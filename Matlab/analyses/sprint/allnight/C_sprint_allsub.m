%%
clear all;
close all;

Folderpath = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub/';
dir_Folderpath = dir([Folderpath,filesep,'AFOSR*']);

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub/';

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
    
    
    
    power_spectrum_1_30_rem_allsub(s,:,:,:) = power_spectrum_1_30_rem;
    power_spectrum_1_30_phasic_allsub(s,:,:,:) = power_spectrum_1_30_phasic;
    power_spectrum_1_30_tonic_allsub(s,:,:,:) = power_spectrum_1_30_tonic;
    power_spectrum_1_30_nrem_allsub(s,:,:,:) = power_spectrum_1_30_nrem;
    power_spectrum_1_30_n1_allsub(s,:,:,:) = power_spectrum_1_30_n1;
    power_spectrum_1_30_n2_allsub(s,:,:,:) = power_spectrum_1_30_n2;
    power_spectrum_1_30_n3_allsub(s,:,:,:) = power_spectrum_1_30_n3;
    power_spectrum_1_30_wake_allsub(s,:,:,:) = power_spectrum_1_30_wake;   
    
    power_spectrum_30_45_rem_allsub(s,:,:,:) = power_spectrum_30_45_rem;
    power_spectrum_30_45_phasic_allsub(s,:,:,:) = power_spectrum_30_45_phasic;
    power_spectrum_30_45_tonic_allsub(s,:,:,:) = power_spectrum_30_45_tonic;
    power_spectrum_30_45_nrem_allsub(s,:,:,:) = power_spectrum_30_45_nrem;
    power_spectrum_30_45_n1_allsub(s,:,:,:) = power_spectrum_30_45_n1;
    power_spectrum_30_45_n2_allsub(s,:,:,:) = power_spectrum_30_45_n2;
    power_spectrum_30_45_n3_allsub(s,:,:,:) = power_spectrum_30_45_n3;
    power_spectrum_30_45_wake_allsub(s,:,:,:) = power_spectrum_30_45_wake;

    power_spectrum_1_45_rem_allsub(s,:,:,:) = power_spectrum_1_45_rem;
    power_spectrum_1_45_phasic_allsub(s,:,:,:) = power_spectrum_1_45_phasic;
    power_spectrum_1_45_tonic_allsub(s,:,:,:) = power_spectrum_1_45_tonic;
    power_spectrum_1_45_nrem_allsub(s,:,:,:) = power_spectrum_1_45_nrem;
    power_spectrum_1_45_n1_allsub(s,:,:,:) = power_spectrum_1_45_n1;
    power_spectrum_1_45_n2_allsub(s,:,:,:) = power_spectrum_1_45_n2;
    power_spectrum_1_45_n3_allsub(s,:,:,:) = power_spectrum_1_45_n3;
    power_spectrum_1_45_wake_allsub(s,:,:,:) = power_spectrum_1_45_wake; 
    
    
    ap_fit_1_30_rem_allsub(s,:,:,:) = ap_fit_1_30_rem;
    ap_fit_1_30_phasic_allsub(s,:,:,:) = ap_fit_1_30_phasic;
    ap_fit_1_30_tonic_allsub(s,:,:,:) = ap_fit_1_30_tonic;
    ap_fit_1_30_nrem_allsub(s,:,:,:) = ap_fit_1_30_nrem;
    ap_fit_1_30_n1_allsub(s,:,:,:) = ap_fit_1_30_n1;
    ap_fit_1_30_n2_allsub(s,:,:,:) = ap_fit_1_30_n2;
    ap_fit_1_30_n3_allsub(s,:,:,:) = ap_fit_1_30_n3;
    ap_fit_1_30_wake_allsub(s,:,:,:) = ap_fit_1_30_wake;   
    
    ap_fit_30_45_rem_allsub(s,:,:,:) = ap_fit_30_45_rem;
    ap_fit_30_45_phasic_allsub(s,:,:,:) = ap_fit_30_45_phasic;
    ap_fit_30_45_tonic_allsub(s,:,:,:) = ap_fit_30_45_tonic;
    ap_fit_30_45_nrem_allsub(s,:,:,:) = ap_fit_30_45_nrem;
    ap_fit_30_45_n1_allsub(s,:,:,:) = ap_fit_30_45_n1;
    ap_fit_30_45_n2_allsub(s,:,:,:) = ap_fit_30_45_n2;
    ap_fit_30_45_n3_allsub(s,:,:,:) = ap_fit_30_45_n3;
    ap_fit_30_45_wake_allsub(s,:,:,:) = ap_fit_30_45_wake;

    ap_fit_1_45_rem_allsub(s,:,:,:) = ap_fit_1_45_rem;
    ap_fit_1_45_phasic_allsub(s,:,:,:) = ap_fit_1_45_phasic;
    ap_fit_1_45_tonic_allsub(s,:,:,:) = ap_fit_1_45_tonic;
    ap_fit_1_45_nrem_allsub(s,:,:,:) = ap_fit_1_45_nrem;
    ap_fit_1_45_n1_allsub(s,:,:,:) = ap_fit_1_45_n1;
    ap_fit_1_45_n2_allsub(s,:,:,:) = ap_fit_1_45_n2;
    ap_fit_1_45_n3_allsub(s,:,:,:) = ap_fit_1_45_n3;
    ap_fit_1_45_wake_allsub(s,:,:,:) = ap_fit_1_45_wake; 
    
    
    
    peak_fit_1_30_rem_allsub(s,:,:,:) = peak_fit_1_30_rem;
    peak_fit_1_30_phasic_allsub(s,:,:,:) = peak_fit_1_30_phasic;
    peak_fit_1_30_tonic_allsub(s,:,:,:) = peak_fit_1_30_tonic;
    peak_fit_1_30_nrem_allsub(s,:,:,:) = peak_fit_1_30_nrem;
    peak_fit_1_30_n1_allsub(s,:,:,:) = peak_fit_1_30_n1;
    peak_fit_1_30_n2_allsub(s,:,:,:) = peak_fit_1_30_n2;
    peak_fit_1_30_n3_allsub(s,:,:,:) = peak_fit_1_30_n3;
    peak_fit_1_30_wake_allsub(s,:,:,:) = peak_fit_1_30_wake;   
    
    peak_fit_30_45_rem_allsub(s,:,:,:) = peak_fit_30_45_rem;
    peak_fit_30_45_phasic_allsub(s,:,:,:) = peak_fit_30_45_phasic;
    peak_fit_30_45_tonic_allsub(s,:,:,:) = peak_fit_30_45_tonic;
    peak_fit_30_45_nrem_allsub(s,:,:,:) = peak_fit_30_45_nrem;
    peak_fit_30_45_n1_allsub(s,:,:,:) = peak_fit_30_45_n1;
    peak_fit_30_45_n2_allsub(s,:,:,:) = peak_fit_30_45_n2;
    peak_fit_30_45_n3_allsub(s,:,:,:) = peak_fit_30_45_n3;
    peak_fit_30_45_wake_allsub(s,:,:,:) = peak_fit_30_45_wake;

    peak_fit_1_45_rem_allsub(s,:,:,:) = peak_fit_1_45_rem;
    peak_fit_1_45_phasic_allsub(s,:,:,:) = peak_fit_1_45_phasic;
    peak_fit_1_45_tonic_allsub(s,:,:,:) = peak_fit_1_45_tonic;
    peak_fit_1_45_nrem_allsub(s,:,:,:) = peak_fit_1_45_nrem;
    peak_fit_1_45_n1_allsub(s,:,:,:) = peak_fit_1_45_n1;
    peak_fit_1_45_n2_allsub(s,:,:,:) = peak_fit_1_45_n2;
    peak_fit_1_45_n3_allsub(s,:,:,:) = peak_fit_1_45_n3;
    peak_fit_1_45_wake_allsub(s,:,:,:) = peak_fit_1_45_wake; 
    
    
    foofed_spectrum_1_30_rem_allsub(s,:,:,:) = foofed_spectrum_1_30_rem;
    foofed_spectrum_1_30_phasic_allsub(s,:,:,:) = foofed_spectrum_1_30_phasic;
    foofed_spectrum_1_30_tonic_allsub(s,:,:,:) = foofed_spectrum_1_30_tonic;
    foofed_spectrum_1_30_nrem_allsub(s,:,:,:) = foofed_spectrum_1_30_nrem;
    foofed_spectrum_1_30_n1_allsub(s,:,:,:) = foofed_spectrum_1_30_n1;
    foofed_spectrum_1_30_n2_allsub(s,:,:,:) = foofed_spectrum_1_30_n2;
    foofed_spectrum_1_30_n3_allsub(s,:,:,:) = foofed_spectrum_1_30_n3;
    foofed_spectrum_1_30_wake_allsub(s,:,:,:) = foofed_spectrum_1_30_wake;   
    
    foofed_spectrum_30_45_rem_allsub(s,:,:,:) = foofed_spectrum_30_45_rem;
    foofed_spectrum_30_45_phasic_allsub(s,:,:,:) = foofed_spectrum_30_45_phasic;
    foofed_spectrum_30_45_tonic_allsub(s,:,:,:) = foofed_spectrum_30_45_tonic;
    foofed_spectrum_30_45_nrem_allsub(s,:,:,:) = foofed_spectrum_30_45_nrem;
    foofed_spectrum_30_45_n1_allsub(s,:,:,:) = foofed_spectrum_30_45_n1;
    foofed_spectrum_30_45_n2_allsub(s,:,:,:) = foofed_spectrum_30_45_n2;
    foofed_spectrum_30_45_n3_allsub(s,:,:,:) = foofed_spectrum_30_45_n3;
    foofed_spectrum_30_45_wake_allsub(s,:,:,:) = foofed_spectrum_30_45_wake;

    foofed_spectrum_1_45_rem_allsub(s,:,:,:) = foofed_spectrum_1_45_rem;
    foofed_spectrum_1_45_phasic_allsub(s,:,:,:) = foofed_spectrum_1_45_phasic;
    foofed_spectrum_1_45_tonic_allsub(s,:,:,:) = foofed_spectrum_1_45_tonic;
    foofed_spectrum_1_45_nrem_allsub(s,:,:,:) = foofed_spectrum_1_45_nrem;
    foofed_spectrum_1_45_n1_allsub(s,:,:,:) = foofed_spectrum_1_45_n1;
    foofed_spectrum_1_45_n2_allsub(s,:,:,:) = foofed_spectrum_1_45_n2;
    foofed_spectrum_1_45_n3_allsub(s,:,:,:) = foofed_spectrum_1_45_n3;
    foofed_spectrum_1_45_wake_allsub(s,:,:,:) = foofed_spectrum_1_45_wake; 
      
    
    
    log_power_spectrum_1_30_rem_allsub(s,:,:,:) = log_power_spectrum_1_30_rem;
    log_power_spectrum_1_30_phasic_allsub(s,:,:,:) = log_power_spectrum_1_30_phasic;
    log_power_spectrum_1_30_tonic_allsub(s,:,:,:) = log_power_spectrum_1_30_tonic;
    log_power_spectrum_1_30_nrem_allsub(s,:,:,:) = log_power_spectrum_1_30_nrem;
    log_power_spectrum_1_30_n1_allsub(s,:,:,:) = log_power_spectrum_1_30_n1;
    log_power_spectrum_1_30_n2_allsub(s,:,:,:) = log_power_spectrum_1_30_n2;
    log_power_spectrum_1_30_n3_allsub(s,:,:,:) = log_power_spectrum_1_30_n3;
    log_power_spectrum_1_30_wake_allsub(s,:,:,:) = log_power_spectrum_1_30_wake;   
    
    log_power_spectrum_30_45_rem_allsub(s,:,:,:) = log_power_spectrum_30_45_rem;
    log_power_spectrum_30_45_phasic_allsub(s,:,:,:) = log_power_spectrum_30_45_phasic;
    log_power_spectrum_30_45_tonic_allsub(s,:,:,:) = log_power_spectrum_30_45_tonic;
    log_power_spectrum_30_45_nrem_allsub(s,:,:,:) = log_power_spectrum_30_45_nrem;
    log_power_spectrum_30_45_n1_allsub(s,:,:,:) = log_power_spectrum_30_45_n1;
    log_power_spectrum_30_45_n2_allsub(s,:,:,:) = log_power_spectrum_30_45_n2;
    log_power_spectrum_30_45_n3_allsub(s,:,:,:) = log_power_spectrum_30_45_n3;
    log_power_spectrum_30_45_wake_allsub(s,:,:,:) = log_power_spectrum_30_45_wake;

    log_power_spectrum_1_45_rem_allsub(s,:,:,:) = log_power_spectrum_1_45_rem;
    log_power_spectrum_1_45_phasic_allsub(s,:,:,:) = log_power_spectrum_1_45_phasic;
    log_power_spectrum_1_45_tonic_allsub(s,:,:,:) = log_power_spectrum_1_45_tonic;
    log_power_spectrum_1_45_nrem_allsub(s,:,:,:) = log_power_spectrum_1_45_nrem;
    log_power_spectrum_1_45_n1_allsub(s,:,:,:) = log_power_spectrum_1_45_n1;
    log_power_spectrum_1_45_n2_allsub(s,:,:,:) = log_power_spectrum_1_45_n2;
    log_power_spectrum_1_45_n3_allsub(s,:,:,:) = log_power_spectrum_1_45_n3;
    log_power_spectrum_1_45_wake_allsub(s,:,:,:) = log_power_spectrum_1_45_wake; 
    
    
    log_ap_fit_1_30_rem_allsub(s,:,:,:) = log_ap_fit_1_30_rem;
    log_ap_fit_1_30_phasic_allsub(s,:,:,:) = log_ap_fit_1_30_phasic;
    log_ap_fit_1_30_tonic_allsub(s,:,:,:) = log_ap_fit_1_30_tonic;
    log_ap_fit_1_30_nrem_allsub(s,:,:,:) = log_ap_fit_1_30_nrem;
    log_ap_fit_1_30_n1_allsub(s,:,:,:) = log_ap_fit_1_30_n1;
    log_ap_fit_1_30_n2_allsub(s,:,:,:) = log_ap_fit_1_30_n2;
    log_ap_fit_1_30_n3_allsub(s,:,:,:) = log_ap_fit_1_30_n3;
    log_ap_fit_1_30_wake_allsub(s,:,:,:) = log_ap_fit_1_30_wake;   
    
    log_ap_fit_30_45_rem_allsub(s,:,:,:) = log_ap_fit_30_45_rem;
    log_ap_fit_30_45_phasic_allsub(s,:,:,:) = log_ap_fit_30_45_phasic;
    log_ap_fit_30_45_tonic_allsub(s,:,:,:) = log_ap_fit_30_45_tonic;
    log_ap_fit_30_45_nrem_allsub(s,:,:,:) = log_ap_fit_30_45_nrem;
    log_ap_fit_30_45_n1_allsub(s,:,:,:) = log_ap_fit_30_45_n1;
    log_ap_fit_30_45_n2_allsub(s,:,:,:) = log_ap_fit_30_45_n2;
    log_ap_fit_30_45_n3_allsub(s,:,:,:) = log_ap_fit_30_45_n3;
    log_ap_fit_30_45_wake_allsub(s,:,:,:) = log_ap_fit_30_45_wake;

    log_ap_fit_1_45_rem_allsub(s,:,:,:) = log_ap_fit_1_45_rem;
    log_ap_fit_1_45_phasic_allsub(s,:,:,:) = log_ap_fit_1_45_phasic;
    log_ap_fit_1_45_tonic_allsub(s,:,:,:) = log_ap_fit_1_45_tonic;
    log_ap_fit_1_45_nrem_allsub(s,:,:,:) = log_ap_fit_1_45_nrem;
    log_ap_fit_1_45_n1_allsub(s,:,:,:) = log_ap_fit_1_45_n1;
    log_ap_fit_1_45_n2_allsub(s,:,:,:) = log_ap_fit_1_45_n2;
    log_ap_fit_1_45_n3_allsub(s,:,:,:) = log_ap_fit_1_45_n3;
    log_ap_fit_1_45_wake_allsub(s,:,:,:) = log_ap_fit_1_45_wake; 
    
    
    
    log_peak_fit_1_30_rem_allsub(s,:,:,:) = log_peak_fit_1_30_rem;
    log_peak_fit_1_30_phasic_allsub(s,:,:,:) = log_peak_fit_1_30_phasic;
    log_peak_fit_1_30_tonic_allsub(s,:,:,:) = log_peak_fit_1_30_tonic;
    log_peak_fit_1_30_nrem_allsub(s,:,:,:) = log_peak_fit_1_30_nrem;
    log_peak_fit_1_30_n1_allsub(s,:,:,:) = log_peak_fit_1_30_n1;
    log_peak_fit_1_30_n2_allsub(s,:,:,:) = log_peak_fit_1_30_n2;
    log_peak_fit_1_30_n3_allsub(s,:,:,:) = log_peak_fit_1_30_n3;
    log_peak_fit_1_30_wake_allsub(s,:,:,:) = log_peak_fit_1_30_wake;   
    
    log_peak_fit_30_45_rem_allsub(s,:,:,:) = log_peak_fit_30_45_rem;
    log_peak_fit_30_45_phasic_allsub(s,:,:,:) = log_peak_fit_30_45_phasic;
    log_peak_fit_30_45_tonic_allsub(s,:,:,:) = log_peak_fit_30_45_tonic;
    log_peak_fit_30_45_nrem_allsub(s,:,:,:) = log_peak_fit_30_45_nrem;
    log_peak_fit_30_45_n1_allsub(s,:,:,:) = log_peak_fit_30_45_n1;
    log_peak_fit_30_45_n2_allsub(s,:,:,:) = log_peak_fit_30_45_n2;
    log_peak_fit_30_45_n3_allsub(s,:,:,:) = log_peak_fit_30_45_n3;
    log_peak_fit_30_45_wake_allsub(s,:,:,:) = log_peak_fit_30_45_wake;

    log_peak_fit_1_45_rem_allsub(s,:,:,:) = log_peak_fit_1_45_rem;
    log_peak_fit_1_45_phasic_allsub(s,:,:,:) = log_peak_fit_1_45_phasic;
    log_peak_fit_1_45_tonic_allsub(s,:,:,:) = log_peak_fit_1_45_tonic;
    log_peak_fit_1_45_nrem_allsub(s,:,:,:) = log_peak_fit_1_45_nrem;
    log_peak_fit_1_45_n1_allsub(s,:,:,:) = log_peak_fit_1_45_n1;
    log_peak_fit_1_45_n2_allsub(s,:,:,:) = log_peak_fit_1_45_n2;
    log_peak_fit_1_45_n3_allsub(s,:,:,:) = log_peak_fit_1_45_n3;
    log_peak_fit_1_45_wake_allsub(s,:,:,:) = log_peak_fit_1_45_wake; 
    
    
    log_foofed_spectrum_1_30_rem_allsub(s,:,:,:) = log_foofed_spectrum_1_30_rem;
    log_foofed_spectrum_1_30_phasic_allsub(s,:,:,:) = log_foofed_spectrum_1_30_phasic;
    log_foofed_spectrum_1_30_tonic_allsub(s,:,:,:) = log_foofed_spectrum_1_30_tonic;
    log_foofed_spectrum_1_30_nrem_allsub(s,:,:,:) = log_foofed_spectrum_1_30_nrem;
    log_foofed_spectrum_1_30_n1_allsub(s,:,:,:) = log_foofed_spectrum_1_30_n1;
    log_foofed_spectrum_1_30_n2_allsub(s,:,:,:) = log_foofed_spectrum_1_30_n2;
    log_foofed_spectrum_1_30_n3_allsub(s,:,:,:) = log_foofed_spectrum_1_30_n3;
    log_foofed_spectrum_1_30_wake_allsub(s,:,:,:) = log_foofed_spectrum_1_30_wake;   
    
    log_foofed_spectrum_30_45_rem_allsub(s,:,:,:) = log_foofed_spectrum_30_45_rem;
    log_foofed_spectrum_30_45_phasic_allsub(s,:,:,:) = log_foofed_spectrum_30_45_phasic;
    log_foofed_spectrum_30_45_tonic_allsub(s,:,:,:) = log_foofed_spectrum_30_45_tonic;
    log_foofed_spectrum_30_45_nrem_allsub(s,:,:,:) = log_foofed_spectrum_30_45_nrem;
    log_foofed_spectrum_30_45_n1_allsub(s,:,:,:) = log_foofed_spectrum_30_45_n1;
    log_foofed_spectrum_30_45_n2_allsub(s,:,:,:) = log_foofed_spectrum_30_45_n2;
    log_foofed_spectrum_30_45_n3_allsub(s,:,:,:) = log_foofed_spectrum_30_45_n3;
    log_foofed_spectrum_30_45_wake_allsub(s,:,:,:) = log_foofed_spectrum_30_45_wake;

    log_foofed_spectrum_1_45_rem_allsub(s,:,:,:) = log_foofed_spectrum_1_45_rem;
    log_foofed_spectrum_1_45_phasic_allsub(s,:,:,:) = log_foofed_spectrum_1_45_phasic;
    log_foofed_spectrum_1_45_tonic_allsub(s,:,:,:) = log_foofed_spectrum_1_45_tonic;
    log_foofed_spectrum_1_45_nrem_allsub(s,:,:,:) = log_foofed_spectrum_1_45_nrem;
    log_foofed_spectrum_1_45_n1_allsub(s,:,:,:) = log_foofed_spectrum_1_45_n1;
    log_foofed_spectrum_1_45_n2_allsub(s,:,:,:) = log_foofed_spectrum_1_45_n2;
    log_foofed_spectrum_1_45_n3_allsub(s,:,:,:) = log_foofed_spectrum_1_45_n3;
    log_foofed_spectrum_1_45_wake_allsub(s,:,:,:) = log_foofed_spectrum_1_45_wake; 
            
end

%%

save([Savefolder,filesep,'sprint_allsub_',date,'.mat']);

