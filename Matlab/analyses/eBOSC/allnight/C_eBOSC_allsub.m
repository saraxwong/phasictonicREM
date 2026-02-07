%%
clear all;
close all;

Folderpath = '/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_allstages_1s_osc4/indsub/';
dir_Folderpath = dir([Folderpath,filesep,'AFOSR*']);

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_allstages_1s_osc4/';

%%

for s = 1:length(dir_Folderpath)
    
    
    load([Folderpath,filesep,dir_Folderpath(s).name]);
    
    exponent_1_30_rem_allsub(s,:,:) = exponent_1_30_rem;
    exponent_1_30_phasic_allsub(s,:,:) = exponent_1_30_phasic;
    exponent_1_30_tonic_allsub(s,:,:) = exponent_1_30_tonic;
    exponent_1_30_nrem_allsub(s,:,:) = exponent_1_30_nrem;
    exponent_1_30_n1_allsub(s,:,:) = exponent_1_30_n1;
    exponent_1_30_n2_allsub(s,:,:) = exponent_1_30_n2;
    exponent_1_30_n3_allsub(s,:,:) = exponent_1_30_n3;
    exponent_1_30_wake_allsub(s,:,:) = exponent_1_30_wake;   
    
    exponent_30_45_rem_allsub(s,:,:) = exponent_30_45_rem;
    exponent_30_45_phasic_allsub(s,:,:) = exponent_30_45_phasic;
    exponent_30_45_tonic_allsub(s,:,:) = exponent_30_45_tonic;
    exponent_30_45_nrem_allsub(s,:,:) = exponent_30_45_nrem;
    exponent_30_45_n1_allsub(s,:,:) = exponent_30_45_n1;
    exponent_30_45_n2_allsub(s,:,:) = exponent_30_45_n2;
    exponent_30_45_n3_allsub(s,:,:) = exponent_30_45_n3;
    exponent_30_45_wake_allsub(s,:,:) = exponent_30_45_wake;

    exponent_1_45_rem_allsub(s,:,:) = exponent_1_45_rem;
    exponent_1_45_phasic_allsub(s,:,:) = exponent_1_45_phasic;
    exponent_1_45_tonic_allsub(s,:,:) = exponent_1_45_tonic;
    exponent_1_45_nrem_allsub(s,:,:) = exponent_1_45_nrem;
    exponent_1_45_n1_allsub(s,:,:) = exponent_1_45_n1;
    exponent_1_45_n2_allsub(s,:,:) = exponent_1_45_n2;
    exponent_1_45_n3_allsub(s,:,:) = exponent_1_45_n3;
    exponent_1_45_wake_allsub(s,:,:) = exponent_1_45_wake;  
    
    
    offset_1_30_rem_allsub(s,:,:) = offset_1_30_rem;
    offset_1_30_phasic_allsub(s,:,:) = offset_1_30_phasic;
    offset_1_30_tonic_allsub(s,:,:) = offset_1_30_tonic;
    offset_1_30_nrem_allsub(s,:,:) = offset_1_30_nrem;
    offset_1_30_n1_allsub(s,:,:) = offset_1_30_n1;
    offset_1_30_n2_allsub(s,:,:) = offset_1_30_n2;
    offset_1_30_n3_allsub(s,:,:) = offset_1_30_n3;
    offset_1_30_wake_allsub(s,:,:) = offset_1_30_wake;   
    
    offset_30_45_rem_allsub(s,:,:) = offset_30_45_rem;
    offset_30_45_phasic_allsub(s,:,:) = offset_30_45_phasic;
    offset_30_45_tonic_allsub(s,:,:) = offset_30_45_tonic;
    offset_30_45_nrem_allsub(s,:,:) = offset_30_45_nrem;
    offset_30_45_n1_allsub(s,:,:) = offset_30_45_n1;
    offset_30_45_n2_allsub(s,:,:) = offset_30_45_n2;
    offset_30_45_n3_allsub(s,:,:) = offset_30_45_n3;
    offset_30_45_wake_allsub(s,:,:) = offset_30_45_wake;

    offset_1_45_rem_allsub(s,:,:) = offset_1_45_rem;
    offset_1_45_phasic_allsub(s,:,:) = offset_1_45_phasic;
    offset_1_45_tonic_allsub(s,:,:) = offset_1_45_tonic;
    offset_1_45_nrem_allsub(s,:,:) = offset_1_45_nrem;
    offset_1_45_n1_allsub(s,:,:) = offset_1_45_n1;
    offset_1_45_n2_allsub(s,:,:) = offset_1_45_n2;
    offset_1_45_n3_allsub(s,:,:) = offset_1_45_n3;
    offset_1_45_wake_allsub(s,:,:) = offset_1_45_wake; 
       
    IAPF_wake_allsub(s,:,:) = IAPF_wake_all;
    IAPF_rem_allsub(s,:,:) = IAPF_rem_all;
    IAPF_phasic_allsub(s,:,:) = IAPF_phasic_all;
    IAPF_tonic_allsub(s,:,:) = IAPF_tonic_all;
    IAPF_nrem_allsub(s,:,:) = IAPF_nrem_all;
    
    ITPF_wake_allsub(s,:,:) = ITPF_wake_all;
    ITPF_rem_allsub(s,:,:) = ITPF_rem_all;
    ITPF_phasic_allsub(s,:,:) = ITPF_phasic_all;
    ITPF_tonic_allsub(s,:,:) = ITPF_tonic_all;
    ITPF_nrem_allsub(s,:,:) = ITPF_nrem_all;
    
    ISPF_wake_allsub(s,:,:) = ISPF_wake_all;
    ISPF_rem_allsub(s,:,:) = ISPF_rem_all;
    ISPF_phasic_allsub(s,:,:) = ISPF_phasic_all;
    ISPF_tonic_allsub(s,:,:) = ISPF_tonic_all;
    ISPF_nrem_allsub(s,:,:) = ISPF_nrem_all;
    
    IAPF_wake_height_allsub(s,:,:) = IAPF_wake_height_all;
    IAPF_rem_height_allsub(s,:,:) = IAPF_rem_height_all;
    IAPF_phasic_height_allsub(s,:,:) = IAPF_phasic_height_all;
    IAPF_tonic_height_allsub(s,:,:) = IAPF_tonic_height_all;
    IAPF_nrem_height_allsub(s,:,:) = IAPF_nrem_height_all;
    
    ITPF_wake_height_allsub(s,:,:) = ITPF_wake_height_all;
    ITPF_rem_height_allsub(s,:,:) = ITPF_rem_height_all;
    ITPF_phasic_height_allsub(s,:,:) = ITPF_phasic_height_all;
    ITPF_tonic_height_allsub(s,:,:) = ITPF_tonic_height_all;
    ITPF_nrem_height_allsub(s,:,:) = ITPF_nrem_height_all;
    
    ISPF_wake_height_allsub(s,:,:) = ISPF_wake_height_all;
    ISPF_rem_height_allsub(s,:,:) = ISPF_rem_height_all;
    ISPF_phasic_height_allsub(s,:,:) = ISPF_phasic_height_all;
    ISPF_tonic_height_allsub(s,:,:) = ISPF_tonic_height_all;
    ISPF_nrem_height_allsub(s,:,:) = ISPF_nrem_height_all;
    
    alpha_rem_den_allsub(s,:,:) = alpha_rem_den;
    theta_rem_den_allsub(s,:,:) = theta_rem_den;
    spindles_rem_den_allsub(s,:,:) = spindles_rem_den;
    
    alpha_phasic_den_allsub(s,:,:) = alpha_phasic_den;
    theta_phasic_den_allsub(s,:,:) = theta_phasic_den;
    spindles_phasic_den_allsub(s,:,:) = spindles_phasic_den;
    
    alpha_tonic_den_allsub(s,:,:) = alpha_tonic_den;
    theta_tonic_den_allsub(s,:,:) = theta_tonic_den;
    spindles_tonic_den_allsub(s,:,:) = spindles_tonic_den;
    
    alpha_nrem_den_allsub(s,:,:) = alpha_nrem_den;
    theta_nrem_den_allsub(s,:,:) = theta_nrem_den;
    spindles_nrem_den_allsub(s,:,:) = spindles_nrem_den;
    
    alpha_wake_den_allsub(s,:,:) = alpha_wake_den;
    theta_wake_den_allsub(s,:,:) = theta_wake_den;
    spindles_wake_den_allsub(s,:,:) = spindles_wake_den;
    
    
    alpha_rem_abu_allsub(s,:,:) = alpha_rem_abu;
    theta_rem_abu_allsub(s,:,:) = theta_rem_abu;
    spindles_rem_abu_allsub(s,:,:) = spindles_rem_abu;
    
    alpha_phasic_abu_allsub(s,:,:) = alpha_phasic_abu;
    theta_phasic_abu_allsub(s,:,:) = theta_phasic_abu;
    spindles_phasic_abu_allsub(s,:,:) = spindles_phasic_abu;
    
    alpha_tonic_abu_allsub(s,:,:) = alpha_tonic_abu;
    theta_tonic_abu_allsub(s,:,:) = theta_tonic_abu;
    spindles_tonic_abu_allsub(s,:,:) = spindles_tonic_abu;
    
    alpha_nrem_abu_allsub(s,:,:) = alpha_nrem_abu;
    theta_nrem_abu_allsub(s,:,:) = theta_nrem_abu;
    spindles_nrem_abu_allsub(s,:,:) = spindles_nrem_abu;
    
    alpha_wake_abu_allsub(s,:,:) = alpha_wake_abu;
    theta_wake_abu_allsub(s,:,:) = theta_wake_abu;
    spindles_wake_abu_allsub(s,:,:) = spindles_wake_abu;
    
    
    alpha_rem_amp_allsub(s,:,:) = alpha_rem_amp;
    theta_rem_amp_allsub(s,:,:) = theta_rem_amp;
    spindles_rem_amp_allsub(s,:,:) = spindles_rem_amp;
    
    alpha_phasic_amp_allsub(s,:,:) = alpha_phasic_amp;
    theta_phasic_amp_allsub(s,:,:) = theta_phasic_amp;
    spindles_phasic_amp_allsub(s,:,:) = spindles_phasic_amp;
    
    alpha_tonic_amp_allsub(s,:,:) = alpha_tonic_amp;
    theta_tonic_amp_allsub(s,:,:) = theta_tonic_amp;
    spindles_tonic_amp_allsub(s,:,:) = spindles_tonic_amp;
    
    alpha_nrem_amp_allsub(s,:,:) = alpha_nrem_amp;
    theta_nrem_amp_allsub(s,:,:) = theta_nrem_amp;
    spindles_nrem_amp_allsub(s,:,:) = spindles_nrem_amp;
    
    alpha_wake_amp_allsub(s,:,:) = alpha_wake_amp;
    theta_wake_amp_allsub(s,:,:) = theta_wake_amp;
    spindles_wake_amp_allsub(s,:,:) = spindles_wake_amp;
    
    
    alpha_rem_snr_allsub(s,:,:) = alpha_rem_snr;
    theta_rem_snr_allsub(s,:,:) = theta_rem_snr;
    spindles_rem_snr_allsub(s,:,:) = spindles_rem_snr;
    
    alpha_phasic_snr_allsub(s,:,:) = alpha_phasic_snr;
    theta_phasic_snr_allsub(s,:,:) = theta_phasic_snr;
    spindles_phasic_snr_allsub(s,:,:) = spindles_phasic_snr;
    
    alpha_tonic_snr_allsub(s,:,:) = alpha_tonic_snr;
    theta_tonic_snr_allsub(s,:,:) = theta_tonic_snr;
    spindles_tonic_snr_allsub(s,:,:) = spindles_tonic_snr;
    
    alpha_nrem_snr_allsub(s,:,:) = alpha_nrem_snr;
    theta_nrem_snr_allsub(s,:,:) = theta_nrem_snr;
    spindles_nrem_snr_allsub(s,:,:) = spindles_nrem_snr;
    
    alpha_wake_snr_allsub(s,:,:) = alpha_wake_snr;
    theta_wake_snr_allsub(s,:,:) = theta_wake_snr;
    spindles_wake_snr_allsub(s,:,:) = spindles_wake_snr;
        
    
    clear exponent_1_30_rem exponent_1_30_rem exponent_1_30_phasic exponent_1_30_tonic exponent_1_30_nrem exponent_1_30_n1 exponent_1_30_n2 exponent_1_30_n3 exponent_1_30_wake   
    clear exponent_30_45_rem exponent_30_45_rem exponent_30_45_phasic exponent_30_45_tonic exponent_30_45_nrem exponent_30_45_n1 exponent_30_45_n2 exponent_30_45_n3 exponent_30_45_wake   
    clear exponent_1_45_rem exponent_1_45_rem exponent_1_45_phasic exponent_1_45_tonic exponent_1_45_nrem exponent_1_45_n1 exponent_1_45_n2 exponent_1_45_n3 exponent_1_45_wake   
    
    clear offset_1_30_rem offset_1_30_rem offset_1_30_phasic offset_1_30_tonic offset_1_30_nrem offset_1_30_n1 offset_1_30_n2 offset_1_30_n3 offset_1_30_wake   
    clear offset_30_45_rem offset_30_45_rem offset_30_45_phasic offset_30_45_tonic offset_30_45_nrem offset_30_45_n1 offset_30_45_n2 offset_30_45_n3 offset_30_45_wake   
    clear offset_1_45_rem offset_1_45_rem offset_1_45_phasic offset_1_45_tonic offset_1_45_nrem offset_1_45_n1 offset_1_45_n2 offset_1_45_n3 offset_1_45_wake   
    
    clear IAPF_wake_all IAPF_rem_all IAPF_phasic_all IAPF_tonic_all IAPF_nrem_all 
    clear ITPF_wake_all ITPF_rem_all ITPF_phasic_all ITPF_tonic_all ITPF_nrem_all 
    clear ISPF_wake_all ISPF_rem_all ISPF_phasic_all ISPF_tonic_all ISPF_nrem_all 
    
    clear alpha_rem_den theta_rem_den spindles_rem_den
    clear alpha_phasic_den theta_phasic_den spindles_phasic_den
    clear alpha_tonic_den theta_tonic_den spindles_tonic_den
    clear alpha_nrem_den theta_nrem_den spindles_nrem_den
    clear alpha_wake_den theta_wake_den spindles_wake_den
    
    clear alpha_rem_abu theta_rem_abu spindles_rem_abu
    clear alpha_phasic_abu theta_phasic_abu spindles_phasic_abu
    clear alpha_tonic_abu theta_tonic_abu spindles_tonic_abu
    clear alpha_nrem_abu theta_nrem_abu spindles_nrem_abu
    clear alpha_wake_abu theta_wake_abu spindles_wake_abu
    
    clear alpha_rem_amp theta_rem_amp spindles_rem_amp
    clear alpha_phasic_amp theta_phasic_amp spindles_phasic_amp
    clear alpha_tonic_amp theta_tonic_amp spindles_tonic_amp
    clear alpha_nrem_amp theta_nrem_amp spindles_nrem_amp
    clear alpha_wake_amp theta_wake_amp spindles_wake_amp
    
    clear alpha_rem_snr theta_rem_snr spindles_rem_snr
    clear alpha_phasic_snr theta_phasic_snr spindles_phasic_snr
    clear alpha_tonic_snr theta_tonic_snr spindles_tonic_snr
    clear alpha_nrem_snr theta_nrem_snr spindles_nrem_snr
    clear alpha_wake_snr theta_wake_snr spindles_wake_snr

end

%%

save([Savefolder,filesep,'eBOSC_allsub_not_individualized_2_6_12_1s_osc_',date,'.mat']);

