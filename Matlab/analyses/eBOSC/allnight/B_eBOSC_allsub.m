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
waves_folder_dir = dir([waves_folder,'AFOSR*'])

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_allstages_1s_osc4/indsub/';

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
IAPF_wake_all = NaN(18,8);
IAPF_rem_all = NaN(18,8);
IAPF_phasic_all = NaN(18,8);
IAPF_tonic_all = NaN(18,8);
IAPF_nrem_all = NaN(18,8);

ITPF_wake_all = NaN(18,8);
ITPF_rem_all = NaN(18,8);
ITPF_phasic_all = NaN(18,8);
ITPF_tonic_all = NaN(18,8);
ITPF_nrem_all = NaN(18,8);

ISPF_wake_all = NaN(18,8);
ISPF_rem_all = NaN(18,8);
ISPF_phasic_all = NaN(18,8);
ISPF_tonic_all = NaN(18,8);
ISPF_nrem_all = NaN(18,8);

IAPF_wake_height_all = NaN(18,8);
IAPF_rem_height_all = NaN(18,8);
IAPF_phasic_height_all = NaN(18,8);
IAPF_tonic_height_all = NaN(18,8);
IAPF_nrem_height_all = NaN(18,8);

ITPF_wake_height_all = NaN(18,8);
ITPF_rem_height_all = NaN(18,8);
ITPF_phasic_height_all = NaN(18,8);
ITPF_tonic_height_all = NaN(18,8);
ITPF_nrem_height_all = NaN(18,8);

ISPF_wake_height_all = NaN(18,8);
ISPF_rem_height_all = NaN(18,8);
ISPF_phasic_height_all = NaN(18,8);
ISPF_tonic_height_all = NaN(18,8);
ISPF_nrem_height_all = NaN(18,8);

alpha_rem_den = NaN(18,8);
theta_rem_den = NaN(18,8);
spindles_rem_den = NaN(18,8);

alpha_phasic_den = NaN(18,8);
theta_phasic_den = NaN(18,8);
spindles_phasic_den = NaN(18,8);

alpha_tonic_den = NaN(18,8);
theta_tonic_den = NaN(18,8);
spindles_tonic_den = NaN(18,8);

alpha_nrem_den = NaN(18,8);
theta_nrem_den = NaN(18,8);
spindles_nrem_den = NaN(18,8);

alpha_wake_den = NaN(18,8);
theta_wake_den = NaN(18,8);
spindles_wake_den = NaN(18,8);


alpha_rem_abu = NaN(18,8);
theta_rem_abu = NaN(18,8);
spindles_rem_abu = NaN(18,8);


alpha_phasic_abu = NaN(18,8);
theta_phasic_abu = NaN(18,8);
spindles_phasic_abu = NaN(18,8);

alpha_tonic_abu = NaN(18,8);
theta_tonic_abu = NaN(18,8);
spindles_tonic_abu = NaN(18,8);

alpha_nrem_abu = NaN(18,8);
theta_nrem_abu = NaN(18,8);
spindles_nrem_abu = NaN(18,8);

alpha_wake_abu = NaN(18,8);
theta_wake_abu = NaN(18,8);
spindles_wake_abu = NaN(18,8);


alpha_rem_amp = NaN(18,8);
theta_rem_amp = NaN(18,8);
spindles_rem_amp = NaN(18,8);

alpha_phasic_amp = NaN(18,8);
theta_phasic_amp = NaN(18,8);
spindles_phasic_amp = NaN(18,8);

alpha_tonic_amp = NaN(18,8);
theta_tonic_amp = NaN(18,8);
spindles_tonic_amp = NaN(18,8);

alpha_nrem_amp = NaN(18,8);
theta_nrem_amp = NaN(18,8);
spindles_nrem_amp = NaN(18,8);

alpha_wake_amp = NaN(18,8);
theta_wake_amp = NaN(18,8);
spindles_wake_amp = NaN(18,8);


