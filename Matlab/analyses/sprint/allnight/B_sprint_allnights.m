function B_sprint_allsub(s)

try

% clear all;
% close all;
% 
% s = 1;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

waves_folder = '/parallel_scratch/nemo/AFdata/sprint_220125/';
waves_folder_dir = dir([waves_folder,'AFOSR*'])


for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub_peakfitwaves/';

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');


%% thresholds
lower_freq = 1;
higher_freq = 20;
lower_freq_alpha = 6;
higher_freq_alpha = 12;
lower_freq_theta = 2;
higher_freq_theta = 6;
lower_freq_spindles = 12;
higher_freq_spindles = 16;
peak_thresh = 0.03;

swa_freq = [1 4];
spindles_freq = [11 16];

%%
sprint.exponent_1_30_rem = NaN(18,8);
sprint.exponent_1_30_phasic = NaN(18,8);
sprint.exponent_1_30_tonic = NaN(18,8);
sprint.exponent_1_30_nrem = NaN(18,8);
sprint.exponent_1_30_n1 = NaN(18,8);
sprint.exponent_1_30_n2 = NaN(18,8);
sprint.exponent_1_30_n3 = NaN(18,8);
sprint.exponent_1_30_wake = NaN(18,8);

sprint.exponent_30_45_rem = NaN(18,8);
sprint.exponent_30_45_phasic = NaN(18,8);
sprint.exponent_30_45_tonic = NaN(18,8);
sprint.exponent_30_45_nrem = NaN(18,8);
sprint.exponent_30_45_n1 = NaN(18,8);
sprint.exponent_30_45_n2 = NaN(18,8);
sprint.exponent_30_45_n3 = NaN(18,8);
sprint.exponent_30_45_wake = NaN(18,8);

sprint.exponent_1_45_rem = NaN(18,8);
sprint.exponent_1_45_phasic = NaN(18,8);
sprint.exponent_1_45_tonic = NaN(18,8);
sprint.exponent_1_45_nrem = NaN(18,8);
sprint.exponent_1_45_n1 = NaN(18,8);
sprint.exponent_1_45_n2 = NaN(18,8);
sprint.exponent_1_45_n3 = NaN(18,8);
sprint.exponent_1_45_wake = NaN(18,8);


sprint.offset_1_30_rem = NaN(18,8);
sprint.offset_1_30_phasic = NaN(18,8);
sprint.offset_1_30_tonic = NaN(18,8);
sprint.offset_1_30_nrem = NaN(18,8);
sprint.offset_1_30_n1 = NaN(18,8);
sprint.offset_1_30_n2 = NaN(18,8);
sprint.offset_1_30_n3 = NaN(18,8);
sprint.offset_1_30_wake = NaN(18,8);

sprint.offset_30_45_rem = NaN(18,8);
sprint.offset_30_45_phasic = NaN(18,8);
sprint.offset_30_45_tonic = NaN(18,8);
sprint.offset_30_45_nrem = NaN(18,8);
sprint.offset_30_45_n1 = NaN(18,8);
sprint.offset_30_45_n2 = NaN(18,8);
sprint.offset_30_45_n3 = NaN(18,8);
sprint.offset_30_45_wake = NaN(18,8);

sprint.offset_1_45_rem = NaN(18,8);
sprint.offset_1_45_phasic = NaN(18,8);
sprint.offset_1_45_tonic = NaN(18,8);
sprint.offset_1_45_nrem = NaN(18,8);
sprint.offset_1_45_n1 = NaN(18,8);
sprint.offset_1_45_n2 = NaN(18,8);
sprint.offset_1_45_n3 = NaN(18,8);
sprint.offset_1_45_wake = NaN(18,8);


sprint.power_spectrum_1_30_rem = NaN(18,8,30);
sprint.power_spectrum_1_30_phasic = NaN(18,8,30);
sprint.power_spectrum_1_30_tonic = NaN(18,8,30);
sprint.power_spectrum_1_30_nrem = NaN(18,8,30);
sprint.power_spectrum_1_30_n1 = NaN(18,8,30);
sprint.power_spectrum_1_30_n2 = NaN(18,8,30);
sprint.power_spectrum_1_30_n3 = NaN(18,8,30);
sprint.power_spectrum_1_30_wake = NaN(18,8,30);

sprint.power_spectrum_30_45_rem = NaN(18,8,16);
sprint.power_spectrum_30_45_phasic = NaN(18,8,16);
sprint.power_spectrum_30_45_tonic = NaN(18,8,16);
sprint.power_spectrum_30_45_nrem = NaN(18,8,16);
sprint.power_spectrum_30_45_n1 = NaN(18,8,16);
sprint.power_spectrum_30_45_n2 = NaN(18,8,16);
sprint.power_spectrum_30_45_n3 = NaN(18,8,16);
sprint.power_spectrum_30_45_wake = NaN(18,8,16);

sprint.power_spectrum_1_45_rem = NaN(18,8,45);
sprint.power_spectrum_1_45_phasic = NaN(18,8,45);
sprint.power_spectrum_1_45_tonic = NaN(18,8,45);
sprint.power_spectrum_1_45_nrem = NaN(18,8,45);
sprint.power_spectrum_1_45_n1 = NaN(18,8,45);
sprint.power_spectrum_1_45_n2 = NaN(18,8,45);
sprint.power_spectrum_1_45_n3 = NaN(18,8,45);
sprint.power_spectrum_1_45_wake = NaN(18,8,45);


sprint.ap_fit_1_30_rem = NaN(18,8,30);
sprint.ap_fit_1_30_phasic = NaN(18,8,30);
sprint.ap_fit_1_30_tonic = NaN(18,8,30);
sprint.ap_fit_1_30_nrem = NaN(18,8,30);
sprint.ap_fit_1_30_n1 = NaN(18,8,30);
sprint.ap_fit_1_30_n2 = NaN(18,8,30);
sprint.ap_fit_1_30_n3 = NaN(18,8,30);
sprint.ap_fit_1_30_wake = NaN(18,8,30);

sprint.ap_fit_30_45_rem = NaN(18,8,16);
sprint.ap_fit_30_45_phasic = NaN(18,8,16);
sprint.ap_fit_30_45_tonic = NaN(18,8,16);
sprint.ap_fit_30_45_nrem = NaN(18,8,16);
sprint.ap_fit_30_45_n1 = NaN(18,8,16);
sprint.ap_fit_30_45_n2 = NaN(18,8,16);
sprint.ap_fit_30_45_n3 = NaN(18,8,16);
sprint.ap_fit_30_45_wake = NaN(18,8,16);

sprint.ap_fit_1_45_rem = NaN(18,8,45);
sprint.ap_fit_1_45_phasic = NaN(18,8,45);
sprint.ap_fit_1_45_tonic = NaN(18,8,45);
sprint.ap_fit_1_45_nrem = NaN(18,8,45);
sprint.ap_fit_1_45_n1 = NaN(18,8,45);
sprint.ap_fit_1_45_n2 = NaN(18,8,45);
sprint.ap_fit_1_45_n3 = NaN(18,8,45);
sprint.ap_fit_1_45_wake = NaN(18,8,45);


sprint.peak_fit_1_30_rem = NaN(18,8,30);
sprint.peak_fit_1_30_phasic = NaN(18,8,30);
sprint.peak_fit_1_30_tonic = NaN(18,8,30);
sprint.peak_fit_1_30_nrem = NaN(18,8,30);
sprint.peak_fit_1_30_n1 = NaN(18,8,30);
sprint.peak_fit_1_30_n2 = NaN(18,8,30);
sprint.peak_fit_1_30_n3 = NaN(18,8,30);
sprint.peak_fit_1_30_wake = NaN(18,8,30);

sprint.peak_fit_30_45_rem = NaN(18,8,16);
sprint.peak_fit_30_45_phasic = NaN(18,8,16);
sprint.peak_fit_30_45_tonic = NaN(18,8,16);
sprint.peak_fit_30_45_nrem = NaN(18,8,16);
sprint.peak_fit_30_45_n1 = NaN(18,8,16);
sprint.peak_fit_30_45_n2 = NaN(18,8,16);
sprint.peak_fit_30_45_n3 = NaN(18,8,16);
sprint.peak_fit_30_45_wake = NaN(18,8,16);

sprint.peak_fit_1_45_rem = NaN(18,8,45);
sprint.peak_fit_1_45_phasic = NaN(18,8,45);
sprint.peak_fit_1_45_tonic = NaN(18,8,45);
sprint.peak_fit_1_45_nrem = NaN(18,8,45);
sprint.peak_fit_1_45_n1 = NaN(18,8,45);
sprint.peak_fit_1_45_n2 = NaN(18,8,45);
sprint.peak_fit_1_45_n3 = NaN(18,8,45);
sprint.peak_fit_1_45_wake = NaN(18,8,45);

sprint.peak_fit_1_30_phasic_alphawaves = NaN(18,8,30);
sprint.peak_fit_1_30_phasic_thetawaves = NaN(18,8,30);
sprint.peak_fit_1_30_tonic_alphawaves = NaN(18,8,30);
sprint.peak_fit_1_30_tonic_thetawaves = NaN(18,8,30);

sprint.foofed_spectrum_1_30_rem = NaN(18,8,30);
sprint.foofed_spectrum_1_30_phasic = NaN(18,8,30);
sprint.foofed_spectrum_1_30_tonic = NaN(18,8,30);
sprint.foofed_spectrum_1_30_nrem = NaN(18,8,30);
sprint.foofed_spectrum_1_30_n1 = NaN(18,8,30);
sprint.foofed_spectrum_1_30_n2 = NaN(18,8,30);
sprint.foofed_spectrum_1_30_n3 = NaN(18,8,30);
sprint.foofed_spectrum_1_30_wake = NaN(18,8,30);

