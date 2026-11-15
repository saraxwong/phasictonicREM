%%
clear all;
close all;

Folderpath = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/allsub/';
dir_Folderpath = dir([Folderpath,filesep,'AFOSR*']);

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/allsub/allsub/';

%%

for s = 1:length(dir_Folderpath)
    
    display(['Sub = ',num2str(s)]);
    load([Folderpath,filesep,dir_Folderpath(s).name]);
    
%     load([Folderpath_power,filesep,dir_Folderpath_power(s).name]);
      
    eBOSC_allsub.exponent_1_30_rem_allsub(s,:,:) = eBOSC.exponent_1_30_rem;
    eBOSC_allsub.exponent_1_30_phasic_allsub(s,:,:) = eBOSC.exponent_1_30_phasic;
    eBOSC_allsub.exponent_1_30_tonic_allsub(s,:,:) = eBOSC.exponent_1_30_tonic;
    eBOSC_allsub.exponent_1_30_nrem_allsub(s,:,:) = eBOSC.exponent_1_30_nrem;
    eBOSC_allsub.exponent_1_30_n1_allsub(s,:,:) = eBOSC.exponent_1_30_n1;
    eBOSC_allsub.exponent_1_30_n2_allsub(s,:,:) = eBOSC.exponent_1_30_n2;
    eBOSC_allsub.exponent_1_30_n3_allsub(s,:,:) = eBOSC.exponent_1_30_n3;
    eBOSC_allsub.exponent_1_30_wake_allsub(s,:,:) = eBOSC.exponent_1_30_wake;   
    
    eBOSC_allsub.exponent_30_45_rem_allsub(s,:,:) = eBOSC.exponent_30_45_rem;
    eBOSC_allsub.exponent_30_45_phasic_allsub(s,:,:) = eBOSC.exponent_30_45_phasic;
    eBOSC_allsub.exponent_30_45_tonic_allsub(s,:,:) = eBOSC.exponent_30_45_tonic;
    eBOSC_allsub.exponent_30_45_nrem_allsub(s,:,:) = eBOSC.exponent_30_45_nrem;
    eBOSC_allsub.exponent_30_45_n1_allsub(s,:,:) = eBOSC.exponent_30_45_n1;
    eBOSC_allsub.exponent_30_45_n2_allsub(s,:,:) = eBOSC.exponent_30_45_n2;
    eBOSC_allsub.exponent_30_45_n3_allsub(s,:,:) = eBOSC.exponent_30_45_n3;
    eBOSC_allsub.exponent_30_45_wake_allsub(s,:,:) = eBOSC.exponent_30_45_wake;

    eBOSC_allsub.exponent_1_45_rem_allsub(s,:,:) = eBOSC.exponent_1_45_rem;
    eBOSC_allsub.exponent_1_45_phasic_allsub(s,:,:) = eBOSC.exponent_1_45_phasic;
    eBOSC_allsub.exponent_1_45_tonic_allsub(s,:,:) = eBOSC.exponent_1_45_tonic;
    eBOSC_allsub.exponent_1_45_nrem_allsub(s,:,:) = eBOSC.exponent_1_45_nrem;
    eBOSC_allsub.exponent_1_45_n1_allsub(s,:,:) = eBOSC.exponent_1_45_n1;
    eBOSC_allsub.exponent_1_45_n2_allsub(s,:,:) = eBOSC.exponent_1_45_n2;
    eBOSC_allsub.exponent_1_45_n3_allsub(s,:,:) = eBOSC.exponent_1_45_n3;
    eBOSC_allsub.exponent_1_45_wake_allsub(s,:,:) = eBOSC.exponent_1_45_wake;  
    
    
    eBOSC_allsub.offset_1_30_rem_allsub(s,:,:) = eBOSC.offset_1_30_rem;
    eBOSC_allsub.offset_1_30_phasic_allsub(s,:,:) = eBOSC.offset_1_30_phasic;
    eBOSC_allsub.offset_1_30_tonic_allsub(s,:,:) = eBOSC.offset_1_30_tonic;
    eBOSC_allsub.offset_1_30_nrem_allsub(s,:,:) = eBOSC.offset_1_30_nrem;
    eBOSC_allsub.offset_1_30_n1_allsub(s,:,:) = eBOSC.offset_1_30_n1;
    eBOSC_allsub.offset_1_30_n2_allsub(s,:,:) = eBOSC.offset_1_30_n2;
    eBOSC_allsub.offset_1_30_n3_allsub(s,:,:) = eBOSC.offset_1_30_n3;
    eBOSC_allsub.offset_1_30_wake_allsub(s,:,:) = eBOSC.offset_1_30_wake;   
    
    eBOSC_allsub.offset_30_45_rem_allsub(s,:,:) = eBOSC.offset_30_45_rem;
    eBOSC_allsub.offset_30_45_phasic_allsub(s,:,:) = eBOSC.offset_30_45_phasic;
    eBOSC_allsub.offset_30_45_tonic_allsub(s,:,:) = eBOSC.offset_30_45_tonic;
    eBOSC_allsub.offset_30_45_nrem_allsub(s,:,:) = eBOSC.offset_30_45_nrem;
    eBOSC_allsub.offset_30_45_n1_allsub(s,:,:) = eBOSC.offset_30_45_n1;
    eBOSC_allsub.offset_30_45_n2_allsub(s,:,:) = eBOSC.offset_30_45_n2;
    eBOSC_allsub.offset_30_45_n3_allsub(s,:,:) = eBOSC.offset_30_45_n3;
    eBOSC_allsub.offset_30_45_wake_allsub(s,:,:) = eBOSC.offset_30_45_wake;

    eBOSC_allsub.offset_1_45_rem_allsub(s,:,:) = eBOSC.offset_1_45_rem;
    eBOSC_allsub.offset_1_45_phasic_allsub(s,:,:) = eBOSC.offset_1_45_phasic;
    eBOSC_allsub.offset_1_45_tonic_allsub(s,:,:) = eBOSC.offset_1_45_tonic;
    eBOSC_allsub.offset_1_45_nrem_allsub(s,:,:) = eBOSC.offset_1_45_nrem;
    eBOSC_allsub.offset_1_45_n1_allsub(s,:,:) = eBOSC.offset_1_45_n1;
    eBOSC_allsub.offset_1_45_n2_allsub(s,:,:) = eBOSC.offset_1_45_n2;
    eBOSC_allsub.offset_1_45_n3_allsub(s,:,:) = eBOSC.offset_1_45_n3;
    eBOSC_allsub.offset_1_45_wake_allsub(s,:,:) = eBOSC.offset_1_45_wake; 
    
    
    
    eBOSC_allsub.power_spectrum_1_30_rem_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_rem;
    eBOSC_allsub.power_spectrum_1_30_phasic_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_phasic;
    eBOSC_allsub.power_spectrum_1_30_tonic_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_tonic;
    eBOSC_allsub.power_spectrum_1_30_nrem_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_nrem;
    eBOSC_allsub.power_spectrum_1_30_n1_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_n1;
    eBOSC_allsub.power_spectrum_1_30_n2_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_n2;
    eBOSC_allsub.power_spectrum_1_30_n3_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_n3;
    eBOSC_allsub.power_spectrum_1_30_wake_allsub(s,:,:,:) = eBOSC.power_spectrum_1_30_wake;   
    
    eBOSC_allsub.power_spectrum_30_45_rem_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_rem;
    eBOSC_allsub.power_spectrum_30_45_phasic_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_phasic;
    eBOSC_allsub.power_spectrum_30_45_tonic_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_tonic;
    eBOSC_allsub.power_spectrum_30_45_nrem_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_nrem;
    eBOSC_allsub.power_spectrum_30_45_n1_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_n1;
    eBOSC_allsub.power_spectrum_30_45_n2_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_n2;
    eBOSC_allsub.power_spectrum_30_45_n3_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_n3;
    eBOSC_allsub.power_spectrum_30_45_wake_allsub(s,:,:,:) = eBOSC.power_spectrum_30_45_wake;

    eBOSC_allsub.power_spectrum_1_45_rem_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_rem;
    eBOSC_allsub.power_spectrum_1_45_phasic_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_phasic;
    eBOSC_allsub.power_spectrum_1_45_tonic_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_tonic;
    eBOSC_allsub.power_spectrum_1_45_nrem_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_nrem;
    eBOSC_allsub.power_spectrum_1_45_n1_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_n1;
    eBOSC_allsub.power_spectrum_1_45_n2_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_n2;
    eBOSC_allsub.power_spectrum_1_45_n3_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_n3;
    eBOSC_allsub.power_spectrum_1_45_wake_allsub(s,:,:,:) = eBOSC.power_spectrum_1_45_wake; 
    
    
    eBOSC_allsub.ap_fit_1_30_rem_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_rem;
    eBOSC_allsub.ap_fit_1_30_phasic_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_phasic;
    eBOSC_allsub.ap_fit_1_30_tonic_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_tonic;
    eBOSC_allsub.ap_fit_1_30_nrem_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_nrem;
    eBOSC_allsub.ap_fit_1_30_n1_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_n1;
    eBOSC_allsub.ap_fit_1_30_n2_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_n2;
    eBOSC_allsub.ap_fit_1_30_n3_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_n3;
    eBOSC_allsub.ap_fit_1_30_wake_allsub(s,:,:,:) = eBOSC.ap_fit_1_30_wake;   
    
    eBOSC_allsub.ap_fit_30_45_rem_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_rem;
    eBOSC_allsub.ap_fit_30_45_phasic_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_phasic;
    eBOSC_allsub.ap_fit_30_45_tonic_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_tonic;
    eBOSC_allsub.ap_fit_30_45_nrem_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_nrem;
    eBOSC_allsub.ap_fit_30_45_n1_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_n1;
    eBOSC_allsub.ap_fit_30_45_n2_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_n2;
    eBOSC_allsub.ap_fit_30_45_n3_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_n3;
    eBOSC_allsub.ap_fit_30_45_wake_allsub(s,:,:,:) = eBOSC.ap_fit_30_45_wake;

    eBOSC_allsub.ap_fit_1_45_rem_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_rem;
    eBOSC_allsub.ap_fit_1_45_phasic_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_phasic;
    eBOSC_allsub.ap_fit_1_45_tonic_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_tonic;
    eBOSC_allsub.ap_fit_1_45_nrem_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_nrem;
    eBOSC_allsub.ap_fit_1_45_n1_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_n1;
    eBOSC_allsub.ap_fit_1_45_n2_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_n2;
    eBOSC_allsub.ap_fit_1_45_n3_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_n3;
    eBOSC_allsub.ap_fit_1_45_wake_allsub(s,:,:,:) = eBOSC.ap_fit_1_45_wake; 
    

    eBOSC_allsub.peak_fit_1_30_rem_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_rem;
    eBOSC_allsub.peak_fit_1_30_phasic_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_phasic;
    eBOSC_allsub.peak_fit_1_30_tonic_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_tonic;
    eBOSC_allsub.peak_fit_1_30_nrem_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_nrem;
    eBOSC_allsub.peak_fit_1_30_n1_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_n1;
    eBOSC_allsub.peak_fit_1_30_n2_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_n2;
    eBOSC_allsub.peak_fit_1_30_n3_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_n3;
    eBOSC_allsub.peak_fit_1_30_wake_allsub(s,:,:,:) = eBOSC.peak_fit_1_30_wake;   
    
    eBOSC_allsub.peak_fit_30_45_rem_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_rem;
    eBOSC_allsub.peak_fit_30_45_phasic_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_phasic;
    eBOSC_allsub.peak_fit_30_45_tonic_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_tonic;
    eBOSC_allsub.peak_fit_30_45_nrem_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_nrem;
    eBOSC_allsub.peak_fit_30_45_n1_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_n1;
    eBOSC_allsub.peak_fit_30_45_n2_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_n2;
    eBOSC_allsub.peak_fit_30_45_n3_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_n3;
    eBOSC_allsub.peak_fit_30_45_wake_allsub(s,:,:,:) = eBOSC.peak_fit_30_45_wake;

    eBOSC_allsub.peak_fit_1_45_rem_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_rem;
    eBOSC_allsub.peak_fit_1_45_phasic_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_phasic;
    eBOSC_allsub.peak_fit_1_45_tonic_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_tonic;
    eBOSC_allsub.peak_fit_1_45_nrem_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_nrem;
    eBOSC_allsub.peak_fit_1_45_n1_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_n1;
    eBOSC_allsub.peak_fit_1_45_n2_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_n2;
    eBOSC_allsub.peak_fit_1_45_n3_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_n3;
    eBOSC_allsub.peak_fit_1_45_wake_allsub(s,:,:,:) = eBOSC.peak_fit_1_45_wake; 
    
    
    eBOSC_allsub.log_power_spectrum_1_30_rem_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_rem;
    eBOSC_allsub.log_power_spectrum_1_30_phasic_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_phasic;
    eBOSC_allsub.log_power_spectrum_1_30_tonic_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_tonic;
    eBOSC_allsub.log_power_spectrum_1_30_nrem_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_nrem;
    eBOSC_allsub.log_power_spectrum_1_30_n1_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_n1;
    eBOSC_allsub.log_power_spectrum_1_30_n2_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_n2;
    eBOSC_allsub.log_power_spectrum_1_30_n3_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_n3;
    eBOSC_allsub.log_power_spectrum_1_30_wake_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_30_wake;   
    
    eBOSC_allsub.log_power_spectrum_30_45_rem_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_rem;
    eBOSC_allsub.log_power_spectrum_30_45_phasic_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_phasic;
    eBOSC_allsub.log_power_spectrum_30_45_tonic_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_tonic;
    eBOSC_allsub.log_power_spectrum_30_45_nrem_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_nrem;
    eBOSC_allsub.log_power_spectrum_30_45_n1_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_n1;
    eBOSC_allsub.log_power_spectrum_30_45_n2_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_n2;
    eBOSC_allsub.log_power_spectrum_30_45_n3_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_n3;
    eBOSC_allsub.log_power_spectrum_30_45_wake_allsub(s,:,:,:) = eBOSC.log_power_spectrum_30_45_wake;

    eBOSC_allsub.log_power_spectrum_1_45_rem_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_rem;
    eBOSC_allsub.log_power_spectrum_1_45_phasic_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_phasic;
    eBOSC_allsub.log_power_spectrum_1_45_tonic_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_tonic;
    eBOSC_allsub.log_power_spectrum_1_45_nrem_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_nrem;
    eBOSC_allsub.log_power_spectrum_1_45_n1_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_n1;
    eBOSC_allsub.log_power_spectrum_1_45_n2_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_n2;
    eBOSC_allsub.log_power_spectrum_1_45_n3_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_n3;
    eBOSC_allsub.log_power_spectrum_1_45_wake_allsub(s,:,:,:) = eBOSC.log_power_spectrum_1_45_wake; 
    
    
    eBOSC_allsub.log_ap_fit_1_30_rem_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_rem;
    eBOSC_allsub.log_ap_fit_1_30_phasic_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_phasic;
    eBOSC_allsub.log_ap_fit_1_30_tonic_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_tonic;
    eBOSC_allsub.log_ap_fit_1_30_nrem_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_nrem;
    eBOSC_allsub.log_ap_fit_1_30_n1_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_n1;
    eBOSC_allsub.log_ap_fit_1_30_n2_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_n2;
    eBOSC_allsub.log_ap_fit_1_30_n3_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_n3;
    eBOSC_allsub.log_ap_fit_1_30_wake_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_30_wake;   
    
    eBOSC_allsub.log_ap_fit_30_45_rem_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_rem;
    eBOSC_allsub.log_ap_fit_30_45_phasic_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_phasic;
    eBOSC_allsub.log_ap_fit_30_45_tonic_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_tonic;
    eBOSC_allsub.log_ap_fit_30_45_nrem_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_nrem;
    eBOSC_allsub.log_ap_fit_30_45_n1_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_n1;
    eBOSC_allsub.log_ap_fit_30_45_n2_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_n2;
    eBOSC_allsub.log_ap_fit_30_45_n3_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_n3;
    eBOSC_allsub.log_ap_fit_30_45_wake_allsub(s,:,:,:) = eBOSC.log_ap_fit_30_45_wake;

    eBOSC_allsub.log_ap_fit_1_45_rem_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_rem;
    eBOSC_allsub.log_ap_fit_1_45_phasic_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_phasic;
    eBOSC_allsub.log_ap_fit_1_45_tonic_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_tonic;
    eBOSC_allsub.log_ap_fit_1_45_nrem_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_nrem;
    eBOSC_allsub.log_ap_fit_1_45_n1_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_n1;
    eBOSC_allsub.log_ap_fit_1_45_n2_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_n2;
    eBOSC_allsub.log_ap_fit_1_45_n3_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_n3;
    eBOSC_allsub.log_ap_fit_1_45_wake_allsub(s,:,:,:) = eBOSC.log_ap_fit_1_45_wake; 
    

    eBOSC_allsub.log_peak_fit_1_30_rem_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_rem;
    eBOSC_allsub.log_peak_fit_1_30_phasic_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_phasic;
    eBOSC_allsub.log_peak_fit_1_30_tonic_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_tonic;
    eBOSC_allsub.log_peak_fit_1_30_nrem_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_nrem;
    eBOSC_allsub.log_peak_fit_1_30_n1_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_n1;
    eBOSC_allsub.log_peak_fit_1_30_n2_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_n2;
    eBOSC_allsub.log_peak_fit_1_30_n3_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_n3;
    eBOSC_allsub.log_peak_fit_1_30_wake_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_30_wake;   
    
    eBOSC_allsub.log_peak_fit_30_45_rem_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_rem;
    eBOSC_allsub.log_peak_fit_30_45_phasic_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_phasic;
    eBOSC_allsub.log_peak_fit_30_45_tonic_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_tonic;
    eBOSC_allsub.log_peak_fit_30_45_nrem_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_nrem;
    eBOSC_allsub.log_peak_fit_30_45_n1_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_n1;
    eBOSC_allsub.log_peak_fit_30_45_n2_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_n2;
    eBOSC_allsub.log_peak_fit_30_45_n3_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_n3;
    eBOSC_allsub.log_peak_fit_30_45_wake_allsub(s,:,:,:) = eBOSC.log_peak_fit_30_45_wake;

    eBOSC_allsub.log_peak_fit_1_45_rem_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_rem;
    eBOSC_allsub.log_peak_fit_1_45_phasic_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_phasic;
    eBOSC_allsub.log_peak_fit_1_45_tonic_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_tonic;
    eBOSC_allsub.log_peak_fit_1_45_nrem_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_nrem;
    eBOSC_allsub.log_peak_fit_1_45_n1_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_n1;
    eBOSC_allsub.log_peak_fit_1_45_n2_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_n2;
    eBOSC_allsub.log_peak_fit_1_45_n3_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_n3;
    eBOSC_allsub.log_peak_fit_1_45_wake_allsub(s,:,:,:) = eBOSC.log_peak_fit_1_45_wake; 
    
    eBOSC_allsub.r_squared_1_30_rem_allsub(s,:,:) = eBOSC.r_squared_1_30_rem;
    eBOSC_allsub.r_squared_1_30_phasic_allsub(s,:,:) = eBOSC.r_squared_1_30_phasic;
    eBOSC_allsub.r_squared_1_30_tonic_allsub(s,:,:) = eBOSC.r_squared_1_30_tonic;
    eBOSC_allsub.r_squared_1_30_nrem_allsub(s,:,:) = eBOSC.r_squared_1_30_nrem;
    eBOSC_allsub.r_squared_1_30_n1_allsub(s,:,:) = eBOSC.r_squared_1_30_n1;
    eBOSC_allsub.r_squared_1_30_n2_allsub(s,:,:) = eBOSC.r_squared_1_30_n2;
    eBOSC_allsub.r_squared_1_30_n3_allsub(s,:,:) = eBOSC.r_squared_1_30_n3;
    eBOSC_allsub.r_squared_1_30_wake_allsub(s,:,:) = eBOSC.r_squared_1_30_wake;
    
    eBOSC_allsub.r_squared_30_45_rem_allsub(s,:,:) = eBOSC.r_squared_30_45_rem;
    eBOSC_allsub.r_squared_30_45_phasic_allsub(s,:,:) = eBOSC.r_squared_30_45_phasic;
    eBOSC_allsub.r_squared_30_45_tonic_allsub(s,:,:) = eBOSC.r_squared_30_45_tonic;
    eBOSC_allsub.r_squared_30_45_nrem_allsub(s,:,:) = eBOSC.r_squared_30_45_nrem;
    eBOSC_allsub.r_squared_30_45_n1_allsub(s,:,:) = eBOSC.r_squared_30_45_n1;
    eBOSC_allsub.r_squared_30_45_n2_allsub(s,:,:) = eBOSC.r_squared_30_45_n2;
    eBOSC_allsub.r_squared_30_45_n3_allsub(s,:,:) = eBOSC.r_squared_30_45_n3;
    eBOSC_allsub.r_squared_30_45_wake_allsub(s,:,:) = eBOSC.r_squared_30_45_wake;
        
    eBOSC_allsub.r_squared_1_45_rem_allsub(s,:,:) = eBOSC.r_squared_1_45_rem;
    eBOSC_allsub.r_squared_1_45_phasic_allsub(s,:,:) = eBOSC.r_squared_1_45_phasic;
    eBOSC_allsub.r_squared_1_45_tonic_allsub(s,:,:) = eBOSC.r_squared_1_45_tonic;
    eBOSC_allsub.r_squared_1_45_nrem_allsub(s,:,:) = eBOSC.r_squared_1_45_nrem;
    eBOSC_allsub.r_squared_1_45_n1_allsub(s,:,:) = eBOSC.r_squared_1_45_n1;
    eBOSC_allsub.r_squared_1_45_n2_allsub(s,:,:) = eBOSC.r_squared_1_45_n2;
    eBOSC_allsub.r_squared_1_45_n3_allsub(s,:,:) = eBOSC.r_squared_1_45_n3;
    eBOSC_allsub.r_squared_1_45_wake_allsub(s,:,:) = eBOSC.r_squared_1_45_wake;
    

    eBOSC_allsub.error_1_30_rem_allsub(s,:,:) = eBOSC.error_1_30_rem;
    eBOSC_allsub.error_1_30_phasic_allsub(s,:,:) = eBOSC.error_1_30_phasic;
    eBOSC_allsub.error_1_30_tonic_allsub(s,:,:) = eBOSC.error_1_30_tonic;
    eBOSC_allsub.error_1_30_nrem_allsub(s,:,:) = eBOSC.error_1_30_nrem;
    eBOSC_allsub.error_1_30_n1_allsub(s,:,:) = eBOSC.error_1_30_n1;
    eBOSC_allsub.error_1_30_n2_allsub(s,:,:) = eBOSC.error_1_30_n2;
    eBOSC_allsub.error_1_30_n3_allsub(s,:,:) = eBOSC.error_1_30_n3;
    eBOSC_allsub.error_1_30_wake_allsub(s,:,:) = eBOSC.error_1_30_wake;
    
    eBOSC_allsub.error_30_45_rem_allsub(s,:,:) = eBOSC.error_30_45_rem;
    eBOSC_allsub.error_30_45_phasic_allsub(s,:,:) = eBOSC.error_30_45_phasic;
    eBOSC_allsub.error_30_45_tonic_allsub(s,:,:) = eBOSC.error_30_45_tonic;
    eBOSC_allsub.error_30_45_nrem_allsub(s,:,:) = eBOSC.error_30_45_nrem;
    eBOSC_allsub.error_30_45_n1_allsub(s,:,:) = eBOSC.error_30_45_n1;
    eBOSC_allsub.error_30_45_n2_allsub(s,:,:) = eBOSC.error_30_45_n2;
    eBOSC_allsub.error_30_45_n3_allsub(s,:,:) = eBOSC.error_30_45_n3;
    eBOSC_allsub.error_30_45_wake_allsub(s,:,:) = eBOSC.error_30_45_wake;
    
    eBOSC_allsub.error_1_45_rem_allsub(s,:,:) = eBOSC.error_1_45_rem;
    eBOSC_allsub.error_1_45_phasic_allsub(s,:,:) = eBOSC.error_1_45_phasic;
    eBOSC_allsub.error_1_45_tonic_allsub(s,:,:) = eBOSC.error_1_45_tonic;
    eBOSC_allsub.error_1_45_nrem_allsub(s,:,:) = eBOSC.error_1_45_nrem;
    eBOSC_allsub.error_1_45_n1_allsub(s,:,:) = eBOSC.error_1_45_n1;
    eBOSC_allsub.error_1_45_n2_allsub(s,:,:) = eBOSC.error_1_45_n2;
    eBOSC_allsub.error_1_45_n3_allsub(s,:,:) = eBOSC.error_1_45_n3;
    eBOSC_allsub.error_1_45_wake_allsub(s,:,:) = eBOSC.error_1_45_wake;  
    
    eBOSC_allsub.swa_rem_allsub(s,:,:) = eBOSC.swa_rem;
    eBOSC_allsub.swa_phasic_allsub(s,:,:) = eBOSC.swa_phasic;
    eBOSC_allsub.swa_tonic_allsub(s,:,:) = eBOSC.swa_tonic;
    eBOSC_allsub.swa_nrem_allsub(s,:,:) = eBOSC.swa_nrem;
    eBOSC_allsub.swa_n1_allsub(s,:,:) = eBOSC.swa_n1;
    eBOSC_allsub.swa_n2_allsub(s,:,:) = eBOSC.swa_n2;
    eBOSC_allsub.swa_n3_allsub(s,:,:) = eBOSC.swa_n3;
    eBOSC_allsub.swa_wake_allsub(s,:,:) = eBOSC.swa_wake;

    eBOSC_allsub.spindle_power_rem_allsub(s,:,:) = eBOSC.spindle_power_rem;
    eBOSC_allsub.spindle_power_phasic_allsub(s,:,:) = eBOSC.spindle_power_phasic;
    eBOSC_allsub.spindle_power_tonic_allsub(s,:,:) = eBOSC.spindle_power_tonic;
    eBOSC_allsub.spindle_power_nrem_allsub(s,:,:) = eBOSC.spindle_power_nrem;
    eBOSC_allsub.spindle_power_n1_allsub(s,:,:) = eBOSC.spindle_power_n1;
    eBOSC_allsub.spindle_power_n2_allsub(s,:,:) = eBOSC.spindle_power_n2;
    eBOSC_allsub.spindle_power_n3_allsub(s,:,:) = eBOSC.spindle_power_n3;
    eBOSC_allsub.spindle_power_wake_allsub(s,:,:) = eBOSC.spindle_power_wake;
    
    eBOSC_allsub.IAPF_rem_allsub(s,:,:) = eBOSC.IAPF_rem_all;
    eBOSC_allsub.IAPF_phasic_allsub(s,:,:) = eBOSC.IAPF_phasic_all;
    eBOSC_allsub.IAPF_tonic_allsub(s,:,:) = eBOSC.IAPF_tonic_all;
    eBOSC_allsub.IAPF_nrem_allsub(s,:,:) = eBOSC.IAPF_nrem_all;
    eBOSC_allsub.IAPF_wake_allsub(s,:,:) = eBOSC.IAPF_wake_all;
    
    eBOSC_allsub.ITPF_rem_allsub(s,:,:) = eBOSC.ITPF_rem_all;
    eBOSC_allsub.ITPF_phasic_allsub(s,:,:) = eBOSC.ITPF_phasic_all;
    eBOSC_allsub.ITPF_tonic_allsub(s,:,:) = eBOSC.ITPF_tonic_all;
    eBOSC_allsub.ITPF_nrem_allsub(s,:,:) = eBOSC.ITPF_nrem_all;
    eBOSC_allsub.ITPF_wake_allsub(s,:,:) = eBOSC.ITPF_wake_all;
    
    eBOSC_allsub.ISPF_rem_allsub(s,:,:) = eBOSC.ISPF_rem_all;
    eBOSC_allsub.ISPF_phasic_allsub(s,:,:) = eBOSC.ISPF_phasic_all;
    eBOSC_allsub.ISPF_tonic_allsub(s,:,:) = eBOSC.ISPF_tonic_all;
    eBOSC_allsub.ISPF_nrem_allsub(s,:,:) = eBOSC.ISPF_nrem_all;
    eBOSC_allsub.ISPF_wake_allsub(s,:,:) = eBOSC.ISPF_wake_all;
    
    
    eBOSC_allsub.IAPF_rem_height_allsub(s,:,:) = eBOSC.IAPF_rem_height_all;
    eBOSC_allsub.IAPF_phasic_height_allsub(s,:,:) = eBOSC.IAPF_phasic_height_all;
    eBOSC_allsub.IAPF_tonic_height_allsub(s,:,:) = eBOSC.IAPF_tonic_height_all;
    eBOSC_allsub.IAPF_nrem_height_allsub(s,:,:) = eBOSC.IAPF_nrem_height_all;
    eBOSC_allsub.IAPF_wake_height_allsub(s,:,:) = eBOSC.IAPF_wake_height_all;
    
    eBOSC_allsub.ITPF_rem_height_allsub(s,:,:) = eBOSC.ITPF_rem_height_all;
    eBOSC_allsub.ITPF_phasic_height_allsub(s,:,:) = eBOSC.ITPF_phasic_height_all;
    eBOSC_allsub.ITPF_tonic_height_allsub(s,:,:) = eBOSC.ITPF_tonic_height_all;
    eBOSC_allsub.ITPF_nrem_height_allsub(s,:,:) = eBOSC.ITPF_nrem_height_all;
    eBOSC_allsub.ITPF_wake_height_allsub(s,:,:) = eBOSC.ITPF_wake_height_all;
    
    eBOSC_allsub.ISPF_rem_height_allsub(s,:,:) = eBOSC.ISPF_rem_height_all;
    eBOSC_allsub.ISPF_phasic_height_allsub(s,:,:) = eBOSC.ISPF_phasic_height_all;
    eBOSC_allsub.ISPF_tonic_height_allsub(s,:,:) = eBOSC.ISPF_tonic_height_all;
    eBOSC_allsub.ISPF_nrem_height_allsub(s,:,:) = eBOSC.ISPF_nrem_height_all;
    eBOSC_allsub.ISPF_wake_height_allsub(s,:,:) = eBOSC.ISPF_wake_height_all;
    
    
    eBOSC_allsub.alpha_rem_den_allsub(s,:,:) = eBOSC.alpha_rem_den;
    eBOSC_allsub.alpha_phasic_den_allsub(s,:,:) = eBOSC.alpha_phasic_den;
    eBOSC_allsub.alpha_tonic_den_allsub(s,:,:) = eBOSC.alpha_tonic_den;
    eBOSC_allsub.alpha_nrem_den_allsub(s,:,:) = eBOSC.alpha_nrem_den;
    eBOSC_allsub.alpha_wake_den_allsub(s,:,:) = eBOSC.alpha_wake_den;
    
    eBOSC_allsub.theta_rem_den_allsub(s,:,:) = eBOSC.theta_rem_den;
    eBOSC_allsub.theta_phasic_den_allsub(s,:,:) = eBOSC.theta_phasic_den;
    eBOSC_allsub.theta_tonic_den_allsub(s,:,:) = eBOSC.theta_tonic_den;
    eBOSC_allsub.theta_nrem_den_allsub(s,:,:) = eBOSC.theta_nrem_den;
    eBOSC_allsub.theta_wake_den_allsub(s,:,:) = eBOSC.theta_wake_den;
    
    eBOSC_allsub.spindles_rem_den_allsub(s,:,:) = eBOSC.spindles_rem_den;
    eBOSC_allsub.spindles_phasic_den_allsub(s,:,:) = eBOSC.spindles_phasic_den;
    eBOSC_allsub.spindles_tonic_den_allsub(s,:,:) = eBOSC.spindles_tonic_den;
    eBOSC_allsub.spindles_nrem_den_allsub(s,:,:) = eBOSC.spindles_nrem_den;
    eBOSC_allsub.spindles_wake_den_allsub(s,:,:) = eBOSC.spindles_wake_den;
    
    eBOSC_allsub.alpha_rem_snr_allsub(s,:,:) = eBOSC.alpha_rem_snr;
    eBOSC_allsub.alpha_phasic_snr_allsub(s,:,:) = eBOSC.alpha_phasic_snr;
    eBOSC_allsub.alpha_tonic_snr_allsub(s,:,:) = eBOSC.alpha_tonic_snr;
    eBOSC_allsub.alpha_nrem_snr_allsub(s,:,:) = eBOSC.alpha_nrem_snr;
    eBOSC_allsub.alpha_wake_snr_allsub(s,:,:) = eBOSC.alpha_wake_snr;
    
    eBOSC_allsub.theta_rem_snr_allsub(s,:,:) = eBOSC.theta_rem_snr;
    eBOSC_allsub.theta_phasic_snr_allsub(s,:,:) = eBOSC.theta_phasic_snr;
    eBOSC_allsub.theta_tonic_snr_allsub(s,:,:) = eBOSC.theta_tonic_snr;
    eBOSC_allsub.theta_nrem_snr_allsub(s,:,:) = eBOSC.theta_nrem_snr;
    eBOSC_allsub.theta_wake_snr_allsub(s,:,:) = eBOSC.theta_wake_snr;
    
    eBOSC_allsub.spindles_rem_snr_allsub(s,:,:) = eBOSC.spindles_rem_snr;
    eBOSC_allsub.spindles_phasic_snr_allsub(s,:,:) = eBOSC.spindles_phasic_snr;
    eBOSC_allsub.spindles_tonic_snr_allsub(s,:,:) = eBOSC.spindles_tonic_snr;
    eBOSC_allsub.spindles_nrem_snr_allsub(s,:,:) = eBOSC.spindles_nrem_snr;
    eBOSC_allsub.spindles_wake_snr_allsub(s,:,:) = eBOSC.spindles_wake_snr;
    
    eBOSC_allsub.alpha_rem_amp_allsub(s,:,:) = eBOSC.alpha_rem_amp;
    eBOSC_allsub.alpha_phasic_amp_allsub(s,:,:) = eBOSC.alpha_phasic_amp;
    eBOSC_allsub.alpha_tonic_amp_allsub(s,:,:) = eBOSC.alpha_tonic_amp;
    eBOSC_allsub.alpha_nrem_amp_allsub(s,:,:) = eBOSC.alpha_nrem_amp;
    eBOSC_allsub.alpha_wake_amp_allsub(s,:,:) = eBOSC.alpha_wake_amp;
    
    eBOSC_allsub.theta_rem_amp_allsub(s,:,:) = eBOSC.theta_rem_amp;
    eBOSC_allsub.theta_phasic_amp_allsub(s,:,:) = eBOSC.theta_phasic_amp;
    eBOSC_allsub.theta_tonic_amp_allsub(s,:,:) = eBOSC.theta_tonic_amp;
    eBOSC_allsub.theta_nrem_amp_allsub(s,:,:) = eBOSC.theta_nrem_amp;
    eBOSC_allsub.theta_wake_amp_allsub(s,:,:) = eBOSC.theta_wake_amp;
    
    eBOSC_allsub.spindles_rem_amp_allsub(s,:,:) = eBOSC.spindles_rem_amp;
    eBOSC_allsub.spindles_phasic_amp_allsub(s,:,:) = eBOSC.spindles_phasic_amp;
    eBOSC_allsub.spindles_tonic_amp_allsub(s,:,:) = eBOSC.spindles_tonic_amp;
    eBOSC_allsub.spindles_nrem_amp_allsub(s,:,:) = eBOSC.spindles_nrem_amp;
    eBOSC_allsub.spindles_wake_amp_allsub(s,:,:) = eBOSC.spindles_wake_amp;
    
    eBOSC_allsub.alpha_rem_abu_allsub(s,:,:) = eBOSC.alpha_rem_abu;
    eBOSC_allsub.alpha_phasic_abu_allsub(s,:,:) = eBOSC.alpha_phasic_abu;
    eBOSC_allsub.alpha_tonic_abu_allsub(s,:,:) = eBOSC.alpha_tonic_abu;
    eBOSC_allsub.alpha_nrem_abu_allsub(s,:,:) = eBOSC.alpha_nrem_abu;
    eBOSC_allsub.alpha_wake_abu_allsub(s,:,:) = eBOSC.alpha_wake_abu;
    
    eBOSC_allsub.theta_rem_abu_allsub(s,:,:) = eBOSC.theta_rem_abu;
    eBOSC_allsub.theta_phasic_abu_allsub(s,:,:) = eBOSC.theta_phasic_abu;
    eBOSC_allsub.theta_tonic_abu_allsub(s,:,:) = eBOSC.theta_tonic_abu;
    eBOSC_allsub.theta_nrem_abu_allsub(s,:,:) = eBOSC.theta_nrem_abu;
    eBOSC_allsub.theta_wake_abu_allsub(s,:,:) = eBOSC.theta_wake_abu;
    
    eBOSC_allsub.spindles_rem_abu_allsub(s,:,:) = eBOSC.spindles_rem_abu;
    eBOSC_allsub.spindles_phasic_abu_allsub(s,:,:) = eBOSC.spindles_phasic_abu;
    eBOSC_allsub.spindles_tonic_abu_allsub(s,:,:) = eBOSC.spindles_tonic_abu;
    eBOSC_allsub.spindles_nrem_abu_allsub(s,:,:) = eBOSC.spindles_nrem_abu;
    eBOSC_allsub.spindles_wake_abu_allsub(s,:,:) = eBOSC.spindles_wake_abu;
    
    eBOSC_allsub.h_values_rem_allsub(s,:,:,:) = eBOSC.h_values_rem;
    eBOSC_allsub.h_values_phasic_allsub(s,:,:,:) = eBOSC.h_values_phasic;
    eBOSC_allsub.h_values_tonic_allsub(s,:,:,:) = eBOSC.h_values_tonic;
    eBOSC_allsub.h_values_nrem_allsub(s,:,:,:) = eBOSC.h_values_nrem;
    eBOSC_allsub.h_values_wake_allsub(s,:,:,:) = eBOSC.h_values_wake; 
    
    eBOSC_allsub.h_bin_edges_rem_allsub(s,:,:,:) = eBOSC.h_bin_edges_rem;
    eBOSC_allsub.h_bin_edges_phasic_allsub(s,:,:,:) = eBOSC.h_bin_edges_phasic;
    eBOSC_allsub.h_bin_edges_tonic_allsub(s,:,:,:) = eBOSC.h_bin_edges_tonic;
    eBOSC_allsub.h_bin_edges_nrem_allsub(s,:,:,:) = eBOSC.h_bin_edges_nrem;
    eBOSC_allsub.h_bin_edges_wake_allsub(s,:,:,:) = eBOSC.h_bin_edges_wake; 

    clear eBOSC
end

%%

save([Savefolder,filesep,'eBOSC_allsub_',date,'.mat'],'eBOSC_allsub');