alpha_rem_snr = NaN(18,8);
theta_rem_snr = NaN(18,8);
spindles_rem_snr = NaN(18,8);

alpha_phasic_snr = NaN(18,8);
theta_phasic_snr = NaN(18,8);
spindles_phasic_snr = NaN(18,8);

alpha_tonic_snr = NaN(18,8);
theta_tonic_snr = NaN(18,8);
spindles_tonic_snr = NaN(18,8);

alpha_nrem_snr = NaN(18,8);
theta_nrem_snr = NaN(18,8);
spindles_nrem_snr = NaN(18,8);

alpha_wake_snr = NaN(18,8);
theta_wake_snr = NaN(18,8);
spindles_wake_snr = NaN(18,8);


exponent_1_30_rem = NaN(18,8);
exponent_1_30_phasic = NaN(18,8);
exponent_1_30_tonic = NaN(18,8);
exponent_1_30_nrem = NaN(18,8);
exponent_1_30_n1 = NaN(18,8);
exponent_1_30_n2 = NaN(18,8);
exponent_1_30_n3 = NaN(18,8);
exponent_1_30_wake = NaN(18,8);

exponent_30_45_rem = NaN(18,8);
exponent_30_45_phasic = NaN(18,8);
exponent_30_45_tonic = NaN(18,8);
exponent_30_45_nrem = NaN(18,8);
exponent_30_45_n1 = NaN(18,8);
exponent_30_45_n2 = NaN(18,8);
exponent_30_45_n3 = NaN(18,8);
exponent_30_45_wake = NaN(18,8);

exponent_1_45_rem = NaN(18,8);
exponent_1_45_phasic = NaN(18,8);
exponent_1_45_tonic = NaN(18,8);
exponent_1_45_nrem = NaN(18,8);
exponent_1_45_n1 = NaN(18,8);
exponent_1_45_n2 = NaN(18,8);
exponent_1_45_n3 = NaN(18,8);
exponent_1_45_wake = NaN(18,8);


offset_1_30_rem = NaN(18,8);
offset_1_30_phasic = NaN(18,8);
offset_1_30_tonic = NaN(18,8);
offset_1_30_nrem = NaN(18,8);
offset_1_30_n1 = NaN(18,8);
offset_1_30_n2 = NaN(18,8);
offset_1_30_n3 = NaN(18,8);
offset_1_30_wake = NaN(18,8);

offset_30_45_rem = NaN(18,8);
offset_30_45_phasic = NaN(18,8);
offset_30_45_tonic = NaN(18,8);
offset_30_45_nrem = NaN(18,8);
offset_30_45_n1 = NaN(18,8);
offset_30_45_n2 = NaN(18,8);
offset_30_45_n3 = NaN(18,8);
offset_30_45_wake = NaN(18,8);

offset_1_45_rem = NaN(18,8);
offset_1_45_phasic = NaN(18,8);
offset_1_45_tonic = NaN(18,8);
offset_1_45_nrem = NaN(18,8);
offset_1_45_n1 = NaN(18,8);
offset_1_45_n2 = NaN(18,8);
offset_1_45_n3 = NaN(18,8);
offset_1_45_wake = NaN(18,8);

%%