sprint.foofed_spectrum_30_45_rem = NaN(18,8,16);
sprint.foofed_spectrum_30_45_phasic = NaN(18,8,16);
sprint.foofed_spectrum_30_45_tonic = NaN(18,8,16);
sprint.foofed_spectrum_30_45_nrem = NaN(18,8,16);
sprint.foofed_spectrum_30_45_n1 = NaN(18,8,16);
sprint.foofed_spectrum_30_45_n2 = NaN(18,8,16);
sprint.foofed_spectrum_30_45_n3 = NaN(18,8,16);
sprint.foofed_spectrum_30_45_wake = NaN(18,8,16);

sprint.foofed_spectrum_1_45_rem = NaN(18,8,45);
sprint.foofed_spectrum_1_45_phasic = NaN(18,8,45);
sprint.foofed_spectrum_1_45_tonic = NaN(18,8,45);
sprint.foofed_spectrum_1_45_nrem = NaN(18,8,45);
sprint.foofed_spectrum_1_45_n1 = NaN(18,8,45);
sprint.foofed_spectrum_1_45_n2 = NaN(18,8,45);
sprint.foofed_spectrum_1_45_n3 = NaN(18,8,45);
sprint.foofed_spectrum_1_45_wake = NaN(18,8,45);



sprint.log_power_spectrum_1_30_rem = NaN(18,8,30);
sprint.log_power_spectrum_1_30_phasic = NaN(18,8,30);
sprint.log_power_spectrum_1_30_tonic = NaN(18,8,30);
sprint.log_power_spectrum_1_30_nrem = NaN(18,8,30);
sprint.log_power_spectrum_1_30_n1 = NaN(18,8,30);
sprint.log_power_spectrum_1_30_n2 = NaN(18,8,30);
sprint.log_power_spectrum_1_30_n3 = NaN(18,8,30);
sprint.log_power_spectrum_1_30_wake = NaN(18,8,30);

sprint.log_power_spectrum_30_45_rem = NaN(18,8,16);
sprint.log_power_spectrum_30_45_phasic = NaN(18,8,16);
sprint.log_power_spectrum_30_45_tonic = NaN(18,8,16);
sprint.log_power_spectrum_30_45_nrem = NaN(18,8,16);
sprint.log_power_spectrum_30_45_n1 = NaN(18,8,16);
sprint.log_power_spectrum_30_45_n2 = NaN(18,8,16);
sprint.log_power_spectrum_30_45_n3 = NaN(18,8,16);
sprint.log_power_spectrum_30_45_wake = NaN(18,8,16);

sprint.log_power_spectrum_1_45_rem = NaN(18,8,45);
sprint.log_power_spectrum_1_45_phasic = NaN(18,8,45);
sprint.log_power_spectrum_1_45_tonic = NaN(18,8,45);
sprint.log_power_spectrum_1_45_nrem = NaN(18,8,45);
sprint.log_power_spectrum_1_45_n1 = NaN(18,8,45);
sprint.log_power_spectrum_1_45_n2 = NaN(18,8,45);
sprint.log_power_spectrum_1_45_n3 = NaN(18,8,45);
sprint.log_power_spectrum_1_45_wake = NaN(18,8,45);



sprint.log_ap_fit_1_30_rem = NaN(18,8,30);
sprint.log_ap_fit_1_30_phasic = NaN(18,8,30);
sprint.log_ap_fit_1_30_tonic = NaN(18,8,30);
sprint.log_ap_fit_1_30_nrem = NaN(18,8,30);
sprint.log_ap_fit_1_30_n1 = NaN(18,8,30);
sprint.log_ap_fit_1_30_n2 = NaN(18,8,30);
sprint.log_ap_fit_1_30_n3 = NaN(18,8,30);
sprint.log_ap_fit_1_30_wake = NaN(18,8,30);

sprint.log_ap_fit_30_45_rem = NaN(18,8,16);
sprint.log_ap_fit_30_45_phasic = NaN(18,8,16);
sprint.log_ap_fit_30_45_tonic = NaN(18,8,16);
sprint.log_ap_fit_30_45_nrem = NaN(18,8,16);
sprint.log_ap_fit_30_45_n1 = NaN(18,8,16);
sprint.log_ap_fit_30_45_n2 = NaN(18,8,16);
sprint.log_ap_fit_30_45_n3 = NaN(18,8,16);
sprint.log_ap_fit_30_45_wake = NaN(18,8,16);

sprint.log_ap_fit_1_45_rem = NaN(18,8,45);
sprint.log_ap_fit_1_45_phasic = NaN(18,8,45);
sprint.log_ap_fit_1_45_tonic = NaN(18,8,45);
sprint.log_ap_fit_1_45_nrem = NaN(18,8,45);
sprint.log_ap_fit_1_45_n1 = NaN(18,8,45);
sprint.log_ap_fit_1_45_n2 = NaN(18,8,45);
sprint.log_ap_fit_1_45_n3 = NaN(18,8,45);
sprint.log_ap_fit_1_45_wake = NaN(18,8,45);



sprint.log_peak_fit_1_30_rem = NaN(18,8,30);
sprint.log_peak_fit_1_30_phasic = NaN(18,8,30);
sprint.log_peak_fit_1_30_tonic = NaN(18,8,30);
sprint.log_peak_fit_1_30_nrem = NaN(18,8,30);
sprint.log_peak_fit_1_30_n1 = NaN(18,8,30);
sprint.log_peak_fit_1_30_n2 = NaN(18,8,30);
sprint.log_peak_fit_1_30_n3 = NaN(18,8,30);
sprint.log_peak_fit_1_30_wake = NaN(18,8,30);

sprint.log_peak_fit_30_45_rem = NaN(18,8,16);
sprint.log_peak_fit_30_45_phasic = NaN(18,8,16);
sprint.log_peak_fit_30_45_tonic = NaN(18,8,16);
sprint.log_peak_fit_30_45_nrem = NaN(18,8,16);
sprint.log_peak_fit_30_45_n1 = NaN(18,8,16);
sprint.log_peak_fit_30_45_n2 = NaN(18,8,16);
sprint.log_peak_fit_30_45_n3 = NaN(18,8,16);
sprint.log_peak_fit_30_45_wake = NaN(18,8,16);

sprint.log_peak_fit_1_45_rem = NaN(18,8,45);
sprint.log_peak_fit_1_45_phasic = NaN(18,8,45);
sprint.log_peak_fit_1_45_tonic = NaN(18,8,45);
sprint.log_peak_fit_1_45_nrem = NaN(18,8,45);
sprint.log_peak_fit_1_45_n1 = NaN(18,8,45);
sprint.log_peak_fit_1_45_n2 = NaN(18,8,45);
sprint.log_peak_fit_1_45_n3 = NaN(18,8,45);
sprint.log_peak_fit_1_45_wake = NaN(18,8,45);


sprint.log_foofed_spectrum_1_30_rem = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_phasic = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_tonic = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_nrem = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_n1 = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_n2 = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_n3 = NaN(18,8,30);
sprint.log_foofed_spectrum_1_30_wake = NaN(18,8,30);

sprint.log_foofed_spectrum_30_45_rem = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_phasic = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_tonic = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_nrem = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_n1 = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_n2 = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_n3 = NaN(18,8,16);
sprint.log_foofed_spectrum_30_45_wake = NaN(18,8,16);

sprint.log_foofed_spectrum_1_45_rem = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_phasic = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_tonic = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_nrem = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_n1 = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_n2 = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_n3 = NaN(18,8,45);
sprint.log_foofed_spectrum_1_45_wake = NaN(18,8,45);


sprint.r_squared_1_30_rem = NaN(18,8);
sprint.r_squared_1_30_phasic = NaN(18,8);
sprint.r_squared_1_30_tonic = NaN(18,8);
sprint.r_squared_1_30_nrem = NaN(18,8);
sprint.r_squared_1_30_n1 = NaN(18,8);
sprint.r_squared_1_30_n2 = NaN(18,8);
sprint.r_squared_1_30_n3 = NaN(18,8);
sprint.r_squared_1_30_wake = NaN(18,8);

sprint.r_squared_30_45_rem = NaN(18,8);
sprint.r_squared_30_45_phasic = NaN(18,8);
sprint.r_squared_30_45_tonic = NaN(18,8);
sprint.r_squared_30_45_nrem = NaN(18,8);
sprint.r_squared_30_45_n1 = NaN(18,8);
sprint.r_squared_30_45_n2 = NaN(18,8);
sprint.r_squared_30_45_n3 = NaN(18,8);
sprint.r_squared_30_45_wake = NaN(18,8);

sprint.r_squared_1_45_rem = NaN(18,8);
sprint.r_squared_1_45_phasic = NaN(18,8);
sprint.r_squared_1_45_tonic = NaN(18,8);
sprint.r_squared_1_45_nrem = NaN(18,8);
sprint.r_squared_1_45_n1 = NaN(18,8);
sprint.r_squared_1_45_n2 = NaN(18,8);
sprint.r_squared_1_45_n3 = NaN(18,8);
sprint.r_squared_1_45_wake = NaN(18,8);


