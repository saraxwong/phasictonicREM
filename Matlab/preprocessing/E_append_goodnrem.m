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

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2'
% savefolder_allnight = '/parallel_scratch/nemo/AFdata/allnight/';

%%
for s = 1:length(Scoringfolder_dir)

subfoldername = Scoringfolder_dir(s).name;
data_subfoldername = ['af' subfoldername(3:end)];

files = dir([goodREM_folder,filesep,'*',subfoldername,'*.mat']); %dir([Scoringfolder,subfoldername,'/*.mat']);
% goodREM_files = dir([goodREM_folder,filesep,'*',subfoldername,'*.mat']);

    for f = 1:length(files)

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
            

        
%         [hdr data] = edfread2([Folderpath,filesep,data_subfoldername,filesep,files(f).name(1:18),'.edf']);

%         load([Scoringfolder,subfoldername,filesep,files(f).name]);

        load([goodREM_folder,filesep,files(f).name]);
        load([AlignFolder,filesep,files(f).name(1:18),'_aligninfo.mat']);
        
        %%
        
        windowl = 1;
        
        artifacts_aligned = artifacts(aligninfo.newscoring_startep:end,:);
        stages_aligned = stages(aligninfo.newscoring_startep:end);
                
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

     
        ep_comp = NaN(length(hypno_aligned2),1);
        for ep = 1:(length(hypno_aligned2)-1)
           
            if strcmp(hypno_aligned2(ep),stages_aligned2(ep))
                ep_comp(ep) = 1;
            else
                ep_comp(ep) = 0;
            end
        end
        
        if ~isempty(find(ep_comp == 0))
            error([files(f).name(1:18), ' stages and hypno are not aligned']);
        end
        
        
        nrem_art_ep = sum(artifacts_aligned,2) > 0;
        nrem_art_ep3 = repelem(nrem_art_ep,epochlength/windowl);


        save([goodREM_folder,filesep,files(f).name(1:18),'_goodREM.mat'],'artifacts','artifacts_aligned','stages_aligned2','nrem_art_ep','nrem_art_ep3','ep_comp','-append');
   
        clear aligninfo artifacts_aligned stages_aligned artifacts_aligned2 stages_aligned2 hypno_aligned2 nrem_art_ep nrem_art_ep3 ep_comp

    end

end


