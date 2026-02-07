% function B_eBOSC_allsub(s)
% 
% try
    
clear all;
close all;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

waves_folder = '/parallel_scratch/nemo/AFdata/eBOSC/';
waves_folder_dir = dir([waves_folder,'AFOSR*']);

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_dynamics/indsub/';

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

%% Average across on and off blocks and calculate change
lower_freq = 1;
higher_freq = 20;
lower_freq_alpha = 6;
higher_freq_alpha = 12;
lower_freq_theta = 2;
higher_freq_theta = 6;
lower_freq_spindles = 12;
higher_freq_spindles = 16;
peak_thresh = 0.03;

%%

prob_phasic_cyc_all = NaN(18,8,10);
dur_cyc_min_all = NaN(18,8,10);

prob_phasic_cyc_quint_all = NaN(18,8,10,5);
dur_cyc_quint_min_all = NaN(18,8,10,5);


% rem
exponent_1_30_cyc_rem_all = NaN(18,8,10);
exponent_30_45_cyc_rem_all = NaN(18,8,10);
offset_1_30_cyc_rem_all = NaN(18,8,10);
offset_30_45_cyc_rem_all = NaN(18,8,10);

exponent_1_30_cyc_quint_rem_all = NaN(18,8,10,5);
exponent_30_45_cyc_quint_rem_all = NaN(18,8,10,5);
offset_1_30_cyc_quint_rem_all = NaN(18,8,10,5);
offset_30_45_cyc_quint_rem_all = NaN(18,8,10,5);
       
IAPF_rem_cyc_all = NaN(18,8,10);
ITPF_rem_cyc_all = NaN(18,8,10);
ISPF_rem_cyc_all = NaN(18,8,10);
IAPF_rem_height_cyc_all = NaN(18,8,10);
ITPF_rem_height_cyc_all = NaN(18,8,10);
ISPF_rem_height_cyc_all = NaN(18,8,10);

alpha_rem_den_cyc = NaN(18,8,10);
alpha_rem_abu_cyc = NaN(18,8,10);
alpha_rem_amp_cyc = NaN(18,8,10);
alpha_rem_snr_cyc = NaN(18,8,10);

theta_rem_den_cyc = NaN(18,8,10);
theta_rem_abu_cyc = NaN(18,8,10);
theta_rem_amp_cyc = NaN(18,8,10);
theta_rem_snr_cyc = NaN(18,8,10);

spindles_rem_den_cyc = NaN(18,8,10);
spindles_rem_abu_cyc = NaN(18,8,10);
spindles_rem_amp_cyc = NaN(18,8,10);
spindles_rem_snr_cyc = NaN(18,8,10);
    
IAPF_rem_cyc_quint_all = NaN(18,8,10,5);
ITPF_rem_cyc_quint_all = NaN(18,8,10,5);
ISPF_rem_cyc_quint_all = NaN(18,8,10,5);
IAPF_rem_height_cyc_quint_all = NaN(18,8,10,5);
ITPF_rem_height_cyc_quint_all = NaN(18,8,10,5);
ISPF_rem_height_cyc_quint_all = NaN(18,8,10,5);

alpha_rem_den_cyc_quint = NaN(18,8,10,5);
alpha_rem_abu_cyc_quint = NaN(18,8,10,5);
alpha_rem_amp_cyc_quint = NaN(18,8,10,5);
alpha_rem_snr_cyc_quint = NaN(18,8,10,5);

theta_rem_den_cyc_quint = NaN(18,8,10,5);
theta_rem_abu_cyc_quint = NaN(18,8,10,5);
theta_rem_amp_cyc_quint = NaN(18,8,10,5);
theta_rem_snr_cyc_quint = NaN(18,8,10,5);

spindles_rem_den_cyc_quint = NaN(18,8,10,5);
spindles_rem_abu_cyc_quint = NaN(18,8,10,5);
spindles_rem_amp_cyc_quint = NaN(18,8,10,5);
spindles_rem_snr_cyc_quint = NaN(18,8,10,5);


% phasic
exponent_1_30_cyc_phasic_all = NaN(18,8,10);
exponent_30_45_cyc_phasic_all = NaN(18,8,10);
offset_1_30_cyc_phasic_all = NaN(18,8,10);
offset_30_45_cyc_phasic_all = NaN(18,8,10);

exponent_1_30_cyc_quint_phasic_all = NaN(18,8,10,5);
exponent_30_45_cyc_quint_phasic_all = NaN(18,8,10,5);
offset_1_30_cyc_quint_phasic_all = NaN(18,8,10,5);
offset_30_45_cyc_quint_phasic_all = NaN(18,8,10,5);
       
IAPF_phasic_cyc_all = NaN(18,8,10);
ITPF_phasic_cyc_all = NaN(18,8,10);
ISPF_phasic_cyc_all = NaN(18,8,10);
IAPF_phasic_height_cyc_all = NaN(18,8,10);
ITPF_phasic_height_cyc_all = NaN(18,8,10);
ISPF_phasic_height_cyc_all = NaN(18,8,10);

alpha_phasic_den_cyc = NaN(18,8,10);
alpha_phasic_abu_cyc = NaN(18,8,10);
alpha_phasic_amp_cyc = NaN(18,8,10);
alpha_phasic_snr_cyc = NaN(18,8,10);

theta_phasic_den_cyc = NaN(18,8,10);
theta_phasic_abu_cyc = NaN(18,8,10);
theta_phasic_amp_cyc = NaN(18,8,10);
theta_phasic_snr_cyc = NaN(18,8,10);

spindles_phasic_den_cyc = NaN(18,8,10);
spindles_phasic_abu_cyc = NaN(18,8,10);
spindles_phasic_amp_cyc = NaN(18,8,10);
spindles_phasic_snr_cyc = NaN(18,8,10);
    
IAPF_phasic_cyc_quint_all = NaN(18,8,10,5);
ITPF_phasic_cyc_quint_all = NaN(18,8,10,5);
ISPF_phasic_cyc_quint_all = NaN(18,8,10,5);
IAPF_phasic_height_cyc_quint_all = NaN(18,8,10,5);
ITPF_phasic_height_cyc_quint_all = NaN(18,8,10,5);
ISPF_phasic_height_cyc_quint_all = NaN(18,8,10,5);

alpha_phasic_den_cyc_quint = NaN(18,8,10,5);
alpha_phasic_abu_cyc_quint = NaN(18,8,10,5);
alpha_phasic_amp_cyc_quint = NaN(18,8,10,5);
alpha_phasic_snr_cyc_quint = NaN(18,8,10,5);

theta_phasic_den_cyc_quint = NaN(18,8,10,5);
theta_phasic_abu_cyc_quint = NaN(18,8,10,5);
theta_phasic_amp_cyc_quint = NaN(18,8,10,5);
theta_phasic_snr_cyc_quint = NaN(18,8,10,5);

spindles_phasic_den_cyc_quint = NaN(18,8,10,5);
spindles_phasic_abu_cyc_quint = NaN(18,8,10,5);
spindles_phasic_amp_cyc_quint = NaN(18,8,10,5);
spindles_phasic_snr_cyc_quint = NaN(18,8,10,5);


% tonic
exponent_1_30_cyc_tonic_all = NaN(18,8,10);
exponent_30_45_cyc_tonic_all = NaN(18,8,10);
offset_1_30_cyc_tonic_all = NaN(18,8,10);
offset_30_45_cyc_tonic_all = NaN(18,8,10);

exponent_1_30_cyc_quint_tonic_all = NaN(18,8,10,5);
exponent_30_45_cyc_quint_tonic_all = NaN(18,8,10,5);
offset_1_30_cyc_quint_tonic_all = NaN(18,8,10,5);
offset_30_45_cyc_quint_tonic_all = NaN(18,8,10,5);
       
IAPF_tonic_cyc_all = NaN(18,8,10);
ITPF_tonic_cyc_all = NaN(18,8,10);
ISPF_tonic_cyc_all = NaN(18,8,10);
IAPF_tonic_height_cyc_all = NaN(18,8,10);
ITPF_tonic_height_cyc_all = NaN(18,8,10);
ISPF_tonic_height_cyc_all = NaN(18,8,10);

alpha_tonic_den_cyc = NaN(18,8,10);
alpha_tonic_abu_cyc = NaN(18,8,10);
alpha_tonic_amp_cyc = NaN(18,8,10);
alpha_tonic_snr_cyc = NaN(18,8,10);

theta_tonic_den_cyc = NaN(18,8,10);
theta_tonic_abu_cyc = NaN(18,8,10);
theta_tonic_amp_cyc = NaN(18,8,10);
theta_tonic_snr_cyc = NaN(18,8,10);

spindles_tonic_den_cyc = NaN(18,8,10);
spindles_tonic_abu_cyc = NaN(18,8,10);
spindles_tonic_amp_cyc = NaN(18,8,10);
spindles_tonic_snr_cyc = NaN(18,8,10);
    
IAPF_tonic_cyc_quint_all = NaN(18,8,10,5);
ITPF_tonic_cyc_quint_all = NaN(18,8,10,5);
ISPF_tonic_cyc_quint_all = NaN(18,8,10,5);
IAPF_tonic_height_cyc_quint_all = NaN(18,8,10,5);
ITPF_tonic_height_cyc_quint_all = NaN(18,8,10,5);
ISPF_tonic_height_cyc_quint_all = NaN(18,8,10,5);

alpha_tonic_den_cyc_quint = NaN(18,8,10,5);
alpha_tonic_abu_cyc_quint = NaN(18,8,10,5);
alpha_tonic_amp_cyc_quint = NaN(18,8,10,5);
alpha_tonic_snr_cyc_quint = NaN(18,8,10,5);