% for s = 1:length(waves_folder_dir)   
s = 29;
   
    display(['sub = ',num2str(s)]); 


    files = dir([waves_folder, waves_folder_dir(s).name(1:12),filesep,'AFOSR*']);
    
    
    for file = 1:length(files)
        
       display(['file = ',num2str(file)]); 
        
        %%
        filename = files(file).name;
        night = find_night(filename);
        
        load([waves_folder, waves_folder_dir(s).name(1:12),filesep,files(file).name]);
        clear phato_30
        
        load([goodREM_folder,files(file).name(1:18),'_goodREM.mat']);
                
        rem_epochs = find(hypno_aligned2 == 'R');
        nrem_epochs = find(hypno_aligned2 == '2'| hypno_aligned2 == '3' | hypno_aligned2 == '4');
        n1_epochs = find(hypno_aligned2 == '1');
        n2_epochs = find(hypno_aligned2 == '2');
        n3_epochs = find(hypno_aligned2 == '3' | hypno_aligned2 == '4');
        wake_epochs = find(hypno_aligned2 == 'W');
        
        epochl = 30;
        n_phasic_thresh = 3;
        phato_30 = calculate_phato(phasic_ep, tonic_ep, art_ep, epochl, n_phasic_thresh); 
        
        phasic_epochs = find(string(phato_30) == 'P');
        tonic_epochs = find(string(phato_30) == 'T');
        art_epochs = find(string(phato_30) == 'A');
        
        
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
        
        
%%
    
        
        for ch = 1:8
      %%
         
        exponent_1_30_rem(night,ch) = nanmean(exponent_1_30_allep(rem_epochs,ch),1);
        exponent_1_30_phasic(night,ch) = nanmean(exponent_1_30_allep(phasic_epochs,ch),1);
        exponent_1_30_tonic(night,ch) = nanmean(exponent_1_30_allep(tonic_epochs,ch),1);
        exponent_1_30_nrem(night,ch) = nanmean(exponent_1_30_allep(nrem_epochs,ch),1);
        exponent_1_30_n1(night,ch) = nanmean(exponent_1_30_allep(n1_epochs,ch),1);
        exponent_1_30_n2(night,ch) = nanmean(exponent_1_30_allep(n2_epochs,ch),1);
        exponent_1_30_n3(night,ch) = nanmean(exponent_1_30_allep(n3_epochs,ch),1);
        exponent_1_30_wake(night,ch) = nanmean(exponent_1_30_allep(wake_epochs,ch),1);
      
        exponent_30_45_rem(night,ch) = nanmean(exponent_30_45_allep(rem_epochs,ch),1);
        exponent_30_45_phasic(night,ch) = nanmean(exponent_30_45_allep(phasic_epochs,ch),1);
        exponent_30_45_tonic(night,ch) = nanmean(exponent_30_45_allep(tonic_epochs,ch),1);
        exponent_30_45_nrem(night,ch) = nanmean(exponent_30_45_allep(nrem_epochs,ch),1);
        exponent_30_45_n1(night,ch) = nanmean(exponent_30_45_allep(n1_epochs,ch),1);
        exponent_30_45_n2(night,ch) = nanmean(exponent_30_45_allep(n2_epochs,ch),1);
        exponent_30_45_n3(night,ch) = nanmean(exponent_30_45_allep(n3_epochs,ch),1);
        exponent_30_45_wake(night,ch) = nanmean(exponent_30_45_allep(wake_epochs,ch),1);
        
        exponent_1_45_rem(night,ch) = nanmean(exponent_1_45_allep(rem_epochs,ch),1);
        exponent_1_45_phasic(night,ch) = nanmean(exponent_1_45_allep(phasic_epochs,ch),1);
        exponent_1_45_tonic(night,ch) = nanmean(exponent_1_45_allep(tonic_epochs,ch),1);
        exponent_1_45_nrem(night,ch) = nanmean(exponent_1_45_allep(nrem_epochs,ch),1);
        exponent_1_45_n1(night,ch) = nanmean(exponent_1_45_allep(n1_epochs,ch),1);
        exponent_1_45_n2(night,ch) = nanmean(exponent_1_45_allep(n2_epochs,ch),1);
        exponent_1_45_n3(night,ch) = nanmean(exponent_1_45_allep(n3_epochs,ch),1);
        exponent_1_45_wake(night,ch) = nanmean(exponent_1_45_allep(wake_epochs,ch),1);
                
                
        offset_1_30_rem(night,ch) = nanmean(offset_1_30_allep(rem_epochs,ch),1);
        offset_1_30_phasic(night,ch) = nanmean(offset_1_30_allep(phasic_epochs,ch),1);
        offset_1_30_tonic(night,ch) = nanmean(offset_1_30_allep(tonic_epochs,ch),1);
        offset_1_30_nrem(night,ch) = nanmean(offset_1_30_allep(nrem_epochs,ch),1);
        offset_1_30_n1(night,ch) = nanmean(offset_1_30_allep(n1_epochs,ch),1);
        offset_1_30_n2(night,ch) = nanmean(offset_1_30_allep(n2_epochs,ch),1);
        offset_1_30_n3(night,ch) = nanmean(offset_1_30_allep(n3_epochs,ch),1);
        offset_1_30_wake(night,ch) = nanmean(offset_1_30_allep(wake_epochs,ch),1);
      
        offset_30_45_rem(night,ch) = nanmean(offset_30_45_allep(rem_epochs,ch),1);
        offset_30_45_phasic(night,ch) = nanmean(offset_30_45_allep(phasic_epochs,ch),1);
        offset_30_45_tonic(night,ch) = nanmean(offset_30_45_allep(tonic_epochs,ch),1);
        offset_30_45_nrem(night,ch) = nanmean(offset_30_45_allep(nrem_epochs,ch),1);
        offset_30_45_n1(night,ch) = nanmean(offset_30_45_allep(n1_epochs,ch),1);
        offset_30_45_n2(night,ch) = nanmean(offset_30_45_allep(n2_epochs,ch),1);
        offset_30_45_n3(night,ch) = nanmean(offset_30_45_allep(n3_epochs,ch),1);
        offset_30_45_wake(night,ch) = nanmean(offset_30_45_allep(wake_epochs,ch),1);
        
        offset_1_45_rem(night,ch) = nanmean(offset_1_45_allep(rem_epochs,ch),1);
        offset_1_45_phasic(night,ch) = nanmean(offset_1_45_allep(phasic_epochs,ch),1);
        offset_1_45_tonic(night,ch) = nanmean(offset_1_45_allep(tonic_epochs,ch),1);
        offset_1_45_nrem(night,ch) = nanmean(offset_1_45_allep(nrem_epochs,ch),1);
        offset_1_45_n1(night,ch) = nanmean(offset_1_45_allep(n1_epochs,ch),1);
        offset_1_45_n2(night,ch) = nanmean(offset_1_45_allep(n2_epochs,ch),1);
        offset_1_45_n3(night,ch) = nanmean(offset_1_45_allep(n3_epochs,ch),1);
        offset_1_45_wake(night,ch) = nanmean(offset_1_45_allep(wake_epochs,ch),1);
       

