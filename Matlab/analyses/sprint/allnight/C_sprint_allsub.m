%%
clear all;
close all;

Folderpath = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub_peakfitwaves/';
dir_Folderpath = dir([Folderpath,filesep,'AFOSR*']);

% Folderpath_power = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub/swa_spindles_power/';
% dir_Folderpath_power = dir([Folderpath_power,filesep,'AFOSR*']);

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub_peakfitwaves/allsub/';

addpath(genpath('/users/nemo/software/Henry/useful_functions'));

%%

for s = 1:length(dir_Folderpath)
    
    display(['Sub = ',num2str(s)]);
    load([Folderpath,filesep,dir_Folderpath(s).name]);
    
%     load([Folderpath_power,filesep,dir_Folderpath_power(s).name]);
      
    sprint_allsub.exponent_1_30_rem_allsub(s,:,:) = sprint.exponent_1_30_rem;
    sprint_allsub.exponent_1_30_phasic_allsub(s,:,:) = sprint.exponent_1_30_phasic;
    sprint_allsub.exponent_1_30_tonic_allsub(s,:,:) = sprint.exponent_1_30_tonic;
    sprint_allsub.exponent_1_30_nrem_allsub(s,:,:) = sprint.exponent_1_30_nrem;
    sprint_allsub.exponent_1_30_n1_allsub(s,:,:) = sprint.exponent_1_30_n1;
    sprint_allsub.exponent_1_30_n2_allsub(s,:,:) = sprint.exponent_1_30_n2;
    sprint_allsub.exponent_1_30_n3_allsub(s,:,:) = sprint.exponent_1_30_n3;
    sprint_allsub.exponent_1_30_wake_allsub(s,:,:) = sprint.exponent_1_30_wake;   
    
    sprint_allsub.exponent_30_45_rem_allsub(s,:,:) = sprint.exponent_30_45_rem;
    sprint_allsub.exponent_30_45_phasic_allsub(s,:,:) = sprint.exponent_30_45_phasic;
    sprint_allsub.exponent_30_45_tonic_allsub(s,:,:) = sprint.exponent_30_45_tonic;
    sprint_allsub.exponent_30_45_nrem_allsub(s,:,:) = sprint.exponent_30_45_nrem;
    sprint_allsub.exponent_30_45_n1_allsub(s,:,:) = sprint.exponent_30_45_n1;
    sprint_allsub.exponent_30_45_n2_allsub(s,:,:) = sprint.exponent_30_45_n2;
    sprint_allsub.exponent_30_45_n3_allsub(s,:,:) = sprint.exponent_30_45_n3;
    sprint_allsub.exponent_30_45_wake_allsub(s,:,:) = sprint.exponent_30_45_wake;

    sprint_allsub.exponent_1_45_rem_allsub(s,:,:) = sprint.exponent_1_45_rem;
    sprint_allsub.exponent_1_45_phasic_allsub(s,:,:) = sprint.exponent_1_45_phasic;
    sprint_allsub.exponent_1_45_tonic_allsub(s,:,:) = sprint.exponent_1_45_tonic;
    sprint_allsub.exponent_1_45_nrem_allsub(s,:,:) = sprint.exponent_1_45_nrem;
    sprint_allsub.exponent_1_45_n1_allsub(s,:,:) = sprint.exponent_1_45_n1;
    sprint_allsub.exponent_1_45_n2_allsub(s,:,:) = sprint.exponent_1_45_n2;
    sprint_allsub.exponent_1_45_n3_allsub(s,:,:) = sprint.exponent_1_45_n3;
    sprint_allsub.exponent_1_45_wake_allsub(s,:,:) = sprint.exponent_1_45_wake;  
    
    
    sprint_allsub.offset_1_30_rem_allsub(s,:,:) = sprint.offset_1_30_rem;
    sprint_allsub.offset_1_30_phasic_allsub(s,:,:) = sprint.offset_1_30_phasic;
    sprint_allsub.offset_1_30_tonic_allsub(s,:,:) = sprint.offset_1_30_tonic;
    sprint_allsub.offset_1_30_nrem_allsub(s,:,:) = sprint.offset_1_30_nrem;
    sprint_allsub.offset_1_30_n1_allsub(s,:,:) = sprint.offset_1_30_n1;
    sprint_allsub.offset_1_30_n2_allsub(s,:,:) = sprint.offset_1_30_n2;
    sprint_allsub.offset_1_30_n3_allsub(s,:,:) = sprint.offset_1_30_n3;
    sprint_allsub.offset_1_30_wake_allsub(s,:,:) = sprint.offset_1_30_wake;   
    
    sprint_allsub.offset_30_45_rem_allsub(s,:,:) = sprint.offset_30_45_rem;
    sprint_allsub.offset_30_45_phasic_allsub(s,:,:) = sprint.offset_30_45_phasic;
    sprint_allsub.offset_30_45_tonic_allsub(s,:,:) = sprint.offset_30_45_tonic;
    sprint_allsub.offset_30_45_nrem_allsub(s,:,:) = sprint.offset_30_45_nrem;
    sprint_allsub.offset_30_45_n1_allsub(s,:,:) = sprint.offset_30_45_n1;
    sprint_allsub.offset_30_45_n2_allsub(s,:,:) = sprint.offset_30_45_n2;
    sprint_allsub.offset_30_45_n3_allsub(s,:,:) = sprint.offset_30_45_n3;
    sprint_allsub.offset_30_45_wake_allsub(s,:,:) = sprint.offset_30_45_wake;

    sprint_allsub.offset_1_45_rem_allsub(s,:,:) = sprint.offset_1_45_rem;
    sprint_allsub.offset_1_45_phasic_allsub(s,:,:) = sprint.offset_1_45_phasic;
    sprint_allsub.offset_1_45_tonic_allsub(s,:,:) = sprint.offset_1_45_tonic;
    sprint_allsub.offset_1_45_nrem_allsub(s,:,:) = sprint.offset_1_45_nrem;
    sprint_allsub.offset_1_45_n1_allsub(s,:,:) = sprint.offset_1_45_n1;
    sprint_allsub.offset_1_45_n2_allsub(s,:,:) = sprint.offset_1_45_n2;
    sprint_allsub.offset_1_45_n3_allsub(s,:,:) = sprint.offset_1_45_n3;
    sprint_allsub.offset_1_45_wake_allsub(s,:,:) = sprint.offset_1_45_wake; 
    
    
    
    sprint_allsub.power_spectrum_1_30_rem_allsub(s,:,:,:) = sprint.power_spectrum_1_30_rem;
    sprint_allsub.power_spectrum_1_30_phasic_allsub(s,:,:,:) = sprint.power_spectrum_1_30_phasic;
    sprint_allsub.power_spectrum_1_30_tonic_allsub(s,:,:,:) = sprint.power_spectrum_1_30_tonic;
    sprint_allsub.power_spectrum_1_30_nrem_allsub(s,:,:,:) = sprint.power_spectrum_1_30_nrem;
    sprint_allsub.power_spectrum_1_30_n1_allsub(s,:,:,:) = sprint.power_spectrum_1_30_n1;
    sprint_allsub.power_spectrum_1_30_n2_allsub(s,:,:,:) = sprint.power_spectrum_1_30_n2;
    sprint_allsub.power_spectrum_1_30_n3_allsub(s,:,:,:) = sprint.power_spectrum_1_30_n3;
    sprint_allsub.power_spectrum_1_30_wake_allsub(s,:,:,:) = sprint.power_spectrum_1_30_wake;   
    
    sprint_allsub.power_spectrum_30_45_rem_allsub(s,:,:,:) = sprint.power_spectrum_30_45_rem;
    sprint_allsub.power_spectrum_30_45_phasic_allsub(s,:,:,:) = sprint.power_spectrum_30_45_phasic;
    sprint_allsub.power_spectrum_30_45_tonic_allsub(s,:,:,:) = sprint.power_spectrum_30_45_tonic;
    sprint_allsub.power_spectrum_30_45_nrem_allsub(s,:,:,:) = sprint.power_spectrum_30_45_nrem;
    sprint_allsub.power_spectrum_30_45_n1_allsub(s,:,:,:) = sprint.power_spectrum_30_45_n1;
    sprint_allsub.power_spectrum_30_45_n2_allsub(s,:,:,:) = sprint.power_spectrum_30_45_n2;
    sprint_allsub.power_spectrum_30_45_n3_allsub(s,:,:,:) = sprint.power_spectrum_30_45_n3;
    sprint_allsub.power_spectrum_30_45_wake_allsub(s,:,:,:) = sprint.power_spectrum_30_45_wake;

    sprint_allsub.power_spectrum_1_45_rem_allsub(s,:,:,:) = sprint.power_spectrum_1_45_rem;
    sprint_allsub.power_spectrum_1_45_phasic_allsub(s,:,:,:) = sprint.power_spectrum_1_45_phasic;
    sprint_allsub.power_spectrum_1_45_tonic_allsub(s,:,:,:) = sprint.power_spectrum_1_45_tonic;
    sprint_allsub.power_spectrum_1_45_nrem_allsub(s,:,:,:) = sprint.power_spectrum_1_45_nrem;
    sprint_allsub.power_spectrum_1_45_n1_allsub(s,:,:,:) = sprint.power_spectrum_1_45_n1;
    sprint_allsub.power_spectrum_1_45_n2_allsub(s,:,:,:) = sprint.power_spectrum_1_45_n2;
    sprint_allsub.power_spectrum_1_45_n3_allsub(s,:,:,:) = sprint.power_spectrum_1_45_n3;
    sprint_allsub.power_spectrum_1_45_wake_allsub(s,:,:,:) = sprint.power_spectrum_1_45_wake; 
    
    
    sprint_allsub.ap_fit_1_30_rem_allsub(s,:,:,:) = sprint.ap_fit_1_30_rem;
    sprint_allsub.ap_fit_1_30_phasic_allsub(s,:,:,:) = sprint.ap_fit_1_30_phasic;
    sprint_allsub.ap_fit_1_30_tonic_allsub(s,:,:,:) = sprint.ap_fit_1_30_tonic;
    sprint_allsub.ap_fit_1_30_nrem_allsub(s,:,:,:) = sprint.ap_fit_1_30_nrem;
    sprint_allsub.ap_fit_1_30_n1_allsub(s,:,:,:) = sprint.ap_fit_1_30_n1;
    sprint_allsub.ap_fit_1_30_n2_allsub(s,:,:,:) = sprint.ap_fit_1_30_n2;
    sprint_allsub.ap_fit_1_30_n3_allsub(s,:,:,:) = sprint.ap_fit_1_30_n3;
    sprint_allsub.ap_fit_1_30_wake_allsub(s,:,:,:) = sprint.ap_fit_1_30_wake;   
    
    sprint_allsub.ap_fit_30_45_rem_allsub(s,:,:,:) = sprint.ap_fit_30_45_rem;
    sprint_allsub.ap_fit_30_45_phasic_allsub(s,:,:,:) = sprint.ap_fit_30_45_phasic;
    sprint_allsub.ap_fit_30_45_tonic_allsub(s,:,:,:) = sprint.ap_fit_30_45_tonic;
    sprint_allsub.ap_fit_30_45_nrem_allsub(s,:,:,:) = sprint.ap_fit_30_45_nrem;
    sprint_allsub.ap_fit_30_45_n1_allsub(s,:,:,:) = sprint.ap_fit_30_45_n1;
    sprint_allsub.ap_fit_30_45_n2_allsub(s,:,:,:) = sprint.ap_fit_30_45_n2;
    sprint_allsub.ap_fit_30_45_n3_allsub(s,:,:,:) = sprint.ap_fit_30_45_n3;
    sprint_allsub.ap_fit_30_45_wake_allsub(s,:,:,:) = sprint.ap_fit_30_45_wake;

    sprint_allsub.ap_fit_1_45_rem_allsub(s,:,:,:) = sprint.ap_fit_1_45_rem;
    sprint_allsub.ap_fit_1_45_phasic_allsub(s,:,:,:) = sprint.ap_fit_1_45_phasic;
    sprint_allsub.ap_fit_1_45_tonic_allsub(s,:,:,:) = sprint.ap_fit_1_45_tonic;
    sprint_allsub.ap_fit_1_45_nrem_allsub(s,:,:,:) = sprint.ap_fit_1_45_nrem;
    sprint_allsub.ap_fit_1_45_n1_allsub(s,:,:,:) = sprint.ap_fit_1_45_n1;
    sprint_allsub.ap_fit_1_45_n2_allsub(s,:,:,:) = sprint.ap_fit_1_45_n2;
    sprint_allsub.ap_fit_1_45_n3_allsub(s,:,:,:) = sprint.ap_fit_1_45_n3;
    sprint_allsub.ap_fit_1_45_wake_allsub(s,:,:,:) = sprint.ap_fit_1_45_wake; 
    
    
    
    sprint_allsub.peak_fit_1_30_rem_allsub(s,:,:,:) = sprint.peak_fit_1_30_rem;
    sprint_allsub.peak_fit_1_30_phasic_allsub(s,:,:,:) = sprint.peak_fit_1_30_phasic;
    sprint_allsub.peak_fit_1_30_tonic_allsub(s,:,:,:) = sprint.peak_fit_1_30_tonic;
    sprint_allsub.peak_fit_1_30_nrem_allsub(s,:,:,:) = sprint.peak_fit_1_30_nrem;
    sprint_allsub.peak_fit_1_30_n1_allsub(s,:,:,:) = sprint.peak_fit_1_30_n1;
    sprint_allsub.peak_fit_1_30_n2_allsub(s,:,:,:) = sprint.peak_fit_1_30_n2;
    sprint_allsub.peak_fit_1_30_n3_allsub(s,:,:,:) = sprint.peak_fit_1_30_n3;
    sprint_allsub.peak_fit_1_30_wake_allsub(s,:,:,:) = sprint.peak_fit_1_30_wake;   
    
    sprint_allsub.peak_fit_30_45_rem_allsub(s,:,:,:) = sprint.peak_fit_30_45_rem;
    sprint_allsub.peak_fit_30_45_phasic_allsub(s,:,:,:) = sprint.peak_fit_30_45_phasic;
    sprint_allsub.peak_fit_30_45_tonic_allsub(s,:,:,:) = sprint.peak_fit_30_45_tonic;
    sprint_allsub.peak_fit_30_45_nrem_allsub(s,:,:,:) = sprint.peak_fit_30_45_nrem;
    sprint_allsub.peak_fit_30_45_n1_allsub(s,:,:,:) = sprint.peak_fit_30_45_n1;
    sprint_allsub.peak_fit_30_45_n2_allsub(s,:,:,:) = sprint.peak_fit_30_45_n2;
    sprint_allsub.peak_fit_30_45_n3_allsub(s,:,:,:) = sprint.peak_fit_30_45_n3;
    sprint_allsub.peak_fit_30_45_wake_allsub(s,:,:,:) = sprint.peak_fit_30_45_wake;

    sprint_allsub.peak_fit_1_45_rem_allsub(s,:,:,:) = sprint.peak_fit_1_45_rem;
    sprint_allsub.peak_fit_1_45_phasic_allsub(s,:,:,:) = sprint.peak_fit_1_45_phasic;
    sprint_allsub.peak_fit_1_45_tonic_allsub(s,:,:,:) = sprint.peak_fit_1_45_tonic;
    sprint_allsub.peak_fit_1_45_nrem_allsub(s,:,:,:) = sprint.peak_fit_1_45_nrem;
    sprint_allsub.peak_fit_1_45_n1_allsub(s,:,:,:) = sprint.peak_fit_1_45_n1;
    sprint_allsub.peak_fit_1_45_n2_allsub(s,:,:,:) = sprint.peak_fit_1_45_n2;
    sprint_allsub.peak_fit_1_45_n3_allsub(s,:,:,:) = sprint.peak_fit_1_45_n3;
    sprint_allsub.peak_fit_1_45_wake_allsub(s,:,:,:) = sprint.peak_fit_1_45_wake; 
    
    sprint_allsub.peak_fit_1_30_phasic_alphawaves(s,:,:,:) = sprint.peak_fit_1_30_phasic_alphawaves;
    sprint_allsub.peak_fit_1_30_phasic_thetawaves(s,:,:,:) = sprint.peak_fit_1_30_phasic_thetawaves;
    sprint_allsub.peak_fit_1_30_tonic_alphawaves(s,:,:,:) = sprint.peak_fit_1_30_tonic_alphawaves;
    sprint_allsub.peak_fit_1_30_tonic_thetawaves(s,:,:,:) = sprint.peak_fit_1_30_tonic_thetawaves;
    
    sprint_allsub.foofed_spectrum_1_30_rem_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_rem;
    sprint_allsub.foofed_spectrum_1_30_phasic_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_phasic;
    sprint_allsub.foofed_spectrum_1_30_tonic_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_tonic;
    sprint_allsub.foofed_spectrum_1_30_nrem_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_nrem;
    sprint_allsub.foofed_spectrum_1_30_n1_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_n1;
    sprint_allsub.foofed_spectrum_1_30_n2_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_n2;
    sprint_allsub.foofed_spectrum_1_30_n3_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_n3;
    sprint_allsub.foofed_spectrum_1_30_wake_allsub(s,:,:,:) = sprint.foofed_spectrum_1_30_wake;   
    
    sprint_allsub.foofed_spectrum_30_45_rem_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_rem;
    sprint_allsub.foofed_spectrum_30_45_phasic_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_phasic;
    sprint_allsub.foofed_spectrum_30_45_tonic_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_tonic;
    sprint_allsub.foofed_spectrum_30_45_nrem_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_nrem;
    sprint_allsub.foofed_spectrum_30_45_n1_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_n1;
    sprint_allsub.foofed_spectrum_30_45_n2_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_n2;
    sprint_allsub.foofed_spectrum_30_45_n3_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_n3;
    sprint_allsub.foofed_spectrum_30_45_wake_allsub(s,:,:,:) = sprint.foofed_spectrum_30_45_wake;

    sprint_allsub.foofed_spectrum_1_45_rem_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_rem;
    sprint_allsub.foofed_spectrum_1_45_phasic_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_phasic;
    sprint_allsub.foofed_spectrum_1_45_tonic_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_tonic;
    sprint_allsub.foofed_spectrum_1_45_nrem_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_nrem;
    sprint_allsub.foofed_spectrum_1_45_n1_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_n1;
    sprint_allsub.foofed_spectrum_1_45_n2_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_n2;
    sprint_allsub.foofed_spectrum_1_45_n3_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_n3;
    sprint_allsub.foofed_spectrum_1_45_wake_allsub(s,:,:,:) = sprint.foofed_spectrum_1_45_wake; 
      
    
    
    sprint_allsub.log_power_spectrum_1_30_rem_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_rem;
    sprint_allsub.log_power_spectrum_1_30_phasic_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_phasic;
    sprint_allsub.log_power_spectrum_1_30_tonic_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_tonic;
    sprint_allsub.log_power_spectrum_1_30_nrem_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_nrem;
    sprint_allsub.log_power_spectrum_1_30_n1_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_n1;
    sprint_allsub.log_power_spectrum_1_30_n2_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_n2;
    sprint_allsub.log_power_spectrum_1_30_n3_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_n3;
    sprint_allsub.log_power_spectrum_1_30_wake_allsub(s,:,:,:) = sprint.log_power_spectrum_1_30_wake;   
    
    sprint_allsub.log_power_spectrum_30_45_rem_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_rem;
    sprint_allsub.log_power_spectrum_30_45_phasic_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_phasic;
    sprint_allsub.log_power_spectrum_30_45_tonic_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_tonic;
    sprint_allsub.log_power_spectrum_30_45_nrem_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_nrem;
    sprint_allsub.log_power_spectrum_30_45_n1_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_n1;
    sprint_allsub.log_power_spectrum_30_45_n2_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_n2;
    sprint_allsub.log_power_spectrum_30_45_n3_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_n3;
    sprint_allsub.log_power_spectrum_30_45_wake_allsub(s,:,:,:) = sprint.log_power_spectrum_30_45_wake;

    sprint_allsub.log_power_spectrum_1_45_rem_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_rem;
    sprint_allsub.log_power_spectrum_1_45_phasic_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_phasic;
    sprint_allsub.log_power_spectrum_1_45_tonic_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_tonic;
    sprint_allsub.log_power_spectrum_1_45_nrem_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_nrem;
    sprint_allsub.log_power_spectrum_1_45_n1_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_n1;
    sprint_allsub.log_power_spectrum_1_45_n2_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_n2;
    sprint_allsub.log_power_spectrum_1_45_n3_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_n3;
    sprint_allsub.log_power_spectrum_1_45_wake_allsub(s,:,:,:) = sprint.log_power_spectrum_1_45_wake; 
    
    
    sprint_allsub.log_ap_fit_1_30_rem_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_rem;
    sprint_allsub.log_ap_fit_1_30_phasic_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_phasic;
    sprint_allsub.log_ap_fit_1_30_tonic_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_tonic;
    sprint_allsub.log_ap_fit_1_30_nrem_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_nrem;
    sprint_allsub.log_ap_fit_1_30_n1_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_n1;
    sprint_allsub.log_ap_fit_1_30_n2_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_n2;
    sprint_allsub.log_ap_fit_1_30_n3_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_n3;
    sprint_allsub.log_ap_fit_1_30_wake_allsub(s,:,:,:) = sprint.log_ap_fit_1_30_wake;   
    
    sprint_allsub.log_ap_fit_30_45_rem_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_rem;
    sprint_allsub.log_ap_fit_30_45_phasic_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_phasic;
    sprint_allsub.log_ap_fit_30_45_tonic_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_tonic;
    sprint_allsub.log_ap_fit_30_45_nrem_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_nrem;
    sprint_allsub.log_ap_fit_30_45_n1_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_n1;
    sprint_allsub.log_ap_fit_30_45_n2_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_n2;
    sprint_allsub.log_ap_fit_30_45_n3_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_n3;
    sprint_allsub.log_ap_fit_30_45_wake_allsub(s,:,:,:) = sprint.log_ap_fit_30_45_wake;

    sprint_allsub.log_ap_fit_1_45_rem_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_rem;
    sprint_allsub.log_ap_fit_1_45_phasic_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_phasic;
    sprint_allsub.log_ap_fit_1_45_tonic_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_tonic;
    sprint_allsub.log_ap_fit_1_45_nrem_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_nrem;
    sprint_allsub.log_ap_fit_1_45_n1_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_n1;
    sprint_allsub.log_ap_fit_1_45_n2_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_n2;
    sprint_allsub.log_ap_fit_1_45_n3_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_n3;
    sprint_allsub.log_ap_fit_1_45_wake_allsub(s,:,:,:) = sprint.log_ap_fit_1_45_wake; 
    
    
    
    sprint_allsub.log_peak_fit_1_30_rem_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_rem;
    sprint_allsub.log_peak_fit_1_30_phasic_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_phasic;
    sprint_allsub.log_peak_fit_1_30_tonic_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_tonic;
    sprint_allsub.log_peak_fit_1_30_nrem_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_nrem;
    sprint_allsub.log_peak_fit_1_30_n1_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_n1;
    sprint_allsub.log_peak_fit_1_30_n2_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_n2;
    sprint_allsub.log_peak_fit_1_30_n3_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_n3;
    sprint_allsub.log_peak_fit_1_30_wake_allsub(s,:,:,:) = sprint.log_peak_fit_1_30_wake;   
    
    sprint_allsub.log_peak_fit_30_45_rem_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_rem;
    sprint_allsub.log_peak_fit_30_45_phasic_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_phasic;
    sprint_allsub.log_peak_fit_30_45_tonic_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_tonic;
    sprint_allsub.log_peak_fit_30_45_nrem_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_nrem;
    sprint_allsub.log_peak_fit_30_45_n1_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_n1;
    sprint_allsub.log_peak_fit_30_45_n2_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_n2;
    sprint_allsub.log_peak_fit_30_45_n3_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_n3;
    sprint_allsub.log_peak_fit_30_45_wake_allsub(s,:,:,:) = sprint.log_peak_fit_30_45_wake;

    sprint_allsub.log_peak_fit_1_45_rem_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_rem;
    sprint_allsub.log_peak_fit_1_45_phasic_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_phasic;
    sprint_allsub.log_peak_fit_1_45_tonic_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_tonic;
    sprint_allsub.log_peak_fit_1_45_nrem_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_nrem;
    sprint_allsub.log_peak_fit_1_45_n1_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_n1;
    sprint_allsub.log_peak_fit_1_45_n2_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_n2;
    sprint_allsub.log_peak_fit_1_45_n3_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_n3;
    sprint_allsub.log_peak_fit_1_45_wake_allsub(s,:,:,:) = sprint.log_peak_fit_1_45_wake; 
    
    
    sprint_allsub.log_foofed_spectrum_1_30_rem_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_rem;
    sprint_allsub.log_foofed_spectrum_1_30_phasic_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_phasic;
    sprint_allsub.log_foofed_spectrum_1_30_tonic_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_tonic;
    sprint_allsub.log_foofed_spectrum_1_30_nrem_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_nrem;
    sprint_allsub.log_foofed_spectrum_1_30_n1_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_n1;
    sprint_allsub.log_foofed_spectrum_1_30_n2_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_n2;
    sprint_allsub.log_foofed_spectrum_1_30_n3_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_n3;
    sprint_allsub.log_foofed_spectrum_1_30_wake_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_30_wake;   
    
    sprint_allsub.log_foofed_spectrum_30_45_rem_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_rem;
    sprint_allsub.log_foofed_spectrum_30_45_phasic_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_phasic;
    sprint_allsub.log_foofed_spectrum_30_45_tonic_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_tonic;
    sprint_allsub.log_foofed_spectrum_30_45_nrem_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_nrem;
    sprint_allsub.log_foofed_spectrum_30_45_n1_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_n1;
    sprint_allsub.log_foofed_spectrum_30_45_n2_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_n2;
    sprint_allsub.log_foofed_spectrum_30_45_n3_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_n3;
    sprint_allsub.log_foofed_spectrum_30_45_wake_allsub(s,:,:,:) = sprint.log_foofed_spectrum_30_45_wake;

    sprint_allsub.log_foofed_spectrum_1_45_rem_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_rem;
    sprint_allsub.log_foofed_spectrum_1_45_phasic_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_phasic;
    sprint_allsub.log_foofed_spectrum_1_45_tonic_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_tonic;
    sprint_allsub.log_foofed_spectrum_1_45_nrem_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_nrem;
    sprint_allsub.log_foofed_spectrum_1_45_n1_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_n1;
    sprint_allsub.log_foofed_spectrum_1_45_n2_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_n2;
    sprint_allsub.log_foofed_spectrum_1_45_n3_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_n3;
    sprint_allsub.log_foofed_spectrum_1_45_wake_allsub(s,:,:,:) = sprint.log_foofed_spectrum_1_45_wake; 
    
    sprint_allsub.r_squared_1_30_rem_allsub(s,:,:) = sprint.r_squared_1_30_rem;
    sprint_allsub.r_squared_1_30_phasic_allsub(s,:,:) = sprint.r_squared_1_30_phasic;
    sprint_allsub.r_squared_1_30_tonic_allsub(s,:,:) = sprint.r_squared_1_30_tonic;
    sprint_allsub.r_squared_1_30_nrem_allsub(s,:,:) = sprint.r_squared_1_30_nrem;
    sprint_allsub.r_squared_1_30_n1_allsub(s,:,:) = sprint.r_squared_1_30_n1;
    sprint_allsub.r_squared_1_30_n2_allsub(s,:,:) = sprint.r_squared_1_30_n2;
    sprint_allsub.r_squared_1_30_n3_allsub(s,:,:) = sprint.r_squared_1_30_n3;
    sprint_allsub.r_squared_1_30_wake_allsub(s,:,:) = sprint.r_squared_1_30_wake;
    
    sprint_allsub.r_squared_30_45_rem_allsub(s,:,:) = sprint.r_squared_30_45_rem;
    sprint_allsub.r_squared_30_45_phasic_allsub(s,:,:) = sprint.r_squared_30_45_phasic;
    sprint_allsub.r_squared_30_45_tonic_allsub(s,:,:) = sprint.r_squared_30_45_tonic;
    sprint_allsub.r_squared_30_45_nrem_allsub(s,:,:) = sprint.r_squared_30_45_nrem;
    sprint_allsub.r_squared_30_45_n1_allsub(s,:,:) = sprint.r_squared_30_45_n1;
    sprint_allsub.r_squared_30_45_n2_allsub(s,:,:) = sprint.r_squared_30_45_n2;
    sprint_allsub.r_squared_30_45_n3_allsub(s,:,:) = sprint.r_squared_30_45_n3;
    sprint_allsub.r_squared_30_45_wake_allsub(s,:,:) = sprint.r_squared_30_45_wake;
        
    sprint_allsub.r_squared_1_45_rem_allsub(s,:,:) = sprint.r_squared_1_45_rem;
    sprint_allsub.r_squared_1_45_phasic_allsub(s,:,:) = sprint.r_squared_1_45_phasic;
    sprint_allsub.r_squared_1_45_tonic_allsub(s,:,:) = sprint.r_squared_1_45_tonic;
    sprint_allsub.r_squared_1_45_nrem_allsub(s,:,:) = sprint.r_squared_1_45_nrem;
    sprint_allsub.r_squared_1_45_n1_allsub(s,:,:) = sprint.r_squared_1_45_n1;
    sprint_allsub.r_squared_1_45_n2_allsub(s,:,:) = sprint.r_squared_1_45_n2;
    sprint_allsub.r_squared_1_45_n3_allsub(s,:,:) = sprint.r_squared_1_45_n3;
    sprint_allsub.r_squared_1_45_wake_allsub(s,:,:) = sprint.r_squared_1_45_wake;
    

    sprint_allsub.error_1_30_rem_allsub(s,:,:) = sprint.error_1_30_rem;
    sprint_allsub.error_1_30_phasic_allsub(s,:,:) = sprint.error_1_30_phasic;
    sprint_allsub.error_1_30_tonic_allsub(s,:,:) = sprint.error_1_30_tonic;
    sprint_allsub.error_1_30_nrem_allsub(s,:,:) = sprint.error_1_30_nrem;
    sprint_allsub.error_1_30_n1_allsub(s,:,:) = sprint.error_1_30_n1;
    sprint_allsub.error_1_30_n2_allsub(s,:,:) = sprint.error_1_30_n2;
    sprint_allsub.error_1_30_n3_allsub(s,:,:) = sprint.error_1_30_n3;
    sprint_allsub.error_1_30_wake_allsub(s,:,:) = sprint.error_1_30_wake;
    
    sprint_allsub.error_30_45_rem_allsub(s,:,:) = sprint.error_30_45_rem;
    sprint_allsub.error_30_45_phasic_allsub(s,:,:) = sprint.error_30_45_phasic;
    sprint_allsub.error_30_45_tonic_allsub(s,:,:) = sprint.error_30_45_tonic;
    sprint_allsub.error_30_45_nrem_allsub(s,:,:) = sprint.error_30_45_nrem;
    sprint_allsub.error_30_45_n1_allsub(s,:,:) = sprint.error_30_45_n1;
    sprint_allsub.error_30_45_n2_allsub(s,:,:) = sprint.error_30_45_n2;
    sprint_allsub.error_30_45_n3_allsub(s,:,:) = sprint.error_30_45_n3;
    sprint_allsub.error_30_45_wake_allsub(s,:,:) = sprint.error_30_45_wake;
    
    sprint_allsub.error_1_45_rem_allsub(s,:,:) = sprint.error_1_45_rem;
    sprint_allsub.error_1_45_phasic_allsub(s,:,:) = sprint.error_1_45_phasic;
    sprint_allsub.error_1_45_tonic_allsub(s,:,:) = sprint.error_1_45_tonic;
    sprint_allsub.error_1_45_nrem_allsub(s,:,:) = sprint.error_1_45_nrem;
    sprint_allsub.error_1_45_n1_allsub(s,:,:) = sprint.error_1_45_n1;
    sprint_allsub.error_1_45_n2_allsub(s,:,:) = sprint.error_1_45_n2;
    sprint_allsub.error_1_45_n3_allsub(s,:,:) = sprint.error_1_45_n3;
    sprint_allsub.error_1_45_wake_allsub(s,:,:) = sprint.error_1_45_wake;  
    
    sprint_allsub.swa_rem_allsub(s,:,:) = sprint.swa_rem;
    sprint_allsub.swa_phasic_allsub(s,:,:) = sprint.swa_phasic;
    sprint_allsub.swa_tonic_allsub(s,:,:) = sprint.swa_tonic;
    sprint_allsub.swa_nrem_allsub(s,:,:) = sprint.swa_nrem;
    sprint_allsub.swa_n1_allsub(s,:,:) = sprint.swa_n1;
    sprint_allsub.swa_n2_allsub(s,:,:) = sprint.swa_n2;
    sprint_allsub.swa_n3_allsub(s,:,:) = sprint.swa_n3;
    sprint_allsub.swa_wake_allsub(s,:,:) = sprint.swa_wake;

    sprint_allsub.spindle_power_rem_allsub(s,:,:) = sprint.spindle_power_rem;
    sprint_allsub.spindle_power_phasic_allsub(s,:,:) = sprint.spindle_power_phasic;
    sprint_allsub.spindle_power_tonic_allsub(s,:,:) = sprint.spindle_power_tonic;
    sprint_allsub.spindle_power_nrem_allsub(s,:,:) = sprint.spindle_power_nrem;
    sprint_allsub.spindle_power_n1_allsub(s,:,:) = sprint.spindle_power_n1;
    sprint_allsub.spindle_power_n2_allsub(s,:,:) = sprint.spindle_power_n2;
    sprint_allsub.spindle_power_n3_allsub(s,:,:) = sprint.spindle_power_n3;
    sprint_allsub.spindle_power_wake_allsub(s,:,:) = sprint.spindle_power_wake;
    
    sprint_allsub.IAPF_rem_allsub(s,:,:) = sprint.IAPF_rem_all;
    sprint_allsub.IAPF_phasic_allsub(s,:,:) = sprint.IAPF_phasic_all;
    sprint_allsub.IAPF_tonic_allsub(s,:,:) = sprint.IAPF_tonic_all;
    sprint_allsub.IAPF_nrem_allsub(s,:,:) = sprint.IAPF_nrem_all;
    sprint_allsub.IAPF_wake_allsub(s,:,:) = sprint.IAPF_wake_all;
    
    sprint_allsub.ITPF_rem_allsub(s,:,:) = sprint.ITPF_rem_all;
    sprint_allsub.ITPF_phasic_allsub(s,:,:) = sprint.ITPF_phasic_all;
    sprint_allsub.ITPF_tonic_allsub(s,:,:) = sprint.ITPF_tonic_all;
    sprint_allsub.ITPF_nrem_allsub(s,:,:) = sprint.ITPF_nrem_all;
    sprint_allsub.ITPF_wake_allsub(s,:,:) = sprint.ITPF_wake_all;
    
    sprint_allsub.ISPF_rem_allsub(s,:,:) = sprint.ISPF_rem_all;
    sprint_allsub.ISPF_phasic_allsub(s,:,:) = sprint.ISPF_phasic_all;
    sprint_allsub.ISPF_tonic_allsub(s,:,:) = sprint.ISPF_tonic_all;
    sprint_allsub.ISPF_nrem_allsub(s,:,:) = sprint.ISPF_nrem_all;
    sprint_allsub.ISPF_wake_allsub(s,:,:) = sprint.ISPF_wake_all;
    
    sprint_allsub.alpha_rem_den_allsub(s,:,:) = sprint.alpha_rem_den;
    sprint_allsub.alpha_phasic_den_allsub(s,:,:) = sprint.alpha_phasic_den;
    sprint_allsub.alpha_tonic_den_allsub(s,:,:) = sprint.alpha_tonic_den;
    sprint_allsub.alpha_nrem_den_allsub(s,:,:) = sprint.alpha_nrem_den;
    sprint_allsub.alpha_wake_den_allsub(s,:,:) = sprint.alpha_wake_den;
    
    sprint_allsub.theta_rem_den_allsub(s,:,:) = sprint.theta_rem_den;
    sprint_allsub.theta_phasic_den_allsub(s,:,:) = sprint.theta_phasic_den;
    sprint_allsub.theta_tonic_den_allsub(s,:,:) = sprint.theta_tonic_den;
    sprint_allsub.theta_nrem_den_allsub(s,:,:) = sprint.theta_nrem_den;
    sprint_allsub.theta_wake_den_allsub(s,:,:) = sprint.theta_wake_den;
    
    sprint_allsub.spindles_rem_den_allsub(s,:,:) = sprint.spindles_rem_den;
    sprint_allsub.spindles_phasic_den_allsub(s,:,:) = sprint.spindles_phasic_den;
    sprint_allsub.spindles_tonic_den_allsub(s,:,:) = sprint.spindles_tonic_den;
    sprint_allsub.spindles_nrem_den_allsub(s,:,:) = sprint.spindles_nrem_den;
    sprint_allsub.spindles_wake_den_allsub(s,:,:) = sprint.spindles_wake_den;
    
    sprint_allsub.alpha_rem_snr_allsub(s,:,:) = sprint.alpha_rem_snr;
    sprint_allsub.alpha_phasic_snr_allsub(s,:,:) = sprint.alpha_phasic_snr;
    sprint_allsub.alpha_tonic_snr_allsub(s,:,:) = sprint.alpha_tonic_snr;
    sprint_allsub.alpha_nrem_snr_allsub(s,:,:) = sprint.alpha_nrem_snr;
    sprint_allsub.alpha_wake_snr_allsub(s,:,:) = sprint.alpha_wake_snr;
    
    sprint_allsub.theta_rem_snr_allsub(s,:,:) = sprint.theta_rem_snr;
    sprint_allsub.theta_phasic_snr_allsub(s,:,:) = sprint.theta_phasic_snr;
    sprint_allsub.theta_tonic_snr_allsub(s,:,:) = sprint.theta_tonic_snr;
    sprint_allsub.theta_nrem_snr_allsub(s,:,:) = sprint.theta_nrem_snr;
    sprint_allsub.theta_wake_snr_allsub(s,:,:) = sprint.theta_wake_snr;
    
    sprint_allsub.spindles_rem_snr_allsub(s,:,:) = sprint.spindles_rem_snr;
    sprint_allsub.spindles_phasic_snr_allsub(s,:,:) = sprint.spindles_phasic_snr;
    sprint_allsub.spindles_tonic_snr_allsub(s,:,:) = sprint.spindles_tonic_snr;
    sprint_allsub.spindles_nrem_snr_allsub(s,:,:) = sprint.spindles_nrem_snr;
    sprint_allsub.spindles_wake_snr_allsub(s,:,:) = sprint.spindles_wake_snr;
    

    clear sprint
