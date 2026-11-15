clear all;
close all;

T = readtable('/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/rand_sched_psa.csv');

Folderpath = '/parallel_scratch/nemo/AFdata/goodREM2';
files = dir([Folderpath, filesep,'AF*goodREM.mat']);

Scoringfolder = '/parallel_scratch/nemo/AFdata/Airforce_Surrey_psa/REM_scoring/';
Scoringfolder_dir = dir([Scoringfolder,filesep,'AF*']);

Folderpath_aICA = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath_aICA,'*_aICA.set']);

Savefolder = '/parallel_scratch/nemo/AFdata/duration';

addpath(genpath('/users/nemo/projects/Airforce/paper/duration'));

%%
for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

time_in_bed_all = NaN(36,18);

WASO_all = NaN(36,18);
N1_all = NaN(36,18);
N2_all = NaN(36,18);
N3_all = NaN(36,18);
NREM_all = NaN(36,18);
REM_all = NaN(36,18);
tst_all = NaN(36,18);
phasic_all = NaN(36,18);
tonic_all = NaN(36,18);

time_in_bed_common_all = NaN(36,18);
WASO_common_all = NaN(36,18);
N1_common_all = NaN(36,18);
N2_common_all = NaN(36,18);
N3_common_all = NaN(36,18);
NREM_common_all = NaN(36,18);
REM_common_all = NaN(36,18);
tst_common_all = NaN(36,18);
phasic_common_all = NaN(36,18);
tonic_common_all = NaN(36,18);


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

        [WASO_dur, N1_dur, N2_dur, N3_dur, NREM_dur, REM_dur, tst, phasic_dur, tonic_dur] = func_sleepduration_vj(hypno_aligned2, epochlength, phasic_ep, tonic_ep); %in min
        
        
        WASO_all(s,c) = WASO_dur;
        N1_all(s,c) = N1_dur;
        N2_all(s,c) = N2_dur;
        N3_all(s,c) = N3_dur;
        NREM_all(s,c) = NREM_dur;
        REM_all(s,c) = REM_dur;
        tst_all(s,c) = tst;
        phasic_all(s,c) = phasic_dur;
        tonic_all(s,c) = tonic_dur;
        
        clear c ni con time_in_bed hypno* phasic_ep tonic_ep
        clear WASO_dur N1_dur N2_dur N3_dur NREM_dur REM_dur tst phasic_dur tonic_dur
      
    end 
    
    participant = repmat({subfoldername(7:end)},18,1,1);
    order = repmat(seq,18,1,1);
    night = repmat(1:9,1,2)';
    condition = vertcat(repmat({'SE'},9,1,1),repmat({'SR'},9,1,1));
    
    wake_perc = WASO_all(s,:)./time_in_bed_all(s,:)*100; % per time in bed
    N1_perc = N1_all(s,:)./tst_all(s,:)*100; % per tst
    N2_perc = N2_all(s,:)./tst_all(s,:)*100; % per tst
    N3_perc = N3_all(s,:)./tst_all(s,:)*100; % per tst
    NREM_perc = NREM_all(s,:)./tst_all(s,:)*100; % per tst
    REM_perc = REM_all(s,:)./tst_all(s,:)*100; % per tst
    phasic_perc = phasic_all(s,:)./tst_all(s,:)*100; % per tst
    tonic_perc = tonic_all(s,:)./tst_all(s,:)*100; % per tst
    phasicperREM_perc = phasic_all(s,:)./REM_all(s,:)*100; % per REM
    tonicperREM_perc = tonic_all(s,:)./REM_all(s,:)*100; % per REM
    
    base_N1 = vertcat(repmat(N1_all(s,1),9,1),repmat(N1_all(s,10),9,1));
    base_N2 = vertcat(repmat(N2_all(s,1),9,1),repmat(N2_all(s,10),9,1));
    base_N3 = vertcat(repmat(N3_all(s,1),9,1),repmat(N3_all(s,10),9,1));
    base_NREM = vertcat(repmat(NREM_all(s,1),9,1),repmat(NREM_all(s,10),9,1));
    base_REM = vertcat(repmat(REM_all(s,1),9,1),repmat(REM_all(s,10),9,1));
    base_phasic = vertcat(repmat(phasic_all(s,1),9,1),repmat(phasic_all(s,10),9,1));
    base_tonic = vertcat(repmat(tonic_all(s,1),9,1),repmat(tonic_all(s,10),9,1));
    base_wake = vertcat(repmat(WASO_all(s,1),9,1),repmat(WASO_all(s,10),9,1));
    base_tst = vertcat(repmat(tst_all(s,1),9,1),repmat(tst_all(s,10),9,1));
    base_time_in_bed = vertcat(repmat(time_in_bed_all(s,1),9,1),repmat(time_in_bed_all(s,10),9,1));
    
    base_wake_perc = base_wake./base_time_in_bed*100;
    base_N1_perc = base_N1./base_tst*100;
    base_N2_perc = base_N2./base_tst*100;
    base_N3_perc = base_N3./base_tst*100;
    base_NREM_perc = base_NREM./base_tst*100;
    base_REM_perc = base_REM./base_tst*100;
    base_phasic_perc = base_phasic./base_tst*100;
    base_tonic_perc = base_tonic./base_tst*100;
    base_phasicperREM_perc = base_phasic./base_REM*100;
    base_tonicperREM_perc = base_tonic./base_REM*100;
    
    
    
    table_sub = table(participant,night,condition,N1_all(s,:)',N2_all(s,:)',N3_all(s,:)',NREM_all(s,:)',REM_all(s,:)',phasic_all(s,:)',tonic_all(s,:)',WASO_all(s,:)',tst_all(s,:)',order,time_in_bed_all(s,:)',...
        wake_perc',N1_perc',N2_perc',N3_perc',NREM_perc',REM_perc',phasic_perc',tonic_perc',phasicperREM_perc',tonicperREM_perc',...
        base_N1,base_N2,base_N3,base_NREM,base_REM,base_phasic,base_tonic,base_wake,base_tst,base_time_in_bed,...
        base_wake_perc,base_N1_perc,base_N2_perc,base_N3_perc,base_NREM_perc,base_REM_perc,base_phasic_perc,base_tonic_perc,base_phasicperREM_perc,base_tonicperREM_perc);
    
          
    table_allsub = vertcat(table_allsub,table_sub);

    clear subfoldername files sub_ndx seq 
    
    clear participant night condition order wake_perc N1_perc N2_perc N3_perc NREM_perc REM_perc phasic_perc tonic_perc phasicperREM_perc tonicperREM_perc
    clear base* table_sub
    
    