%%      density and abundance 

        waves_ch = waves_allepch(find(waves_allepch.channel == ch),:);

        waves_ch.start_miniep = NaN(size(waves_ch,1),1);
        waves_ch.end_miniep = NaN(size(waves_ch,1),1);

        for w = 1:size(waves_ch,1)
            if string(waves_ch.stage(w)) == 'R'
                
                samp_wave = waves_ch.startsamp(w):waves_ch.endsamp(w);
                start_miniep = ceil(waves_ch.startsamp(w)/fs);
                end_miniep = ceil(waves_ch.endsamp(w)/fs);
               
                if ~isempty(intersect(samp_wave,phasicgoodrem_samp))                    
                    waves_ch.substage(w) = 'P';
                elseif ~isempty(intersect(samp_wave,tonicgoodrem_samp))  
                    waves_ch.substage(w) = 'T'; 
                else
                    waves_ch.substage(w) = 'A';                     
                end
                
                waves_ch.start_miniep(w) = start_miniep;
                waves_ch.end_miniep(w) = end_miniep;
                
                clear samp_wave start_ep end_ep
               
            else
            waves_ch.substage(w) = 'N';  

            end
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
        
        
        
        [den_alpha abu_alpha amp_alpha snr_alpha] = calculate_abu_den_vj(waves_ch, lower_freq_alpha, higher_freq_alpha,waves_rem_cyc_dur_freq_ndx, rem_epochs, waves_phasic_cyc_dur_freq_ndx, phasic_goodndx, waves_tonic_cyc_dur_freq_ndx, tonic_goodndx, waves_nrem_cyc_dur_freq_ndx, nrem_epochs, waves_wake_cyc_dur_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep); 
        [den_theta abu_theta amp_theta snr_theta] = calculate_abu_den_vj(waves_ch, lower_freq_theta, higher_freq_theta,waves_rem_cyc_dur_freq_ndx, rem_epochs, waves_phasic_cyc_dur_freq_ndx, phasic_goodndx, waves_tonic_cyc_dur_freq_ndx, tonic_goodndx, waves_nrem_cyc_dur_freq_ndx, nrem_epochs, waves_wake_cyc_dur_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep); 
        [den_spindles abu_spindles amp_spindles snr_spindles] = calculate_abu_den_vj(waves_ch, lower_freq_spindles, higher_freq_spindles,waves_rem_cyc_dur_freq_ndx, rem_epochs, waves_phasic_cyc_dur_freq_ndx, phasic_goodndx, waves_tonic_cyc_dur_freq_ndx, tonic_goodndx, waves_nrem_cyc_dur_freq_ndx, nrem_epochs, waves_wake_cyc_dur_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep); 
        
        alpha_rem_den(night,ch) = den_alpha.rem_density;
        theta_rem_den(night,ch) = den_theta.rem_density;
        spindles_rem_den(night,ch) = den_spindles.rem_density;

        alpha_phasic_den(night,ch) = den_alpha.phasic_density;
        theta_phasic_den(night,ch) = den_theta.phasic_density;
        spindles_phasic_den(night,ch) = den_spindles.phasic_density;

        alpha_tonic_den(night,ch) = den_alpha.tonic_density;
        theta_tonic_den(night,ch) = den_theta.tonic_density;
        spindles_tonic_den(night,ch) = den_spindles.tonic_density;

        alpha_nrem_den(night,ch) = den_alpha.nrem_density;
        theta_nrem_den(night,ch) = den_theta.nrem_density;
        spindles_nrem_den(night,ch) = den_spindles.nrem_density;

        alpha_wake_den(night,ch) = den_alpha.wake_density;
        theta_wake_den(night,ch) = den_theta.wake_density;
        spindles_wake_den(night,ch) = den_spindles.wake_density;
        
        
        alpha_rem_abu(night,ch) = abu_alpha.rem_abu;
        theta_rem_abu(night,ch) = abu_theta.rem_abu;
        spindles_rem_abu(night,ch) = abu_spindles.rem_abu;

        alpha_phasic_abu(night,ch) = abu_alpha.phasic_abu;
        theta_phasic_abu(night,ch) = abu_theta.phasic_abu;
        spindles_phasic_abu(night,ch) = abu_spindles.phasic_abu;

        alpha_tonic_abu(night,ch) = abu_alpha.tonic_abu;
        theta_tonic_abu(night,ch) = abu_theta.tonic_abu;
        spindles_tonic_abu(night,ch) = abu_spindles.tonic_abu;

        alpha_nrem_abu(night,ch) = abu_alpha.nrem_abu;
        theta_nrem_abu(night,ch) = abu_theta.nrem_abu;
        spindles_nrem_abu(night,ch) = abu_spindles.nrem_abu;

        alpha_wake_abu(night,ch) = abu_alpha.wake_abu;
        theta_wake_abu(night,ch) = abu_theta.wake_abu;
        spindles_wake_abu(night,ch) = abu_spindles.wake_abu;
        
        
        alpha_rem_amp(night,ch) = amp_alpha.rem_amp;
        theta_rem_amp(night,ch) = amp_theta.rem_amp;
        spindles_rem_amp(night,ch) = amp_spindles.rem_amp;

        alpha_phasic_amp(night,ch) = amp_alpha.phasic_amp;
        theta_phasic_amp(night,ch) = amp_theta.phasic_amp;
        spindles_phasic_amp(night,ch) = amp_spindles.phasic_amp;

        alpha_tonic_amp(night,ch) = amp_alpha.tonic_amp;
        theta_tonic_amp(night,ch) = amp_theta.tonic_amp;
        spindles_tonic_amp(night,ch) = amp_spindles.tonic_amp;

        alpha_nrem_amp(night,ch) = amp_alpha.nrem_amp;
        theta_nrem_amp(night,ch) = amp_theta.nrem_amp;
        spindles_nrem_amp(night,ch) = amp_spindles.nrem_amp;

        alpha_wake_amp(night,ch) = amp_alpha.wake_amp;
        theta_wake_amp(night,ch) = amp_theta.wake_amp;
        spindles_wake_amp(night,ch) = amp_spindles.wake_amp;
        
        
        alpha_rem_snr(night,ch) = snr_alpha.rem_snr;
        theta_rem_snr(night,ch) = snr_theta.rem_snr;
        spindles_rem_snr(night,ch) = snr_spindles.rem_snr;

        alpha_phasic_snr(night,ch) = snr_alpha.phasic_snr;
        theta_phasic_snr(night,ch) = snr_theta.phasic_snr;
        spindles_phasic_snr(night,ch) = snr_spindles.phasic_snr;

        alpha_tonic_snr(night,ch) = snr_alpha.tonic_snr;
        theta_tonic_snr(night,ch) = snr_theta.tonic_snr;
        spindles_tonic_snr(night,ch) = snr_spindles.tonic_snr;

        alpha_nrem_snr(night,ch) = snr_alpha.nrem_snr;
        theta_nrem_snr(night,ch) = snr_theta.nrem_snr;
        spindles_nrem_snr(night,ch) = snr_spindles.nrem_snr;

        alpha_wake_snr(night,ch) = snr_alpha.wake_snr;
        theta_wake_snr(night,ch) = snr_theta.wake_snr;
        spindles_wake_snr(night,ch) = snr_spindles.wake_snr;
        
        
        clear den_alpha abu_alpha amp_alpha den_theta abu_theta amp_theta den_spindles abu_spindles amp_spindles snr_alpha snr_theta snr_spindles
        