end

%%

save([Savefolder,filesep,'sprint_allsub_',date,'.mat'],'sprint_allsub');


%%

% m_swa_nrem_allsub = squeeze(nanmean(swa_nrem_allsub,1));
% sem_swa_nrem_allsub = squeeze(nanstd(swa_nrem_allsub,1))./sqrt(size(swa_nrem_allsub,1));
% 
% ch = 1;
% 
% d = 1:9;
% 
% shadedErrorBar(d,m_swa_nrem_allsub(1:9,ch),sem_swa_nrem_allsub(1:9,ch),'lineProps',{'Color','b','LineWidth',1},'patchSaturation',.3);
% hold on
% shadedErrorBar(d,m_swa_nrem_allsub(10:18,ch),sem_swa_nrem_allsub(10:18,ch),'lineProps',{'Color','r','LineWidth',1},'patchSaturation',.3);
% 
% %%
% 
% m_swa_rem_allsub = squeeze(nanmean(swa_rem_allsub,1));
% sem_swa_rem_allsub = squeeze(nanstd(swa_rem_allsub,1))./sqrt(size(swa_rem_allsub,1));
% 
% ch = 1;
% 
% d = 1:9;
% 
% shadedErrorBar(d,m_swa_rem_allsub(1:9,ch),sem_swa_rem_allsub(1:9,ch),'lineProps',{'Color','b','LineWidth',1},'patchSaturation',.3);
% hold on
% shadedErrorBar(d,m_swa_rem_allsub(10:18,ch),sem_swa_rem_allsub(10:18,ch),'lineProps',{'Color','r','LineWidth',1},'patchSaturation',.3);
% 
% 
% 
% 