end

%%

table_allsub.Properties.VariableNames{4} = 'N1_min';
table_allsub.Properties.VariableNames{5} = 'N2_min';
table_allsub.Properties.VariableNames{6} = 'N3_min';
table_allsub.Properties.VariableNames{7} = 'NREM_min';
table_allsub.Properties.VariableNames{8} = 'REM_min';
table_allsub.Properties.VariableNames{9} = 'phasic_min';
table_allsub.Properties.VariableNames{10} = 'tonic_min';
table_allsub.Properties.VariableNames{11} = 'WASO_min';
table_allsub.Properties.VariableNames{12} = 'tst_min';
table_allsub.Properties.VariableNames{14} = 'time_in_bed';
table_allsub.Properties.VariableNames{15} = 'wake_perc';
table_allsub.Properties.VariableNames{16} = 'N1_perc';
table_allsub.Properties.VariableNames{17} = 'N2_perc';
table_allsub.Properties.VariableNames{18} = 'N3_perc';
table_allsub.Properties.VariableNames{19} = 'NREM_perc';
table_allsub.Properties.VariableNames{20} = 'REM_perc';
table_allsub.Properties.VariableNames{21} = 'phasic_perc';
table_allsub.Properties.VariableNames{22} = 'tonic_perc';
table_allsub.Properties.VariableNames{23} = 'phasicperREM_perc';
table_allsub.Properties.VariableNames{24} = 'tonicperREM_perc';
table_allsub.Properties.VariableNames{25} = 'baseline_N1min';
table_allsub.Properties.VariableNames{26} = 'baseline_N2min';
table_allsub.Properties.VariableNames{27} = 'baseline_N3min';
table_allsub.Properties.VariableNames{28} = 'baseline_NREMmin';
table_allsub.Properties.VariableNames{29} = 'baseline_REMmin';
table_allsub.Properties.VariableNames{30} = 'baseline_phasicmin';
table_allsub.Properties.VariableNames{31} = 'baseline_tonicmin';
table_allsub.Properties.VariableNames{32} = 'baseline_wakemin';
table_allsub.Properties.VariableNames{33} = 'baseline_tstmin';
table_allsub.Properties.VariableNames{34} = 'baseline_timeinbedmin';
table_allsub.Properties.VariableNames{35} = 'baseline_wakeperc';
table_allsub.Properties.VariableNames{36} = 'baseline_N1perc';
table_allsub.Properties.VariableNames{37} = 'baseline_N2perc';
table_allsub.Properties.VariableNames{38} = 'baseline_N3perc';
table_allsub.Properties.VariableNames{39} = 'baseline_NREMperc';
table_allsub.Properties.VariableNames{40} = 'baseline_REMperc';
table_allsub.Properties.VariableNames{41} = 'baseline_phasicperc';
table_allsub.Properties.VariableNames{42} = 'baseline_tonicperc';
table_allsub.Properties.VariableNames{43} = 'baseline_phasicperREMperc';
table_allsub.Properties.VariableNames{44} = 'baseline_tonicperREMperc';