%% find alpha peaks in wake, rem, and nrem

        colors = linspecer(8);
        
        if ch == 1 | ch == 5
            fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
            fig.WindowState = 'maximized';
        end
        
        if ch == 1 | ch == 8
            subplot(5,4,1)
        elseif ch == 2 | ch == 7
            subplot(5,4,2)           
        elseif ch == 3 | ch == 6
            subplot(5,4,3)            
        elseif ch == 4 | ch == 5
            subplot(5,4,4)           
        end
        
%         fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
%         fig.WindowState = 'maximized';
% 
%         subplot(5,4,1)

        if ~isempty(waves_wake_cyc_dur_freq)
        [IAPF_wake ITPF_wake ISPF_wake IAPF_wake_height ITPF_wake_height ISPF_wake_height] = peak_detection_vj(waves_wake_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title({filename(1:18) [EEG.chanlocs(ch).labels,' wake, IAPF: ', num2str(IAPF_wake),' Hz, height: ',num2str(round(IAPF_wake_height,2)), ', ITPF: ', num2str(ITPF_wake), ' Hz, ISPF: ', num2str(ISPF_wake)]});
        else
            IAPF_wake = NaN;
            ITPF_wake = NaN;
            ISPF_wake = NaN;
            IAPF_wake_height = NaN;
            ITPF_wake_height = NaN;
            ISPF_wake_height = NaN;
        end
        
        
        if ch == 1 | ch == 8
            subplot(5,4,5)
        elseif ch == 2 | ch == 7
            subplot(5,4,6)           
        elseif ch == 3 | ch == 6
            subplot(5,4,7)            
        elseif ch == 4 | ch == 5
            subplot(5,4,8)           
        end

%         subplot(5,4,5)
        
        if ~isempty(waves_rem_cyc_dur_freq)
        [IAPF_rem ITPF_rem ISPF_rem IAPF_rem_height ITPF_rem_height ISPF_rem_height] = peak_detection_vj(waves_rem_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels,' rem, IAPF: ', num2str(IAPF_rem), ' Hz, height: ',num2str(round(IAPF_rem_height,2)), ', ITPF: ', num2str(ITPF_rem), ' Hz, ISPF: ', num2str(ISPF_rem)]);
        else
            IAPF_rem = NaN;
            ITPF_rem = NaN;
            ISPF_rem = NaN;
            IAPF_rem_height = NaN;
            ITPF_rem_height = NaN;
            ISPF_rem_height = NaN;
        end
        
     
        if ch == 1 | ch == 8
            subplot(5,4,9)
        elseif ch == 2 | ch == 7
            subplot(5,4,10)           
        elseif ch == 3 | ch == 6
            subplot(5,4,11)            
        elseif ch == 4 | ch == 5
            subplot(5,4,12)           
        end