theta_tonic_den_cyc_quint = NaN(18,8,10,5);
theta_tonic_abu_cyc_quint = NaN(18,8,10,5);
theta_tonic_amp_cyc_quint = NaN(18,8,10,5);
theta_tonic_snr_cyc_quint = NaN(18,8,10,5);

spindles_tonic_den_cyc_quint = NaN(18,8,10,5);
spindles_tonic_abu_cyc_quint = NaN(18,8,10,5);
spindles_tonic_amp_cyc_quint = NaN(18,8,10,5);
spindles_tonic_snr_cyc_quint = NaN(18,8,10,5);


% nrem
exponent_1_30_cyc_nrem_all = NaN(18,8,10);
exponent_30_45_cyc_nrem_all = NaN(18,8,10);
offset_1_30_cyc_nrem_all = NaN(18,8,10);
offset_30_45_cyc_nrem_all = NaN(18,8,10);

exponent_1_30_cyc_quint_nrem_all = NaN(18,8,10,5);
exponent_30_45_cyc_quint_nrem_all = NaN(18,8,10,5);
offset_1_30_cyc_quint_nrem_all = NaN(18,8,10,5);
offset_30_45_cyc_quint_nrem_all = NaN(18,8,10,5);
       
IAPF_nrem_cyc_all = NaN(18,8,10);
ITPF_nrem_cyc_all = NaN(18,8,10);
ISPF_nrem_cyc_all = NaN(18,8,10);
IAPF_nrem_height_cyc_all = NaN(18,8,10);
ITPF_nrem_height_cyc_all = NaN(18,8,10);
ISPF_nrem_height_cyc_all = NaN(18,8,10);

alpha_nrem_den_cyc = NaN(18,8,10);
alpha_nrem_abu_cyc = NaN(18,8,10);
alpha_nrem_amp_cyc = NaN(18,8,10);
alpha_nrem_snr_cyc = NaN(18,8,10);

theta_nrem_den_cyc = NaN(18,8,10);
theta_nrem_abu_cyc = NaN(18,8,10);
theta_nrem_amp_cyc = NaN(18,8,10);
theta_nrem_snr_cyc = NaN(18,8,10);

spindles_nrem_den_cyc = NaN(18,8,10);
spindles_nrem_abu_cyc = NaN(18,8,10);
spindles_nrem_amp_cyc = NaN(18,8,10);
spindles_nrem_snr_cyc = NaN(18,8,10);
    
IAPF_nrem_cyc_quint_all = NaN(18,8,10,5);
ITPF_nrem_cyc_quint_all = NaN(18,8,10,5);
ISPF_nrem_cyc_quint_all = NaN(18,8,10,5);
IAPF_nrem_height_cyc_quint_all = NaN(18,8,10,5);
ITPF_nrem_height_cyc_quint_all = NaN(18,8,10,5);
ISPF_nrem_height_cyc_quint_all = NaN(18,8,10,5);

alpha_nrem_den_cyc_quint = NaN(18,8,10,5);
alpha_nrem_abu_cyc_quint = NaN(18,8,10,5);
alpha_nrem_amp_cyc_quint = NaN(18,8,10,5);
alpha_nrem_snr_cyc_quint = NaN(18,8,10,5);

theta_nrem_den_cyc_quint = NaN(18,8,10,5);
theta_nrem_abu_cyc_quint = NaN(18,8,10,5);
theta_nrem_amp_cyc_quint = NaN(18,8,10,5);
theta_nrem_snr_cyc_quint = NaN(18,8,10,5);

spindles_nrem_den_cyc_quint = NaN(18,8,10,5);
spindles_nrem_abu_cyc_quint = NaN(18,8,10,5);
spindles_nrem_amp_cyc_quint = NaN(18,8,10,5);
spindles_nrem_snr_cyc_quint = NaN(18,8,10,5);

%%

% for s = 1 %:length(waves_folder_dir)   
s = 29;

    files = dir([waves_folder, waves_folder_dir(s).name(1:12),filesep,'AFOSR*']);
    
    
    for file = 1:length(files)
        
        display(['file = ',num2str(file)]);
        
        %%
        filename = files(file).name;
        night = find_night(filename);
        
        load([waves_folder, waves_folder_dir(s).name(1:12),filesep,files(file).name]);
        clear phato_30
        
        load([goodREM_folder,files(file).name(1:18),'_goodREM.mat']);
        
        if length(hypno3) > length(phasic_ep)
           hypno3 = hypno3(1:length(phasic_ep));   
        end        
                
        rem_epochs = find(hypno3 == 'R');
        nrem_epochs = find(hypno3 == '2'| hypno3 == '3' | hypno3 == '4');
        n1_epochs = find(hypno3 == '1');
        n2_epochs = find(hypno3 == '2');
        n3_epochs = find(hypno3 == '3' | hypno3 == '4');
        wake_epochs = find(hypno3 == 'W');
        
        epochl = 1;
        n_phasic_thresh = 1;
        phato = calculate_phato(phasic_ep, tonic_ep, art_ep, epochl, n_phasic_thresh); 
        
        phasic_epochs = find(string(phato) == 'P');
        tonic_epochs = find(string(phato) == 'T');
        art_epochs = find(string(phato) == 'A');
                   
        windowl = 1;
        phasicgoodrem_samp = [];
    
        for ep = 1:length(phasic_goodndx)
        
            ep_ndx = phasic_goodndx(ep);
            ep_samp = ((ep_ndx-1)*fs*windowl+1):(ep_ndx*fs*windowl);
            phasicgoodrem_samp = [phasicgoodrem_samp ep_samp];
        
            clear ep_samp
        
        end
        
        
        tonicgoodrem_samp = [];
    
        for ep = 1:length(tonic_goodndx)
        
            ep_ndx = tonic_goodndx(ep);
            ep_samp = ((ep_ndx-1)*fs*windowl+1):(ep_ndx*fs*windowl);
            tonicgoodrem_samp = [tonicgoodrem_samp ep_samp];
        
            clear ep_samp
        
        end
        

%% find nrem-rem cycles

        diff_rem_epochs = diff(rem_epochs);
        
        rem_break_ndx = find(diff_rem_epochs > 5*60/epochl);
       
        cyc_ndx_hypno = zeros(length(hypno3),1);
        
        n = 1;
        r = 1;
        cy = 1;
        last_rem = [];
            
        while r <= length(rem_break_ndx)
            if r == 1 % first cycle, at least 15 min NREM, no duration criterion for REM
                cyc_ndx_rem = rem_epochs(1:rem_break_ndx(r));
                cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1)));
                if length(cyc_ndx_nrem)*epochl/60 > 15
                cyc_ndx_hypno(cyc_ndx_rem) = cy;
                cyc_ndx_hypno(cyc_ndx_nrem) = cy;
                cy = cy+1;
                last_rem = cyc_ndx_rem(end);
                clear cyc_ndx_rem cyc_ndx_nrem
                end
                r = r+1;
            elseif r <= length(rem_break_ndx) % second to second last cycle, at least 15 min NREM and 5 min REM
                cyc_ndx_rem = rem_epochs(rem_break_ndx(r-1)+1:rem_break_ndx(r));
                if ~isempty(last_rem)
                    cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1) & nrem_epochs > last_rem));
                else
                    cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1)));
                end
                if length(cyc_ndx_rem)*epochl/60 > 5 & length(cyc_ndx_nrem)*epochl/60 > 15
                   cyc_ndx_hypno(cyc_ndx_rem) = cy;
                   cyc_ndx_hypno(cyc_ndx_nrem) = cy;
                   cy = cy+1;
                   last_rem = cyc_ndx_rem(end);
                   clear cyc_ndx_rem cyc_ndx_nrem
                end
                r = r+1;
            end
        end
         
        cyc_ndx_rem = rem_epochs(rem_break_ndx(length(rem_break_ndx))+1:end);  % last cycle, at least 15 min NREM and 5 min REM
        if ~isempty(last_rem)
           cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1) & nrem_epochs > last_rem));
        else
           cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1)));
        end
        
        if length(cyc_ndx_rem)*epochl/60 > 5 & length(cyc_ndx_nrem)*epochl/60 > 15
           cyc_ndx_hypno(cyc_ndx_rem) = cy;
           cyc_ndx_hypno(cyc_ndx_nrem) = cy;
           clear cyc_ndx_rem cyc_ndx_nrem
        end      
        
%%
    
        
        for ch = 1:8

            
         %% rem cycles - aperiodic

            exponent_1_30_allep_ch_rep = repelem(exponent_1_30_allep(:,ch),epochlength/windowl);
            exponent_30_45_allep_ch_rep = repelem(exponent_30_45_allep(:,ch),epochlength/windowl);
            exponent_1_45_allep_ch_rep = repelem(exponent_1_45_allep(:,ch),epochlength/windowl);
             
            offset_1_30_allep_ch_rep = repelem(offset_1_30_allep(:,ch),epochlength/windowl);
            offset_30_45_allep_ch_rep = repelem(offset_30_45_allep(:,ch),epochlength/windowl);
            offset_1_45_allep_ch_rep = repelem(offset_1_45_allep(:,ch),epochlength/windowl);
             
            
            for c = 1:max(cyc_ndx_hypno)

             cyc_ndx = find(cyc_ndx_hypno == c);
             cyc_ndx_nrem = intersect(cyc_ndx,nrem_epochs);
             cyc_ndx_rem = intersect(cyc_ndx,rem_epochs);
             cyc_ndx_phasic = intersect(cyc_ndx,phasic_epochs);
             cyc_ndx_tonic = intersect(cyc_ndx,tonic_epochs);
             
             exponent_1_30_cyc_nrem(c) = nanmean(exponent_1_30_allep_ch_rep(cyc_ndx_nrem),1);
             exponent_30_45_cyc_nrem(c) = nanmean(exponent_30_45_allep_ch_rep(cyc_ndx_nrem),1);