writetable(table_allsub,[Savefolder,filesep,'duration_allnight_',date,'.xlsx']);              


%% common sleep duration across all participants for each night

for n = 1:9

    common_min_all(n) = min([min(tst_all(:,n)) min(tst_all(:,n+9))]);

end


%% make common sleep duration table

table_allsub_common = [];

for s = 1:length(participants_uni)
    
    subfoldername = participants_uni{s};

    files = dir([Folderpath,filesep,subfoldername,'*goodREM.mat']);
    
    T_sub = T.subj;
    
    for i = 1:length(T_sub)
        if strcmp(T_sub{i}(3:end),subfoldername(9:end))
            sub_ndx = i; 
        end
    end
    
    seq = T.sequence(sub_ndx);

    
    for f = 1:length(files)
    
        load([Folderpath,filesep,files(f).name]);
      
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
        
        common_min_night = common_min_all(ni);
        common_epoch_end_n = common_min_night*60/epochlength;
        
        sleep_ndx = find(hypno_aligned2 == '1' | hypno_aligned2 == '2' | hypno_aligned2 == '3' | hypno_aligned2 == '4' | hypno_aligned2 == 'R');

        common_epoch_end_ndx = sleep_ndx(common_epoch_end_n);
              
        hypno_aligned2_common = hypno_aligned2(1:common_epoch_end_ndx); %cuts the hypnogram at required epoch
        phasic_ep_common = phasic_ep(1:common_epoch_end_ndx*epochlength);
        tonic_ep_common = tonic_ep(1:common_epoch_end_ndx*epochlength);

        [WASO_dur_common, N1_dur_common, N2_dur_common, N3_dur_common, ...
         NREM_dur_common, REM_dur_common, tst_common, phasic_dur_common,...
         tonic_dur_common] = func_sleepduration_vj(hypno_aligned2_common,epochlength,phasic_ep_common,tonic_ep_common); %in min
    
        time_in_bed_common_all(s,c) = common_epoch_end_ndx*epochlength/60;
        WASO_common_all(s,c) = WASO_dur_common;
        N1_common_all(s,c) = N1_dur_common;
        N2_common_all(s,c) = N2_dur_common;
        N3_common_all(s,c) = N3_dur_common;
        NREM_common_all(s,c) = NREM_dur_common;
        REM_common_all(s,c) = REM_dur_common;
        tst_common_all(s,c) = tst_common;
        phasic_common_all(s,c) = phasic_dur_common;
        tonic_common_all(s,c) = tonic_dur_common;
      
        clear c ni con time_in_bed hypno* phasic_ep tonic_ep 
        clear common_epoch_end_ndx WASO_dur_common N1_dur_common N2_dur_common N3_dur_common NREM_dur_common REM_dur_common tst_common phasic_dur_common tonic_dur_common

    end 
    
    
    participant = repmat({subfoldername(7:end)},18,1,1);
    order = repmat(seq,18,1,1);
    night = repmat(1:9,1,2)';
    condition = vertcat(repmat({'SE'},9,1,1),repmat({'SR'},9,1,1));
    
