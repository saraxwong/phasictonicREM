clear all;
close all;

addpath /users/psychology01/software/fieldtrip
addpath /users/psychology01/software/eeglab
addpath /users/psychology01/Valeria/Scripts

Folderpath = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa';
Datafolder_dir = dir([Folderpath,'/af*']);

Artcorrfolder = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/mat_artcorr';
Artcorrfolder_dir = dir([Artcorrfolder,filesep,'*.mat']);

Hypnofolder = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/HYPNOGRAMS';
Hypnofolder_dir = dir([Hypnofolder,filesep,'af*']);

Timefile = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/HYPNOGRAMS/Emma_PSG_Timefile_errorshighlightedfromold_psa.xlsx';

Savefolder = '/mnt/beegfs/users/psychology01/projects/Airforce/alignment';

%%

% cluster = parcluster('eureka'); % to add cluster go to home - parallel - create and manage clusters -import -go to config folder in software folder in psychology01 -open eureka .mlsettings file
% % cluster.SubmitArguments = compose("--partition=high_mem --mem=%dG
% % --time=%d", 16, 24*60); % for high memory job (max. memory that can be
% % allocated in normal job is 8 or 12 GB, max. time is 7 days)
% cluster.SubmitArguments = compose("--mem=%dG --time=%d", 8, 24*60); % for normal job, mem: memory in GB, time: time in min that is allocated to this job
% cluster.NumWorkers = 1;
% cluster.JobStorageLocation = '/users/psychology01/Valeria/jobfiles'; % wdir: directory where job file is put
% 
% for s = 1:size(Datafolder_dir,1)
%     
% 
%     batch(cluster,@aligninfo,0,{Folderpath,Datafolder_dir,Artcorrfolder, Artcorrfolder_dir, ...
%      Hypnofolder, Hypnofolder_dir, Timefile, Savefolder,s},'AutoAttachFiles', false, ...
%     'AutoAddClientPath', true, ...
%     'CaptureDiary', true);
% 
% end

for s = 1:size(Datafolder_dir,1)
aligninfo(Folderpath,Datafolder_dir,Artcorrfolder, Artcorrfolder_dir, ...
    Hypnofolder, Hypnofolder_dir, Timefile, Savefolder,s);
end


%%


   