%              exponent_1_45_cyc_nrem(c) = nanmean(exponent_1_45_allep_ch_rep(cyc_ndx_nrem),1);
             offset_1_30_cyc_nrem(c) = nanmean(offset_1_30_allep_ch_rep(cyc_ndx_nrem),1);
             offset_30_45_cyc_nrem(c) = nanmean(offset_30_45_allep_ch_rep(cyc_ndx_nrem),1);
%              offset_1_45_cyc_nrem(c) = nanmean(offset_1_45_allep_ch_rep(cyc_ndx_nrem),1);
             
             exponent_1_30_cyc_rem(c) = nanmean(exponent_1_30_allep_ch_rep(cyc_ndx_rem),1);
             exponent_30_45_cyc_rem(c) = nanmean(exponent_30_45_allep_ch_rep(cyc_ndx_rem),1);
%              exponent_1_45_cyc_rem(c) = nanmean(exponent_1_45_allep_ch_rep(cyc_ndx_rem),1);
             offset_1_30_cyc_rem(c) = nanmean(offset_1_30_allep_ch_rep(cyc_ndx_rem),1);
             offset_30_45_cyc_rem(c) = nanmean(offset_30_45_allep_ch_rep(cyc_ndx_rem),1);
%              offset_1_45_cyc_rem(c) = nanmean(offset_1_45_allep_ch_rep(cyc_ndx_rem),1);

             exponent_1_30_cyc_phasic(c) = nanmean(exponent_1_30_allep_ch_rep(cyc_ndx_phasic),1);
             exponent_30_45_cyc_phasic(c) = nanmean(exponent_30_45_allep_ch_rep(cyc_ndx_phasic),1);
%              exponent_1_45_cyc_phasic(c) = nanmean(exponent_1_45_allep_ch_rep(cyc_ndx_phasic),1);
             offset_1_30_cyc_phasic(c) = nanmean(offset_1_30_allep_ch_rep(cyc_ndx_phasic),1);
             offset_30_45_cyc_phasic(c) = nanmean(offset_30_45_allep_ch_rep(cyc_ndx_phasic),1);
%              offset_1_45_cyc_phasic(c) = nanmean(offset_1_45_allep_ch_rep(cyc_ndx_phasic),1);

             exponent_1_30_cyc_tonic(c) = nanmean(exponent_1_30_allep_ch_rep(cyc_ndx_tonic),1);
             exponent_30_45_cyc_tonic(c) = nanmean(exponent_30_45_allep_ch_rep(cyc_ndx_tonic),1);
%              exponent_1_45_cyc_tonic(c) = nanmean(exponent_1_45_allep_ch_rep(cyc_ndx_tonic),1);
             offset_1_30_cyc_tonic(c) = nanmean(offset_1_30_allep_ch_rep(cyc_ndx_tonic),1);
             offset_30_45_cyc_tonic(c) = nanmean(offset_30_45_allep_ch_rep(cyc_ndx_tonic),1);
%              offset_1_45_cyc_tonic(c) = nanmean(offset_1_45_allep_ch_rep(cyc_ndx_tonic),1);
             
             n_cyc_ep_nrem = length(cyc_ndx_nrem);
             n_cyc_ep_nrem_quint = floor(n_cyc_ep_nrem/5);
             
             n_cyc_ep_rem = length(cyc_ndx_rem);
             n_cyc_ep_rem_quint = floor(n_cyc_ep_rem/5);
             
             for q = 1:5
                 
                 cyc_quint_ndx_nrem = cyc_ndx_nrem((q-1)*n_cyc_ep_nrem_quint+1:q*n_cyc_ep_nrem_quint);
                 cyc_quint_ndx_rem = cyc_ndx_rem((q-1)*n_cyc_ep_rem_quint+1:q*n_cyc_ep_rem_quint);
                 cyc_quint_ndx_phasic = intersect(cyc_quint_ndx_rem,phasic_epochs);
                 cyc_quint_ndx_tonic = intersect(cyc_quint_ndx_rem,tonic_epochs);
                 
                 exponent_1_30_cyc_quint_nrem(c,q) = nanmean(exponent_1_30_allep_ch_rep(cyc_quint_ndx_nrem),1);
                 exponent_30_45_cyc_quint_nrem(c,q) = nanmean(exponent_30_45_allep_ch_rep(cyc_quint_ndx_nrem),1);
%                  exponent_1_45_cyc_quint_nrem(c,q) = nanmean(exponent_1_45_allep_ch_rep(cyc_quint_ndx_nrem),1);
                 offset_1_30_cyc_quint_nrem(c,q) = nanmean(offset_1_30_allep_ch_rep(cyc_quint_ndx_nrem),1);
                 offset_30_45_cyc_quint_nrem(c,q) = nanmean(offset_30_45_allep_ch_rep(cyc_quint_ndx_nrem),1);
%                  offset_1_45_cyc_quint_nrem(c,q) = nanmean(offset_1_45_allep_ch_rep(cyc_quint_ndx_nrem),1);

                 exponent_1_30_cyc_quint_rem(c,q) = nanmean(exponent_1_30_allep_ch_rep(cyc_quint_ndx_rem),1);
                 exponent_30_45_cyc_quint_rem(c,q) = nanmean(exponent_30_45_allep_ch_rep(cyc_quint_ndx_rem),1);
%                  exponent_1_45_cyc_quint_rem(c,q) = nanmean(exponent_1_45_allep_ch_rep(cyc_quint_ndx_rem),1);
                 offset_1_30_cyc_quint_rem(c,q) = nanmean(offset_1_30_allep_ch_rep(cyc_quint_ndx_rem),1);
                 offset_30_45_cyc_quint_rem(c,q) = nanmean(offset_30_45_allep_ch_rep(cyc_quint_ndx_rem),1);
%                  offset_1_45_cyc_quint_rem(c,q) = nanmean(offset_1_45_allep_ch_rep(cyc_quint_ndx_rem),1);

                 exponent_1_30_cyc_quint_phasic(c,q) = nanmean(exponent_1_30_allep_ch_rep(cyc_quint_ndx_phasic),1);
                 exponent_30_45_cyc_quint_phasic(c,q) = nanmean(exponent_30_45_allep_ch_rep(cyc_quint_ndx_phasic),1);
%                  exponent_1_45_cyc_quint_phasic(c,q) = nanmean(exponent_1_45_allep_ch_rep(cyc_quint_ndx_phasic),1);
                 offset_1_30_cyc_quint_phasic(c,q) = nanmean(offset_1_30_allep_ch_rep(cyc_quint_ndx_phasic),1);
                 offset_30_45_cyc_quint_phasic(c,q) = nanmean(offset_30_45_allep_ch_rep(cyc_quint_ndx_phasic),1);
%                  offset_1_45_cyc_quint_phasic(c,q) = nanmean(offset_1_45_allep_ch_rep(cyc_quint_ndx_phasic),1);

                 exponent_1_30_cyc_quint_tonic(c,q) = nanmean(exponent_1_30_allep_ch_rep(cyc_quint_ndx_tonic),1);
                 exponent_30_45_cyc_quint_tonic(c,q) = nanmean(exponent_30_45_allep_ch_rep(cyc_quint_ndx_tonic),1);
%                  exponent_1_45_cyc_quint_tonic(c,q) = nanmean(exponent_1_45_allep_ch_rep(cyc_quint_ndx_tonic),1);
                 offset_1_30_cyc_quint_tonic(c,q) = nanmean(offset_1_30_allep_ch_rep(cyc_quint_ndx_tonic),1);
                 offset_30_45_cyc_quint_tonic(c,q) = nanmean(offset_30_45_allep_ch_rep(cyc_quint_ndx_tonic),1);
%                  offset_1_45_cyc_quint_tonic(c,q) = nanmean(offset_1_45_allep_ch_rep(cyc_quint_ndx_tonic),1);
                 
                 clear cyc_quint_ndx_nrem cyc_quint_ndx_rem cyc_quint_ndx_phasic cyc_quint_ndx_tonic
                 
             end
             
             clear cyc_ndx_nrem cyc_ndx_rem cyc_ndx_phasic cyc_ndx_tonic 
                
        end   
            