sprint.error_1_30_rem = NaN(18,8);
sprint.error_1_30_phasic = NaN(18,8);
sprint.error_1_30_tonic = NaN(18,8);
sprint.error_1_30_nrem = NaN(18,8);
sprint.error_1_30_n1 = NaN(18,8);
sprint.error_1_30_n2 = NaN(18,8);
sprint.error_1_30_n3 = NaN(18,8);
sprint.error_1_30_wake = NaN(18,8);

sprint.error_30_45_rem = NaN(18,8);
sprint.error_30_45_phasic = NaN(18,8);
sprint.error_30_45_tonic = NaN(18,8);
sprint.error_30_45_nrem = NaN(18,8);
sprint.error_30_45_n1 = NaN(18,8);
sprint.error_30_45_n2 = NaN(18,8);
sprint.error_30_45_n3 = NaN(18,8);
sprint.error_30_45_wake = NaN(18,8);

sprint.error_1_45_rem = NaN(18,8);
sprint.error_1_45_phasic = NaN(18,8);
sprint.error_1_45_tonic = NaN(18,8);
sprint.error_1_45_nrem = NaN(18,8);
sprint.error_1_45_n1 = NaN(18,8);
sprint.error_1_45_n2 = NaN(18,8);
sprint.error_1_45_n3 = NaN(18,8);
sprint.error_1_45_wake = NaN(18,8);

%%

sprint.swa_rem = NaN(18,8);
sprint.swa_phasic = NaN(18,8);
sprint.swa_tonic = NaN(18,8);
sprint.swa_nrem = NaN(18,8);
sprint.swa_n1 = NaN(18,8);
sprint.swa_n2 = NaN(18,8);
sprint.swa_n3 = NaN(18,8);
sprint.swa_wake = NaN(18,8);

sprint.spindle_power_rem = NaN(18,8);
sprint.spindle_power_phasic = NaN(18,8);
sprint.spindle_power_tonic = NaN(18,8);
sprint.spindle_power_nrem = NaN(18,8);
sprint.spindle_power_n1 = NaN(18,8);
sprint.spindle_power_n2 = NaN(18,8);
sprint.spindle_power_n3 = NaN(18,8);
sprint.spindle_power_wake = NaN(18,8);

%%
sprint.IAPF_wake_all = NaN(18,8);
sprint.IAPF_rem_all = NaN(18,8);
sprint.IAPF_phasic_all = NaN(18,8);
sprint.IAPF_tonic_all = NaN(18,8);
sprint.IAPF_nrem_all = NaN(18,8);

sprint.ITPF_wake_all = NaN(18,8);
sprint.ITPF_rem_all = NaN(18,8);
sprint.ITPF_phasic_all = NaN(18,8);
sprint.ITPF_tonic_all = NaN(18,8);
sprint.ITPF_nrem_all = NaN(18,8);

sprint.ISPF_wake_all = NaN(18,8);
sprint.ISPF_rem_all = NaN(18,8);
sprint.ISPF_phasic_all = NaN(18,8);
sprint.ISPF_tonic_all = NaN(18,8);
sprint.ISPF_nrem_all = NaN(18,8);

sprint.IAPF_wake_height_all = NaN(18,8);
sprint.IAPF_rem_height_all = NaN(18,8);
sprint.IAPF_phasic_height_all = NaN(18,8);
sprint.IAPF_tonic_height_all = NaN(18,8);
sprint.IAPF_nrem_height_all = NaN(18,8);

sprint.ITPF_wake_height_all = NaN(18,8);
sprint.ITPF_rem_height_all = NaN(18,8);
sprint.ITPF_phasic_height_all = NaN(18,8);
sprint.ITPF_tonic_height_all = NaN(18,8);
sprint.ITPF_nrem_height_all = NaN(18,8);

sprint.ISPF_wake_height_all = NaN(18,8);
sprint.ISPF_rem_height_all = NaN(18,8);
sprint.ISPF_phasic_height_all = NaN(18,8);
sprint.ISPF_tonic_height_all = NaN(18,8);
sprint.ISPF_nrem_height_all = NaN(18,8);

sprint.alpha_rem_den = NaN(18,8);
sprint.theta_rem_den = NaN(18,8);
sprint.spindles_rem_den = NaN(18,8);

sprint.alpha_phasic_den = NaN(18,8);
sprint.theta_phasic_den = NaN(18,8);
sprint.spindles_phasic_den = NaN(18,8);

sprint.alpha_tonic_den = NaN(18,8);
sprint.theta_tonic_den = NaN(18,8);
sprint.spindles_tonic_den = NaN(18,8);

sprint.alpha_nrem_den = NaN(18,8);
sprint.theta_nrem_den = NaN(18,8);
sprint.spindles_nrem_den = NaN(18,8);

sprint.alpha_wake_den = NaN(18,8);
sprint.theta_wake_den = NaN(18,8);
sprint.spindles_wake_den = NaN(18,8);


sprint.alpha_rem_abu = NaN(18,8);
sprint.theta_rem_abu = NaN(18,8);
sprint.spindles_rem_abu = NaN(18,8);


sprint.alpha_rem_snr = NaN(18,8);
sprint.theta_rem_snr = NaN(18,8);
sprint.spindles_rem_snr = NaN(18,8);

sprint.alpha_phasic_snr = NaN(18,8);
sprint.theta_phasic_snr = NaN(18,8);
sprint.spindles_phasic_snr = NaN(18,8);

sprint.alpha_tonic_snr = NaN(18,8);
sprint.theta_tonic_snr = NaN(18,8);
sprint.spindles_tonic_snr = NaN(18,8);

sprint.alpha_nrem_snr = NaN(18,8);
sprint.theta_nrem_snr = NaN(18,8);
sprint.spindles_nrem_snr = NaN(18,8);

sprint.alpha_wake_snr = NaN(18,8);
sprint.theta_wake_snr = NaN(18,8);
sprint.spindles_wake_snr = NaN(18,8);


%%

% for s = 1:36 %length(waves_folder_dir)   
    
%     display(['sub = ',num2str(s)]); 

    files = dir([waves_folder, participants_uni{s},'*']);
    
    
    for file = 1:length(files)
        
       display(['file = ',num2str(file)]); 
        
        %%
        filename = files(file).name;
        night = find_night(filename);
        
        load([waves_folder, filesep,files(file).name]);
        
        swa_ndx = find(f1 >= swa_freq(1) & f1 < swa_freq(2));
        spindle_power_ndx = find(f1 >= spindles_freq(1) & f1 < spindles_freq(2));
        freq_resolution = f1(2)-f1(1);

        clear phato_30
        
        load([goodREM_folder,files(file).name(1:18),'_goodREM.mat']);
        
        if length(hypno3) > size(exponent_1_30_allep,1)
           hypno3 = hypno3(1:size(exponent_1_30_allep,1));   
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
        
        epochs_art_good = find(nrem_art_ep3 == 0);
        nrem_epochs_art_goodndx = intersect(nrem_epochs,epochs_art_good);
        n1_epochs_art_goodndx = intersect(n1_epochs,epochs_art_good);
        n2_epochs_art_goodndx = intersect(n2_epochs,epochs_art_good);
        n3_epochs_art_goodndx = intersect(n3_epochs,epochs_art_good);
        
               
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
 
            
         %% remove outliers
            
%         histogram(exponent_1_30_allep)
%         hold on 
        outlier_matrix_1_30 = exponent_1_30_allep < 0.2;
%         outlier_matrix_1_30 = r_squared_1_30_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_1_30_allep(outlier_matrix_1_30) = NaN;
        offset_1_30_allep(outlier_matrix_1_30) = NaN;
        for b = 1:size(foofed_spectrum_1_30_allep,3)
            foofed_spectrum_1_30_allep_bin = squeeze(foofed_spectrum_1_30_allep(:,:,b));
            foofed_spectrum_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            foofed_spectrum_1_30_allep(:,:,b) = foofed_spectrum_1_30_allep_bin;
            ap_fit_1_30_allep_bin = squeeze(ap_fit_1_30_allep(:,:,b));
            ap_fit_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            ap_fit_1_30_allep(:,:,b) = ap_fit_1_30_allep_bin;
            peak_fit_1_30_allep_bin = squeeze(peak_fit_1_30_allep(:,:,b));
            peak_fit_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            peak_fit_1_30_allep(:,:,b) = peak_fit_1_30_allep_bin;
            power_spectrum_1_30_allep_bin = squeeze(power_spectrum_1_30_allep(:,:,b));
            power_spectrum_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            power_spectrum_1_30_allep(:,:,b) = power_spectrum_1_30_allep_bin;
        end      
        
        r_squared_1_30_allep(r_squared_1_30_allep == 0) = NaN;
        error_1_30_allep(error_1_30_allep == 0) = NaN;
        if size(r_squared_1_30_allep,1) < size(exponent_1_30_allep,1)
           r_squared_1_30_allep(size(r_squared_1_30_allep,1)+1:size(exponent_1_30_allep,1),:) = NaN;
        end
        
        if size(error_1_30_allep,1) < size(exponent_1_30_allep,1)
          error_1_30_allep(size(error_1_30_allep,1)+1:size(exponent_1_30_allep,1),:) = NaN; 
        end
        r_squared_1_30_allep(outlier_matrix_1_30) = NaN;
        error_1_30_allep(outlier_matrix_1_30) = NaN;

        
%         clear outlier_matrix_1_30
%         histogram(exponent_1_30_allep)
 
%         histogram(exponent_30_45_allep)
%         hold on
        outlier_matrix_30_45 = exponent_30_45_allep < 0.2;
