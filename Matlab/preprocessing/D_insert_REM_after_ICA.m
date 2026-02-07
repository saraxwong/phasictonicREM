clear all;
close all;
clc;

addpath (genpath('/users/nemo/software/eeglab/'))

allnight_folder = '/parallel_scratch/nemo/AFdata/allnight/';
% mICA_folder = '/parallel_scratch/nemo/AFdata/goodREM/spillover/ICA/';
mICA_folder = '/parallel_scratch/nemo/AFdata/goodREM2/ICA_with_permission/ICA/';
goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

dir_allnight = dir([allnight_folder,'AFOSR*.set']);

Savefolder = '/parallel_scratch/nemo/AFdata/aICA';

%%
for f = 1:length(dir_allnight)

    EEG = pop_loadset('filename', dir_allnight(f).name, 'filepath', allnight_folder); 
    EEG = pop_select(EEG,'nochannel',{'EMG'}); % removes EMG channel from original EEGset

    dir_mICA = dir([mICA_folder,dir_allnight(f).name(1:18),'_goodREM',filesep,'*ICs_removed.set']); 
    EEG_mICA = pop_loadset('filename',dir_mICA(1).name,'filepath',[mICA_folder,dir_allnight(f).name(1:18),'_goodREM']);

    load([goodREM_folder,dir_allnight(f).name(1:18),'_goodREM.mat']);
    
        if length(goodrem_samp) == size(EEG_mICA.data,2)
       
            EEG.data(:,goodrem_samp) = EEG_mICA.data;
              
        else
            error('goodREM samp length and mICA data length do not match');
        end

    EEG = pop_chanedit(EEG, 'lookup','/users/nemo/software/eeglab/plugins/dipfit4.3/standard_BEM/elec/standard_1005.elc','eval','chans = pop_chancenter( chans, [],[]);');
    
    EEG = pop_saveset(EEG, 'filename', [dir_allnight(f).name(1:18),'_aICA'], 'filepath', Savefolder);

        

end