%%      extract waves 

        waves_ch = waves_allepch(find(waves_allepch.channel == ch),:);

        waves_ch.start_miniep = NaN(size(waves_ch,1),1);
        waves_ch.end_miniep = NaN(size(waves_ch,1),1);

        for w = 1:size(waves_ch,1)
                
                samp_wave = waves_ch.startsamp(w):waves_ch.endsamp(w);
                start_miniep = ceil(waves_ch.startsamp(w)/fs);
                end_miniep = ceil(waves_ch.endsamp(w)/fs);
                
            if string(waves_ch.stage(w)) == 'R'
               
                if ~isempty(intersect(samp_wave,phasicgoodrem_samp))                    
                    waves_ch.substage(w) = 'P';
                elseif ~isempty(intersect(samp_wave,tonicgoodrem_samp))  
                    waves_ch.substage(w) = 'T'; 
                else
                    waves_ch.substage(w) = 'A';                     
                end
                
            else
            waves_ch.substage(w) = 'N';  

            end
                
                waves_ch.start_miniep(w) = start_miniep;
                waves_ch.end_miniep(w) = end_miniep;
                if waves_ch.start_miniep(w) <= length(cyc_ndx_hypno)
                waves_ch.sleepcyc(w) = cyc_ndx_hypno(waves_ch.start_miniep(w));
                else
                waves_ch.sleepcyc(w) = NaN;                   
                end
                waves_ch.wave_ndx(w) = w;
               
                clear samp_wave start_ep end_ep   
        end
                
        cyc_ndx = find(waves_ch.cycles > 3);
        dur_ndx = find(waves_ch.duration > 0.3);
        freq_ndx = find(waves_ch.frequency > lower_freq & waves_ch.frequency < higher_freq);

        waves_wake_ndx = find(string(waves_ch.stage) == 'W');
        waves_n1_ndx = find(string(waves_ch.stage) == '1');
        waves_nrem_ndx = find(string(waves_ch.stage) == '2' | string(waves_ch.stage) == '3' | string(waves_ch.stage) == '4');
        waves_rem_ndx = find(string(waves_ch.stage) == 'R');
        waves_phasic_ndx = find(string(waves_ch.substage) == 'P');
        waves_tonic_ndx = find(string(waves_ch.substage) == 'T');
        
        cyc_dur_ndx = intersect(cyc_ndx,dur_ndx);
        cyc_dur_freq_ndx = intersect(cyc_dur_ndx,freq_ndx);
        waves_ch_cyc_dur_freq = waves_ch(cyc_dur_freq_ndx,:);
        
    
        waves_wake_cyc_dur_freq_ndx = intersect(waves_wake_ndx, cyc_dur_freq_ndx);
        waves_wake_cyc_dur_freq = waves_ch(waves_wake_cyc_dur_freq_ndx,:);
    
        waves_nrem_cyc_dur_freq_ndx = intersect(waves_nrem_ndx, cyc_dur_freq_ndx);
        waves_nrem_cyc_dur_freq = waves_ch(waves_nrem_cyc_dur_freq_ndx,:);
    
        waves_rem_cyc_dur_freq_ndx = intersect(waves_rem_ndx, cyc_dur_freq_ndx);
        waves_rem_cyc_dur_freq = waves_ch(waves_rem_cyc_dur_freq_ndx,:);

        waves_phasic_cyc_dur_freq_ndx = intersect(waves_phasic_ndx, cyc_dur_freq_ndx);
        waves_phasic_cyc_dur_freq = waves_ch(waves_phasic_cyc_dur_freq_ndx,:); 
        
        waves_tonic_cyc_dur_freq_ndx = intersect(waves_tonic_ndx, cyc_dur_freq_ndx);
        waves_tonic_cyc_dur_freq = waves_ch(waves_tonic_cyc_dur_freq_ndx,:); 
        
                 
%% rem cycles - periodic


%         if ~isempty(waves_rem_cyc_dur_freq)
            
         
            for c = 1:max(cyc_ndx_hypno)
  
                cyc_ndx = find(cyc_ndx_hypno == c);
                sleepcyc_ndx = find(waves_ch.sleepcyc == c);
                rem_epochs_cyc = intersect(rem_epochs, cyc_ndx);
                phasic_epochs_cyc = intersect(phasic_epochs, cyc_ndx);
                tonic_epochs_cyc = intersect(tonic_epochs, cyc_ndx);
                nrem_epochs_cyc = intersect(nrem_epochs, cyc_ndx);
                wake_epochs_cyc = intersect(wake_epochs, cyc_ndx);
                
                n_phasic_cyc_ep = length(phasic_epochs_cyc);
                n_tonic_cyc_ep =  length(tonic_epochs_cyc);
                prob_phasic_cyc(c) = n_phasic_cyc_ep/(n_phasic_cyc_ep + n_tonic_cyc_ep);
                dur_rem_cyc_min(c) = length(rem_epochs_cyc)*epochl/60;
                dur_nrem_cyc_min(c) = length(nrem_epochs_cyc)*epochl/60;
               
              
                [den_alpha abu_alpha amp_alpha snr_alpha] = calculate_abu_den_cycles_vj(waves_ch, lower_freq_alpha, higher_freq_alpha,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc, waves_wake_cyc_dur_freq_ndx, wake_epochs_cyc, epochlength, windowl, fs, phasic_ep, sleepcyc_ndx); 
                [den_theta abu_theta amp_theta snr_theta] = calculate_abu_den_cycles_vj(waves_ch, lower_freq_theta, higher_freq_theta,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc, waves_wake_cyc_dur_freq_ndx, wake_epochs_cyc, epochlength, windowl, fs, phasic_ep, sleepcyc_ndx); 
                [den_spindles abu_spindles amp_spindles snr_spindles] = calculate_abu_den_cycles_vj(waves_ch, lower_freq_spindles, higher_freq_spindles,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc, waves_wake_cyc_dur_freq_ndx, wake_epochs_cyc, epochlength, windowl, fs, phasic_ep, sleepcyc_ndx); 
              
                 
                alpha_rem_den_cyc(night,ch,c) = den_alpha.rem_density;
                theta_rem_den_cyc(night,ch,c) = den_theta.rem_density;
                spindles_rem_den_cyc(night,ch,c) = den_spindles.rem_density;

                alpha_phasic_den_cyc(night,ch,c) = den_alpha.phasic_density;
                theta_phasic_den_cyc(night,ch,c) = den_theta.phasic_density;
                spindles_phasic_den_cyc(night,ch,c) = den_spindles.phasic_density;

                alpha_tonic_den_cyc(night,ch,c) = den_alpha.tonic_density;
                theta_tonic_den_cyc(night,ch,c) = den_theta.tonic_density;
                spindles_tonic_den_cyc(night,ch,c) = den_spindles.tonic_density;

                alpha_nrem_den_cyc(night,ch,c) = den_alpha.nrem_density;
                theta_nrem_den_cyc(night,ch,c) = den_theta.nrem_density;
                spindles_nrem_den_cyc(night,ch,c) = den_spindles.nrem_density;

                alpha_wake_den_cyc(night,ch,c) = den_alpha.wake_density;
                theta_wake_den_cyc(night,ch,c) = den_theta.wake_density;
                spindles_wake_den_cyc(night,ch,c) = den_spindles.wake_density;
        
        
                alpha_rem_abu_cyc(night,ch,c) = abu_alpha.rem_abu;
                theta_rem_abu_cyc(night,ch,c) = abu_theta.rem_abu;
                spindles_rem_abu_cyc(night,ch,c) = abu_spindles.rem_abu;

                alpha_phasic_abu_cyc(night,ch,c) = abu_alpha.phasic_abu;
                theta_phasic_abu_cyc(night,ch,c) = abu_theta.phasic_abu;
                spindles_phasic_abu_cyc(night,ch,c) = abu_spindles.phasic_abu;

                alpha_tonic_abu_cyc(night,ch,c) = abu_alpha.tonic_abu;
                theta_tonic_abu_cyc(night,ch,c) = abu_theta.tonic_abu;
                spindles_tonic_abu_cyc(night,ch,c) = abu_spindles.tonic_abu;

                alpha_nrem_abu_cyc(night,ch,c) = abu_alpha.nrem_abu;
                theta_nrem_abu_cyc(night,ch,c) = abu_theta.nrem_abu;
                spindles_nrem_abu_cyc(night,ch,c) = abu_spindles.nrem_abu;

                alpha_wake_abu_cyc(night,ch,c) = abu_alpha.wake_abu;
                theta_wake_abu_cyc(night,ch,c) = abu_theta.wake_abu;
                spindles_wake_abu_cyc(night,ch,c) = abu_spindles.wake_abu;
        
        
                alpha_rem_amp_cyc(night,ch,c) = amp_alpha.rem_amp;
                theta_rem_amp_cyc(night,ch,c) = amp_theta.rem_amp;
                spindles_rem_amp_cyc(night,ch,c) = amp_spindles.rem_amp;

                alpha_phasic_amp_cyc(night,ch,c) = amp_alpha.phasic_amp;
                theta_phasic_amp_cyc(night,ch,c) = amp_theta.phasic_amp;
                spindles_phasic_amp_cyc(night,ch,c) = amp_spindles.phasic_amp;

                alpha_tonic_amp_cyc(night,ch,c) = amp_alpha.tonic_amp;
                theta_tonic_amp_cyc(night,ch,c) = amp_theta.tonic_amp;
                spindles_tonic_amp_cyc(night,ch,c) = amp_spindles.tonic_amp;

                alpha_nrem_amp_cyc(night,ch,c) = amp_alpha.nrem_amp;
                theta_nrem_amp_cyc(night,ch,c) = amp_theta.nrem_amp;
                spindles_nrem_amp_cyc(night,ch,c) = amp_spindles.nrem_amp;

                alpha_wake_amp_cyc(night,ch,c) = amp_alpha.wake_amp;
                theta_wake_amp_cyc(night,ch,c) = amp_theta.wake_amp;
                spindles_wake_amp_cyc(night,ch,c) = amp_spindles.wake_amp;
        
        
                alpha_rem_snr_cyc(night,ch,c) = snr_alpha.rem_snr;
                theta_rem_snr_cyc(night,ch,c) = snr_theta.rem_snr;
                spindles_rem_snr_cyc(night,ch,c) = snr_spindles.rem_snr;

                alpha_phasic_snr_cyc(night,ch,c) = snr_alpha.phasic_snr;
                theta_phasic_snr_cyc(night,ch,c) = snr_theta.phasic_snr;
                spindles_phasic_snr_cyc(night,ch,c) = snr_spindles.phasic_snr;

                alpha_tonic_snr_cyc(night,ch,c) = snr_alpha.tonic_snr;
                theta_tonic_snr_cyc(night,ch,c) = snr_theta.tonic_snr;
                spindles_tonic_snr_cyc(night,ch,c) = snr_spindles.tonic_snr;

                alpha_nrem_snr_cyc(night,ch,c) = snr_alpha.nrem_snr;
                theta_nrem_snr_cyc(night,ch,c) = snr_theta.nrem_snr;
                spindles_nrem_snr_cyc(night,ch,c) = snr_spindles.nrem_snr;

                alpha_wake_snr_cyc(night,ch,c) = snr_alpha.wake_snr;
                theta_wake_snr_cyc(night,ch,c) = snr_theta.wake_snr;
                spindles_wake_snr_cyc(night,ch,c) = snr_spindles.wake_snr;
        
        
                clear den_alpha abu_alpha amp_alpha den_theta abu_theta amp_theta den_spindles abu_spindles amp_spindles snr_alpha snr_theta snr_spindles

