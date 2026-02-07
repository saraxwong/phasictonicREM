clear all;
close all;

addpath(genpath('/users/nemo/software/eeglab/'));
addpath(genpath('/users/nemo/software/fieldtrip/'));
addpath(genpath('/users/nemo/projects/Airforce/paper/preprocessing'));

Folderpath = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa';

Scoringfolder = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/REM_scoring/';
Scoringfolder_dir = dir([Scoringfolder,filesep,'AF*']);

AlignFolder = '/parallel_scratch/nemo/AFdata/alignment/';

EEG_template_folder = '/users/nemo/projects/Airforce/paper/preprocessing';

savefolder = '/parallel_scratch/nemo/AFdata/goodREM2'
savefolder_allnight = '/parallel_scratch/nemo/AFdata/allnight/';

%%
for s = 29 %1:length(Scoringfolder_dir)

subfoldername = Scoringfolder_dir(s).name;
data_subfoldername = ['af' subfoldername(3:end)];

files = dir([Scoringfolder,subfoldername,'/*.mat']);

    for f = 9 %1:length(files)

        if files(f).name(15) == 'E' && files(f).name(16) == 'B' % extension baseline      
            c = 1;
        elseif files(f).name(16) == 'E' && files(f).name(18) == '1' % SEEN1
            c =  2;
        elseif files(f).name(16) == 'E' && files(f).name(18) == '2' % SEEN2
            c =  3;
         elseif files(f).name(16) == 'E' && files(f).name(18) == '3' % SEEN3
            c =  4;
        elseif files(f).name(16) == 'E' && files(f).name(18) == '4' % SEEN4
            c =  5;
        elseif files(f).name(16) == 'E' && files(f).name(18) == '5' % SEEN5
            c =  6;    
         elseif files(f).name(16) == 'E' && files(f).name(18) == '6' % SEEN6
            c =  7;
        elseif files(f).name(16) == 'E' && files(f).name(18) == '7' % SEEN7 (final)
            c =  8;    
        elseif files(f).name(16) == 'E' && files(f).name(18) == '8' % extension recovery
            c =  9;
        elseif files(f).name(15) == 'R' && files(f).name(16) == 'B' % restriction baseline      
            c = 10;    
        elseif files(f).name(16) == 'R' && files(f).name(18) == '1' % SRRN1
            c =  11;
        elseif files(f).name(16) == 'R' && files(f).name(18) == '2' % SRNN2
            c =  12;
        elseif files(f).name(16) == 'R' && files(f).name(18) == '3' % SRRN3
            c =  13;
        elseif files(f).name(16) == 'R' && files(f).name(18) == '4' % SRRN4
            c =  14;
        elseif files(f).name(16) == 'R' && files(f).name(18) == '5' % SRRN5
            c =  15;
        elseif files(f).name(16) == 'R' && files(f).name(18) == '6' % SRRN6
            c =  16;
        elseif files(f).name(16) == 'R' && files(f).name(18) == '7' % SRRN7 (final)
            c =  17;    
        elseif files(f).name(16) == 'R' && files(f).name(18) == '8' % restriction recovery
            c =  18;
          else
            error('Wrong filename');
        end  
            

        
        [hdr data] = edfread2([Folderpath,filesep,data_subfoldername,filesep,files(f).name(1:18),'.edf']);

        load([Scoringfolder,subfoldername,filesep,files(f).name]);
        load([AlignFolder,filesep,files(f).name(1:18),'_aligninfo.mat']);
        
        %%
        
        fs = hdr.samples(1);
        epochlength = 30;
        
        if aligninfo.newdatascoring_start > fs
        data_aligned = data(:,aligninfo.newdatascoring_start-1*fs:end); % align data, add 1 s at beginning of first epoch as was done by REM Scoring App
        else
        data_add = zeros(size(data,1),fs-aligninfo.newdatascoring_start+1,1);    
        data_aligned = horzcat(data_add,data); % align data, add 1 s at beginning of first epoch as was done by REM Scoring App
        end

        nepochs = floor(size(data_aligned,2)/(fs*epochlength));
        
        hypno_aligned = hypno(aligninfo.newscoring_startep:end);
        artifacts_aligned = artifacts(aligninfo.newscoring_startep:end,:);
        stages_aligned = stages(aligninfo.newscoring_startep:end);
        
        hypno_aligned = deblank(hypno_aligned);
        
        if length(hypno_aligned) >= nepochs
           hypno_aligned = hypno_aligned(1:nepochs);
        else
           hypno_aligned = char(hypno_aligned',repmat('?',nepochs-length(hypno_aligned),1));
        end
        
        if length(artifacts_aligned) >= nepochs
           artifacts_aligned = artifacts_aligned(1:nepochs,:);
        else
           artifacts_aligned = vertcat(artifacts_aligned,repmat(10,nepochs-length(artifacts_aligned),8));
        end
        
        if length(stages_aligned) >= nepochs
           stages_aligned = stages_aligned(1:nepochs);
        else
           stages_aligned = char(stages_aligned,repmat('U',nepochs-length(stages_aligned),1));
        end
        
        stages_aligned2 = stages_aligned;
        hypno_aligned2 = hypno_aligned;
        
        stages_aligned2(find(stages_aligned2 == 'U'))= '?';  
        stages_aligned2(find(stages_aligned2 == 'A'))= 'W'; 
        hypno_aligned2(find(hypno_aligned2 == 'U'))= '?';  
        hypno_aligned2(find(hypno_aligned2 == 'A'))= 'W';

        if isequal(stages_aligned2',hypno_aligned2)
           equal_scoring = 1;
        else
           equal_scoring = 0;
        end
         
        %%

        REMscoring_start = datestr(Hypnogram_Tab.Time(1));
        
        if ~strcmp(REMscoring_start(end-7:end),aligninfo.newstarttime)
           error('alignment does not match')
        end
        
        hypno_REMscoring = Hypnogram_Tab.Hypnogram_string;
        
        
        clear hypno_REMscoring2 
        
        for e = 1:length(hypno_REMscoring)

            stage = hypno_REMscoring{e};
     
            if stage == 'A'
                hypno_REMscoring2(e) = '?';
            elseif stage == 'W'
                hypno_REMscoring2(e) = 'W';
            elseif stage == 'N1'
                hypno_REMscoring2(e) = '1';
            elseif stage == 'N2'
                hypno_REMscoring2(e) = '2';
            elseif stage == 'N3'
                hypno_REMscoring2(e) = '3';
            elseif stage == 'R'
                hypno_REMscoring2(e) = 'R';
            else
                error('wrong stage name');
            end
            
            clear stage
        end
        
        hypno_aligned_no4 = hypno_aligned2;
        hypno_aligned_no4(find(hypno_aligned_no4 == '4')) = '3';
        
        if length(hypno_aligned2) > length(hypno_REMscoring2)
           warning([files(f).name,': sleep scoring epochs = ',num2str(length(hypno_aligned2)), ', phasic/tonic scoring = ',num2str(length(hypno_REMscoring2))]); 
           hypno_aligned_no4 = hypno_aligned_no4(1:length(hypno_REMscoring2));
        elseif length(hypno_aligned2) < length(hypno_REMscoring2)
           warning([files(f).name,': sleep scoring epochs = ',num2str(length(hypno_aligned2)), ', phasic/tonic scoring = ',num2str(length(hypno_REMscoring2))]); 
           hypno_REMscoring2 = hypno_REMscoring2(1:length(hypno_aligned_no4));
        end
        
        if ~isequal(hypno_aligned_no4,hypno_REMscoring2)
           warning([files(f).name,' scoring not equal']);
        end
        
        
        EOG_L = squeeze(Labels(1,:,:));
        EOG_R = squeeze(Labels(2,:,:));
        
        %% find phasic and tonic mini-epochs
        
        windowl = 1;
        
        EOG_L_exp = reshape(EOG_L,windowl,[]);
        EOG_R_exp = reshape(EOG_L,windowl,[]);
        

        for ep = 1:size(EOG_L_exp,2)
    
            if isempty(find(EOG_L_exp(:,ep)== 2))
                phasic_ep(ep) = 0; 
            else
                phasic_ep(ep) = 1;  
            end
  
            if isempty(find(EOG_L_exp(:,ep)== 3))  
                tonic_ep(ep) = 0; 
            else
                tonic_ep(ep) = 1;  
            end
  
            if isempty(find(EOG_L_exp(:,ep)== 1))  
                art_ep(ep) = 0; 
            else
                art_ep(ep) = 1;  
            end

        end

phasic_ndx = find(phasic_ep == 1); % phasic epoch (epoch that has at least 1 phasic segment)
tonic_phasic_ndx = find(tonic_ep == 1);   % epoch that has at least 1 tonic segment 
tonic_ndx = setdiff(tonic_phasic_ndx,phasic_ndx); % tonic epoch (epoch that has at least 1 tonic and no phasic segment)

good_ndx = find(art_ep == 0);

hypno3 = repelem(hypno_aligned2,epochlength/windowl);
rem_ndx = find(hypno3 == 'R');
nrem_ndx = find(hypno3 == '2' | hypno3 == '3');

rem_goodndx = intersect(rem_ndx,good_ndx);
phasic_goodndx = intersect(phasic_ndx,good_ndx);
tonic_goodndx = intersect(tonic_ndx,good_ndx);

goodrem_samp = [];
    
    for ep = 1:length(rem_goodndx)
        
        ep_ndx = rem_goodndx(ep);
        ep_samp = ((ep_ndx-1)*fs*windowl+1):(ep_ndx*fs*windowl);
        goodrem_samp = [goodrem_samp ep_samp];
        
        clear ep_samp
        
    end
    
    

    save([savefolder,filesep,files(f).name(1:18),'_goodREM.mat'],'hdr','goodrem_samp','fs','epochlength','nepochs','hypno','hypno_aligned','hypno_aligned2','hypno3','EOG_L','EOG_R','EOG_L_exp','EOG_R_exp','rem_ndx','nrem_ndx','phasic_ep','tonic_ep','art_ep','good_ndx','phasic_ndx','tonic_ndx','rem_goodndx','tonic_goodndx','phasic_goodndx');
   
    load([EEG_template_folder, filesep,'EEG_template.mat']);
    
    EEG.data = NaN(132,1);
    EEG.srate = fs;
    EEG = pop_select(EEG,'channel',{'F3' 'C3' 'P3' 'O1' 'O2' 'P4' 'C4' 'F4' 'EMG' 'lEOG' 'rEOG'});
    
    EEG.data = vertcat(data_aligned(7,:),data_aligned(8,:),data_aligned(9,:),data_aligned(10,:),...
               data_aligned(4,:),data_aligned(3,:),data_aligned(2,:),data_aligned(1,:),...
               data_aligned(11,:),data_aligned(5,:),data_aligned(6,:)); 
           
    EEG = pop_chanedit(EEG, 'lookup','/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/elec/standard_1005.elc','eval','chans = pop_chancenter( chans, [],[]);');
    EEG = pop_saveset(EEG, 'filename', [files(f).name(1:18),'_allnight'], 'filepath', savefolder_allnight);
           
    EEG.data = EEG.data(:,goodrem_samp);
%     pop_eegplot(EEG);
    
    EEG = pop_chanedit(EEG, 'lookup','/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/elec/standard_1005.elc','eval','chans = pop_chancenter( chans, [],[]);');

    EEG = pop_saveset(EEG, 'filename', [files(f).name(1:18),'_goodREM'], 'filepath', savefolder);
    
    clear data_aligned_goodrem goodrem_samp fs epochlength nepochs hypno hypno_aligned hypno_aligned2 hypno3 EOG_L EOG_R EOG_L_exp EOG_R_exp rem_ndx nrem_ndx phasic_ep tonic_ep art_ep good_ndx phasic_ndx tonic_ndx rem_goodndx tonic_goodndx phasic_goodndx

    end

end