%     wake_common_perc = WASO_common_all(s,:)./tst_common_all(s,:)*100;     % per tst
    wake_common_perc = WASO_common_all(s,:)./time_in_bed_common_all(s,:)*100; % per time in bed
    N1_common_perc = N1_common_all(s,:)./tst_common_all(s,:)*100;
    N2_common_perc = N2_common_all(s,:)./tst_common_all(s,:)*100;
    N3_common_perc = N3_common_all(s,:)./tst_common_all(s,:)*100;
    NREM_common_perc = NREM_common_all(s,:)./tst_common_all(s,:)*100;
    REM_common_perc = REM_common_all(s,:)./tst_common_all(s,:)*100;
    phasic_common_perc = phasic_common_all(s,:)./tst_common_all(s,:)*100;
    tonic_common_perc = tonic_common_all(s,:)./tst_common_all(s,:)*100;
    phasicperREM_common_perc = phasic_common_all(s,:)./REM_common_all(s,:)*100;
    tonicperREM_common_perc = tonic_common_all(s,:)./REM_common_all(s,:)*100;

    base_tst_common = vertcat(repmat(tst_common_all(s,1),9,1),repmat(tst_common_all(s,10),9,1));
    base_wake_common = vertcat(repmat(WASO_common_all(s,1),9,1),repmat(WASO_common_all(s,10),9,1));
    base_N1_common = vertcat(repmat(N1_common_all(s,1),9,1),repmat(N1_common_all(s,10),9,1));  
    base_N2_common = vertcat(repmat(N2_common_all(s,1),9,1),repmat(N2_common_all(s,10),9,1));
    base_N3_common = vertcat(repmat(N3_common_all(s,1),9,1),repmat(N3_common_all(s,10),9,1));
    base_NREM_common = vertcat(repmat(NREM_common_all(s,1),9,1),repmat(NREM_common_all(s,10),9,1));
    base_REM_common = vertcat(repmat(REM_common_all(s,1),9,1),repmat(REM_common_all(s,10),9,1));
    base_phasic_common = vertcat(repmat(phasic_common_all(s,1),9,1),repmat(phasic_common_all(s,10),9,1));
    base_tonic_common = vertcat(repmat(tonic_common_all(s,1),9,1),repmat(tonic_common_all(s,10),9,1));
    base_time_in_bed_common = vertcat(repmat(time_in_bed_common_all(s,1),9,1),repmat(time_in_bed_common_all(s,10),9,1));
    
    base_wake_common_perc = base_wake_common./base_time_in_bed_common*100;
    base_N1_common_perc = base_N1_common./base_tst_common*100;
    base_N2_common_perc = base_N2_common./base_tst_common*100;
    base_N3_common_perc = base_N3_common./base_tst_common*100;
    base_NREM_common_perc = base_NREM_common./base_tst_common*100;
    base_REM_common_perc = base_REM_common./base_tst_common*100;
    base_phasic_common_perc = base_phasic_common./base_tst_common*100;
    base_tonic_common_perc = base_tonic_common./base_tst_common*100;
    base_phasicperREM_common_perc = base_phasic_common./base_REM_common*100;
    base_tonicperREM_common_perc = base_tonic_common./base_REM_common*100;
        
    table_sub_common = table(participant,night,condition,N1_common_all(s,:)',N2_common_all(s,:)',N3_common_all(s,:)',NREM_common_all(s,:)',REM_common_all(s,:)',phasic_common_all(s,:)',tonic_common_all(s,:)',WASO_common_all(s,:)',tst_common_all(s,:)',order,time_in_bed_common_all(s,:)',...
        wake_common_perc',N1_common_perc',N2_common_perc',N3_common_perc',NREM_common_perc',REM_common_perc',phasic_common_perc',tonic_common_perc',phasicperREM_common_perc',tonicperREM_common_perc',...
        base_N1_common,base_N2_common,base_N3_common,base_NREM_common,base_REM_common,base_phasic_common,base_tonic_common,base_wake_common,base_tst_common,base_time_in_bed_common,...
        base_wake_common_perc,base_N1_common_perc,base_N2_common_perc,base_N3_common_perc,base_NREM_common_perc,base_REM_common_perc,base_phasic_common_perc,base_tonic_common_perc,base_phasicperREM_common_perc,base_tonicperREM_common_perc);
    
          
    table_allsub_common = vertcat(table_allsub_common,table_sub_common);

    clear subfoldername files sub_ndx seq 
    
    clear participant night condition order wake_common_perc N1_common_perc N2_common_perc N3_common_perc NREM_common_perc REM_common_perc phasic_common_perc tonic_common_perc phasicperREM_common_perc tonicperREM_common_perc
    clear base* table_sub_common
    
    
    
