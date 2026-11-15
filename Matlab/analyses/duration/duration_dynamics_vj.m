clear all;
close all;

T = readtable('/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/rand_sched_psa.csv');

Folderpath = '/parallel_scratch/nemo/AFdata/goodREM2';
files = dir([Folderpath, filesep,'AF*goodREM.mat']);

Scoringfolder = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/REM_scoring/';
Scoringfolder_dir = dir([Scoringfolder,filesep,'AF*']);

Folderpath_aICA = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath_aICA,'*_aICA.set']);

Savefolder = '/parallel_scratch/nemo/AFdata/Tables';

addpath(genpath('/users/nemo/projects/Airforce/paper/duration'));

%%
for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

time_in_bed_all = NaN(36,18);

rem_dur_min_perhour = NaN(36,18,6);
nrem_dur_min_perhour = NaN(36,18,6);
tst_dur_min_perhour = NaN(36,18,6);
rem_per_tst_perhour = NaN(36,18,6);
nrem_per_tst_perhour = NaN(36,18,6);

%% make allnight table

table_allsub = [];

for s = 1:length(participants_uni)
    
    subfoldername = participants_uni{s};
%     subfoldername = Scoringfolder_dir(s).name;

    files = dir([Folderpath,filesep,subfoldername,'*goodREM.mat']);
%     files = dir([Scoringfolder,filesep,subfoldername,filesep,'AF*']);

    T_sub = T.subj;
    
    for i = 1:length(T_sub)
        if strcmp(T_sub{i}(3:end),subfoldername(9:end))
            sub_ndx = i; 
        end
    end
    
    seq = T.sequence(sub_ndx);
    
    for f = 1:length(files)
    
        load([Folderpath,filesep,files(f).name]);
        scoring_file = dir([Scoringfolder,subfoldername(7:end),filesep,files(f).name(1:18),'*']);
        load([scoring_file(1).folder,filesep,scoring_file(1).name]);
        
      
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
    
        
        if c < 10
           ni = c;
           con = 'SE';
        else
           ni = c-9;
           con = 'SR';
        end
       
        
        if c == 1 | c == 10
           time_in_bed = 8*60;
        elseif ismember(c,2:8)
           time_in_bed = 10*60;
        elseif ismember(c,11:17)
           time_in_bed = 6*60;
        elseif c == 9 | c == 18
            time_in_bed = 12*60;
        end
        
        time_in_bed_all(s,c) = time_in_bed;
       
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
        
        
        epoch_n = 60*60/epochlength*2;
        
        max_h = time_in_bed/(2*60);
        
        if max_h > floor((length(hypno_aligned2)*epochlength)/(60*60*2))
            max_h = floor((length(hypno_aligned2)*epochlength)/(60*60*2));
        end
        
        for h = 1:max_h
        
            hypno_hour_ndx = ((h-1)*epoch_n + 1):1:h*epoch_n;
            hypno_hour = hypno_aligned2(hypno_hour_ndx);
            rem_epochs_hour = find(hypno_hour == 'R');
            nrem_epochs_hour = find(hypno_hour == '2' | hypno_hour == '3' | hypno_hour == '4');
            rem_dur_min(h) = length(rem_epochs_hour)*epochlength/60;
            nrem_dur_min(h) = length(nrem_epochs_hour)*epochlength/60;
            allsleep_epochs_hour = find(hypno_hour == '1' | hypno_hour == '2' | hypno_hour == '3' | hypno_hour == '4' | hypno_hour == 'R');
            tst_dur_min(h) = length(allsleep_epochs_hour)*epochlength/60;
            rem_per_tst(h) = rem_dur_min(h)/(tst_dur_min(h))*100;
            nrem_per_tst(h) = nrem_dur_min(h)/(tst_dur_min(h))*100;

        end

        rem_dur_min_perhour(s,c,1:length(rem_dur_min)) = rem_dur_min;
        nrem_dur_min_perhour(s,c,1:length(nrem_dur_min)) = nrem_dur_min;
        tst_dur_min_perhour(s,c,1:length(tst_dur_min)) = tst_dur_min;
        rem_per_tst_perhour(s,c,1:length(rem_per_tst)) = rem_per_tst;
        nrem_per_tst_perhour(s,c,1:length(nrem_per_tst)) = nrem_per_tst;
        
        participant = repmat({subfoldername(7:end)},6,1);
        order = repmat(seq,6,1);
        twohour = (1:6)';
        night = repmat(ni,6,1);
        condition = repmat(con,6,1);
    
  
        table_sub = table(participant,night,condition,order,twohour,squeeze(rem_dur_min_perhour(s,c,:)),...
            squeeze(nrem_dur_min_perhour(s,c,:)),squeeze(tst_dur_min_perhour(s,c,:)),...
            squeeze(rem_per_tst_perhour(s,c,:)),squeeze(nrem_per_tst_perhour(s,c,:)));
        
        table_allsub = vertcat(table_allsub,table_sub);
        
        clear c ni con
        
        clear time_in_bed hypno* phasic_ep tonic_ep
        clear WASO_dur N1_dur N2_dur N3_dur NREM_dur REM_dur tst phasic_dur tonic_dur
        
        clear rem_dur_min nrem_dur_min tst_dur_min rem_per_tst nrem_per_tst
        
        clear table_sub
      
    end 
    

    clear subfoldername files sub_ndx seq 
    
    clear participant night condition order wake_perc N1_perc N2_perc N3_perc NREM_perc REM_perc phasic_perc tonic_perc phasicperREM_perc tonicperREM_perc
    clear base*
    
    
end

%%

table_allsub.Properties.VariableNames{6} = 'REM_min';
table_allsub.Properties.VariableNames{7} = 'NREM_min';
table_allsub.Properties.VariableNames{8} = 'tst_min';
table_allsub.Properties.VariableNames{9} = 'REM_perc';
table_allsub.Properties.VariableNames{10} = 'NREM_perc';


writetable(table_allsub,[Savefolder,filesep,'duration_dynamics_per2h_',date,'.xlsx']);              