%         outlier_matrix_30_45 = r_squared_30_45_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_30_45_allep(outlier_matrix_30_45) = NaN;
        offset_30_45_allep(outlier_matrix_30_45) = NaN;
         for b = 1:size(foofed_spectrum_30_45_allep,3)
            foofed_spectrum_30_45_allep_bin = squeeze(foofed_spectrum_30_45_allep(:,:,b));
            foofed_spectrum_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            foofed_spectrum_30_45_allep(:,:,b) = foofed_spectrum_30_45_allep_bin;
            ap_fit_30_45_allep_bin = squeeze(ap_fit_30_45_allep(:,:,b));
            ap_fit_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            ap_fit_30_45_allep(:,:,b) = ap_fit_30_45_allep_bin;
            peak_fit_30_45_allep_bin = squeeze(peak_fit_30_45_allep(:,:,b));
            peak_fit_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            peak_fit_30_45_allep(:,:,b) = peak_fit_30_45_allep_bin;
            power_spectrum_30_45_allep_bin = squeeze(power_spectrum_30_45_allep(:,:,b));
            power_spectrum_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            power_spectrum_30_45_allep(:,:,b) = power_spectrum_30_45_allep_bin;
         end
         
         
        r_squared_30_45_allep(r_squared_30_45_allep == 0) = NaN;
        error_30_45_allep(error_30_45_allep == 0) = NaN;
        if size(r_squared_30_45_allep,1) < size(exponent_30_45_allep,1)
           r_squared_30_45_allep(size(r_squared_30_45_allep,1)+1:size(exponent_30_45_allep,1),:) = NaN;
        end
        
        if size(error_30_45_allep,1) < size(exponent_30_45_allep,1)
          error_30_45_allep(size(error_30_45_allep,1)+1:size(exponent_30_45_allep,1),:) = NaN; 
        end
        r_squared_30_45_allep(outlier_matrix_30_45) = NaN;
        error_30_45_allep(outlier_matrix_30_45) = NaN;
         
         
         
%         clear outlier_matrix_30_45
%         histogram(exponent_30_45_allep)

%         histogram(exponent_1_45_allep)
%         hold on
%          outlier_matrix_1_45 = exponent_1_45_allep < 0.2;
        outlier_matrix_1_45 = logical(outlier_matrix_1_30 + outlier_matrix_30_45); %exponent_1_45_allep < 0.2;
%         outlier_matrix_1_45 = r_squared_1_45_allep < 0.01;
        %  sum_outliers = sum(outlier_matrix,1)
        exponent_1_45_allep(outlier_matrix_1_45) = NaN;
        offset_1_45_allep(outlier_matrix_1_45) = NaN;
         for b = 1:size(foofed_spectrum_1_45_allep,3)
            foofed_spectrum_1_45_allep_bin = squeeze(foofed_spectrum_1_45_allep(:,:,b));
            foofed_spectrum_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            foofed_spectrum_1_45_allep(:,:,b) = foofed_spectrum_1_45_allep_bin;
            ap_fit_1_45_allep_bin = squeeze(ap_fit_1_45_allep(:,:,b));
            ap_fit_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            ap_fit_1_45_allep(:,:,b) = ap_fit_1_45_allep_bin;
            peak_fit_1_45_allep_bin = squeeze(peak_fit_1_45_allep(:,:,b));
            peak_fit_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            peak_fit_1_45_allep(:,:,b) = peak_fit_1_45_allep_bin;
            power_spectrum_1_45_allep_bin = squeeze(power_spectrum_1_45_allep(:,:,b));
            power_spectrum_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            power_spectrum_1_45_allep(:,:,b) = power_spectrum_1_45_allep_bin;
         end
         
        r_squared_1_45_allep(r_squared_1_45_allep == 0) = NaN;
        error_1_45_allep(error_1_45_allep == 0) = NaN;
        if size(r_squared_1_45_allep,1) < size(exponent_1_45_allep,1)
           r_squared_1_45_allep(size(r_squared_1_45_allep,1)+1:size(exponent_1_45_allep,1),:) = NaN;
        end
        
        if size(error_1_45_allep,1) < size(exponent_1_45_allep,1)
          error_1_45_allep(size(error_1_45_allep,1)+1:size(exponent_1_45_allep,1),:) = NaN; 
        end
        r_squared_1_45_allep(outlier_matrix_1_45) = NaN;
        error_1_45_allep(outlier_matrix_1_45) = NaN;
         
         
        clear outlier_matrix_1_30 outlier_matrix_30_45 outlier_matrix_1_45
        


          %%
        