end


%%

table_allsub_common.Properties.VariableNames{4} = 'common_night_N1_min';
table_allsub_common.Properties.VariableNames{5} = 'common_night_N2_min';
table_allsub_common.Properties.VariableNames{6} = 'common_night_N3_min';
table_allsub_common.Properties.VariableNames{7} = 'common_night_NREM_min';
table_allsub_common.Properties.VariableNames{8} = 'common_night_REM_min';
table_allsub_common.Properties.VariableNames{9} = 'common_night_phasic_min';
table_allsub_common.Properties.VariableNames{10} = 'common_night_tonic_min';
table_allsub_common.Properties.VariableNames{11} = 'common_night_WASO_min';
table_allsub_common.Properties.VariableNames{12} = 'common_night_tst_min';
table_allsub_common.Properties.VariableNames{14} = 'common_night_time_in_bed';
table_allsub_common.Properties.VariableNames{15} = 'common_wake_perc';
table_allsub_common.Properties.VariableNames{16} = 'common_N1_perc';
table_allsub_common.Properties.VariableNames{17} = 'common_N2_perc';
table_allsub_common.Properties.VariableNames{18} = 'common_N3_perc';
table_allsub_common.Properties.VariableNames{19} = 'common_NREM_perc';
table_allsub_common.Properties.VariableNames{20} = 'common_REM_perc';
table_allsub_common.Properties.VariableNames{21} = 'common_phasic_perc';
table_allsub_common.Properties.VariableNames{22} = 'common_tonic_perc';
table_allsub_common.Properties.VariableNames{23} = 'common_phasicperREM_perc';
table_allsub_common.Properties.VariableNames{24} = 'common_tonicperREM_perc';
table_allsub_common.Properties.VariableNames{25} = 'baseline_common_N1min';
table_allsub_common.Properties.VariableNames{26} = 'baseline_common_N2min';
table_allsub_common.Properties.VariableNames{27} = 'baseline_common_N3min';
table_allsub_common.Properties.VariableNames{28} = 'baseline_common_NREMmin';
table_allsub_common.Properties.VariableNames{29} = 'baseline_common_REMmin';
table_allsub_common.Properties.VariableNames{30} = 'baseline_common_phasicmin';
table_allsub_common.Properties.VariableNames{31} = 'baseline_common_tonicmin';
table_allsub_common.Properties.VariableNames{32} = 'baseline_common_wakemin';
table_allsub_common.Properties.VariableNames{33} = 'baseline_common_tstmin';
table_allsub_common.Properties.VariableNames{34} = 'baseline_common_timeinbedmin';
table_allsub_common.Properties.VariableNames{35} = 'baseline_common_wakeperc';
table_allsub_common.Properties.VariableNames{36} = 'baseline_common_N1perc';
table_allsub_common.Properties.VariableNames{37} = 'baseline_common_N2perc';
table_allsub_common.Properties.VariableNames{38} = 'baseline_common_N3perc';
table_allsub_common.Properties.VariableNames{39} = 'baseline_common_NREMperc';
table_allsub_common.Properties.VariableNames{40} = 'baseline_common_REMperc';
table_allsub_common.Properties.VariableNames{41} = 'baseline_common_phasicperc';
table_allsub_common.Properties.VariableNames{42} = 'baseline_common_tonicperc';
table_allsub_common.Properties.VariableNames{43} = 'baseline_common_phasicperREMperc';
table_allsub_common.Properties.VariableNames{44} = 'baseline_common_tonicperREMperc';


writetable(table_allsub_common,[Savefolder,filesep,'duration_common_',date,'.xlsx']);              

