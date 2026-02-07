%% perform ICA as an array job
   
function ICA_af_array(f)

addpath(genpath('/users/nemo/software/eeglab/'))
addpath(genpath('/users/nemo/software/fieldtrip/'))
% addpath(genpath('/users/nemo/projects/Airforce/'))

Folderpath = '/parallel_scratch/nemo/AFdata/goodREM2/';
Folderpath_dir = dir([Folderpath,'*goodREM.set']);

% for    f = 1 %:length(Folderpath_dir)

    eeg = pop_loadset('filename', Folderpath_dir(f).name, 'filepath', Folderpath);
    eeg = pop_select(eeg,'nochannel',{'EMG'});
%     eeg = pop_select(eeg,'nochannel',{'EMG' 'lEOG' 'rEOG'});
    
    cd(Folderpath)

    ica_dir = [Folderpath,'ICA/',Folderpath_dir(f).name(1:end-4)];
% %     ica_dir = [Folderpath,'/ICA_noEOG/',Folderpath_dir(f).name(1:end-4)];
%     mkdir(ica_dir)  
%     
    dataRank = sum(eig(cov(double(eeg.data'))) > 1E-6); % 1E-6 follows pop_runica() line 531, changed from 1E-7.
%      
    runamica15(eeg, 'num_chans', eeg.nbchan,...
        'outdir', [Folderpath,'ICA/',Folderpath_dir(f).name(1:end-4)],...
        'pcakeep', dataRank, 'num_models', 1,...
        'do_reject', 1, 'numrej', 15, 'rejsig', 3, 'rejint', 1, 'max_threads', 1);

%     runamica15(eeg, 'num_chans', eeg.nbchan,...
%         'outdir', [Folderpath,'/ICA_noEOG/',Folderpath_dir(f).name(1:end-4)],...
%         'pcakeep', dataRank, 'num_models', 1,...
%         'do_reject', 1, 'numrej', 15, 'rejsig', 3, 'rejint', 1, 'max_threads', 1);
        
    eeg.etc.amica  = loadmodout15([Folderpath,'ICA/',Folderpath_dir(f).name(1:end-4)]);
%     eeg.etc.amica  = loadmodout15([Folderpath,'/ICA_noEOG/',Folderpath_dir(f).name]);

    eeg.etc.amica.S = eeg.etc.amica.S(1:eeg.etc.amica.num_pcs, :); % Weirdly, I saw size(S,1) be larger than rank. This process does not hurt anyway.
    eeg.icaweights = eeg.etc.amica.W;
    eeg.icasphere  = eeg.etc.amica.S;
    eeg = eeg_checkset(eeg, 'ica');
       
  [~,coordinateTransformParameters] = coregister(eeg.chanlocs, '/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/elec/standard_1005.elc', 'warp', 'auto', 'manual', 'off');

  templateChannelFilePath = '/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/elec/standard_1005.elc';
    hdmFilePath             = '/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/standard_vol.mat';
    eeg = pop_dipfit_settings( eeg, 'hdmfile', hdmFilePath, 'coordformat', 'MNI',...
        'mrifile', '/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/standard_mri.mat',...
        'chanfile', templateChannelFilePath, 'coord_transform', coordinateTransformParameters,...
        'chansel', 1:eeg.nbchan);
    eeg = pop_multifit(eeg, 1:eeg.nbchan,'threshold', 100, 'dipplot','off','plotopt',{'normlen' 'on'});
 
    % Step 12: Search for and estimate symmetrically constrained bilateral dipoles
    eeg = fitTwoDipoles(eeg, 'LRR', 35);
    
    eeg = pop_saveset(eeg, 'filename', [Folderpath_dir(f).name(1:end-4),'_ICA'], 'filepath', [Folderpath,'ICA/',Folderpath_dir(f).name(1:end-4)]);
%     eeg = pop_saveset(eeg, 'filename', [Folderpath_dir(f).name(1:end-4),'_ICA'], 'filepath', [Folderpath,'/ICA_noEOG/',Folderpath_dir(f).name(1:end-4)]);

    % Step 13: Run ICLabel (Pion-Tonachini et al., 2019)
    eeg = iclabel(eeg, 'default');  
    
%     mkdir([Folderpath,dataName,'/IClabel'])
            
     % Perform IC rejection using ICLabel scores and r.v. from dipole fitting.
 Folderpath_dir(f).name
     %
     
    % Obtain the most dominant class label and its label probability.
    [~, mostDominantClassLabelVector] = max(eeg.etc.ic_classification.ICLabel.classifications, [], 2);
    mostDominantClassLabelProbVector = zeros(length(mostDominantClassLabelVector),1);
    for icIdx = 1:length(mostDominantClassLabelVector)
             mostDominantClassLabelProbVector(icIdx)  = eeg.etc.ic_classification.ICLabel.classifications(icIdx, mostDominantClassLabelVector(icIdx));
    end
    
        
    %brainLabelProbThresh  = .4; % [0-1]
    brainIdx = find(mostDominantClassLabelVector==1 | mostDominantClassLabelVector==7);% & mostDominantClassLabelProbVector>=brainLabelProbThresh);
    %brainIdx = logical((brainIdx-1).^2); 
         
    % Perform IC rejection using residual variance of the IC scalp maps.
    rvList    = [eeg.dipfit.model.rv];
    goodRvIdx = find(rvList < 0.35)'; % < 15% residual variance == good ICs.
 
    % Perform IC rejection using inside brain criterion.
    load(eeg.dipfit.hdmfile); % This returns 'vol'.
    dipoleXyz = zeros(length(eeg.dipfit.model),3);
    for icIdx = 1:length(eeg.dipfit.model)
        dipoleXyz(icIdx,:) = eeg.dipfit.model(icIdx).posxyz(1,:);
    end
    depth = ft_sourcedepth(dipoleXyz, vol);
    depthThreshold = 1;
    insideBrainIdx = find(depth<=depthThreshold);
 
    % Take AND across the three criteria.
    goodIcIdx = intersect(brainIdx, goodRvIdx);
    goodIcIdx = intersect(goodIcIdx, insideBrainIdx);
        %goodIcIdx = intersect(brainIdx, insideBrainIdx);        
         
     % Perform IC rejection.
    eeg = pop_subcomp(eeg, goodIcIdx, 0, 1);  
             
    % Save the dataset
    eeg = pop_saveset(eeg, 'filename', [Folderpath_dir(f).name(1:end-4),'_ICs_removed'], 'filepath', [Folderpath,'ICA/',Folderpath_dir(f).name(1:end-4)]);
%     eeg = pop_saveset(eeg, 'filename', [Folderpath_dir(f).name(1:end-4),'_ICs_removed'], 'filepath', [Folderpath,'/ICA_noEOG/',Folderpath_dir(f).name(1:end-4)]);
        
% end
    
end
   