%         subplot(5,4,9)
        
        if ~isempty(waves_phasic_cyc_dur_freq)
        [IAPF_phasic ITPF_phasic ISPF_phasic IAPF_phasic_height ITPF_phasic_height ISPF_phasic_height] = peak_detection_vj(waves_phasic_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels, ' phasic, IAPF: ', num2str(IAPF_phasic),' Hz, height: ',num2str(round(IAPF_phasic_height,2)), ', ITPF: ', num2str(ITPF_phasic), ' Hz, ISPF: ', num2str(ISPF_phasic)]);
        else
            IAPF_phasic = NaN;
            ITPF_phasic = NaN;
            ISPF_phasic = NaN; 
            IAPF_phasic_height = NaN;
            ITPF_phasic_height = NaN;
            ISPF_phasic_height = NaN; 
        end
        
        
        if ch == 1 | ch == 8
            subplot(5,4,13)
        elseif ch == 2 | ch == 7
            subplot(5,4,14)           
        elseif ch == 3 | ch == 6
            subplot(5,4,15)            
        elseif ch == 4 | ch == 5
            subplot(5,4,16)           
        end
        

%         subplot(5,4,13)        

        if ~isempty(waves_tonic_cyc_dur_freq) 
        [IAPF_tonic ITPF_tonic ISPF_tonic IAPF_tonic_height ITPF_tonic_height ISPF_tonic_height] = peak_detection_vj(waves_tonic_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels, ' tonic, IAPF: ', num2str(IAPF_tonic), ' Hz, height: ',num2str(round(IAPF_tonic_height,2)), ', ITPF: ', num2str(ITPF_tonic), ' Hz, ISPF: ', num2str(ISPF_tonic)]);
        else
           IAPF_tonic = NaN;
           ITPF_tonic = NaN;
           ISPF_tonic = NaN;  
           IAPF_tonic_height = NaN;
           ITPF_tonic_height = NaN;
           ISPF_tonic_height = NaN;   
        end
        
        if ch == 1 | ch == 8
            subplot(5,4,17)
        elseif ch == 2 | ch == 7
            subplot(5,4,18)           
        elseif ch == 3 | ch == 6
            subplot(5,4,19)            
        elseif ch == 4 | ch == 5
            subplot(5,4,20)           
        end
        