%         clear outlier_matrix_1_45
%         histogram(exponent_1_45_allep)
        
        
        sprint.exponent_1_30_rem(night,ch) = nanmean(exponent_1_30_allep(rem_epochs,ch),1);
        sprint.exponent_1_30_phasic(night,ch) = nanmean(exponent_1_30_allep(phasic_epochs,ch),1);
        sprint.exponent_1_30_tonic(night,ch) = nanmean(exponent_1_30_allep(tonic_epochs,ch),1);
        sprint.exponent_1_30_nrem(night,ch) = nanmean(exponent_1_30_allep(nrem_epochs,ch),1);
        sprint.exponent_1_30_n1(night,ch) = nanmean(exponent_1_30_allep(n1_epochs,ch),1);
        sprint.exponent_1_30_n2(night,ch) = nanmean(exponent_1_30_allep(n2_epochs,ch),1);
        sprint.exponent_1_30_n3(night,ch) = nanmean(exponent_1_30_allep(n3_epochs,ch),1);
        sprint.exponent_1_30_wake(night,ch) = nanmean(exponent_1_30_allep(wake_epochs,ch),1);
      
        sprint.exponent_30_45_rem(night,ch) = nanmean(exponent_30_45_allep(rem_epochs,ch),1);
        sprint.exponent_30_45_phasic(night,ch) = nanmean(exponent_30_45_allep(phasic_epochs,ch),1);
        sprint.exponent_30_45_tonic(night,ch) = nanmean(exponent_30_45_allep(tonic_epochs,ch),1);
        sprint.exponent_30_45_nrem(night,ch) = nanmean(exponent_30_45_allep(nrem_epochs,ch),1);
        sprint.exponent_30_45_n1(night,ch) = nanmean(exponent_30_45_allep(n1_epochs,ch),1);
        sprint.exponent_30_45_n2(night,ch) = nanmean(exponent_30_45_allep(n2_epochs,ch),1);
        sprint.exponent_30_45_n3(night,ch) = nanmean(exponent_30_45_allep(n3_epochs,ch),1);
        sprint.exponent_30_45_wake(night,ch) = nanmean(exponent_30_45_allep(wake_epochs,ch),1);
        
        sprint.exponent_1_45_rem(night,ch) = nanmean(exponent_1_45_allep(rem_epochs,ch),1);
        sprint.exponent_1_45_phasic(night,ch) = nanmean(exponent_1_45_allep(phasic_epochs,ch),1);
        sprint.exponent_1_45_tonic(night,ch) = nanmean(exponent_1_45_allep(tonic_epochs,ch),1);
        sprint.exponent_1_45_nrem(night,ch) = nanmean(exponent_1_45_allep(nrem_epochs,ch),1);
        sprint.exponent_1_45_n1(night,ch) = nanmean(exponent_1_45_allep(n1_epochs,ch),1);
        sprint.exponent_1_45_n2(night,ch) = nanmean(exponent_1_45_allep(n2_epochs,ch),1);
        sprint.exponent_1_45_n3(night,ch) = nanmean(exponent_1_45_allep(n3_epochs,ch),1);
        sprint.exponent_1_45_wake(night,ch) = nanmean(exponent_1_45_allep(wake_epochs,ch),1);
        

        
                
        sprint.offset_1_30_rem(night,ch) = nanmean(offset_1_30_allep(rem_epochs,ch),1);
        sprint.offset_1_30_phasic(night,ch) = nanmean(offset_1_30_allep(phasic_epochs,ch),1);
        sprint.offset_1_30_tonic(night,ch) = nanmean(offset_1_30_allep(tonic_epochs,ch),1);
        sprint.offset_1_30_nrem(night,ch) = nanmean(offset_1_30_allep(nrem_epochs,ch),1);
        sprint.offset_1_30_n1(night,ch) = nanmean(offset_1_30_allep(n1_epochs,ch),1);
        sprint.offset_1_30_n2(night,ch) = nanmean(offset_1_30_allep(n2_epochs,ch),1);
        sprint.offset_1_30_n3(night,ch) = nanmean(offset_1_30_allep(n3_epochs,ch),1);
        sprint.offset_1_30_wake(night,ch) = nanmean(offset_1_30_allep(wake_epochs,ch),1);
      
        sprint.offset_30_45_rem(night,ch) = nanmean(offset_30_45_allep(rem_epochs,ch),1);
        sprint.offset_30_45_phasic(night,ch) = nanmean(offset_30_45_allep(phasic_epochs,ch),1);
        sprint.offset_30_45_tonic(night,ch) = nanmean(offset_30_45_allep(tonic_epochs,ch),1);
        sprint.offset_30_45_nrem(night,ch) = nanmean(offset_30_45_allep(nrem_epochs,ch),1);
        sprint.offset_30_45_n1(night,ch) = nanmean(offset_30_45_allep(n1_epochs,ch),1);
        sprint.offset_30_45_n2(night,ch) = nanmean(offset_30_45_allep(n2_epochs,ch),1);
        sprint.offset_30_45_n3(night,ch) = nanmean(offset_30_45_allep(n3_epochs,ch),1);
        sprint.offset_30_45_wake(night,ch) = nanmean(offset_30_45_allep(wake_epochs,ch),1);
        
        sprint.offset_1_45_rem(night,ch) = nanmean(offset_1_45_allep(rem_epochs,ch),1);
        sprint.offset_1_45_phasic(night,ch) = nanmean(offset_1_45_allep(phasic_epochs,ch),1);
        sprint.offset_1_45_tonic(night,ch) = nanmean(offset_1_45_allep(tonic_epochs,ch),1);
        sprint.offset_1_45_nrem(night,ch) = nanmean(offset_1_45_allep(nrem_epochs,ch),1);
        sprint.offset_1_45_n1(night,ch) = nanmean(offset_1_45_allep(n1_epochs,ch),1);
        sprint.offset_1_45_n2(night,ch) = nanmean(offset_1_45_allep(n2_epochs,ch),1);
        sprint.offset_1_45_n3(night,ch) = nanmean(offset_1_45_allep(n3_epochs,ch),1);
        sprint.offset_1_45_wake(night,ch) = nanmean(offset_1_45_allep(wake_epochs,ch),1);
       

        
        sprint.power_spectrum_1_30_rem(night,ch,:) = nanmean(power_spectrum_1_30_allep(rem_epochs,ch,:),1);
        sprint.power_spectrum_1_30_phasic(night,ch,:) = nanmean(power_spectrum_1_30_allep(phasic_epochs,ch,:),1);
        sprint.power_spectrum_1_30_tonic(night,ch,:) = nanmean(power_spectrum_1_30_allep(tonic_epochs,ch,:),1);
        sprint.power_spectrum_1_30_nrem(night,ch,:) = nanmean(power_spectrum_1_30_allep(nrem_epochs,ch,:),1);
        sprint.power_spectrum_1_30_n1(night,ch,:) = nanmean(power_spectrum_1_30_allep(n1_epochs,ch,:),1);
        sprint.power_spectrum_1_30_n2(night,ch,:) = nanmean(power_spectrum_1_30_allep(n2_epochs,ch,:),1);
        sprint.power_spectrum_1_30_n3(night,ch,:) = nanmean(power_spectrum_1_30_allep(n3_epochs,ch,:),1);
        sprint.power_spectrum_1_30_wake(night,ch,:) = nanmean(power_spectrum_1_30_allep(wake_epochs,ch,:),1);
        
       
        sprint.power_spectrum_30_45_rem(night,ch,:) = nanmean(power_spectrum_30_45_allep(rem_epochs,ch,:),1);
        sprint.power_spectrum_30_45_phasic(night,ch,:) = nanmean(power_spectrum_30_45_allep(phasic_epochs,ch,:),1);
        sprint.power_spectrum_30_45_tonic(night,ch,:) = nanmean(power_spectrum_30_45_allep(tonic_epochs,ch,:),1);
        sprint.power_spectrum_30_45_nrem(night,ch,:) = nanmean(power_spectrum_30_45_allep(nrem_epochs,ch,:),1);
        sprint.power_spectrum_30_45_n1(night,ch,:) = nanmean(power_spectrum_30_45_allep(n1_epochs,ch,:),1);
        sprint.power_spectrum_30_45_n2(night,ch,:) = nanmean(power_spectrum_30_45_allep(n2_epochs,ch,:),1);
        sprint.power_spectrum_30_45_n3(night,ch,:) = nanmean(power_spectrum_30_45_allep(n3_epochs,ch,:),1);
        sprint.power_spectrum_30_45_wake(night,ch,:) = nanmean(power_spectrum_30_45_allep(wake_epochs,ch,:),1);


        sprint.power_spectrum_1_45_rem(night,ch,:) = nanmean(power_spectrum_1_45_allep(rem_epochs,ch,:),1);
        sprint.power_spectrum_1_45_phasic(night,ch,:) = nanmean(power_spectrum_1_45_allep(phasic_epochs,ch,:),1);
        sprint.power_spectrum_1_45_tonic(night,ch,:) = nanmean(power_spectrum_1_45_allep(tonic_epochs,ch,:),1);
        sprint.power_spectrum_1_45_nrem(night,ch,:) = nanmean(power_spectrum_1_45_allep(nrem_epochs,ch,:),1);
        sprint.power_spectrum_1_45_n1(night,ch,:) = nanmean(power_spectrum_1_45_allep(n1_epochs,ch,:),1);
        sprint.power_spectrum_1_45_n2(night,ch,:) = nanmean(power_spectrum_1_45_allep(n2_epochs,ch,:),1);
        sprint.power_spectrum_1_45_n3(night,ch,:) = nanmean(power_spectrum_1_45_allep(n3_epochs,ch,:),1);
        sprint.power_spectrum_1_45_wake(night,ch,:) = nanmean(power_spectrum_1_45_allep(wake_epochs,ch,:),1);



        
        sprint.ap_fit_1_30_rem(night,ch,:) = nanmean(ap_fit_1_30_allep(rem_epochs,ch,:),1);
        sprint.ap_fit_1_30_phasic(night,ch,:) = nanmean(ap_fit_1_30_allep(phasic_epochs,ch,:),1);
        sprint.ap_fit_1_30_tonic(night,ch,:) = nanmean(ap_fit_1_30_allep(tonic_epochs,ch,:),1);
        sprint.ap_fit_1_30_nrem(night,ch,:) = nanmean(ap_fit_1_30_allep(nrem_epochs,ch,:),1);
        sprint.ap_fit_1_30_n1(night,ch,:) = nanmean(ap_fit_1_30_allep(n1_epochs,ch,:),1);
        sprint.ap_fit_1_30_n2(night,ch,:) = nanmean(ap_fit_1_30_allep(n2_epochs,ch,:),1);
        sprint.ap_fit_1_30_n3(night,ch,:) = nanmean(ap_fit_1_30_allep(n3_epochs,ch,:),1);
        sprint.ap_fit_1_30_wake(night,ch,:) = nanmean(ap_fit_1_30_allep(wake_epochs,ch,:),1);


        sprint.ap_fit_30_45_rem(night,ch,:) = nanmean(ap_fit_30_45_allep(rem_epochs,ch,:),1);
        sprint.ap_fit_30_45_phasic(night,ch,:) = nanmean(ap_fit_30_45_allep(phasic_epochs,ch,:),1);
        sprint.ap_fit_30_45_tonic(night,ch,:) = nanmean(ap_fit_30_45_allep(tonic_epochs,ch,:),1);
        sprint.ap_fit_30_45_nrem(night,ch,:) = nanmean(ap_fit_30_45_allep(nrem_epochs,ch,:),1);
        sprint.ap_fit_30_45_n1(night,ch,:) = nanmean(ap_fit_30_45_allep(n1_epochs,ch,:),1);
        sprint.ap_fit_30_45_n2(night,ch,:) = nanmean(ap_fit_30_45_allep(n2_epochs,ch,:),1);
        sprint.ap_fit_30_45_n3(night,ch,:) = nanmean(ap_fit_30_45_allep(n3_epochs,ch,:),1);
        sprint.ap_fit_30_45_wake(night,ch,:) = nanmean(ap_fit_30_45_allep(wake_epochs,ch,:),1);


        sprint.ap_fit_1_45_rem(night,ch,:) = nanmean(ap_fit_1_45_allep(rem_epochs,ch,:),1);
        sprint.ap_fit_1_45_phasic(night,ch,:) = nanmean(ap_fit_1_45_allep(phasic_epochs,ch,:),1);
        sprint.ap_fit_1_45_tonic(night,ch,:) = nanmean(ap_fit_1_45_allep(tonic_epochs,ch,:),1);
        sprint.ap_fit_1_45_nrem(night,ch,:) = nanmean(ap_fit_1_45_allep(nrem_epochs,ch,:),1);
        sprint.ap_fit_1_45_n1(night,ch,:) = nanmean(ap_fit_1_45_allep(n1_epochs,ch,:),1);
        sprint.ap_fit_1_45_n2(night,ch,:) = nanmean(ap_fit_1_45_allep(n2_epochs,ch,:),1);
        sprint.ap_fit_1_45_n3(night,ch,:) = nanmean(ap_fit_1_45_allep(n3_epochs,ch,:),1);
        sprint.ap_fit_1_45_wake(night,ch,:) = nanmean(ap_fit_1_45_allep(wake_epochs,ch,:),1);
        
                
         
        sprint.peak_fit_1_30_rem(night,ch,:) = nanmean(peak_fit_1_30_allep(rem_epochs,ch,:),1);
        sprint.peak_fit_1_30_phasic(night,ch,:) = nanmean(peak_fit_1_30_allep(phasic_epochs,ch,:),1);
        sprint.peak_fit_1_30_tonic(night,ch,:) = nanmean(peak_fit_1_30_allep(tonic_epochs,ch,:),1);
        sprint.peak_fit_1_30_nrem(night,ch,:) = nanmean(peak_fit_1_30_allep(nrem_epochs,ch,:),1);
        sprint.peak_fit_1_30_n1(night,ch,:) = nanmean(peak_fit_1_30_allep(n1_epochs,ch,:),1);
        sprint.peak_fit_1_30_n2(night,ch,:) = nanmean(peak_fit_1_30_allep(n2_epochs,ch,:),1);
        sprint.peak_fit_1_30_n3(night,ch,:) = nanmean(peak_fit_1_30_allep(n3_epochs,ch,:),1);
        sprint.peak_fit_1_30_wake(night,ch,:) = nanmean(peak_fit_1_30_allep(wake_epochs,ch,:),1);


        sprint.peak_fit_30_45_rem(night,ch,:) = nanmean(peak_fit_30_45_allep(rem_epochs,ch,:),1);
        sprint.peak_fit_30_45_phasic(night,ch,:) = nanmean(peak_fit_30_45_allep(phasic_epochs,ch,:),1);
        sprint.peak_fit_30_45_tonic(night,ch,:) = nanmean(peak_fit_30_45_allep(tonic_epochs,ch,:),1);
        sprint.peak_fit_30_45_nrem(night,ch,:) = nanmean(peak_fit_30_45_allep(nrem_epochs,ch,:),1);
        sprint.peak_fit_30_45_n1(night,ch,:) = nanmean(peak_fit_30_45_allep(n1_epochs,ch,:),1);
        sprint.peak_fit_30_45_n2(night,ch,:) = nanmean(peak_fit_30_45_allep(n2_epochs,ch,:),1);
        sprint.peak_fit_30_45_n3(night,ch,:) = nanmean(peak_fit_30_45_allep(n3_epochs,ch,:),1);
        sprint.peak_fit_30_45_wake(night,ch,:) = nanmean(peak_fit_30_45_allep(wake_epochs,ch,:),1);


        sprint.peak_fit_1_45_rem(night,ch,:) = nanmean(peak_fit_1_45_allep(rem_epochs,ch,:),1);
        sprint.peak_fit_1_45_phasic(night,ch,:) = nanmean(peak_fit_1_45_allep(phasic_epochs,ch,:),1);
        sprint.peak_fit_1_45_tonic(night,ch,:) = nanmean(peak_fit_1_45_allep(tonic_epochs,ch,:),1);
        sprint.peak_fit_1_45_nrem(night,ch,:) = nanmean(peak_fit_1_45_allep(nrem_epochs,ch,:),1);
        sprint.peak_fit_1_45_n1(night,ch,:) = nanmean(peak_fit_1_45_allep(n1_epochs,ch,:),1);
        sprint.peak_fit_1_45_n2(night,ch,:) = nanmean(peak_fit_1_45_allep(n2_epochs,ch,:),1);
        sprint.peak_fit_1_45_n3(night,ch,:) = nanmean(peak_fit_1_45_allep(n3_epochs,ch,:),1);
        sprint.peak_fit_1_45_wake(night,ch,:) = nanmean(peak_fit_1_45_allep(wake_epochs,ch,:),1);
        

        
        
        sprint.foofed_spectrum_1_30_rem(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(rem_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_phasic(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(phasic_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_tonic(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(tonic_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_nrem(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(nrem_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_n1(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(n1_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_n2(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(n2_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_n3(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(n3_epochs,ch,:),1);
        sprint.foofed_spectrum_1_30_wake(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(wake_epochs,ch,:),1);


        sprint.foofed_spectrum_30_45_rem(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(rem_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_phasic(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(phasic_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_tonic(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(tonic_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_nrem(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(nrem_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_n1(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(n1_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_n2(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(n2_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_n3(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(n3_epochs,ch,:),1);
        sprint.foofed_spectrum_30_45_wake(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(wake_epochs,ch,:),1);


        sprint.foofed_spectrum_1_45_rem(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(rem_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_phasic(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(phasic_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_tonic(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(tonic_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_nrem(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(nrem_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_n1(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(n1_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_n2(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(n2_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_n3(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(n3_epochs,ch,:),1);
        sprint.foofed_spectrum_1_45_wake(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(wake_epochs,ch,:),1);
        



        sprint.log_power_spectrum_1_30_rem(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(rem_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_phasic(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(phasic_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_tonic(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(tonic_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_nrem(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(nrem_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_n1(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n1_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_n2(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n2_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_n3(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n3_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_30_wake(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(wake_epochs,ch,:)),1);


        sprint.log_power_spectrum_30_45_rem(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(rem_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_phasic(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_tonic(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_nrem(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_n1(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n1_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_n2(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n2_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_n3(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n3_epochs,ch,:)),1);
        sprint.log_power_spectrum_30_45_wake(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(wake_epochs,ch,:)),1);


        sprint.log_power_spectrum_1_45_rem(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(rem_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_phasic(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_tonic(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_nrem(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_n1(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n1_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_n2(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n2_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_n3(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n3_epochs,ch,:)),1);
        sprint.log_power_spectrum_1_45_wake(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(wake_epochs,ch,:)),1);



        
        sprint.log_ap_fit_1_30_rem(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(rem_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_phasic(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(phasic_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_tonic(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(tonic_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_nrem(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(nrem_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_n1(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n1_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_n2(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n2_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_n3(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n3_epochs,ch,:)),1);
        sprint.log_ap_fit_1_30_wake(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(wake_epochs,ch,:)),1);


        sprint.log_ap_fit_30_45_rem(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(rem_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_phasic(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_tonic(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_nrem(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_n1(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n1_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_n2(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n2_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_n3(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n3_epochs,ch,:)),1);
        sprint.log_ap_fit_30_45_wake(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(wake_epochs,ch,:)),1);


        sprint.log_ap_fit_1_45_rem(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(rem_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_phasic(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_tonic(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_nrem(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_n1(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n1_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_n2(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n2_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_n3(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n3_epochs,ch,:)),1);
        sprint.log_ap_fit_1_45_wake(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(wake_epochs,ch,:)),1);
        
                
         
        sprint.log_peak_fit_1_30_rem(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(rem_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_phasic(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(phasic_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_tonic(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(tonic_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_nrem(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(nrem_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_n1(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n1_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_n2(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n2_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_n3(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n3_epochs,ch,:)),1);
        sprint.log_peak_fit_1_30_wake(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(wake_epochs,ch,:)),1);


        sprint.log_peak_fit_30_45_rem(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(rem_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_phasic(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_tonic(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_nrem(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_n1(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n1_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_n2(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n2_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_n3(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n3_epochs,ch,:)),1);
        sprint.log_peak_fit_30_45_wake(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(wake_epochs,ch,:)),1);


        sprint.log_peak_fit_1_45_rem(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(rem_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_phasic(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_tonic(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_nrem(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_n1(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n1_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_n2(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n2_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_n3(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n3_epochs,ch,:)),1);
        sprint.log_peak_fit_1_45_wake(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(wake_epochs,ch,:)),1);

        
        
        sprint.log_foofed_spectrum_1_30_rem(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(rem_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_phasic(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(phasic_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_tonic(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(tonic_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_nrem(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(nrem_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_n1(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(n1_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_n2(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(n2_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_n3(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(n3_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_30_wake(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(wake_epochs,ch,:)),1);


        sprint.log_foofed_spectrum_30_45_rem(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(rem_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_phasic(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_tonic(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_nrem(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_n1(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(n1_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_n2(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(n2_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_n3(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(n3_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_30_45_wake(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(wake_epochs,ch,:)),1);


        sprint.log_foofed_spectrum_1_45_rem(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(rem_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_phasic(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(phasic_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_tonic(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(tonic_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_nrem(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(nrem_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_n1(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(n1_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_n2(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(n2_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_n3(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(n3_epochs,ch,:)),1);
        sprint.log_foofed_spectrum_1_45_wake(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(wake_epochs,ch,:)),1);

        
        sprint.r_squared_1_30_rem(night,ch) = nanmean(r_squared_1_30_allep(rem_epochs,ch),1);
        sprint.r_squared_1_30_phasic(night,ch) = nanmean(r_squared_1_30_allep(phasic_epochs,ch),1);
        sprint.r_squared_1_30_tonic(night,ch) = nanmean(r_squared_1_30_allep(tonic_epochs,ch),1);
        sprint.r_squared_1_30_nrem(night,ch) = nanmean(r_squared_1_30_allep(nrem_epochs,ch),1);
        sprint.r_squared_1_30_n1(night,ch) = nanmean(r_squared_1_30_allep(n1_epochs,ch),1);
        sprint.r_squared_1_30_n2(night,ch) = nanmean(r_squared_1_30_allep(n2_epochs,ch),1);
        sprint.r_squared_1_30_n3(night,ch) = nanmean(r_squared_1_30_allep(n3_epochs,ch),1);
        sprint.r_squared_1_30_wake(night,ch) = nanmean(r_squared_1_30_allep(wake_epochs,ch),1);
        
        
        sprint.r_squared_30_45_rem(night,ch) = nanmean(r_squared_30_45_allep(rem_epochs,ch),1);
        sprint.r_squared_30_45_phasic(night,ch) = nanmean(r_squared_30_45_allep(phasic_epochs,ch),1);
        sprint.r_squared_30_45_tonic(night,ch) = nanmean(r_squared_30_45_allep(tonic_epochs,ch),1);
        sprint.r_squared_30_45_nrem(night,ch) = nanmean(r_squared_30_45_allep(nrem_epochs,ch),1);
        sprint.r_squared_30_45_n1(night,ch) = nanmean(r_squared_30_45_allep(n1_epochs,ch),1);
        sprint.r_squared_30_45_n2(night,ch) = nanmean(r_squared_30_45_allep(n2_epochs,ch),1);
        sprint.r_squared_30_45_n3(night,ch) = nanmean(r_squared_30_45_allep(n3_epochs,ch),1);
        sprint.r_squared_30_45_wake(night,ch) = nanmean(r_squared_30_45_allep(wake_epochs,ch),1);
        
        
        sprint.r_squared_1_45_rem(night,ch) = nanmean(r_squared_1_45_allep(rem_epochs,ch),1);
        sprint.r_squared_1_45_phasic(night,ch) = nanmean(r_squared_1_45_allep(phasic_epochs,ch),1);
        sprint.r_squared_1_45_tonic(night,ch) = nanmean(r_squared_1_45_allep(tonic_epochs,ch),1);
        sprint.r_squared_1_45_nrem(night,ch) = nanmean(r_squared_1_45_allep(nrem_epochs,ch),1);
        sprint.r_squared_1_45_n1(night,ch) = nanmean(r_squared_1_45_allep(n1_epochs,ch),1);
        sprint.r_squared_1_45_n2(night,ch) = nanmean(r_squared_1_45_allep(n2_epochs,ch),1);
        sprint.r_squared_1_45_n3(night,ch) = nanmean(r_squared_1_45_allep(n3_epochs,ch),1);
        sprint.r_squared_1_45_wake(night,ch) = nanmean(r_squared_1_45_allep(wake_epochs,ch),1);
        
        
        
        sprint.error_1_30_rem(night,ch) = nanmean(error_1_30_allep(rem_epochs,ch),1);
        sprint.error_1_30_phasic(night,ch) = nanmean(error_1_30_allep(phasic_epochs,ch),1);
        sprint.error_1_30_tonic(night,ch) = nanmean(error_1_30_allep(tonic_epochs,ch),1);
        sprint.error_1_30_nrem(night,ch) = nanmean(error_1_30_allep(nrem_epochs,ch),1);
        sprint.error_1_30_n1(night,ch) = nanmean(error_1_30_allep(n1_epochs,ch),1);
        sprint.error_1_30_n2(night,ch) = nanmean(error_1_30_allep(n2_epochs,ch),1);
        sprint.error_1_30_n3(night,ch) = nanmean(error_1_30_allep(n3_epochs,ch),1);
        sprint.error_1_30_wake(night,ch) = nanmean(error_1_30_allep(wake_epochs,ch),1);
        
        
        sprint.error_30_45_rem(night,ch) = nanmean(error_30_45_allep(rem_epochs,ch),1);
        sprint.error_30_45_phasic(night,ch) = nanmean(error_30_45_allep(phasic_epochs,ch),1);
        sprint.error_30_45_tonic(night,ch) = nanmean(error_30_45_allep(tonic_epochs,ch),1);
        sprint.error_30_45_nrem(night,ch) = nanmean(error_30_45_allep(nrem_epochs,ch),1);
        sprint.error_30_45_n1(night,ch) = nanmean(error_30_45_allep(n1_epochs,ch),1);
        sprint.error_30_45_n2(night,ch) = nanmean(error_30_45_allep(n2_epochs,ch),1);
        sprint.error_30_45_n3(night,ch) = nanmean(error_30_45_allep(n3_epochs,ch),1);
        sprint.error_30_45_wake(night,ch) = nanmean(error_30_45_allep(wake_epochs,ch),1);
        
        
        sprint.error_1_45_rem(night,ch) = nanmean(error_1_45_allep(rem_epochs,ch),1);
        sprint.error_1_45_phasic(night,ch) = nanmean(error_1_45_allep(phasic_epochs,ch),1);
        sprint.error_1_45_tonic(night,ch) = nanmean(error_1_45_allep(tonic_epochs,ch),1);
        sprint.error_1_45_nrem(night,ch) = nanmean(error_1_45_allep(nrem_epochs,ch),1);
        sprint.error_1_45_n1(night,ch) = nanmean(error_1_45_allep(n1_epochs,ch),1);
        sprint.error_1_45_n2(night,ch) = nanmean(error_1_45_allep(n2_epochs,ch),1);
        sprint.error_1_45_n3(night,ch) = nanmean(error_1_45_allep(n3_epochs,ch),1);
        sprint.error_1_45_wake(night,ch) = nanmean(error_1_45_allep(wake_epochs,ch),1);
        
      %% SWA and spindle power
 
        sprint.swa_rem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(rem_epochs,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_phasic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(phasic_epochs,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_tonic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(tonic_epochs,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_nrem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(nrem_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_n1(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n1_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_n2(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n2_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_n3(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n3_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        sprint.swa_wake(night,ch) = nanmean(sum(power_spectrum_1_30_allep(wake_epochs,ch,swa_ndx),3).*freq_resolution,1);
            
            
        sprint.spindle_power_rem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(rem_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_phasic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(phasic_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_tonic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(tonic_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_nrem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(nrem_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_n1(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n1_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_n2(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n2_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_n3(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n3_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        sprint.spindle_power_wake(night,ch) = nanmean(sum(power_spectrum_1_30_allep(wake_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);


        %%      density and abundance 

        if ~isempty(waves_allepch)
        waves_ch = waves_allepch(find(waves_allepch.channel == ch),:);
  
 
        freq_ndx = find(waves_ch.frequency > lower_freq & waves_ch.frequency < higher_freq);

        waves_wake_ndx = find(string(waves_ch.stage) == 'W');
        waves_n1_ndx = find(string(waves_ch.stage) == '1');
        waves_nrem_ndx = find(string(waves_ch.stage) == '2' | string(waves_ch.stage) == '3' | string(waves_ch.stage) == '4');
        waves_rem_ndx = find(string(waves_ch.stage) == 'R');
        waves_phasic_ndx = find(string(waves_ch.substage) == 'P');
        waves_tonic_ndx = find(string(waves_ch.substage) == 'T');
        
                 
        waves_wake_freq_ndx = intersect(waves_wake_ndx, freq_ndx);
        waves_wake_freq = waves_ch(waves_wake_freq_ndx,:);
    
        waves_nrem_freq_ndx = intersect(waves_nrem_ndx, freq_ndx);
        waves_nrem_freq = waves_ch(waves_nrem_freq_ndx,:);
    
        waves_rem_freq_ndx = intersect(waves_rem_ndx, freq_ndx);
        waves_rem_freq = waves_ch(waves_rem_freq_ndx,:);

        waves_phasic_freq_ndx = intersect(waves_phasic_ndx, freq_ndx);
        waves_phasic_freq = waves_ch(waves_phasic_freq_ndx,:); 
        
        waves_tonic_freq_ndx = intersect(waves_tonic_ndx, freq_ndx);
        waves_tonic_freq = waves_ch(waves_tonic_freq_ndx,:); 
        
        
        [den_alpha amp_alpha] = calculate_abu_den_sprint_vj(waves_ch, lower_freq_alpha, higher_freq_alpha,waves_rem_freq_ndx, rem_epochs, waves_phasic_freq_ndx, phasic_goodndx, waves_tonic_freq_ndx, tonic_goodndx, waves_nrem_freq_ndx, nrem_epochs, waves_wake_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep); 
        [den_theta amp_theta] = calculate_abu_den_sprint_vj(waves_ch, lower_freq_theta, higher_freq_theta,waves_rem_freq_ndx, rem_epochs, waves_phasic_freq_ndx, phasic_goodndx, waves_tonic_freq_ndx, tonic_goodndx, waves_nrem_freq_ndx, nrem_epochs, waves_wake_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep); 
        [den_spindles amp_spindles] = calculate_abu_den_sprint_vj(waves_ch, lower_freq_spindles, higher_freq_spindles,waves_rem_freq_ndx, rem_epochs, waves_phasic_freq_ndx, phasic_goodndx, waves_tonic_freq_ndx, tonic_goodndx, waves_nrem_freq_ndx, nrem_epochs, waves_wake_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep); 
        
        sprint.alpha_rem_den(night,ch) = den_alpha.rem_density;
        sprint.theta_rem_den(night,ch) = den_theta.rem_density;
        sprint.spindles_rem_den(night,ch) = den_spindles.rem_density;

        sprint.alpha_phasic_den(night,ch) = den_alpha.phasic_density;
        sprint.theta_phasic_den(night,ch) = den_theta.phasic_density;
        sprint.spindles_phasic_den(night,ch) = den_spindles.phasic_density;

        sprint.alpha_tonic_den(night,ch) = den_alpha.tonic_density;
        sprint.theta_tonic_den(night,ch) = den_theta.tonic_density;
        sprint.spindles_tonic_den(night,ch) = den_spindles.tonic_density;

        sprint.alpha_nrem_den(night,ch) = den_alpha.nrem_density;
        sprint.theta_nrem_den(night,ch) = den_theta.nrem_density;
        sprint.spindles_nrem_den(night,ch) = den_spindles.nrem_density;

        sprint.alpha_wake_den(night,ch) = den_alpha.wake_density;
        sprint.theta_wake_den(night,ch) = den_theta.wake_density;
        sprint.spindles_wake_den(night,ch) = den_spindles.wake_density;
        
        sprint.alpha_rem_snr(night,ch) = amp_alpha.rem_amp;
        sprint.theta_rem_snr(night,ch) = amp_theta.rem_amp;
        sprint.spindles_rem_snr(night,ch) = amp_spindles.rem_amp;

        sprint.alpha_phasic_snr(night,ch) = amp_alpha.phasic_amp;
        sprint.theta_phasic_snr(night,ch) = amp_theta.phasic_amp;
        sprint.spindles_phasic_snr(night,ch) = amp_spindles.phasic_amp;

        sprint.alpha_tonic_snr(night,ch) = amp_alpha.tonic_amp;
        sprint.theta_tonic_snr(night,ch) = amp_theta.tonic_amp;
        sprint.spindles_tonic_snr(night,ch) = amp_spindles.tonic_amp;

        sprint.alpha_nrem_snr(night,ch) = amp_alpha.nrem_amp;
        sprint.theta_nrem_snr(night,ch) = amp_theta.nrem_amp;
        sprint.spindles_nrem_snr(night,ch) = amp_spindles.nrem_amp;

        sprint.alpha_wake_snr(night,ch) = amp_alpha.wake_amp;
        sprint.theta_wake_snr(night,ch) = amp_theta.wake_amp;
        sprint.spindles_wake_snr(night,ch) = amp_spindles.wake_amp;
        
     
        
        clear den_alpha abu_alpha amp_alpha den_theta abu_theta amp_theta den_spindles abu_spindles amp_spindles snr_alpha snr_theta snr_spindles
  
%%
        waves_phasic_freq_alpha_ndx = find(waves_phasic_freq.frequency > lower_freq_alpha & waves_phasic_freq.frequency < higher_freq_alpha);
        waves_phasic_freq_alpha = waves_phasic_freq(waves_phasic_freq_alpha_ndx,:);
        waves_phasic_freq_alpha_nminiep = unique(waves_phasic_freq_alpha.n_mini_ep);
        sprint.peak_fit_1_30_phasic_alphawaves(night,ch,:) = nanmean(peak_fit_1_30_allep(waves_phasic_freq_alpha_nminiep,ch,:),1);
        
        waves_phasic_freq_theta_ndx = find(waves_phasic_freq.frequency > lower_freq_theta & waves_phasic_freq.frequency < higher_freq_theta);
        waves_phasic_freq_theta = waves_phasic_freq(waves_phasic_freq_theta_ndx,:);
        waves_phasic_freq_theta_nminiep = unique(waves_phasic_freq_theta.n_mini_ep);
        sprint.peak_fit_1_30_phasic_thetawaves(night,ch,:) = nanmean(peak_fit_1_30_allep(waves_phasic_freq_theta_nminiep,ch,:),1);
        
        waves_tonic_freq_alpha_ndx = find(waves_tonic_freq.frequency > lower_freq_alpha & waves_tonic_freq.frequency < higher_freq_alpha);
        waves_tonic_freq_alpha = waves_tonic_freq(waves_tonic_freq_alpha_ndx,:);
        waves_tonic_freq_alpha_nminiep = unique(waves_tonic_freq_alpha.n_mini_ep);
        sprint.peak_fit_1_30_tonic_alphawaves(night,ch,:) = nanmean(peak_fit_1_30_allep(waves_tonic_freq_alpha_nminiep,ch,:),1);
        
        waves_tonic_freq_theta_ndx = find(waves_tonic_freq.frequency > lower_freq_theta & waves_tonic_freq.frequency < higher_freq_theta);
        waves_tonic_freq_theta = waves_tonic_freq(waves_tonic_freq_theta_ndx,:);
        waves_tonic_freq_theta_nminiep = unique(waves_tonic_freq_theta.n_mini_ep);
        sprint.peak_fit_1_30_tonic_thetawaves(night,ch,:) = nanmean(peak_fit_1_30_allep(waves_tonic_freq_theta_nminiep,ch,:),1);
        
        clear  waves_phasic_freq_alpha_ndx waves_phasic_freq_alpha  waves_phasic_freq_alpha_nminiep
        clear  waves_phasic_freq_theta_ndx waves_phasic_freq_theta waves_phasic_freq_theta_nminiep
        
        clear  waves_tonic_freq_alpha_ndx waves_tonic_freq_alpha  waves_tonic_freq_alpha_nminiep
        clear  waves_tonic_freq_theta_ndx waves_tonic_freq_theta waves_tonic_freq_theta_nminiep
        
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

        if ~isempty(waves_wake_freq)
        [IAPF_wake ITPF_wake ISPF_wake IAPF_wake_height ITPF_wake_height ISPF_wake_height] = peak_detection_vj(waves_wake_freq, peak_thresh, lower_freq_alpha,...
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
        
        if ~isempty(waves_rem_freq)
        [IAPF_rem ITPF_rem ISPF_rem IAPF_rem_height ITPF_rem_height ISPF_rem_height] = peak_detection_vj(waves_rem_freq, peak_thresh, lower_freq_alpha,...
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
        
        if ~isempty(waves_phasic_freq)
        [IAPF_phasic ITPF_phasic ISPF_phasic IAPF_phasic_height ITPF_phasic_height ISPF_phasic_height] = peak_detection_vj(waves_phasic_freq, peak_thresh, lower_freq_alpha,...
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

        if ~isempty(waves_tonic_freq) 
        [IAPF_tonic ITPF_tonic ISPF_tonic IAPF_tonic_height ITPF_tonic_height ISPF_tonic_height] = peak_detection_vj(waves_tonic_freq, peak_thresh, lower_freq_alpha,...
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
        
        if ~isempty(waves_nrem_freq) 
        [IAPF_nrem ITPF_nrem ISPF_nrem IAPF_nrem_height ITPF_nrem_height ISPF_nrem_height] = peak_detection_vj(waves_nrem_freq, peak_thresh, lower_freq_alpha,...
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
        sprint.IAPF_wake_all(night,ch) = IAPF_wake;
        sprint.IAPF_rem_all(night,ch) = IAPF_rem;
        sprint.IAPF_phasic_all(night,ch) = IAPF_phasic;
        sprint.IAPF_tonic_all(night,ch) = IAPF_tonic;
        sprint.IAPF_nrem_all(night,ch) = IAPF_nrem;
        
        sprint.ITPF_wake_all(night,ch) = ITPF_wake;
        sprint.ITPF_rem_all(night,ch) = ITPF_rem;
        sprint.ITPF_phasic_all(night,ch) = ITPF_phasic;
        sprint.ITPF_tonic_all(night,ch) = ITPF_tonic;
        sprint.ITPF_nrem_all(night,ch) = ITPF_nrem;
        
        sprint.ISPF_wake_all(night,ch) = ISPF_wake;
        sprint.ISPF_rem_all(night,ch) = ISPF_rem;
        sprint.ISPF_phasic_all(night,ch) = ISPF_phasic;
        sprint.ISPF_tonic_all(night,ch) = ISPF_tonic;
        sprint.ISPF_nrem_all(night,ch) = ISPF_nrem;
                
        sprint.IAPF_wake_height_all(night,ch) = IAPF_wake_height;   
        sprint.IAPF_rem_height_all(night,ch) = IAPF_rem_height;
        sprint.IAPF_phasic_height_all(night,ch) = IAPF_phasic_height;
        sprint.IAPF_tonic_height_all(night,ch) = IAPF_tonic_height;
        sprint.IAPF_nrem_height_all(night,ch) = IAPF_nrem_height;
        
        sprint.ITPF_wake_height_all(night,ch) = ITPF_wake_height;
        sprint.ITPF_rem_height_all(night,ch) = ITPF_rem_height;
        sprint.ITPF_phasic_height_all(night,ch) = ITPF_phasic_height;
        sprint.ITPF_tonic_height_all(night,ch) = ITPF_tonic_height;
        sprint.ITPF_nrem_height_all(night,ch) = ITPF_nrem_height;
        
        sprint.ISPF_wake_height_all(night,ch) = ISPF_wake_height;
        sprint.ISPF_rem_height_all(night,ch) = ISPF_rem_height;
        sprint.ISPF_phasic_height_all(night,ch) = ISPF_phasic_height;
        sprint.ISPF_tonic_height_all(night,ch) = ISPF_tonic_height;
        sprint.ISPF_nrem_height_all(night,ch) = ISPF_nrem_height;
        
        
        clear IAPF_wake IAPF_rem IAPF_nrem ITPF_wake ITPF_rem ITPF_nrem ISPF_wake ISPF_rem ISPF_nrem waves_ch
        clear IAPF_wake_height IAPF_rem_height IAPF_nrem_height ITPF_wake_height ITPF_rem_height ITPF_nrem_height ISPF_wake_height ISPF_rem_height ISPF_nrem_height waves_ch
       

      
        end

        end

       clear hypno_aligned2 hypno3 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phato phasic_epochs tonic_epochs art_epochs 


       clear offset_1_30_allep offset_30_45_allep offset_1_45_allep exponent_1_30_allep exponent_30_45_allep exponent_1_45_allep
 
       clear foofed_spectrum_1_30_allep ap_fit_1_30_allep peak_fit_1_30_allep power_spectrum_1_30_allep
       clear foofed_spectrum_30_45_allep ap_fit_30_45_allep peak_fit_30_45_allep power_spectrum_30_45_allep
       clear foofed_spectrum_1_45_allep ap_fit_1_45_allep peak_fit_1_45_allep power_spectrum_1_45_allep
       
       clear log_foofed_spectrum_1_30_allep log_ap_fit_1_30_allep log_peak_fit_1_30_allep log_power_spectrum_1_30_allep
       clear log_foofed_spectrum_30_45_allep log_ap_fit_30_45_allep log__peak_fit_30_45_allep log_power_spectrum_30_45_allep
       clear log_foofed_spectrum_1_45_allep log_ap_fit_1_45_allep log_peak_fit_1_45_allep log_power_spectrum_1_45_allep
       
       clear r_squared_1_30_allep error_1_30_allep
       clear r_squared_30_45_allep error_30_45_allep
       clear r_squared_1_45_allep error_1_45_allep
     
    end

    save([Savefolder, filename(1:12),'_sprint_allnights.mat'],'sprint')

    clear sprint
% end

       
display('the end');

catch exception
    display(exception.message)
    display(exception.identifier)
    error()
end
    
    
end

