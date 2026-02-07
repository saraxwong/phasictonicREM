%%
clear all;
close all;

Folderpath = '/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_dynamics/indsub';
dir_Folderpath = dir([Folderpath,filesep,'AFOSR*']);

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_dynamics';

%%

for s = 1:length(dir_Folderpath)
    
    
        load([Folderpath,filesep,dir_Folderpath(s).name]);
        
        prob_phasic_cyc_allsub(s,:,:,:) = prob_phasic_cyc_all;
        dur_cyc_min_allsub(s,:,:,:) = dur_cyc_min_all;
        prob_phasic_cyc_quint_allsub(s,:,:,:,:) = prob_phasic_cyc_quint_all;
        dur_cyc_quint_min_allsub(s,:,:,:,:) = dur_cyc_quint_min_all;
        
        exponent_1_30_cyc_rem_allsub(s,:,:,:) = exponent_1_30_cyc_rem_all;
        exponent_30_45_cyc_rem_allsub(s,:,:,:) = exponent_30_45_cyc_rem_all;
        offset_1_30_cyc_rem_allsub(s,:,:,:) = offset_1_30_cyc_rem_all;
        offset_30_45_cyc_rem_allsub(s,:,:,:) = offset_30_45_cyc_rem_all;
        
        exponent_1_30_cyc_quint_rem_allsub(s,:,:,:,:)= exponent_1_30_cyc_quint_rem_all;
        exponent_30_45_cyc_quint_rem_allsub(s,:,:,:,:) = exponent_30_45_cyc_quint_rem_all;
        offset_1_30_cyc_quint_rem_allsub(s,:,:,:,:) = offset_1_30_cyc_quint_rem_all;
        offset_30_45_cyc_quint_rem_allsub(s,:,:,:,:) = offset_30_45_cyc_quint_rem_all;
    
        IAPF_rem_cyc_allsub(s,:,:,:) = IAPF_rem_cyc_all;
        ITPF_rem_cyc_allsub(s,:,:,:) = ITPF_rem_cyc_all;
        ISPF_rem_cyc_allsub(s,:,:,:) = ISPF_rem_cyc_all;
        IAPF_rem_height_cyc_allsub(s,:,:,:) = IAPF_rem_height_cyc_all;
        ITPF_rem_height_cyc_allsub(s,:,:,:) = ITPF_rem_height_cyc_all;
        ISPF_rem_height_cyc_allsub(s,:,:,:) = ISPF_rem_height_cyc_all;
        alpha_rem_den_cyc_allsub(s,:,:,:) = alpha_rem_den_cyc;
        alpha_rem_abu_cyc_allsub(s,:,:,:) = alpha_rem_abu_cyc;
        alpha_rem_amp_cyc_allsub(s,:,:,:) = alpha_rem_amp_cyc;
        alpha_rem_snr_cyc_allsub(s,:,:,:) = alpha_rem_snr_cyc;
        theta_rem_den_cyc_allsub(s,:,:,:) = theta_rem_den_cyc;
        theta_rem_abu_cyc_allsub(s,:,:,:) = theta_rem_abu_cyc;
        theta_rem_amp_cyc_allsub(s,:,:,:) = theta_rem_amp_cyc;
        theta_rem_snr_cyc_allsub(s,:,:,:) = theta_rem_snr_cyc;
        spindles_rem_den_cyc_allsub(s,:,:,:) = spindles_rem_den_cyc;
        spindles_rem_abu_cyc_allsub(s,:,:,:) = spindles_rem_abu_cyc;
        spindles_rem_amp_cyc_allsub(s,:,:,:) = spindles_rem_amp_cyc;
        spindles_rem_snr_cyc_allsub(s,:,:,:) = spindles_rem_snr_cyc;
        
        IAPF_rem_cyc_quint_allsub(s,:,:,:,:) = IAPF_rem_cyc_quint_all;
        ITPF_rem_cyc_quint_allsub(s,:,:,:,:) = ITPF_rem_cyc_quint_all;
        ISPF_rem_cyc_quint_allsub(s,:,:,:,:) = ISPF_rem_cyc_quint_all;
        IAPF_rem_height_cyc_quint_allsub(s,:,:,:,:) = IAPF_rem_height_cyc_quint_all;
        ITPF_rem_height_cyc_quint_allsub(s,:,:,:,:) = ITPF_rem_height_cyc_quint_all;
        ISPF_rem_height_cyc_quint_allsub(s,:,:,:,:) = ISPF_rem_height_cyc_quint_all;
        alpha_rem_den_cyc_quint_allsub(s,:,:,:,:) = alpha_rem_den_cyc_quint;
        alpha_rem_abu_cyc_quint_allsub(s,:,:,:,:) = alpha_rem_abu_cyc_quint;
        alpha_rem_amp_cyc_quint_allsub(s,:,:,:,:) = alpha_rem_amp_cyc_quint;
        alpha_rem_snr_cyc_quint_allsub(s,:,:,:,:) = alpha_rem_snr_cyc_quint;
        theta_rem_den_cyc_quint_allsub(s,:,:,:,:) = theta_rem_den_cyc_quint;
        theta_rem_abu_cyc_quint_allsub(s,:,:,:,:) = theta_rem_abu_cyc_quint;
        theta_rem_amp_cyc_quint_allsub(s,:,:,:,:) = theta_rem_amp_cyc_quint;
        theta_rem_snr_cyc_quint_allsub(s,:,:,:,:) = theta_rem_snr_cyc_quint;
        spindles_rem_den_cyc_quint_allsub(s,:,:,:,:) = spindles_rem_den_cyc_quint;
        spindles_rem_abu_cyc_quint_allsub(s,:,:,:,:) = spindles_rem_abu_cyc_quint;
        spindles_rem_amp_cyc_quint_allsub(s,:,:,:,:) = spindles_rem_amp_cyc_quint;
        spindles_rem_snr_cyc_quint_allsub(s,:,:,:,:) = spindles_rem_snr_cyc_quint;
        
        exponent_1_30_cyc_phasic_allsub(s,:,:,:) = exponent_1_30_cyc_phasic_all;
        exponent_30_45_cyc_phasic_allsub(s,:,:,:) = exponent_30_45_cyc_phasic_all;
        offset_1_30_cyc_phasic_allsub(s,:,:,:) = offset_1_30_cyc_phasic_all;
        offset_30_45_cyc_phasic_allsub(s,:,:,:) = offset_30_45_cyc_phasic_all;
        
        exponent_1_30_cyc_quint_phasic_allsub(s,:,:,:,:)= exponent_1_30_cyc_quint_phasic_all;
        exponent_30_45_cyc_quint_phasic_allsub(s,:,:,:,:) = exponent_30_45_cyc_quint_phasic_all;
        offset_1_30_cyc_quint_phasic_allsub(s,:,:,:,:) = offset_1_30_cyc_quint_phasic_all;
        offset_30_45_cyc_quint_phasic_allsub(s,:,:,:,:) = offset_30_45_cyc_quint_phasic_all;
    
        IAPF_phasic_cyc_allsub(s,:,:,:) = IAPF_phasic_cyc_all;
        ITPF_phasic_cyc_allsub(s,:,:,:) = ITPF_phasic_cyc_all;
        ISPF_phasic_cyc_allsub(s,:,:,:) = ISPF_phasic_cyc_all;
        IAPF_phasic_height_cyc_allsub(s,:,:,:) = IAPF_phasic_height_cyc_all;
        ITPF_phasic_height_cyc_allsub(s,:,:,:) = ITPF_phasic_height_cyc_all;
        ISPF_phasic_height_cyc_allsub(s,:,:,:) = ISPF_phasic_height_cyc_all;
        alpha_phasic_den_cyc_allsub(s,:,:,:) = alpha_phasic_den_cyc;
        alpha_phasic_abu_cyc_allsub(s,:,:,:) = alpha_phasic_abu_cyc;
        alpha_phasic_amp_cyc_allsub(s,:,:,:) = alpha_phasic_amp_cyc;
        alpha_phasic_snr_cyc_allsub(s,:,:,:) = alpha_phasic_snr_cyc;
        theta_phasic_den_cyc_allsub(s,:,:,:) = theta_phasic_den_cyc;
        theta_phasic_abu_cyc_allsub(s,:,:,:) = theta_phasic_abu_cyc;
        theta_phasic_amp_cyc_allsub(s,:,:,:) = theta_phasic_amp_cyc;
        theta_phasic_snr_cyc_allsub(s,:,:,:) = theta_phasic_snr_cyc;
        spindles_phasic_den_cyc_allsub(s,:,:,:) = spindles_phasic_den_cyc;
        spindles_phasic_abu_cyc_allsub(s,:,:,:) = spindles_phasic_abu_cyc;
        spindles_phasic_amp_cyc_allsub(s,:,:,:) = spindles_phasic_amp_cyc;
        spindles_phasic_snr_cyc_allsub(s,:,:,:) = spindles_phasic_snr_cyc;
        
        IAPF_phasic_cyc_quint_allsub(s,:,:,:,:) = IAPF_phasic_cyc_quint_all;
        ITPF_phasic_cyc_quint_allsub(s,:,:,:,:) = ITPF_phasic_cyc_quint_all;
        ISPF_phasic_cyc_quint_allsub(s,:,:,:,:) = ISPF_phasic_cyc_quint_all;
        IAPF_phasic_height_cyc_quint_allsub(s,:,:,:,:) = IAPF_phasic_height_cyc_quint_all;
        ITPF_phasic_height_cyc_quint_allsub(s,:,:,:,:) = ITPF_phasic_height_cyc_quint_all;
        ISPF_phasic_height_cyc_quint_allsub(s,:,:,:,:) = ISPF_phasic_height_cyc_quint_all;
        alpha_phasic_den_cyc_quint_allsub(s,:,:,:,:) = alpha_phasic_den_cyc_quint;
        alpha_phasic_abu_cyc_quint_allsub(s,:,:,:,:) = alpha_phasic_abu_cyc_quint;
        alpha_phasic_amp_cyc_quint_allsub(s,:,:,:,:) = alpha_phasic_amp_cyc_quint;
        alpha_phasic_snr_cyc_quint_allsub(s,:,:,:,:) = alpha_phasic_snr_cyc_quint;
        theta_phasic_den_cyc_quint_allsub(s,:,:,:,:) = theta_phasic_den_cyc_quint;
        theta_phasic_abu_cyc_quint_allsub(s,:,:,:,:) = theta_phasic_abu_cyc_quint;
        theta_phasic_amp_cyc_quint_allsub(s,:,:,:,:) = theta_phasic_amp_cyc_quint;
        theta_phasic_snr_cyc_quint_allsub(s,:,:,:,:) = theta_phasic_snr_cyc_quint;
        spindles_phasic_den_cyc_quint_allsub(s,:,:,:,:) = spindles_phasic_den_cyc_quint;
        spindles_phasic_abu_cyc_quint_allsub(s,:,:,:,:) = spindles_phasic_abu_cyc_quint;
        spindles_phasic_amp_cyc_quint_allsub(s,:,:,:,:) = spindles_phasic_amp_cyc_quint;
        spindles_phasic_snr_cyc_quint_allsub(s,:,:,:,:) = spindles_phasic_snr_cyc_quint;
            
        exponent_1_30_cyc_tonic_allsub(s,:,:,:) = exponent_1_30_cyc_tonic_all;
        exponent_30_45_cyc_tonic_allsub(s,:,:,:) = exponent_30_45_cyc_tonic_all;
        offset_1_30_cyc_tonic_allsub(s,:,:,:) = offset_1_30_cyc_tonic_all;
        offset_30_45_cyc_tonic_allsub(s,:,:,:) = offset_30_45_cyc_tonic_all;
        
        exponent_1_30_cyc_quint_tonic_allsub(s,:,:,:,:)= exponent_1_30_cyc_quint_tonic_all;
        exponent_30_45_cyc_quint_tonic_allsub(s,:,:,:,:) = exponent_30_45_cyc_quint_tonic_all;
        offset_1_30_cyc_quint_tonic_allsub(s,:,:,:,:) = offset_1_30_cyc_quint_tonic_all;
        offset_30_45_cyc_quint_tonic_allsub(s,:,:,:,:) = offset_30_45_cyc_quint_tonic_all;
    
        IAPF_tonic_cyc_allsub(s,:,:,:) = IAPF_tonic_cyc_all;
        ITPF_tonic_cyc_allsub(s,:,:,:) = ITPF_tonic_cyc_all;
        ISPF_tonic_cyc_allsub(s,:,:,:) = ISPF_tonic_cyc_all;
        IAPF_tonic_height_cyc_allsub(s,:,:,:) = IAPF_tonic_height_cyc_all;
        ITPF_tonic_height_cyc_allsub(s,:,:,:) = ITPF_tonic_height_cyc_all;
        ISPF_tonic_height_cyc_allsub(s,:,:,:) = ISPF_tonic_height_cyc_all;
        alpha_tonic_den_cyc_allsub(s,:,:,:) = alpha_tonic_den_cyc;
        alpha_tonic_abu_cyc_allsub(s,:,:,:) = alpha_tonic_abu_cyc;
        alpha_tonic_amp_cyc_allsub(s,:,:,:) = alpha_tonic_amp_cyc;
        alpha_tonic_snr_cyc_allsub(s,:,:,:) = alpha_tonic_snr_cyc;
        theta_tonic_den_cyc_allsub(s,:,:,:) = theta_tonic_den_cyc;
        theta_tonic_abu_cyc_allsub(s,:,:,:) = theta_tonic_abu_cyc;
        theta_tonic_amp_cyc_allsub(s,:,:,:) = theta_tonic_amp_cyc;
        theta_tonic_snr_cyc_allsub(s,:,:,:) = theta_tonic_snr_cyc;
        spindles_tonic_den_cyc_allsub(s,:,:,:) = spindles_tonic_den_cyc;
        spindles_tonic_abu_cyc_allsub(s,:,:,:) = spindles_tonic_abu_cyc;
        spindles_tonic_amp_cyc_allsub(s,:,:,:) = spindles_tonic_amp_cyc;
        spindles_tonic_snr_cyc_allsub(s,:,:,:) = spindles_tonic_snr_cyc;
        
        IAPF_tonic_cyc_quint_allsub(s,:,:,:,:) = IAPF_tonic_cyc_quint_all;
        ITPF_tonic_cyc_quint_allsub(s,:,:,:,:) = ITPF_tonic_cyc_quint_all;
        ISPF_tonic_cyc_quint_allsub(s,:,:,:,:) = ISPF_tonic_cyc_quint_all;
        IAPF_tonic_height_cyc_quint_allsub(s,:,:,:,:) = IAPF_tonic_height_cyc_quint_all;
        ITPF_tonic_height_cyc_quint_allsub(s,:,:,:,:) = ITPF_tonic_height_cyc_quint_all;
        ISPF_tonic_height_cyc_quint_allsub(s,:,:,:,:) = ISPF_tonic_height_cyc_quint_all;
        alpha_tonic_den_cyc_quint_allsub(s,:,:,:,:) = alpha_tonic_den_cyc_quint;
        alpha_tonic_abu_cyc_quint_allsub(s,:,:,:,:) = alpha_tonic_abu_cyc_quint;
        alpha_tonic_amp_cyc_quint_allsub(s,:,:,:,:) = alpha_tonic_amp_cyc_quint;
        alpha_tonic_snr_cyc_quint_allsub(s,:,:,:,:) = alpha_tonic_snr_cyc_quint; 
        theta_tonic_den_cyc_quint_allsub(s,:,:,:,:) = theta_tonic_den_cyc_quint;
        theta_tonic_abu_cyc_quint_allsub(s,:,:,:,:) = theta_tonic_abu_cyc_quint;
        theta_tonic_amp_cyc_quint_allsub(s,:,:,:,:) = theta_tonic_amp_cyc_quint;
        theta_tonic_snr_cyc_quint_allsub(s,:,:,:,:) = theta_tonic_snr_cyc_quint;  
        spindles_tonic_den_cyc_quint_allsub(s,:,:,:,:) = spindles_tonic_den_cyc_quint;
        spindles_tonic_abu_cyc_quint_allsub(s,:,:,:,:) = spindles_tonic_abu_cyc_quint;
        spindles_tonic_amp_cyc_quint_allsub(s,:,:,:,:) = spindles_tonic_amp_cyc_quint;
        spindles_tonic_snr_cyc_quint_allsub(s,:,:,:,:) = spindles_tonic_snr_cyc_quint;  
        
        
        exponent_1_30_cyc_nrem_allsub(s,:,:,:) = exponent_1_30_cyc_nrem_all;
        exponent_30_45_cyc_nrem_allsub(s,:,:,:) = exponent_30_45_cyc_nrem_all;
        offset_1_30_cyc_nrem_allsub(s,:,:,:) = offset_1_30_cyc_nrem_all;
        offset_30_45_cyc_nrem_allsub(s,:,:,:) = offset_30_45_cyc_nrem_all;
        
        exponent_1_30_cyc_quint_nrem_allsub(s,:,:,:,:)= exponent_1_30_cyc_quint_nrem_all;
        exponent_30_45_cyc_quint_nrem_allsub(s,:,:,:,:) = exponent_30_45_cyc_quint_nrem_all;
        offset_1_30_cyc_quint_nrem_allsub(s,:,:,:,:) = offset_1_30_cyc_quint_nrem_all;
        offset_30_45_cyc_quint_nrem_allsub(s,:,:,:,:) = offset_30_45_cyc_quint_nrem_all;
    
        IAPF_nrem_cyc_allsub(s,:,:,:) = IAPF_nrem_cyc_all;
        ITPF_nrem_cyc_allsub(s,:,:,:) = ITPF_nrem_cyc_all;
        ISPF_nrem_cyc_allsub(s,:,:,:) = ISPF_nrem_cyc_all;
        IAPF_nrem_height_cyc_allsub(s,:,:,:) = IAPF_nrem_height_cyc_all;
        ITPF_nrem_height_cyc_allsub(s,:,:,:) = ITPF_nrem_height_cyc_all;
        ISPF_nrem_height_cyc_allsub(s,:,:,:) = ISPF_nrem_height_cyc_all;
        alpha_nrem_den_cyc_allsub(s,:,:,:) = alpha_nrem_den_cyc;
        alpha_nrem_abu_cyc_allsub(s,:,:,:) = alpha_nrem_abu_cyc;
        alpha_nrem_amp_cyc_allsub(s,:,:,:) = alpha_nrem_amp_cyc;
        alpha_nrem_snr_cyc_allsub(s,:,:,:) = alpha_nrem_snr_cyc;
        theta_nrem_den_cyc_allsub(s,:,:,:) = theta_nrem_den_cyc;
        theta_nrem_abu_cyc_allsub(s,:,:,:) = theta_nrem_abu_cyc;
        theta_nrem_amp_cyc_allsub(s,:,:,:) = theta_nrem_amp_cyc;
        theta_nrem_snr_cyc_allsub(s,:,:,:) = theta_nrem_snr_cyc;
        spindles_nrem_den_cyc_allsub(s,:,:,:) = spindles_nrem_den_cyc;
        spindles_nrem_abu_cyc_allsub(s,:,:,:) = spindles_nrem_abu_cyc;
        spindles_nrem_amp_cyc_allsub(s,:,:,:) = spindles_nrem_amp_cyc;
        spindles_nrem_snr_cyc_allsub(s,:,:,:) = spindles_nrem_snr_cyc;
        
        IAPF_nrem_cyc_quint_allsub(s,:,:,:,:) = IAPF_nrem_cyc_quint_all;
        ITPF_nrem_cyc_quint_allsub(s,:,:,:,:) = ITPF_nrem_cyc_quint_all;
        ISPF_nrem_cyc_quint_allsub(s,:,:,:,:) = ISPF_nrem_cyc_quint_all;
        IAPF_nrem_height_cyc_quint_allsub(s,:,:,:,:) = IAPF_nrem_height_cyc_quint_all;
        ITPF_nrem_height_cyc_quint_allsub(s,:,:,:,:) = ITPF_nrem_height_cyc_quint_all;
        ISPF_nrem_height_cyc_quint_allsub(s,:,:,:,:) = ISPF_nrem_height_cyc_quint_all;
        alpha_nrem_den_cyc_quint_allsub(s,:,:,:,:) = alpha_nrem_den_cyc_quint;
        alpha_nrem_abu_cyc_quint_allsub(s,:,:,:,:) = alpha_nrem_abu_cyc_quint;
        alpha_nrem_amp_cyc_quint_allsub(s,:,:,:,:) = alpha_nrem_amp_cyc_quint;
        alpha_nrem_snr_cyc_quint_allsub(s,:,:,:,:) = alpha_nrem_snr_cyc_quint;   
        theta_nrem_den_cyc_quint_allsub(s,:,:,:,:) = theta_nrem_den_cyc_quint;
        theta_nrem_abu_cyc_quint_allsub(s,:,:,:,:) = theta_nrem_abu_cyc_quint;
        theta_nrem_amp_cyc_quint_allsub(s,:,:,:,:) = theta_nrem_amp_cyc_quint;
        theta_nrem_snr_cyc_quint_allsub(s,:,:,:,:) = theta_nrem_snr_cyc_quint;   
        spindles_nrem_den_cyc_quint_allsub(s,:,:,:,:) = spindles_nrem_den_cyc_quint;
        spindles_nrem_abu_cyc_quint_allsub(s,:,:,:,:) = spindles_nrem_abu_cyc_quint;
        spindles_nrem_amp_cyc_quint_allsub(s,:,:,:,:) = spindles_nrem_amp_cyc_quint;
        spindles_nrem_snr_cyc_quint_allsub(s,:,:,:,:) = spindles_nrem_snr_cyc_quint;   
        
        clear prob_phasic_cyc_all dur_cyc_min_all prob_phasic_cyc_quint_all dur_cyc_quint_min_all
        
        clear exponent_1_30_cyc_rem_all exponent_30_45_cyc_rem_all offset_1_30_cyc_rem_all offset_30_45_cyc_rem_all
        clear IAPF_rem_cyc_all ITPF_rem_cyc_all ISPF_rem_cyc_all 
        clear alpha_rem_den_cyc alpha_rem_abu_cyc alpha_rem_amp_cyc alpha_rem_snr_cyc
        clear theta_rem_den_cyc theta_rem_abu_cyc theta_rem_amp_cyc theta_rem_snr_cyc
        clear spindles_rem_den_cyc spindles_rem_abu_cyc spindles_rem_amp_cyc spindles_rem_snr_cyc
        clear exponent_1_30_cyc_quint_rem_all exponent_30_45_cyc_quint_rem_all offset_1_30_cyc_quint_rem_all offset_30_45_cyc_quint_rem_all
        clear IAPF_rem_cyc_quint_all ITPF_rem_cyc_quint_all ISPF_rem_cyc_quint_all 
        clear alpha_rem_den_cyc_quint alpha_rem_abu_cyc_quint alpha_rem_amp_cyc_quint alpha_rem_snr_cyc_quint
        clear theta_rem_den_cyc_quint theta_rem_abu_cyc_quint theta_rem_amp_cyc_quint theta_rem_snr_cyc_quint
        clear spindles_rem_den_cyc_quint spindles_rem_abu_cyc_quint spindles_rem_amp_cyc_quint spindles_rem_snr_cyc_quint    
        
        clear exponent_1_30_cyc_phasic_all exponent_30_45_cyc_phasic_all offset_1_30_cyc_phasic_all offset_30_45_cyc_phasic_all
        clear IAPF_phasic_cyc_all ITPF_phasic_cyc_all ISPF_phasic_cyc_all 
        clear alpha_phasic_den_cyc alpha_phasic_abu_cyc alpha_phasic_amp_cyc alpha_phasic_snr_cyc
        clear theta_phasic_den_cyc theta_phasic_abu_cyc theta_phasic_amp_cyc theta_phasic_snr_cyc
        clear spindles_phasic_den_cyc spindles_phasic_abu_cyc spindles_phasic_amp_cyc spindles_phasic_snr_cyc
        clear exponent_1_30_cyc_quint_phasic_all exponent_30_45_cyc_quint_phasic_all offset_1_30_cyc_quint_phasic_all offset_30_45_cyc_quint_phasic_all
        clear IAPF_phasic_cyc_quint_all ITPF_phasic_cyc_quint_all ISPF_phasic_cyc_quint_all 
        clear alpha_phasic_den_cyc_quint alpha_phasic_abu_cyc_quint alpha_phasic_amp_cyc_quint alpha_phasic_snr_cyc_quint
        clear theta_phasic_den_cyc_quint theta_phasic_abu_cyc_quint theta_phasic_amp_cyc_quint theta_phasic_snr_cyc_quint
        clear spindles_phasic_den_cyc_quint spindles_phasic_abu_cyc_quint spindles_phasic_amp_cyc_quint spindles_phasic_snr_cyc_quint  
        
        clear exponent_1_30_cyc_tonic_all exponent_30_45_cyc_tonic_all offset_1_30_cyc_tonic_all offset_30_45_cyc_tonic_all
        clear IAPF_tonic_cyc_all ITPF_tonic_cyc_all ISPF_tonic_cyc_all 
        clear alpha_tonic_den_cyc alpha_tonic_abu_cyc alpha_tonic_amp_cyc alpha_tonic_snr_cyc
        clear theta_tonic_den_cyc theta_tonic_abu_cyc theta_tonic_amp_cyc theta_tonic_snr_cyc
        clear spindles_tonic_den_cyc spindles_tonic_abu_cyc spindles_tonic_amp_cyc spindles_tonic_snr_cyc
        clear exponent_1_30_cyc_quint_tonic_all exponent_30_45_cyc_quint_tonic_all offset_1_30_cyc_quint_tonic_all offset_30_45_cyc_quint_tonic_all
        clear IAPF_tonic_cyc_quint_all ITPF_tonic_cyc_quint_all ISPF_tonic_cyc_quint_all 
        clear alpha_tonic_den_cyc_quint alpha_tonic_abu_cyc_quint alpha_tonic_amp_cyc_quint alpha_tonic_snr_cyc_quint
        clear theta_tonic_den_cyc_quint theta_tonic_abu_cyc_quint theta_tonic_amp_cyc_quint theta_tonic_snr_cyc_quint
        clear spindles_tonic_den_cyc_quint spindles_tonic_abu_cyc_quint spindles_tonic_amp_cyc_quint spindles_tonic_snr_cyc_quint 
        
        clear exponent_1_30_cyc_nrem_all exponent_30_45_cyc_nrem_all offset_1_30_cyc_nrem_all offset_30_45_cyc_nrem_all
        clear IAPF_nrem_cyc_all ITPF_nrem_cyc_all ISPF_nrem_cyc_all 
        clear alpha_nrem_den_cyc alpha_nrem_abu_cyc alpha_nrem_amp_cyc alpha_nrem_snr_cyc
        clear theta_nrem_den_cyc theta_nrem_abu_cyc theta_nrem_amp_cyc theta_nrem_snr_cyc
        clear spindles_nrem_den_cyc spindles_nrem_abu_cyc spindles_nrem_amp_cyc spindles_nrem_snr_cyc
        clear exponent_1_30_cyc_quint_nrem_all exponent_30_45_cyc_quint_nrem_all offset_1_30_cyc_quint_nrem_all offset_30_45_cyc_quint_nrem_all
        clear IAPF_nrem_cyc_quint_all ITPF_nrem_cyc_quint_all ISPF_nrem_cyc_quint_all 
        clear alpha_nrem_den_cyc_quint alpha_nrem_abu_cyc_quint alpha_nrem_amp_cyc_quint alpha_nrem_snr_cyc_quint
        clear theta_nrem_den_cyc_quint theta_nrem_abu_cyc_quint theta_nrem_amp_cyc_quint theta_nrem_snr_cyc_quint
        clear spindles_nrem_den_cyc_quint spindles_nrem_abu_cyc_quint spindles_nrem_amp_cyc_quint spindles_nrem_snr_cyc_quint 
        
        
end

%%

save([Savefolder,filesep,'eBOSC_allsub_not_individualized_2_6_12_dynamics',date,'.mat']);