%         subplot(5,4,17)           
        
        if ~isempty(waves_nrem_cyc_dur_freq) 
        [IAPF_nrem ITPF_nrem ISPF_nrem IAPF_nrem_height ITPF_nrem_height ISPF_nrem_height] = peak_detection_vj(waves_nrem_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels,' nrem, IAPF: ', num2str(IAPF_nrem), ' Hz, height: ',num2str(round(IAPF_nrem_height,2)),', ITPF: ', num2str(ITPF_nrem), ' Hz, ISPF: ', num2str(ISPF_nrem)]);
        else
           IAPF_nrem = NaN;
           ITPF_nrem = NaN;
           ISPF_nrem = NaN;   
           IAPF_nrem_height = NaN;
           ITPF_nrem_height = NaN;
           ISPF_nrem_height = NaN;   
        end
        
        
        xlabel('Frequency (Hz)');
        ylabel('Number')    
        
        
%         if ch == 4 | ch == 8
%         saveas(fig,[Savefolder,'plots',filesep,filename(1:18),'_ch',num2str(ch),'_not_individualized_2_6_12.svg']);
%         close
%         end

        close

        %%
        IAPF_wake_all(night,ch) = IAPF_wake;
        IAPF_rem_all(night,ch) = IAPF_rem;
        IAPF_phasic_all(night,ch) = IAPF_phasic;
        IAPF_tonic_all(night,ch) = IAPF_tonic;
        IAPF_nrem_all(night,ch) = IAPF_nrem;
        
        ITPF_wake_all(night,ch) = ITPF_wake;
        ITPF_rem_all(night,ch) = ITPF_rem;
        ITPF_phasic_all(night,ch) = ITPF_phasic;
        ITPF_tonic_all(night,ch) = ITPF_tonic;
        ITPF_nrem_all(night,ch) = ITPF_nrem;
        
        ISPF_wake_all(night,ch) = ISPF_wake;
        ISPF_rem_all(night,ch) = ISPF_rem;
        ISPF_phasic_all(night,ch) = ISPF_phasic;
        ISPF_tonic_all(night,ch) = ISPF_tonic;
        ISPF_nrem_all(night,ch) = ISPF_nrem;
                
        IAPF_wake_height_all(night,ch) = IAPF_wake_height;   
        IAPF_rem_height_all(night,ch) = IAPF_rem_height;
        IAPF_phasic_height_all(night,ch) = IAPF_phasic_height;
        IAPF_tonic_height_all(night,ch) = IAPF_tonic_height;
        IAPF_nrem_height_all(night,ch) = IAPF_nrem_height;
        
        ITPF_wake_height_all(night,ch) = ITPF_wake_height;
        ITPF_rem_height_all(night,ch) = ITPF_rem_height;
        ITPF_phasic_height_all(night,ch) = ITPF_phasic_height;
        ITPF_tonic_height_all(night,ch) = ITPF_tonic_height;
        ITPF_nrem_height_all(night,ch) = ITPF_nrem_height;
        
        ISPF_wake_height_all(night,ch) = ISPF_wake_height;
        ISPF_rem_height_all(night,ch) = ISPF_rem_height;
        ISPF_phasic_height_all(night,ch) = ISPF_phasic_height;
        ISPF_tonic_height_all(night,ch) = ISPF_tonic_height;
        ISPF_nrem_height_all(night,ch) = ISPF_nrem_height;
        
        
        clear IAPF_wake IAPF_rem IAPF_nrem ITPF_wake ITPF_rem ITPF_nrem ISPF_wake ISPF_rem ISPF_nrem waves_ch
        clear IAPF_wake_height IAPF_rem_height IAPF_nrem_height ITPF_wake_height ITPF_rem_height ITPF_nrem_height ISPF_wake_height ISPF_rem_height ISPF_nrem_height waves_ch
       
        end

       clear hypno_aligned2 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phasic_epochs tonic_epochs art_epochs 

       
    end

    save([Savefolder, filename(1:12),'eBOSC_allsub_not_individualized_2_6_12_1s_osc_v3.mat'],'IAPF*','ISPF*','ITPF*','exponent*','offset*','alpha*','theta*','spindles*')

    
% end


       
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