%%              

        colors = linspecer(8);
        
%         if ch == 1 | ch == 5
%             fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
%             fig.WindowState = 'maximized';
%         end
% 
%         
%        
%         if ch == 1 | ch == 8
%             subplot(5,4,5)
%         elseif ch == 2 | ch == 7
%             subplot(5,4,6)           
%         elseif ch == 3 | ch == 6
%             subplot(5,4,7)            
%         elseif ch == 4 | ch == 5
%             subplot(5,4,8)           
%         end

%         subplot(5,4,5)

        waves_rem_cyc_dur_freq_sleepcyc = waves_rem_cyc_dur_freq(find(waves_rem_cyc_dur_freq.sleepcyc == c),:);
        
        if size(waves_rem_cyc_dur_freq_sleepcyc,1) >= 10
        [IAPF_rem_cyc(c) ITPF_rem_cyc(c) ISPF_rem_cyc(c) IAPF_rem_height_cyc(c) ITPF_rem_height_cyc(c) ISPF_rem_height_cyc(c)] = peak_detection_vj(waves_rem_cyc_dur_freq_sleepcyc, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels,' rem, IAPF: ', num2str(IAPF_rem_cyc(c)), ' Hz, height: ',num2str(round(IAPF_rem_height_cyc(c),2)), ', ITPF: ', num2str(ITPF_rem_cyc(c)), ' Hz, ISPF: ', num2str(ISPF_rem_cyc(c))]);
        else
            IAPF_rem_cyc(c) = NaN;
            ITPF_rem_cyc(c) = NaN;
            ISPF_rem_cyc(c) = NaN;
            IAPF_rem_height_cyc(c) = NaN;
            ITPF_rem_height_cyc(c) = NaN;
            ISPF_rem_height_cyc(c) = NaN;
        end
        
     
%         if ch == 1 | ch == 8
%             subplot(5,4,9)
%         elseif ch == 2 | ch == 7
%             subplot(5,4,10)           
%         elseif ch == 3 | ch == 6
%             subplot(5,4,11)            
%         elseif ch == 4 | ch == 5
%             subplot(5,4,12)           
%         end

%         subplot(5,4,9)
        waves_phasic_cyc_dur_freq_sleepcyc = waves_phasic_cyc_dur_freq(find(waves_phasic_cyc_dur_freq.sleepcyc == c),:);

        if size(waves_phasic_cyc_dur_freq_sleepcyc,1) >= 10
        [IAPF_phasic_cyc(c) ITPF_phasic_cyc(c) ISPF_phasic_cyc(c) IAPF_phasic_height_cyc(c) ITPF_phasic_height_cyc(c) ISPF_phasic_height_cyc(c)] = peak_detection_vj(waves_phasic_cyc_dur_freq_sleepcyc, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels, ' phasic, IAPF: ', num2str(IAPF_phasic_cyc(c)),' Hz, height: ',num2str(round(IAPF_phasic_height_cyc(c),2)), ', ITPF: ', num2str(ITPF_phasic_cyc(c)), ' Hz, ISPF: ', num2str(ISPF_phasic_cyc(c))]);
        else
            IAPF_phasic_cyc(c) = NaN;
            ITPF_phasic_cyc(c) = NaN;
            ISPF_phasic_cyc(c) = NaN; 
            IAPF_phasic_height_cyc(c) = NaN;
            ITPF_phasic_height_cyc(c) = NaN;
            ISPF_phasic_height_cyc(c) = NaN; 
        end
        
        
%         if ch == 1 | ch == 8
%             subplot(5,4,13)
%         elseif ch == 2 | ch == 7
%             subplot(5,4,14)           
%         elseif ch == 3 | ch == 6
%             subplot(5,4,15)            
%         elseif ch == 4 | ch == 5
%             subplot(5,4,16)           
%         end
        

%         subplot(5,4,13)        
        waves_tonic_cyc_dur_freq_sleepcyc = waves_tonic_cyc_dur_freq(find(waves_tonic_cyc_dur_freq.sleepcyc == c),:);

        if size(waves_tonic_cyc_dur_freq_sleepcyc,1) >= 10 
        [IAPF_tonic_cyc(c) ITPF_tonic_cyc(c) ISPF_tonic_cyc(c) IAPF_tonic_height_cyc(c) ITPF_tonic_height_cyc(c) ISPF_tonic_height_cyc(c)] = peak_detection_vj(waves_tonic_cyc_dur_freq_sleepcyc, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels, ' tonic, IAPF: ', num2str(IAPF_tonic_cyc(c)), ' Hz, height: ',num2str(round(IAPF_tonic_height_cyc(c),2)), ', ITPF: ', num2str(ITPF_tonic_cyc(c)), ' Hz, ISPF: ', num2str(ISPF_tonic_cyc(c))]);
        else
           IAPF_tonic_cyc(c) = NaN;
           ITPF_tonic_cyc(c) = NaN;
           ISPF_tonic_cyc(c) = NaN;  
           IAPF_tonic_height_cyc(c) = NaN;
           ITPF_tonic_height_cyc(c) = NaN;
           ISPF_tonic_height_cyc(c) = NaN;   
        end
        
%         if ch == 1 | ch == 8
%             subplot(5,4,17)
%         elseif ch == 2 | ch == 7
%             subplot(5,4,18)           
%         elseif ch == 3 | ch == 6
%             subplot(5,4,19)            
%         elseif ch == 4 | ch == 5
%             subplot(5,4,20)           
%         end
        
%         subplot(5,4,17)           
        waves_nrem_cyc_dur_freq_sleepcyc = waves_nrem_cyc_dur_freq(find(waves_nrem_cyc_dur_freq.sleepcyc == c),:);
        
        if size(waves_nrem_cyc_dur_freq_sleepcyc,1) >= 10 
        [IAPF_nrem_cyc(c) ITPF_nrem_cyc(c) ISPF_nrem_cyc(c) IAPF_nrem_height_cyc(c) ITPF_nrem_height_cyc(c) ISPF_nrem_height_cyc(c)] = peak_detection_vj(waves_nrem_cyc_dur_freq_sleepcyc, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels,' nrem, IAPF: ', num2str(IAPF_nrem_cyc(c)), ' Hz, height: ',num2str(round(IAPF_nrem_height_cyc(c),2)),', ITPF: ', num2str(ITPF_nrem_cyc(c)), ' Hz, ISPF: ', num2str(ISPF_nrem_cyc(c))]);
        else
           IAPF_nrem_cyc(c) = NaN;
           ITPF_nrem_cyc(c) = NaN;
           ISPF_nrem_cyc(c) = NaN;   
           IAPF_nrem_height_cyc(c) = NaN;
           ITPF_nrem_height_cyc(c) = NaN;
           ISPF_nrem_height_cyc(c) = NaN;   
        end
        
        
        xlabel('Frequency (Hz)');
        ylabel('Number')    
        
        
%         if ch == 4 | ch == 8
%         saveas(fig,[Savefolder,'plots',filesep,filename(1:18),'_ch',num2str(ch),'_not_individualized_2_6_12.svg']);
%         close
%         end

        close
    
%% rem cycles, quintiles
        
%         if ~isempty(waves_rem_cyc_dur_freq)
            
%            fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
%            fig.WindowState = 'maximized';

%             for c = 1:max(waves_rem_cyc_dur_freq.sleepcyc)
                
%                 waves_rem_cyc_dur_freq_sleepcyc = waves_rem_cyc_dur_freq(find(waves_rem_cyc_dur_freq.sleepcyc == c),:);
                

             n_cyc_ep_nrem = length(nrem_epochs_cyc);
             n_cyc_ep_nrem_quint = floor(n_cyc_ep_nrem/5);
             
             n_cyc_ep_rem = length(rem_epochs_cyc);
             n_cyc_ep_rem_quint = floor(n_cyc_ep_rem/5);
             
             
             for q = 1:5
               
                 
                 nrem_epochs_cyc_quint = nrem_epochs_cyc((q-1)*n_cyc_ep_nrem_quint+1:q*n_cyc_ep_nrem_quint);
                 rem_epochs_cyc_quint = rem_epochs_cyc((q-1)*n_cyc_ep_rem_quint+1:q*n_cyc_ep_rem_quint);
                 phasic_epochs_cyc_quint = intersect(rem_epochs_cyc_quint,phasic_epochs);
                 tonic_epochs_cyc_quint = intersect(rem_epochs_cyc_quint,tonic_epochs);
                  
                 n_phasic_cyc_quint_ep = length(phasic_epochs_cyc_quint);
                 n_tonic_cyc_quint_ep =  length(tonic_epochs_cyc_quint);
                 prob_phasic_cyc_quint(c,q) = n_phasic_cyc_quint_ep/(n_phasic_cyc_quint_ep + n_tonic_cyc_quint_ep);
                 dur_rem_cyc_quint_min(c,q) = length(rem_epochs_cyc_quint)*epochl/60;
                 dur_nrem_cyc_quint_min(c,q) = length(nrem_epochs_cyc_quint)*epochl/60;                

                 waves_rem_cyc_dur_freq_sleepcyc_quint = waves_rem_cyc_dur_freq_sleepcyc(find(waves_rem_cyc_dur_freq_sleepcyc.start_miniep > rem_epochs_cyc_quint(1) & waves_rem_cyc_dur_freq_sleepcyc.end_miniep < rem_epochs_cyc_quint(end)),:);
                 sleepcyc_quint_ndx_rem = waves_rem_cyc_dur_freq_sleepcyc_quint.wave_ndx;
                 
                 waves_nrem_cyc_dur_freq_sleepcyc_quint = waves_nrem_cyc_dur_freq_sleepcyc(find(waves_nrem_cyc_dur_freq_sleepcyc.start_miniep > nrem_epochs_cyc_quint(1) & waves_nrem_cyc_dur_freq_sleepcyc.end_miniep < nrem_epochs_cyc_quint(end)),:);
                 sleepcyc_quint_ndx_nrem = waves_nrem_cyc_dur_freq_sleepcyc_quint.wave_ndx;
                 
                [den_alpha abu_alpha amp_alpha snr_alpha] = calculate_abu_den_cycles_quintiles_vj(waves_ch, lower_freq_alpha, higher_freq_alpha,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc_quint, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc_quint, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc_quint, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc_quint, epochlength, windowl, fs, phasic_ep, sleepcyc_quint_ndx_rem, sleepcyc_quint_ndx_nrem); 
                [den_theta abu_theta amp_theta snr_theta] = calculate_abu_den_cycles_quintiles_vj(waves_ch, lower_freq_theta, higher_freq_theta,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc_quint, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc_quint, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc_quint, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc_quint, epochlength, windowl, fs, phasic_ep, sleepcyc_quint_ndx_rem, sleepcyc_quint_ndx_nrem); 
                [den_spindles abu_spindles amp_spindles snr_spindles] = calculate_abu_den_cycles_quintiles_vj(waves_ch, lower_freq_spindles, higher_freq_spindles,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc_quint, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc_quint, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc_quint, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc_quint, epochlength, windowl, fs, phasic_ep, sleepcyc_quint_ndx_rem, sleepcyc_quint_ndx_nrem); 
                
                
                alpha_rem_den_cyc_quint(night,ch,c,q) = den_alpha.rem_density;
                theta_rem_den_cyc_quint(night,ch,c,q) = den_theta.rem_density;
                spindles_rem_den_cyc_quint(night,ch,c,q) = den_spindles.rem_density;

                alpha_phasic_den_cyc_quint(night,ch,c,q) = den_alpha.phasic_density;
                theta_phasic_den_cyc_quint(night,ch,c,q) = den_theta.phasic_density;
                spindles_phasic_den_cyc_quint(night,ch,c,q) = den_spindles.phasic_density;

                alpha_tonic_den_cyc_quint(night,ch,c,q) = den_alpha.tonic_density;
                theta_tonic_den_cyc_quint(night,ch,c,q) = den_theta.tonic_density;
                spindles_tonic_den_cyc_quint(night,ch,c,q) = den_spindles.tonic_density;

                alpha_nrem_den_cyc_quint(night,ch,c,q) = den_alpha.nrem_density;
                theta_nrem_den_cyc_quint(night,ch,c,q) = den_theta.nrem_density;
                spindles_nrem_den_cyc_quint(night,ch,c,q) = den_spindles.nrem_density;


                alpha_rem_abu_cyc_quint(night,ch,c,q) = abu_alpha.rem_abu;
                theta_rem_abu_cyc_quint(night,ch,c,q) = abu_theta.rem_abu;
                spindles_rem_abu_cyc_quint(night,ch,c,q) = abu_spindles.rem_abu;

                alpha_phasic_abu_cyc_quint(night,ch,c,q) = abu_alpha.phasic_abu;
                theta_phasic_abu_cyc_quint(night,ch,c,q) = abu_theta.phasic_abu;
                spindles_phasic_abu_cyc_quint(night,ch,c,q) = abu_spindles.phasic_abu;

                alpha_tonic_abu_cyc_quint(night,ch,c,q) = abu_alpha.tonic_abu;
                theta_tonic_abu_cyc_quint(night,ch,c,q) = abu_theta.tonic_abu;
                spindles_tonic_abu_cyc_quint(night,ch,c,q) = abu_spindles.tonic_abu;

                alpha_nrem_abu_cyc_quint(night,ch,c,q) = abu_alpha.nrem_abu;
                theta_nrem_abu_cyc_quint(night,ch,c,q) = abu_theta.nrem_abu;
                spindles_nrem_abu_cyc_quint(night,ch,c,q) = abu_spindles.nrem_abu;

                
                alpha_rem_amp_cyc_quint(night,ch,c,q) = amp_alpha.rem_amp;
                theta_rem_amp_cyc_quint(night,ch,c,q) = amp_theta.rem_amp;
                spindles_rem_amp_cyc_quint(night,ch,c,q) = amp_spindles.rem_amp;

                alpha_phasic_amp_cyc_quint(night,ch,c,q) = amp_alpha.phasic_amp;
                theta_phasic_amp_cyc_quint(night,ch,c,q) = amp_theta.phasic_amp;
                spindles_phasic_amp_cyc_quint(night,ch,c,q) = amp_spindles.phasic_amp;

                alpha_tonic_amp_cyc_quint(night,ch,c,q) = amp_alpha.tonic_amp;
                theta_tonic_amp_cyc_quint(night,ch,c,q) = amp_theta.tonic_amp;
                spindles_tonic_amp_cyc_quint(night,ch,c,q) = amp_spindles.tonic_amp;

                alpha_nrem_amp_cyc_quint(night,ch,c,q) = amp_alpha.nrem_amp;
                theta_nrem_amp_cyc_quint(night,ch,c,q) = amp_theta.nrem_amp;
                spindles_nrem_amp_cyc_quint(night,ch,c,q) = amp_spindles.nrem_amp;

            
                alpha_rem_snr_cyc_quint(night,ch,c,q) = snr_alpha.rem_snr;
                theta_rem_snr_cyc_quint(night,ch,c,q) = snr_theta.rem_snr;
                spindles_rem_snr_cyc_quint(night,ch,c,q) = snr_spindles.rem_snr;

                alpha_phasic_snr_cyc_quint(night,ch,c,q) = snr_alpha.phasic_snr;
                theta_phasic_snr_cyc_quint(night,ch,c,q) = snr_theta.phasic_snr;
                spindles_phasic_snr_cyc_quint(night,ch,c,q) = snr_spindles.phasic_snr;

                alpha_tonic_snr_cyc_quint(night,ch,c,q) = snr_alpha.tonic_snr;
                theta_tonic_snr_cyc_quint(night,ch,c,q) = snr_theta.tonic_snr;
                spindles_tonic_snr_cyc_quint(night,ch,c,q) = snr_spindles.tonic_snr;

                alpha_nrem_snr_cyc_quint(night,ch,c,q) = snr_alpha.nrem_snr;
                theta_nrem_snr_cyc_quint(night,ch,c,q) = snr_theta.nrem_snr;
                spindles_nrem_snr_cyc_quint(night,ch,c,q) = snr_spindles.nrem_snr;


                clear den_alpha abu_alpha amp_alpha den_theta abu_theta amp_theta den_spindles abu_spindles amp_spindles snr_alpha snr_theta snr_spindles


%%
                            
                colors = linspecer(8);
        
%                 if ch == 1 | ch == 5
%                     fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
%                     fig.WindowState = 'maximized';
%                 end
        
        
%                 if ch == 1 | ch == 8
%                     subplot(5,4,5)
%                 elseif ch == 2 | ch == 7
%                     subplot(5,4,6)           
%                 elseif ch == 3 | ch == 6
%                     subplot(5,4,7)            
%                 elseif ch == 4 | ch == 5
%                     subplot(5,4,8)           
%                 end

%         subplot(5,4,5)
        
                if size(waves_rem_cyc_dur_freq_sleepcyc_quint,1) >= 10
                [IAPF_rem_cyc_quint(c,q) ITPF_rem_cyc_quint(c,q) ISPF_rem_cyc_quint(c,q) IAPF_rem_height_cyc_quint(c,q) ITPF_rem_height_cyc_quint(c,q) ISPF_rem_height_cyc_quint(c,q)] = peak_detection_vj(waves_rem_cyc_dur_freq_sleepcyc_quint, peak_thresh, lower_freq_alpha,...
                    higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
                title([EEG.chanlocs(ch).labels,' rem, IAPF: ', num2str(IAPF_rem_cyc_quint(c,q)), ' Hz, height: ',num2str(round(IAPF_rem_height_cyc_quint(c,q),2)), ', ITPF: ', num2str(ITPF_rem_cyc_quint(c,q)), ' Hz, ISPF: ', num2str(ISPF_rem_cyc_quint(c,q))]);
                else
                    IAPF_rem_cyc_quint(c,q) = NaN;
                    ITPF_rem_cyc_quint(c,q) = NaN;
                    ISPF_rem_cyc_quint(c,q) = NaN;
                    IAPF_rem_height_cyc_quint(c,q) = NaN;
                    ITPF_rem_height_cyc_quint(c,q) = NaN;
                    ISPF_rem_height_cyc_quint(c,q) = NaN;
                end
        
     
%                 if ch == 1 | ch == 8
%                     subplot(5,4,9)
%                 elseif ch == 2 | ch == 7
%                     subplot(5,4,10)           
%                 elseif ch == 3 | ch == 6
%                     subplot(5,4,11)            
%                 elseif ch == 4 | ch == 5
%                     subplot(5,4,12)           
%                 end

%         subplot(5,4,9)
                waves_phasic_cyc_dur_freq_sleepcyc_quint = waves_rem_cyc_dur_freq_sleepcyc_quint(find(waves_rem_cyc_dur_freq_sleepcyc_quint.substage == 'P'),:);

                if size(waves_phasic_cyc_dur_freq_sleepcyc_quint,1) >= 10
                [IAPF_phasic_cyc_quint(c,q) ITPF_phasic_cyc_quint(c,q) ISPF_phasic_cyc_quint(c,q) IAPF_phasic_height_cyc_quint(c,q) ITPF_phasic_height_cyc_quint(c,q) ISPF_phasic_height_cyc_quint(c,q)] = peak_detection_vj(waves_phasic_cyc_dur_freq_sleepcyc_quint, peak_thresh, lower_freq_alpha,...
                    higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
                title([EEG.chanlocs(ch).labels, ' phasic, IAPF: ', num2str(IAPF_phasic_cyc_quint(c,q)),' Hz, height: ',num2str(round(IAPF_phasic_height_cyc_quint(c,q),2)), ', ITPF: ', num2str(ITPF_phasic_cyc_quint(c,q)), ' Hz, ISPF: ', num2str(ISPF_phasic_cyc_quint(c,q))]);
                else
                    IAPF_phasic_cyc_quint(c,q) = NaN;
                    ITPF_phasic_cyc_quint(c,q) = NaN;
                    ISPF_phasic_cyc_quint(c,q) = NaN; 
                    IAPF_phasic_height_cyc_quint(c,q) = NaN;
                    ITPF_phasic_height_cyc_quint(c,q) = NaN;
                    ISPF_phasic_height_cyc_quint(c,q) = NaN; 
                end
        
        
%                 if ch == 1 | ch == 8
%                     subplot(5,4,13)
%                 elseif ch == 2 | ch == 7
%                     subplot(5,4,14)           
%                 elseif ch == 3 | ch == 6
%                     subplot(5,4,15)            
%                 elseif ch == 4 | ch == 5
%                     subplot(5,4,16)           
%                 end
        

%         subplot(5,4,13)        
                waves_tonic_cyc_dur_freq_sleepcyc_quint = waves_rem_cyc_dur_freq_sleepcyc_quint(find(waves_rem_cyc_dur_freq_sleepcyc_quint.substage == 'T'),:);

                if size(waves_tonic_cyc_dur_freq_sleepcyc_quint,1) >= 10
                [IAPF_tonic_cyc_quint(c,q) ITPF_tonic_cyc_quint(c,q) ISPF_tonic_cyc_quint(c,q) IAPF_tonic_height_cyc_quint(c,q) ITPF_tonic_height_cyc_quint(c,q) ISPF_tonic_height_cyc_quint(c,q)] = peak_detection_vj(waves_tonic_cyc_dur_freq_sleepcyc_quint, peak_thresh, lower_freq_alpha,...
                    higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
                title([EEG.chanlocs(ch).labels, ' tonic, IAPF: ', num2str(IAPF_tonic_cyc_quint(c,q)), ' Hz, height: ',num2str(round(IAPF_tonic_height_cyc_quint(c,q),2)), ', ITPF: ', num2str(ITPF_tonic_cyc_quint(c,q)), ' Hz, ISPF: ', num2str(ISPF_tonic_cyc_quint(c,q))]);
                else
                IAPF_tonic_cyc_quint(c,q) = NaN;
                ITPF_tonic_cyc_quint(c,q) = NaN;
                ISPF_tonic_cyc_quint(c,q) = NaN;  
                IAPF_tonic_height_cyc_quint(c,q) = NaN;
                ITPF_tonic_height_cyc_quint(c,q) = NaN;
                ISPF_tonic_height_cyc_quint(c,q) = NaN;   
                end
        
%                 if ch == 1 | ch == 8
%                     subplot(5,4,17)
%                 elseif ch == 2 | ch == 7
%                     subplot(5,4,18)           
%                 elseif ch == 3 | ch == 6
%                     subplot(5,4,19)            
%                 elseif ch == 4 | ch == 5
%                     subplot(5,4,20)           
%                 end
%         
%         subplot(5,4,17)           
        
                if size(waves_nrem_cyc_dur_freq_sleepcyc_quint,1) >= 10 
                [IAPF_nrem_cyc_quint(c,q) ITPF_nrem_cyc_quint(c,q) ISPF_nrem_cyc_quint(c,q) IAPF_nrem_height_cyc_quint(c,q) ITPF_nrem_height_cyc_quint(c,q) ISPF_nrem_height_cyc_quint(c,q)] = peak_detection_vj(waves_nrem_cyc_dur_freq_sleepcyc_quint, peak_thresh, lower_freq_alpha,...
                    higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
                title([EEG.chanlocs(ch).labels,' nrem, IAPF: ', num2str(IAPF_nrem_cyc_quint(c,q)), ' Hz, height: ',num2str(round(IAPF_nrem_height_cyc_quint(c,q),2)),', ITPF: ', num2str(ITPF_nrem_cyc_quint(c,q)), ' Hz, ISPF: ', num2str(ISPF_nrem_cyc_quint(c,q))]);
                else
                IAPF_nrem_cyc_quint(c,q) = NaN;
                ITPF_nrem_cyc_quint(c,q) = NaN;
                ISPF_nrem_cyc_quint(c,q) = NaN;   
                IAPF_nrem_height_cyc_quint(c,q) = NaN;
                ITPF_nrem_height_cyc_quint(c,q) = NaN;
                ISPF_nrem_height_cyc_quint(c,q) = NaN;   
                end
        
        
                xlabel('Frequency (Hz)');
                ylabel('Number')    
        
        
%         if ch == 4 | ch == 8
%         saveas(fig,[Savefolder,'plots',filesep,filename(1:18),'_ch',num2str(ch),'_not_individualized_2_6_12.svg']);
%         close
%         end

        close  
                
                
        clear waves_rem_cyc_dur_freq_sleepcyc_quint waves_nrem_cyc_dur_freq_sleepcyc_quint


             end
                
        clear waves_rem_cyc_dur_freq_sleepcyc waves_nrem_cyc_dur_freq_sleepcyc


        end
            
            
        %%
        
        exponent_1_30_cyc_nrem_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_30_cyc_nrem;
        exponent_30_45_cyc_nrem_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_30_45_cyc_nrem;
%         exponent_1_45_cyc_nrem_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_45_cyc_nrem;
        offset_1_30_cyc_nrem_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_30_cyc_nrem;
        offset_30_45_cyc_nrem_all(night,ch,1:max(cyc_ndx_hypno)) = offset_30_45_cyc_nrem;
%         offset_1_45_cyc_nrem_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_45_cyc_nrem;

        exponent_1_30_cyc_rem_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_30_cyc_rem;
        exponent_30_45_cyc_rem_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_30_45_cyc_rem;
%         exponent_1_45_cyc_rem_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_45_cyc_rem;
        offset_1_30_cyc_rem_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_30_cyc_rem;
        offset_30_45_cyc_rem_all(night,ch,1:max(cyc_ndx_hypno)) = offset_30_45_cyc_rem;
%         offset_1_45_cyc_rem_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_45_cyc_rem;

        exponent_1_30_cyc_phasic_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_30_cyc_phasic;
        exponent_30_45_cyc_phasic_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_30_45_cyc_phasic;
%         exponent_1_45_cyc_phasic_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_45_cyc_phasic;
        offset_1_30_cyc_phasic_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_30_cyc_phasic;
        offset_30_45_cyc_phasic_all(night,ch,1:max(cyc_ndx_hypno)) = offset_30_45_cyc_phasic;
%         offset_1_45_cyc_phasic_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_45_cyc_phasic;

        exponent_1_30_cyc_tonic_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_30_cyc_tonic;
        exponent_30_45_cyc_tonic_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_30_45_cyc_tonic;
%         exponent_1_45_cyc_tonic_all(night,ch,1:max(cyc_ndx_hypno)) = exponent_1_45_cyc_tonic;
        offset_1_30_cyc_tonic_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_30_cyc_tonic;
        offset_30_45_cyc_tonic_all(night,ch,1:max(cyc_ndx_hypno)) = offset_30_45_cyc_tonic;
%         offset_1_45_cyc_tonic_all(night,ch,1:max(cyc_ndx_hypno)) = offset_1_45_cyc_tonic;
        
       

        exponent_1_30_cyc_quint_nrem_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_30_cyc_quint_nrem;
        exponent_30_45_cyc_quint_nrem_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_30_45_cyc_quint_nrem;
%         exponent_1_45_cyc_quint_nrem_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_45_cyc_quint_nrem;
        offset_1_30_cyc_quint_nrem_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_30_cyc_quint_nrem;
        offset_30_45_cyc_quint_nrem_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_30_45_cyc_quint_nrem;
%         offset_1_45_cyc_quint_nrem_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_45_cyc_quint_nrem;

        exponent_1_30_cyc_quint_rem_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_30_cyc_quint_rem;
        exponent_30_45_cyc_quint_rem_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_30_45_cyc_quint_rem;
%         exponent_1_45_cyc_quint_rem_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_45_cyc_quint_rem;
        offset_1_30_cyc_quint_rem_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_30_cyc_quint_rem;
        offset_30_45_cyc_quint_rem_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_30_45_cyc_quint_rem;
%         offset_1_45_cyc_quint_rem_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_45_cyc_quint_rem;

        exponent_1_30_cyc_quint_phasic_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_30_cyc_quint_phasic;
        exponent_30_45_cyc_quint_phasic_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_30_45_cyc_quint_phasic;
%         exponent_1_45_cyc_quint_phasic_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_45_cyc_quint_phasic;
        offset_1_30_cyc_quint_phasic_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_30_cyc_quint_phasic;
        offset_30_45_cyc_quint_phasic_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_30_45_cyc_quint_phasic;
%         offset_1_45_cyc_quint_phasic_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_45_cyc_quint_phasic;

        exponent_1_30_cyc_quint_tonic_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_30_cyc_quint_tonic;
        exponent_30_45_cyc_quint_tonic_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_30_45_cyc_quint_tonic;
%         exponent_1_45_cyc_quint_tonic_all(night,ch,1:max(cyc_ndx_hypno),:) = exponent_1_45_cyc_quint_tonic;
        offset_1_30_cyc_quint_tonic_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_30_cyc_quint_tonic;
        offset_30_45_cyc_quint_tonic_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_30_45_cyc_quint_tonic;
%         offset_1_45_cyc_quint_tonic_all(night,ch,1:max(cyc_ndx_hypno),:) = offset_1_45_cyc_quint_tonic;

       
        prob_phasic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = prob_phasic_cyc;
        dur_rem_cyc_min_all(night,ch,1:max(cyc_ndx_hypno)) = dur_rem_cyc_min;
        dur_nrem_cyc_min_all(night,ch,1:max(cyc_ndx_hypno)) = dur_nrem_cyc_min;
 
        IAPF_rem_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_rem_cyc;
        ITPF_rem_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_rem_cyc;
        ISPF_rem_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_rem_cyc;
        IAPF_rem_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_rem_height_cyc;
        ITPF_rem_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_rem_height_cyc;
        ISPF_rem_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_rem_height_cyc;
        
        IAPF_phasic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_phasic_cyc;
        ITPF_phasic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_phasic_cyc;
        ISPF_phasic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_phasic_cyc;
        IAPF_phasic_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_phasic_height_cyc;
        ITPF_phasic_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_phasic_height_cyc;
        ISPF_phasic_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_phasic_height_cyc;
        
        IAPF_tonic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_tonic_cyc;
        ITPF_tonic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_tonic_cyc;
        ISPF_tonic_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_tonic_cyc;
        IAPF_tonic_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_tonic_height_cyc;
        ITPF_tonic_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_tonic_height_cyc;
        ISPF_tonic_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_tonic_height_cyc;
        
        IAPF_nrem_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_nrem_cyc;
        ITPF_nrem_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_nrem_cyc;
        ISPF_nrem_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_nrem_cyc;
        IAPF_nrem_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = IAPF_nrem_height_cyc;
        ITPF_nrem_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ITPF_nrem_height_cyc;
        ISPF_nrem_height_cyc_all(night,ch,1:max(cyc_ndx_hypno)) = ISPF_nrem_height_cyc;
        
        
        
        prob_phasic_cyc_quint_all(night,ch,1:length(IAPF_rem_cyc),:) = prob_phasic_cyc_quint;
        dur_rem_cyc_quint_min_all(night,ch,1:length(IAPF_rem_cyc),:) = dur_rem_cyc_quint_min;
        dur_nrem_cyc_quint_min_all(night,ch,1:length(IAPF_rem_cyc),:) = dur_nrem_cyc_quint_min;

        IAPF_rem_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_rem_cyc_quint;
        ITPF_rem_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_rem_cyc_quint;
        ISPF_rem_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_rem_cyc_quint;
        IAPF_rem_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_rem_height_cyc_quint;
        ITPF_rem_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_rem_height_cyc_quint;
        ISPF_rem_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_rem_height_cyc_quint;
        
        IAPF_phasic_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_phasic_cyc_quint;
        ITPF_phasic_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_phasic_cyc_quint;
        ISPF_phasic_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_phasic_cyc_quint;
        IAPF_phasic_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_phasic_height_cyc_quint;
        ITPF_phasic_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_phasic_height_cyc_quint;
        ISPF_phasic_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_phasic_height_cyc_quint;
        
        IAPF_tonic_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_tonic_cyc_quint;
        ITPF_tonic_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_tonic_cyc_quint;
        ISPF_tonic_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_tonic_cyc_quint;
        IAPF_tonic_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_tonic_height_cyc_quint;
        ITPF_tonic_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_tonic_height_cyc_quint;
        ISPF_tonic_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_tonic_height_cyc_quint;
        
        IAPF_nrem_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_nrem_cyc_quint;
        ITPF_nrem_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_nrem_cyc_quint;
        ISPF_nrem_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_nrem_cyc_quint;
        IAPF_nrem_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = IAPF_nrem_height_cyc_quint;
        ITPF_nrem_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ITPF_nrem_height_cyc_quint;
        ISPF_nrem_height_cyc_quint_all(night,ch,1:max(cyc_ndx_hypno),:) = ISPF_nrem_height_cyc_quint;
             
        clear exponent_1_30_allep_ch_rep exponent_30_45_allep_ch_rep exponent_1_45_allep_ch_rep
        clear offset_1_30_allep_ch_rep offset_30_45_allep_ch_rep offset_1_45_allep_ch_rep
        
        clear exponent_1_30_cyc_nrem exponent_30_45_cyc_nrem exponent_1_45_cyc_nrem
        clear exponent_1_30_cyc_rem exponent_30_45_cyc_rem exponent_1_45_cyc_rem
        clear exponent_1_30_cyc_phasic exponent_30_45_cyc_phasic exponent_1_45_cyc_phasic
        clear exponent_1_30_cyc_tonic exponent_30_45_cyc_tonic exponent_1_45_cyc_tonic
        
        clear exponent_1_30_cyc_quint_nrem exponent_30_45_cyc_quint_nrem exponent_1_45_cyc_quint_nrem
        clear exponent_1_30_cyc_quint_rem exponent_30_45_cyc_quint_rem exponent_1_45_cyc_quint_rem
        clear exponent_1_30_cyc_quint_phasic exponent_30_45_cyc_quint_phasic exponent_1_45_cyc_quint_phasic
        clear exponent_1_30_cyc_quint_tonic exponent_30_45_cyc_quint_tonic exponent_1_45_cyc_quint_tonic
        
        clear offset_1_30_cyc_nrem offset_30_45_cyc_nrem offset_1_45_cyc_nrem
        clear offset_1_30_cyc_rem offset_30_45_cyc_rem offset_1_45_cyc_rem
        clear offset_1_30_cyc_phasic offset_30_45_cyc_phasic offset_1_45_cyc_phasic
        clear offset_1_30_cyc_tonic offset_30_45_cyc_tonic offset_1_45_cyc_tonic
        
        clear offset_1_30_cyc_quint_nrem offset_30_45_cyc_quint_nrem offset_1_45_cyc_quint_nrem
        clear offset_1_30_cyc_quint_rem offset_30_45_cyc_quint_rem offset_1_45_cyc_quint_rem
        clear offset_1_30_cyc_quint_phasic offset_30_45_cyc_quint_phasic offset_1_45_cyc_quint_phasic
        clear offset_1_30_cyc_quint_tonic offset_30_45_cyc_quint_tonic offset_1_45_cyc_quint_tonic
       

        clear prob_phasic_cyc dur_rem_cyc_min dur_nrem_cyc_min 

        clear IAPF_rem_cyc ITPF_rem_cyc ISPF_rem_cyc IAPF_rem_height_cyc ITPF_rem_height_cyc ISPF_rem_height_cyc
        clear IAPF_phasic_cyc ITPF_phasic_cyc ISPF_phasic_cyc IAPF_phasic_height_cyc ITPF_phasic_height_cyc ISPF_phasic_height_cyc
        clear IAPF_tonic_cyc ITPF_tonic_cyc ISPF_tonic_cyc IAPF_tonic_height_cyc ITPF_tonic_height_cyc ISPF_tonic_height_cyc
        clear IAPF_nrem_cyc ITPF_nrem_cyc ISPF_nrem_cyc IAPF_nrem_height_cyc ITPF_nrem_height_cyc ISPF_nrem_height_cyc

        clear prob_phasic_cyc_quint dur_rem_cyc_quint_min dur_nrem_cyc_quint_min 
     
        clear IAPF_rem_cyc_quint ITPF_rem_cyc_quint ISPF_rem_cyc_quint IAPF_rem_height_cyc_quint ITPF_rem_height_cyc_quint ISPF_rem_height_cyc_quint
        clear IAPF_phasic_cyc_quint ITPF_phasic_cyc_quint ISPF_phasic_cyc_quint IAPF_phasic_height_cyc_quint ITPF_phasic_height_cyc_quint ISPF_phasic_height_cyc_quint
        clear IAPF_tonic_cyc_quint ITPF_tonic_cyc_quint ISPF_tonic_cyc_quint IAPF_tonic_height_cyc_quint ITPF_tonic_height_cyc_quint ISPF_tonic_height_cyc_quint
        clear IAPF_nrem_cyc_quint ITPF_nrem_cyc_quint ISPF_nrem_cyc_quint IAPF_nrem_height_cyc_quint ITPF_nrem_height_cyc_quint ISPF_nrem_height_cyc_quint
             
        end

       clear hypno_aligned2 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phasic_epochs tonic_epochs art_epochs 
       clear cyc_ndx_hypno
       
    end
    
    save([Savefolder, filename(1:12),'_eBOSC_indsub_not_individualized_2_6_12_dynamics.mat'],'IAPF*','ISPF*','ITPF*','exponent*','offset*','alpha*','theta*','spindles*','prob*','dur*');


% end

%        
% display('the end');
% 
% catch exception
%     display(exception.message)
%     display(exception.identifier)
%     error()
% end
%     
%     
% end
