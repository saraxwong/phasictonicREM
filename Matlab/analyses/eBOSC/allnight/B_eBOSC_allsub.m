function B_eBOSC_allsub(s)

try

% clear all;
% close all;

% s = 1;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

waves_folder = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/';
waves_folder_dir = dir([waves_folder,'AFOSR*'])


for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/allsub/';

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
eBOSC.exponent_1_30_rem = NaN(18,8);
eBOSC.exponent_1_30_phasic = NaN(18,8);
eBOSC.exponent_1_30_tonic = NaN(18,8);
eBOSC.exponent_1_30_nrem = NaN(18,8);
eBOSC.exponent_1_30_n1 = NaN(18,8);
eBOSC.exponent_1_30_n2 = NaN(18,8);
eBOSC.exponent_1_30_n3 = NaN(18,8);
eBOSC.exponent_1_30_wake = NaN(18,8);

eBOSC.exponent_30_45_rem = NaN(18,8);
eBOSC.exponent_30_45_phasic = NaN(18,8);
eBOSC.exponent_30_45_tonic = NaN(18,8);
eBOSC.exponent_30_45_nrem = NaN(18,8);
eBOSC.exponent_30_45_n1 = NaN(18,8);
eBOSC.exponent_30_45_n2 = NaN(18,8);
eBOSC.exponent_30_45_n3 = NaN(18,8);
eBOSC.exponent_30_45_wake = NaN(18,8);

eBOSC.exponent_1_45_rem = NaN(18,8);
eBOSC.exponent_1_45_phasic = NaN(18,8);
eBOSC.exponent_1_45_tonic = NaN(18,8);
eBOSC.exponent_1_45_nrem = NaN(18,8);
eBOSC.exponent_1_45_n1 = NaN(18,8);
eBOSC.exponent_1_45_n2 = NaN(18,8);
eBOSC.exponent_1_45_n3 = NaN(18,8);
eBOSC.exponent_1_45_wake = NaN(18,8);


eBOSC.offset_1_30_rem = NaN(18,8);
eBOSC.offset_1_30_phasic = NaN(18,8);
eBOSC.offset_1_30_tonic = NaN(18,8);
eBOSC.offset_1_30_nrem = NaN(18,8);
eBOSC.offset_1_30_n1 = NaN(18,8);
eBOSC.offset_1_30_n2 = NaN(18,8);
eBOSC.offset_1_30_n3 = NaN(18,8);
eBOSC.offset_1_30_wake = NaN(18,8);

eBOSC.offset_30_45_rem = NaN(18,8);
eBOSC.offset_30_45_phasic = NaN(18,8);
eBOSC.offset_30_45_tonic = NaN(18,8);
eBOSC.offset_30_45_nrem = NaN(18,8);
eBOSC.offset_30_45_n1 = NaN(18,8);
eBOSC.offset_30_45_n2 = NaN(18,8);
eBOSC.offset_30_45_n3 = NaN(18,8);
eBOSC.offset_30_45_wake = NaN(18,8);

eBOSC.offset_1_45_rem = NaN(18,8);
eBOSC.offset_1_45_phasic = NaN(18,8);
eBOSC.offset_1_45_tonic = NaN(18,8);
eBOSC.offset_1_45_nrem = NaN(18,8);
eBOSC.offset_1_45_n1 = NaN(18,8);
eBOSC.offset_1_45_n2 = NaN(18,8);
eBOSC.offset_1_45_n3 = NaN(18,8);
eBOSC.offset_1_45_wake = NaN(18,8);


eBOSC.power_spectrum_1_30_rem = NaN(18,8,117);
eBOSC.power_spectrum_1_30_phasic = NaN(18,8,117);
eBOSC.power_spectrum_1_30_tonic = NaN(18,8,117);
eBOSC.power_spectrum_1_30_nrem = NaN(18,8,117);
eBOSC.power_spectrum_1_30_n1 = NaN(18,8,117);
eBOSC.power_spectrum_1_30_n2 = NaN(18,8,117);
eBOSC.power_spectrum_1_30_n3 = NaN(18,8,117);
eBOSC.power_spectrum_1_30_wake = NaN(18,8,117);

eBOSC.power_spectrum_30_45_rem = NaN(18,8,61);
eBOSC.power_spectrum_30_45_phasic = NaN(18,8,61);
eBOSC.power_spectrum_30_45_tonic = NaN(18,8,61);
eBOSC.power_spectrum_30_45_nrem = NaN(18,8,61);
eBOSC.power_spectrum_30_45_n1 = NaN(18,8,61);
eBOSC.power_spectrum_30_45_n2 = NaN(18,8,61);
eBOSC.power_spectrum_30_45_n3 = NaN(18,8,61);
eBOSC.power_spectrum_30_45_wake = NaN(18,8,61);

eBOSC.power_spectrum_1_45_rem = NaN(18,8,177);
eBOSC.power_spectrum_1_45_phasic = NaN(18,8,177);
eBOSC.power_spectrum_1_45_tonic = NaN(18,8,177);
eBOSC.power_spectrum_1_45_nrem = NaN(18,8,177);
eBOSC.power_spectrum_1_45_n1 = NaN(18,8,177);
eBOSC.power_spectrum_1_45_n2 = NaN(18,8,177);
eBOSC.power_spectrum_1_45_n3 = NaN(18,8,177);
eBOSC.power_spectrum_1_45_wake = NaN(18,8,177);


eBOSC.ap_fit_1_30_rem = NaN(18,8,117);
eBOSC.ap_fit_1_30_phasic = NaN(18,8,117);
eBOSC.ap_fit_1_30_tonic = NaN(18,8,117);
eBOSC.ap_fit_1_30_nrem = NaN(18,8,117);
eBOSC.ap_fit_1_30_n1 = NaN(18,8,117);
eBOSC.ap_fit_1_30_n2 = NaN(18,8,117);
eBOSC.ap_fit_1_30_n3 = NaN(18,8,117);
eBOSC.ap_fit_1_30_wake = NaN(18,8,117);

eBOSC.ap_fit_30_45_rem = NaN(18,8,61);
eBOSC.ap_fit_30_45_phasic = NaN(18,8,61);
eBOSC.ap_fit_30_45_tonic = NaN(18,8,61);
eBOSC.ap_fit_30_45_nrem = NaN(18,8,61);
eBOSC.ap_fit_30_45_n1 = NaN(18,8,61);
eBOSC.ap_fit_30_45_n2 = NaN(18,8,61);
eBOSC.ap_fit_30_45_n3 = NaN(18,8,61);
eBOSC.ap_fit_30_45_wake = NaN(18,8,61);

eBOSC.ap_fit_1_45_rem = NaN(18,8,177);
eBOSC.ap_fit_1_45_phasic = NaN(18,8,177);
eBOSC.ap_fit_1_45_tonic = NaN(18,8,177);
eBOSC.ap_fit_1_45_nrem = NaN(18,8,177);
eBOSC.ap_fit_1_45_n1 = NaN(18,8,177);
eBOSC.ap_fit_1_45_n2 = NaN(18,8,177);
eBOSC.ap_fit_1_45_n3 = NaN(18,8,177);
eBOSC.ap_fit_1_45_wake = NaN(18,8,177);

eBOSC.peak_fit_1_30_rem = NaN(18,8,117);
eBOSC.peak_fit_1_30_phasic = NaN(18,8,117);
eBOSC.peak_fit_1_30_tonic = NaN(18,8,117);
eBOSC.peak_fit_1_30_nrem = NaN(18,8,117);
eBOSC.peak_fit_1_30_n1 = NaN(18,8,117);
eBOSC.peak_fit_1_30_n2 = NaN(18,8,117);
eBOSC.peak_fit_1_30_n3 = NaN(18,8,117);
eBOSC.peak_fit_1_30_wake = NaN(18,8,117);

eBOSC.peak_fit_30_45_rem = NaN(18,8,61);
eBOSC.peak_fit_30_45_phasic = NaN(18,8,61);
eBOSC.peak_fit_30_45_tonic = NaN(18,8,61);
eBOSC.peak_fit_30_45_nrem = NaN(18,8,61);
eBOSC.peak_fit_30_45_n1 = NaN(18,8,61);
eBOSC.peak_fit_30_45_n2 = NaN(18,8,61);
eBOSC.peak_fit_30_45_n3 = NaN(18,8,61);
eBOSC.peak_fit_30_45_wake = NaN(18,8,61);

eBOSC.peak_fit_1_45_rem = NaN(18,8,177);
eBOSC.peak_fit_1_45_phasic = NaN(18,8,177);
eBOSC.peak_fit_1_45_tonic = NaN(18,8,177);
eBOSC.peak_fit_1_45_nrem = NaN(18,8,177);
eBOSC.peak_fit_1_45_n1 = NaN(18,8,177);
eBOSC.peak_fit_1_45_n2 = NaN(18,8,177);
eBOSC.peak_fit_1_45_n3 = NaN(18,8,177);
eBOSC.peak_fit_1_45_wake = NaN(18,8,177);


eBOSC.log_power_spectrum_1_30_rem = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_phasic = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_tonic = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_nrem = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_n1 = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_n2 = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_n3 = NaN(18,8,117);
eBOSC.log_power_spectrum_1_30_wake = NaN(18,8,117);

eBOSC.log_power_spectrum_30_45_rem = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_phasic = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_tonic = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_nrem = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_n1 = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_n2 = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_n3 = NaN(18,8,61);
eBOSC.log_power_spectrum_30_45_wake = NaN(18,8,61);

eBOSC.log_power_spectrum_1_45_rem = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_phasic = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_tonic = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_nrem = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_n1 = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_n2 = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_n3 = NaN(18,8,177);
eBOSC.log_power_spectrum_1_45_wake = NaN(18,8,177);


eBOSC.log_ap_fit_1_30_rem = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_phasic = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_tonic = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_nrem = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_n1 = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_n2 = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_n3 = NaN(18,8,117);
eBOSC.log_ap_fit_1_30_wake = NaN(18,8,117);

eBOSC.log_ap_fit_30_45_rem = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_phasic = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_tonic = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_nrem = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_n1 = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_n2 = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_n3 = NaN(18,8,61);
eBOSC.log_ap_fit_30_45_wake = NaN(18,8,61);

eBOSC.log_ap_fit_1_45_rem = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_phasic = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_tonic = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_nrem = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_n1 = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_n2 = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_n3 = NaN(18,8,177);
eBOSC.log_ap_fit_1_45_wake = NaN(18,8,177);

eBOSC.log_peak_fit_1_30_rem = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_phasic = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_tonic = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_nrem = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_n1 = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_n2 = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_n3 = NaN(18,8,117);
eBOSC.log_peak_fit_1_30_wake = NaN(18,8,117);

eBOSC.log_peak_fit_30_45_rem = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_phasic = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_tonic = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_nrem = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_n1 = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_n2 = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_n3 = NaN(18,8,61);
eBOSC.log_peak_fit_30_45_wake = NaN(18,8,61);

eBOSC.log_peak_fit_1_45_rem = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_phasic = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_tonic = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_nrem = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_n1 = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_n2 = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_n3 = NaN(18,8,177);
eBOSC.log_peak_fit_1_45_wake = NaN(18,8,177);

eBOSC.r_squared_1_30_rem = NaN(18,8);
eBOSC.r_squared_1_30_phasic = NaN(18,8);
eBOSC.r_squared_1_30_tonic = NaN(18,8);
eBOSC.r_squared_1_30_nrem = NaN(18,8);
eBOSC.r_squared_1_30_n1 = NaN(18,8);
eBOSC.r_squared_1_30_n2 = NaN(18,8);
eBOSC.r_squared_1_30_n3 = NaN(18,8);
eBOSC.r_squared_1_30_wake = NaN(18,8);

eBOSC.r_squared_30_45_rem = NaN(18,8);
eBOSC.r_squared_30_45_phasic = NaN(18,8);
eBOSC.r_squared_30_45_tonic = NaN(18,8);
eBOSC.r_squared_30_45_nrem = NaN(18,8);
eBOSC.r_squared_30_45_n1 = NaN(18,8);
eBOSC.r_squared_30_45_n2 = NaN(18,8);
eBOSC.r_squared_30_45_n3 = NaN(18,8);
eBOSC.r_squared_30_45_wake = NaN(18,8);

eBOSC.r_squared_1_45_rem = NaN(18,8);
eBOSC.r_squared_1_45_phasic = NaN(18,8);
eBOSC.r_squared_1_45_tonic = NaN(18,8);
eBOSC.r_squared_1_45_nrem = NaN(18,8);
eBOSC.r_squared_1_45_n1 = NaN(18,8);
eBOSC.r_squared_1_45_n2 = NaN(18,8);
eBOSC.r_squared_1_45_n3 = NaN(18,8);
eBOSC.r_squared_1_45_wake = NaN(18,8);


eBOSC.error_1_30_rem = NaN(18,8);
eBOSC.error_1_30_phasic = NaN(18,8);
eBOSC.error_1_30_tonic = NaN(18,8);
eBOSC.error_1_30_nrem = NaN(18,8);
eBOSC.error_1_30_n1 = NaN(18,8);
eBOSC.error_1_30_n2 = NaN(18,8);
eBOSC.error_1_30_n3 = NaN(18,8);
eBOSC.error_1_30_wake = NaN(18,8);

eBOSC.error_30_45_rem = NaN(18,8);
eBOSC.error_30_45_phasic = NaN(18,8);
eBOSC.error_30_45_tonic = NaN(18,8);
eBOSC.error_30_45_nrem = NaN(18,8);
eBOSC.error_30_45_n1 = NaN(18,8);
eBOSC.error_30_45_n2 = NaN(18,8);
eBOSC.error_30_45_n3 = NaN(18,8);
eBOSC.error_30_45_wake = NaN(18,8);

eBOSC.error_1_45_rem = NaN(18,8);
eBOSC.error_1_45_phasic = NaN(18,8);
eBOSC.error_1_45_tonic = NaN(18,8);
eBOSC.error_1_45_nrem = NaN(18,8);
eBOSC.error_1_45_n1 = NaN(18,8);
eBOSC.error_1_45_n2 = NaN(18,8);
eBOSC.error_1_45_n3 = NaN(18,8);
eBOSC.error_1_45_wake = NaN(18,8);

%%

eBOSC.swa_rem = NaN(18,8);
eBOSC.swa_phasic = NaN(18,8);
eBOSC.swa_tonic = NaN(18,8);
eBOSC.swa_nrem = NaN(18,8);
eBOSC.swa_n1 = NaN(18,8);
eBOSC.swa_n2 = NaN(18,8);
eBOSC.swa_n3 = NaN(18,8);
eBOSC.swa_wake = NaN(18,8);

eBOSC.spindle_power_rem = NaN(18,8);
eBOSC.spindle_power_phasic = NaN(18,8);
eBOSC.spindle_power_tonic = NaN(18,8);
eBOSC.spindle_power_nrem = NaN(18,8);
eBOSC.spindle_power_n1 = NaN(18,8);
eBOSC.spindle_power_n2 = NaN(18,8);
eBOSC.spindle_power_n3 = NaN(18,8);
eBOSC.spindle_power_wake = NaN(18,8);


eBOSC.IAPF_wake_all = NaN(18,8);
eBOSC.IAPF_rem_all = NaN(18,8);
eBOSC.IAPF_phasic_all = NaN(18,8);
eBOSC.IAPF_tonic_all = NaN(18,8);
eBOSC.IAPF_nrem_all = NaN(18,8);

eBOSC.ITPF_wake_all = NaN(18,8);
eBOSC.ITPF_rem_all = NaN(18,8);
eBOSC.ITPF_phasic_all = NaN(18,8);
eBOSC.ITPF_tonic_all = NaN(18,8);
eBOSC.ITPF_nrem_all = NaN(18,8);

eBOSC.ISPF_wake_all = NaN(18,8);
eBOSC.ISPF_rem_all = NaN(18,8);
eBOSC.ISPF_phasic_all = NaN(18,8);
eBOSC.ISPF_tonic_all = NaN(18,8);
eBOSC.ISPF_nrem_all = NaN(18,8);

eBOSC.IAPF_wake_height_all = NaN(18,8);
eBOSC.IAPF_rem_height_all = NaN(18,8);
eBOSC.IAPF_phasic_height_all = NaN(18,8);
eBOSC.IAPF_tonic_height_all = NaN(18,8);
eBOSC.IAPF_nrem_height_all = NaN(18,8);

eBOSC.ITPF_wake_height_all = NaN(18,8);
eBOSC.ITPF_rem_height_all = NaN(18,8);
eBOSC.ITPF_phasic_height_all = NaN(18,8);
eBOSC.ITPF_tonic_height_all = NaN(18,8);
eBOSC.ITPF_nrem_height_all = NaN(18,8);

eBOSC.ISPF_wake_height_all = NaN(18,8);
eBOSC.ISPF_rem_height_all = NaN(18,8);
eBOSC.ISPF_phasic_height_all = NaN(18,8);
eBOSC.ISPF_tonic_height_all = NaN(18,8);
eBOSC.ISPF_nrem_height_all = NaN(18,8);

eBOSC.alpha_rem_den = NaN(18,8);
eBOSC.theta_rem_den = NaN(18,8);
eBOSC.spindles_rem_den = NaN(18,8);

eBOSC.alpha_phasic_den = NaN(18,8);
eBOSC.theta_phasic_den = NaN(18,8);
eBOSC.spindles_phasic_den = NaN(18,8);

eBOSC.alpha_tonic_den = NaN(18,8);
eBOSC.theta_tonic_den = NaN(18,8);
eBOSC.spindles_tonic_den = NaN(18,8);

eBOSC.alpha_nrem_den = NaN(18,8);
eBOSC.theta_nrem_den = NaN(18,8);
eBOSC.spindles_nrem_den = NaN(18,8);

eBOSC.alpha_wake_den = NaN(18,8);
eBOSC.theta_wake_den = NaN(18,8);
eBOSC.spindles_wake_den = NaN(18,8);


eBOSC.alpha_rem_abu = NaN(18,8);
eBOSC.theta_rem_abu = NaN(18,8);
eBOSC.spindles_rem_abu = NaN(18,8);


eBOSC.alpha_rem_snr = NaN(18,8);
eBOSC.theta_rem_snr = NaN(18,8);
eBOSC.spindles_rem_snr = NaN(18,8);

eBOSC.alpha_phasic_snr = NaN(18,8);
eBOSC.theta_phasic_snr = NaN(18,8);
eBOSC.spindles_phasic_snr = NaN(18,8);

eBOSC.alpha_tonic_snr = NaN(18,8);
eBOSC.theta_tonic_snr = NaN(18,8);
eBOSC.spindles_tonic_snr = NaN(18,8);

eBOSC.alpha_nrem_snr = NaN(18,8);
eBOSC.theta_nrem_snr = NaN(18,8);
eBOSC.spindles_nrem_snr = NaN(18,8);

eBOSC.alpha_wake_snr = NaN(18,8);
eBOSC.theta_wake_snr = NaN(18,8);
eBOSC.spindles_wake_snr = NaN(18,8);


eBOSC.alpha_rem_abu = NaN(18,8);
eBOSC.theta_rem_abu = NaN(18,8);
eBOSC.spindles_rem_abu = NaN(18,8);

eBOSC.alpha_phasic_abu = NaN(18,8);
eBOSC.theta_phasic_abu = NaN(18,8);
eBOSC.spindles_phasic_abu = NaN(18,8);

eBOSC.alpha_tonic_abu = NaN(18,8);
eBOSC.theta_tonic_abu = NaN(18,8);
eBOSC.spindles_tonic_abu = NaN(18,8);

eBOSC.alpha_nrem_abu = NaN(18,8);
eBOSC.theta_nrem_abu = NaN(18,8);
eBOSC.spindles_nrem_abu = NaN(18,8);

eBOSC.alpha_wake_abu = NaN(18,8);
eBOSC.theta_wake_abu = NaN(18,8);
eBOSC.spindles_wake_abu = NaN(18,8);


eBOSC.alpha_rem_amp = NaN(18,8);
eBOSC.theta_rem_amp = NaN(18,8);
eBOSC.spindles_rem_amp = NaN(18,8);

eBOSC.alpha_phasic_amp = NaN(18,8);
eBOSC.theta_phasic_amp = NaN(18,8);
eBOSC.spindles_phasic_amp = NaN(18,8);

eBOSC.alpha_tonic_amp = NaN(18,8);
eBOSC.theta_tonic_amp = NaN(18,8);
eBOSC.spindles_tonic_amp = NaN(18,8);

eBOSC.alpha_nrem_amp = NaN(18,8);
eBOSC.theta_nrem_amp = NaN(18,8);
eBOSC.spindles_nrem_amp = NaN(18,8);

eBOSC.alpha_wake_amp = NaN(18,8);
eBOSC.theta_wake_amp = NaN(18,8);
eBOSC.spindles_wake_amp = NaN(18,8);


eBOSC.h_values_rem = NaN(18,8,30);
eBOSC.h_bin_edges_rem = NaN(18,8,31);

eBOSC.h_values_phasic = NaN(18,8,30);
eBOSC.h_bin_edges_phasic = NaN(18,8,31);

eBOSC.h_values_tonic = NaN(18,8,30);
eBOSC.h_bin_edges_tonic = NaN(18,8,31);

eBOSC.h_values_nrem = NaN(18,8,30);
eBOSC.h_bin_edges_nrem = NaN(18,8,31);

eBOSC.h_values_wake = NaN(18,8,30);
eBOSC.h_bin_edges_wake = NaN(18,8,31);

%%

% for s = 1:length(waves_folder_dir)   
% s = 29;
   
    display(['sub = ',num2str(s)]); 


%     files = dir([waves_folder, waves_folder_dir(s).name(1:12),filesep,'AFOSR*']);
    files = dir([waves_folder, participants_uni{s},'*']);
    
    for file = 1:length(files)
        
       display(['file = ',num2str(file), ' ',files(file).name]); 
        
        %%
        filename = files(file).name;
        night = find_night(filename);
        
%         load([waves_folder, waves_folder_dir(s).name(1:12),filesep,files(file).name]);
        load([waves_folder, filesep,files(file).name]);

        swa_ndx = find(f1 >= swa_freq(1) & f1 < swa_freq(2));
        spindle_power_ndx = find(f1 >= spindles_freq(1) & f1 < spindles_freq(2));
        freq_resolution = f1(2)-f1(1);

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
        
        epochs_art_good = find(nrem_art_ep == 0);
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

            
          peak_fit_1_30 =  10.^(log_power_spectrum_1_30 - log_ap_fit_1_30);
          log_peak_fit_1_30 = log10(peak_fit_1_30);
          
          peak_fit_30_45 =  10.^(log_power_spectrum_30_45 - log_ap_fit_30_45);
          log_peak_fit_30_45 = log10(peak_fit_30_45);
          
          peak_fit_1_45 =  10.^(log_power_spectrum_1_45 - log_ap_fit_1_45);
          log_peak_fit_1_45 = log10(peak_fit_1_45);
          
             %% remove outliers
            
%         histogram(exponent_1_30_allep)
%         hold on 
        outlier_matrix_1_30 = exponent_1_30_allep > 0.2;
%         outlier_matrix_1_30 = r_squared_1_30_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_1_30_allep(outlier_matrix_1_30) = NaN;
        offset_1_30_allep(outlier_matrix_1_30) = NaN;
        for b = 1:size(power_spectrum_1_30,3)
            ap_fit_1_30_allep_bin = squeeze(ap_fit_1_30(:,:,b));
            ap_fit_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            ap_fit_1_30_allep(:,:,b) = ap_fit_1_30_allep_bin; 
            peak_fit_1_30_allep_bin = squeeze(peak_fit_1_30(:,:,b));
            peak_fit_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            peak_fit_1_30_allep(:,:,b) = peak_fit_1_30_allep_bin; 
            power_spectrum_1_30_allep_bin = squeeze(power_spectrum_1_30(:,:,b));
            power_spectrum_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            power_spectrum_1_30_allep(:,:,b) = power_spectrum_1_30_allep_bin;
        end   
                    
        r_squared_ap_fit_1_30_allep(outlier_matrix_1_30) = NaN;
        MSE_ap_fit_1_30_allep(outlier_matrix_1_30) = NaN;
        
 
        
    %         histogram(exponent_30_45_allep)
%         hold on 
        outlier_matrix_30_45 = exponent_30_45_allep > 0.2;
%         outlier_matrix_30_45 = r_squared_30_45_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_30_45_allep(outlier_matrix_30_45) = NaN;
        offset_30_45_allep(outlier_matrix_30_45) = NaN;
        for b = 1:size(power_spectrum_30_45,3)
            ap_fit_30_45_allep_bin = squeeze(ap_fit_30_45(:,:,b));
            ap_fit_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            ap_fit_30_45_allep(:,:,b) = ap_fit_30_45_allep_bin;  
            peak_fit_30_45_allep_bin = squeeze(peak_fit_30_45(:,:,b));
            peak_fit_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            peak_fit_30_45_allep(:,:,b) = peak_fit_30_45_allep_bin; 
            power_spectrum_30_45_allep_bin = squeeze(power_spectrum_30_45(:,:,b));
            power_spectrum_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            power_spectrum_30_45_allep(:,:,b) = power_spectrum_30_45_allep_bin;
        end   
                    
        r_squared_ap_fit_30_45_allep(outlier_matrix_30_45) = NaN;
        MSE_ap_fit_30_45_allep(outlier_matrix_30_45) = NaN;
        
 
        
            %         histogram(exponent_1_45_allep)
%         hold on 
        outlier_matrix_1_45 = exponent_1_45_allep > 0.2;
%         outlier_matrix_1_45 = r_squared_1_45_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_1_45_allep(outlier_matrix_1_45) = NaN;
        offset_1_45_allep(outlier_matrix_1_45) = NaN;
        for b = 1:size(power_spectrum_1_45,3)
            ap_fit_1_45_allep_bin = squeeze(ap_fit_1_45(:,:,b));
            ap_fit_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            ap_fit_1_45_allep(:,:,b) = ap_fit_1_45_allep_bin; 
            peak_fit_1_45_allep_bin = squeeze(peak_fit_1_45(:,:,b));
            peak_fit_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            peak_fit_1_45_allep(:,:,b) = peak_fit_1_45_allep_bin; 
            power_spectrum_1_45_allep_bin = squeeze(power_spectrum_1_45(:,:,b));
            power_spectrum_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            power_spectrum_1_45_allep(:,:,b) = power_spectrum_1_45_allep_bin;
        end   
                    
        r_squared_ap_fit_1_45_allep(outlier_matrix_1_45) = NaN;
        MSE_ap_fit_1_45_allep(outlier_matrix_1_45) = NaN;
        
        
        clear outlier_matrix_1_30 outlier_matrix_30_45 outlier_matrix_1_45
        clear peak_fit_1_30 peak_fit_30_45 peak_fit_1_45 log_peak_fit_1_30 log_peak_fit_30_45 log_peak_fit_1_45
       
       %%
       
        eBOSC.exponent_1_30_rem(night,ch) = nanmean(exponent_1_30_allep(rem_epochs,ch),1);
        eBOSC.exponent_1_30_phasic(night,ch) = nanmean(exponent_1_30_allep(phasic_epochs,ch),1);
        eBOSC.exponent_1_30_tonic(night,ch) = nanmean(exponent_1_30_allep(tonic_epochs,ch),1);
        eBOSC.exponent_1_30_nrem(night,ch) = nanmean(exponent_1_30_allep(nrem_epochs,ch),1);
        eBOSC.exponent_1_30_n1(night,ch) = nanmean(exponent_1_30_allep(n1_epochs,ch),1);
        eBOSC.exponent_1_30_n2(night,ch) = nanmean(exponent_1_30_allep(n2_epochs,ch),1);
        eBOSC.exponent_1_30_n3(night,ch) = nanmean(exponent_1_30_allep(n3_epochs,ch),1);
        eBOSC.exponent_1_30_wake(night,ch) = nanmean(exponent_1_30_allep(wake_epochs,ch),1);
      
        eBOSC.exponent_30_45_rem(night,ch) = nanmean(exponent_30_45_allep(rem_epochs,ch),1);
        eBOSC.exponent_30_45_phasic(night,ch) = nanmean(exponent_30_45_allep(phasic_epochs,ch),1);
        eBOSC.exponent_30_45_tonic(night,ch) = nanmean(exponent_30_45_allep(tonic_epochs,ch),1);
        eBOSC.exponent_30_45_nrem(night,ch) = nanmean(exponent_30_45_allep(nrem_epochs,ch),1);
        eBOSC.exponent_30_45_n1(night,ch) = nanmean(exponent_30_45_allep(n1_epochs,ch),1);
        eBOSC.exponent_30_45_n2(night,ch) = nanmean(exponent_30_45_allep(n2_epochs,ch),1);
        eBOSC.exponent_30_45_n3(night,ch) = nanmean(exponent_30_45_allep(n3_epochs,ch),1);
        eBOSC.exponent_30_45_wake(night,ch) = nanmean(exponent_30_45_allep(wake_epochs,ch),1);
        
        eBOSC.exponent_1_45_rem(night,ch) = nanmean(exponent_1_45_allep(rem_epochs,ch),1);
        eBOSC.exponent_1_45_phasic(night,ch) = nanmean(exponent_1_45_allep(phasic_epochs,ch),1);
        eBOSC.exponent_1_45_tonic(night,ch) = nanmean(exponent_1_45_allep(tonic_epochs,ch),1);
        eBOSC.exponent_1_45_nrem(night,ch) = nanmean(exponent_1_45_allep(nrem_epochs,ch),1);
        eBOSC.exponent_1_45_n1(night,ch) = nanmean(exponent_1_45_allep(n1_epochs,ch),1);
        eBOSC.exponent_1_45_n2(night,ch) = nanmean(exponent_1_45_allep(n2_epochs,ch),1);
        eBOSC.exponent_1_45_n3(night,ch) = nanmean(exponent_1_45_allep(n3_epochs,ch),1);
        eBOSC.exponent_1_45_wake(night,ch) = nanmean(exponent_1_45_allep(wake_epochs,ch),1);
        

        
                
        eBOSC.offset_1_30_rem(night,ch) = nanmean(offset_1_30_allep(rem_epochs,ch),1);
        eBOSC.offset_1_30_phasic(night,ch) = nanmean(offset_1_30_allep(phasic_epochs,ch),1);
        eBOSC.offset_1_30_tonic(night,ch) = nanmean(offset_1_30_allep(tonic_epochs,ch),1);
        eBOSC.offset_1_30_nrem(night,ch) = nanmean(offset_1_30_allep(nrem_epochs,ch),1);
        eBOSC.offset_1_30_n1(night,ch) = nanmean(offset_1_30_allep(n1_epochs,ch),1);
        eBOSC.offset_1_30_n2(night,ch) = nanmean(offset_1_30_allep(n2_epochs,ch),1);
        eBOSC.offset_1_30_n3(night,ch) = nanmean(offset_1_30_allep(n3_epochs,ch),1);
        eBOSC.offset_1_30_wake(night,ch) = nanmean(offset_1_30_allep(wake_epochs,ch),1);
      
        eBOSC.offset_30_45_rem(night,ch) = nanmean(offset_30_45_allep(rem_epochs,ch),1);
        eBOSC.offset_30_45_phasic(night,ch) = nanmean(offset_30_45_allep(phasic_epochs,ch),1);
        eBOSC.offset_30_45_tonic(night,ch) = nanmean(offset_30_45_allep(tonic_epochs,ch),1);
        eBOSC.offset_30_45_nrem(night,ch) = nanmean(offset_30_45_allep(nrem_epochs,ch),1);
        eBOSC.offset_30_45_n1(night,ch) = nanmean(offset_30_45_allep(n1_epochs,ch),1);
        eBOSC.offset_30_45_n2(night,ch) = nanmean(offset_30_45_allep(n2_epochs,ch),1);
        eBOSC.offset_30_45_n3(night,ch) = nanmean(offset_30_45_allep(n3_epochs,ch),1);
        eBOSC.offset_30_45_wake(night,ch) = nanmean(offset_30_45_allep(wake_epochs,ch),1);
        
        eBOSC.offset_1_45_rem(night,ch) = nanmean(offset_1_45_allep(rem_epochs,ch),1);
        eBOSC.offset_1_45_phasic(night,ch) = nanmean(offset_1_45_allep(phasic_epochs,ch),1);
        eBOSC.offset_1_45_tonic(night,ch) = nanmean(offset_1_45_allep(tonic_epochs,ch),1);
        eBOSC.offset_1_45_nrem(night,ch) = nanmean(offset_1_45_allep(nrem_epochs,ch),1);
        eBOSC.offset_1_45_n1(night,ch) = nanmean(offset_1_45_allep(n1_epochs,ch),1);
        eBOSC.offset_1_45_n2(night,ch) = nanmean(offset_1_45_allep(n2_epochs,ch),1);
        eBOSC.offset_1_45_n3(night,ch) = nanmean(offset_1_45_allep(n3_epochs,ch),1);
        eBOSC.offset_1_45_wake(night,ch) = nanmean(offset_1_45_allep(wake_epochs,ch),1);
       

        
        eBOSC.power_spectrum_1_30_rem(night,ch,:) = nanmean(power_spectrum_1_30_allep(rem_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_phasic(night,ch,:) = nanmean(power_spectrum_1_30_allep(phasic_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_tonic(night,ch,:) = nanmean(power_spectrum_1_30_allep(tonic_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_nrem(night,ch,:) = nanmean(power_spectrum_1_30_allep(nrem_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_n1(night,ch,:) = nanmean(power_spectrum_1_30_allep(n1_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_n2(night,ch,:) = nanmean(power_spectrum_1_30_allep(n2_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_n3(night,ch,:) = nanmean(power_spectrum_1_30_allep(n3_epochs,ch,:),1);
        eBOSC.power_spectrum_1_30_wake(night,ch,:) = nanmean(power_spectrum_1_30_allep(wake_epochs,ch,:),1);
        
       
        eBOSC.power_spectrum_30_45_rem(night,ch,:) = nanmean(power_spectrum_30_45_allep(rem_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_phasic(night,ch,:) = nanmean(power_spectrum_30_45_allep(phasic_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_tonic(night,ch,:) = nanmean(power_spectrum_30_45_allep(tonic_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_nrem(night,ch,:) = nanmean(power_spectrum_30_45_allep(nrem_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_n1(night,ch,:) = nanmean(power_spectrum_30_45_allep(n1_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_n2(night,ch,:) = nanmean(power_spectrum_30_45_allep(n2_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_n3(night,ch,:) = nanmean(power_spectrum_30_45_allep(n3_epochs,ch,:),1);
        eBOSC.power_spectrum_30_45_wake(night,ch,:) = nanmean(power_spectrum_30_45_allep(wake_epochs,ch,:),1);


        eBOSC.power_spectrum_1_45_rem(night,ch,:) = nanmean(power_spectrum_1_45_allep(rem_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_phasic(night,ch,:) = nanmean(power_spectrum_1_45_allep(phasic_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_tonic(night,ch,:) = nanmean(power_spectrum_1_45_allep(tonic_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_nrem(night,ch,:) = nanmean(power_spectrum_1_45_allep(nrem_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_n1(night,ch,:) = nanmean(power_spectrum_1_45_allep(n1_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_n2(night,ch,:) = nanmean(power_spectrum_1_45_allep(n2_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_n3(night,ch,:) = nanmean(power_spectrum_1_45_allep(n3_epochs,ch,:),1);
        eBOSC.power_spectrum_1_45_wake(night,ch,:) = nanmean(power_spectrum_1_45_allep(wake_epochs,ch,:),1);



        
        eBOSC.ap_fit_1_30_rem(night,ch,:) = nanmean(ap_fit_1_30_allep(rem_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_phasic(night,ch,:) = nanmean(ap_fit_1_30_allep(phasic_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_tonic(night,ch,:) = nanmean(ap_fit_1_30_allep(tonic_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_nrem(night,ch,:) = nanmean(ap_fit_1_30_allep(nrem_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_n1(night,ch,:) = nanmean(ap_fit_1_30_allep(n1_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_n2(night,ch,:) = nanmean(ap_fit_1_30_allep(n2_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_n3(night,ch,:) = nanmean(ap_fit_1_30_allep(n3_epochs,ch,:),1);
        eBOSC.ap_fit_1_30_wake(night,ch,:) = nanmean(ap_fit_1_30_allep(wake_epochs,ch,:),1);


        eBOSC.ap_fit_30_45_rem(night,ch,:) = nanmean(ap_fit_30_45_allep(rem_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_phasic(night,ch,:) = nanmean(ap_fit_30_45_allep(phasic_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_tonic(night,ch,:) = nanmean(ap_fit_30_45_allep(tonic_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_nrem(night,ch,:) = nanmean(ap_fit_30_45_allep(nrem_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_n1(night,ch,:) = nanmean(ap_fit_30_45_allep(n1_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_n2(night,ch,:) = nanmean(ap_fit_30_45_allep(n2_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_n3(night,ch,:) = nanmean(ap_fit_30_45_allep(n3_epochs,ch,:),1);
        eBOSC.ap_fit_30_45_wake(night,ch,:) = nanmean(ap_fit_30_45_allep(wake_epochs,ch,:),1);


        eBOSC.ap_fit_1_45_rem(night,ch,:) = nanmean(ap_fit_1_45_allep(rem_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_phasic(night,ch,:) = nanmean(ap_fit_1_45_allep(phasic_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_tonic(night,ch,:) = nanmean(ap_fit_1_45_allep(tonic_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_nrem(night,ch,:) = nanmean(ap_fit_1_45_allep(nrem_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_n1(night,ch,:) = nanmean(ap_fit_1_45_allep(n1_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_n2(night,ch,:) = nanmean(ap_fit_1_45_allep(n2_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_n3(night,ch,:) = nanmean(ap_fit_1_45_allep(n3_epochs,ch,:),1);
        eBOSC.ap_fit_1_45_wake(night,ch,:) = nanmean(ap_fit_1_45_allep(wake_epochs,ch,:),1);
        
        
        eBOSC.peak_fit_1_30_rem(night,ch,:) = nanmean(peak_fit_1_30_allep(rem_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_phasic(night,ch,:) = nanmean(peak_fit_1_30_allep(phasic_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_tonic(night,ch,:) = nanmean(peak_fit_1_30_allep(tonic_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_nrem(night,ch,:) = nanmean(peak_fit_1_30_allep(nrem_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_n1(night,ch,:) = nanmean(peak_fit_1_30_allep(n1_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_n2(night,ch,:) = nanmean(peak_fit_1_30_allep(n2_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_n3(night,ch,:) = nanmean(peak_fit_1_30_allep(n3_epochs,ch,:),1);
        eBOSC.peak_fit_1_30_wake(night,ch,:) = nanmean(peak_fit_1_30_allep(wake_epochs,ch,:),1);


        eBOSC.peak_fit_30_45_rem(night,ch,:) = nanmean(peak_fit_30_45_allep(rem_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_phasic(night,ch,:) = nanmean(peak_fit_30_45_allep(phasic_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_tonic(night,ch,:) = nanmean(peak_fit_30_45_allep(tonic_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_nrem(night,ch,:) = nanmean(peak_fit_30_45_allep(nrem_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_n1(night,ch,:) = nanmean(peak_fit_30_45_allep(n1_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_n2(night,ch,:) = nanmean(peak_fit_30_45_allep(n2_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_n3(night,ch,:) = nanmean(peak_fit_30_45_allep(n3_epochs,ch,:),1);
        eBOSC.peak_fit_30_45_wake(night,ch,:) = nanmean(peak_fit_30_45_allep(wake_epochs,ch,:),1);


        eBOSC.peak_fit_1_45_rem(night,ch,:) = nanmean(peak_fit_1_45_allep(rem_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_phasic(night,ch,:) = nanmean(peak_fit_1_45_allep(phasic_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_tonic(night,ch,:) = nanmean(peak_fit_1_45_allep(tonic_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_nrem(night,ch,:) = nanmean(peak_fit_1_45_allep(nrem_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_n1(night,ch,:) = nanmean(peak_fit_1_45_allep(n1_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_n2(night,ch,:) = nanmean(peak_fit_1_45_allep(n2_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_n3(night,ch,:) = nanmean(peak_fit_1_45_allep(n3_epochs,ch,:),1);
        eBOSC.peak_fit_1_45_wake(night,ch,:) = nanmean(peak_fit_1_45_allep(wake_epochs,ch,:),1);
        

        eBOSC.log_power_spectrum_1_30_rem(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(rem_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_phasic(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_tonic(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_nrem(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_n1(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n1_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_n2(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n2_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_n3(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n3_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_30_wake(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(wake_epochs,ch,:)),1);


        eBOSC.log_power_spectrum_30_45_rem(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(rem_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_phasic(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_tonic(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_nrem(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_n1(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n1_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_n2(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n2_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_n3(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n3_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_30_45_wake(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(wake_epochs,ch,:)),1);


        eBOSC.log_power_spectrum_1_45_rem(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(rem_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_phasic(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_tonic(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_nrem(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_n1(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n1_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_n2(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n2_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_n3(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n3_epochs,ch,:)),1);
        eBOSC.log_power_spectrum_1_45_wake(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(wake_epochs,ch,:)),1);



        
        eBOSC.log_ap_fit_1_30_rem(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(rem_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_phasic(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_tonic(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_nrem(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_n1(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n1_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_n2(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n2_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_n3(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n3_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_30_wake(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(wake_epochs,ch,:)),1);


        eBOSC.log_ap_fit_30_45_rem(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(rem_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_phasic(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_tonic(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_nrem(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_n1(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n1_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_n2(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n2_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_n3(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n3_epochs,ch,:)),1);
        eBOSC.log_ap_fit_30_45_wake(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(wake_epochs,ch,:)),1);


        eBOSC.log_ap_fit_1_45_rem(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(rem_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_phasic(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_tonic(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_nrem(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_n1(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n1_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_n2(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n2_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_n3(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n3_epochs,ch,:)),1);
        eBOSC.log_ap_fit_1_45_wake(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(wake_epochs,ch,:)),1);
        
  
        
        eBOSC.log_peak_fit_1_30_rem(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(rem_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_phasic(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_tonic(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_nrem(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_n1(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n1_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_n2(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n2_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_n3(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n3_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_30_wake(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(wake_epochs,ch,:)),1);


        eBOSC.log_peak_fit_30_45_rem(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(rem_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_phasic(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_tonic(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_nrem(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_n1(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n1_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_n2(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n2_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_n3(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n3_epochs,ch,:)),1);
        eBOSC.log_peak_fit_30_45_wake(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(wake_epochs,ch,:)),1);


        eBOSC.log_peak_fit_1_45_rem(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(rem_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_phasic(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(phasic_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_tonic(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(tonic_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_nrem(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(nrem_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_n1(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n1_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_n2(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n2_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_n3(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n3_epochs,ch,:)),1);
        eBOSC.log_peak_fit_1_45_wake(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(wake_epochs,ch,:)),1);
        
        
        
        
        eBOSC.r_squared_1_30_rem(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(rem_epochs,ch),1);
        eBOSC.r_squared_1_30_phasic(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(phasic_epochs,ch),1);
        eBOSC.r_squared_1_30_tonic(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(tonic_epochs,ch),1);
        eBOSC.r_squared_1_30_nrem(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(nrem_epochs,ch),1);
        eBOSC.r_squared_1_30_n1(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(n1_epochs,ch),1);
        eBOSC.r_squared_1_30_n2(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(n2_epochs,ch),1);
        eBOSC.r_squared_1_30_n3(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(n3_epochs,ch),1);
        eBOSC.r_squared_1_30_wake(night,ch) = nanmean(r_squared_ap_fit_1_30_allep(wake_epochs,ch),1);
        
        
        eBOSC.r_squared_30_45_rem(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(rem_epochs,ch),1);
        eBOSC.r_squared_30_45_phasic(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(phasic_epochs,ch),1);
        eBOSC.r_squared_30_45_tonic(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(tonic_epochs,ch),1);
        eBOSC.r_squared_30_45_nrem(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(nrem_epochs,ch),1);
        eBOSC.r_squared_30_45_n1(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(n1_epochs,ch),1);
        eBOSC.r_squared_30_45_n2(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(n2_epochs,ch),1);
        eBOSC.r_squared_30_45_n3(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(n3_epochs,ch),1);
        eBOSC.r_squared_30_45_wake(night,ch) = nanmean(r_squared_ap_fit_30_45_allep(wake_epochs,ch),1);
        
        
        eBOSC.r_squared_1_45_rem(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(rem_epochs,ch),1);
        eBOSC.r_squared_1_45_phasic(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(phasic_epochs,ch),1);
        eBOSC.r_squared_1_45_tonic(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(tonic_epochs,ch),1);
        eBOSC.r_squared_1_45_nrem(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(nrem_epochs,ch),1);
        eBOSC.r_squared_1_45_n1(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(n1_epochs,ch),1);
        eBOSC.r_squared_1_45_n2(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(n2_epochs,ch),1);
        eBOSC.r_squared_1_45_n3(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(n3_epochs,ch),1);
        eBOSC.r_squared_1_45_wake(night,ch) = nanmean(r_squared_ap_fit_1_45_allep(wake_epochs,ch),1);
        
        
        
        eBOSC.error_1_30_rem(night,ch) = nanmean(MSE_ap_fit_1_30_allep(rem_epochs,ch),1);
        eBOSC.error_1_30_phasic(night,ch) = nanmean(MSE_ap_fit_1_30_allep(phasic_epochs,ch),1);
        eBOSC.error_1_30_tonic(night,ch) = nanmean(MSE_ap_fit_1_30_allep(tonic_epochs,ch),1);
        eBOSC.error_1_30_nrem(night,ch) = nanmean(MSE_ap_fit_1_30_allep(nrem_epochs,ch),1);
        eBOSC.error_1_30_n1(night,ch) = nanmean(MSE_ap_fit_1_30_allep(n1_epochs,ch),1);
        eBOSC.error_1_30_n2(night,ch) = nanmean(MSE_ap_fit_1_30_allep(n2_epochs,ch),1);
        eBOSC.error_1_30_n3(night,ch) = nanmean(MSE_ap_fit_1_30_allep(n3_epochs,ch),1);
        eBOSC.error_1_30_wake(night,ch) = nanmean(MSE_ap_fit_1_30_allep(wake_epochs,ch),1);
        
        
        eBOSC.error_30_45_rem(night,ch) = nanmean(MSE_ap_fit_30_45_allep(rem_epochs,ch),1);
        eBOSC.error_30_45_phasic(night,ch) = nanmean(MSE_ap_fit_30_45_allep(phasic_epochs,ch),1);
        eBOSC.error_30_45_tonic(night,ch) = nanmean(MSE_ap_fit_30_45_allep(tonic_epochs,ch),1);
        eBOSC.error_30_45_nrem(night,ch) = nanmean(MSE_ap_fit_30_45_allep(nrem_epochs,ch),1);
        eBOSC.error_30_45_n1(night,ch) = nanmean(MSE_ap_fit_30_45_allep(n1_epochs,ch),1);
        eBOSC.error_30_45_n2(night,ch) = nanmean(MSE_ap_fit_30_45_allep(n2_epochs,ch),1);
        eBOSC.error_30_45_n3(night,ch) = nanmean(MSE_ap_fit_30_45_allep(n3_epochs,ch),1);
        eBOSC.error_30_45_wake(night,ch) = nanmean(MSE_ap_fit_30_45_allep(wake_epochs,ch),1);
        
        
        eBOSC.error_1_45_rem(night,ch) = nanmean(MSE_ap_fit_1_45_allep(rem_epochs,ch),1);
        eBOSC.error_1_45_phasic(night,ch) = nanmean(MSE_ap_fit_1_45_allep(phasic_epochs,ch),1);
        eBOSC.error_1_45_tonic(night,ch) = nanmean(MSE_ap_fit_1_45_allep(tonic_epochs,ch),1);
        eBOSC.error_1_45_nrem(night,ch) = nanmean(MSE_ap_fit_1_45_allep(nrem_epochs,ch),1);
        eBOSC.error_1_45_n1(night,ch) = nanmean(MSE_ap_fit_1_45_allep(n1_epochs,ch),1);
        eBOSC.error_1_45_n2(night,ch) = nanmean(MSE_ap_fit_1_45_allep(n2_epochs,ch),1);
        eBOSC.error_1_45_n3(night,ch) = nanmean(MSE_ap_fit_1_45_allep(n3_epochs,ch),1);
        eBOSC.error_1_45_wake(night,ch) = nanmean(MSE_ap_fit_1_45_allep(wake_epochs,ch),1);
        
        %% SWA and spindle power
 
        eBOSC.swa_rem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(rem_epochs,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_phasic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(phasic_epochs,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_tonic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(tonic_epochs,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_nrem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(nrem_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_n1(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n1_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_n2(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n2_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_n3(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n3_epochs_art_goodndx,ch,swa_ndx),3).*freq_resolution,1);
        eBOSC.swa_wake(night,ch) = nanmean(sum(power_spectrum_1_30_allep(wake_epochs,ch,swa_ndx),3).*freq_resolution,1);
            
            
        eBOSC.spindle_power_rem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(rem_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_phasic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(phasic_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_tonic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(tonic_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_nrem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(nrem_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_n1(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n1_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_n2(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n2_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_n3(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n3_epochs_art_goodndx,ch,spindle_power_ndx),3).*freq_resolution,1);
        eBOSC.spindle_power_wake(night,ch) = nanmean(sum(power_spectrum_1_30_allep(wake_epochs,ch,spindle_power_ndx),3).*freq_resolution,1);
  
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
        
              
        eBOSC.alpha_rem_den(night,ch) = den_alpha.rem_density;
        eBOSC.theta_rem_den(night,ch) = den_theta.rem_density;
        eBOSC.spindles_rem_den(night,ch) = den_spindles.rem_density;

        eBOSC.alpha_phasic_den(night,ch) = den_alpha.phasic_density;
        eBOSC.theta_phasic_den(night,ch) = den_theta.phasic_density;
        eBOSC.spindles_phasic_den(night,ch) = den_spindles.phasic_density;

        eBOSC.alpha_tonic_den(night,ch) = den_alpha.tonic_density;
        eBOSC.theta_tonic_den(night,ch) = den_theta.tonic_density;
        eBOSC.spindles_tonic_den(night,ch) = den_spindles.tonic_density;

        eBOSC.alpha_nrem_den(night,ch) = den_alpha.nrem_density;
        eBOSC.theta_nrem_den(night,ch) = den_theta.nrem_density;
        eBOSC.spindles_nrem_den(night,ch) = den_spindles.nrem_density;

        eBOSC.alpha_wake_den(night,ch) = den_alpha.wake_density;
        eBOSC.theta_wake_den(night,ch) = den_theta.wake_density;
        eBOSC.spindles_wake_den(night,ch) = den_spindles.wake_density;
        
        
        eBOSC.alpha_rem_abu(night,ch) = abu_alpha.rem_abu;
        eBOSC.theta_rem_abu(night,ch) = abu_theta.rem_abu;
        eBOSC.spindles_rem_abu(night,ch) = abu_spindles.rem_abu;

        eBOSC.alpha_phasic_abu(night,ch) = abu_alpha.phasic_abu;
        eBOSC.theta_phasic_abu(night,ch) = abu_theta.phasic_abu;
        eBOSC.spindles_phasic_abu(night,ch) = abu_spindles.phasic_abu;

        eBOSC.alpha_tonic_abu(night,ch) = abu_alpha.tonic_abu;
        eBOSC.theta_tonic_abu(night,ch) = abu_theta.tonic_abu;
        eBOSC.spindles_tonic_abu(night,ch) = abu_spindles.tonic_abu;

        eBOSC.alpha_nrem_abu(night,ch) = abu_alpha.nrem_abu;
        eBOSC.theta_nrem_abu(night,ch) = abu_theta.nrem_abu;
        eBOSC.spindles_nrem_abu(night,ch) = abu_spindles.nrem_abu;

        eBOSC.alpha_wake_abu(night,ch) = abu_alpha.wake_abu;
        eBOSC.theta_wake_abu(night,ch) = abu_theta.wake_abu;
        eBOSC.spindles_wake_abu(night,ch) = abu_spindles.wake_abu;
        
        
        eBOSC.alpha_rem_amp(night,ch) = amp_alpha.rem_amp;
        eBOSC.theta_rem_amp(night,ch) = amp_theta.rem_amp;
        eBOSC.spindles_rem_amp(night,ch) = amp_spindles.rem_amp;

        eBOSC.alpha_phasic_amp(night,ch) = amp_alpha.phasic_amp;
        eBOSC.theta_phasic_amp(night,ch) = amp_theta.phasic_amp;
        eBOSC.spindles_phasic_amp(night,ch) = amp_spindles.phasic_amp;

        eBOSC.alpha_tonic_amp(night,ch) = amp_alpha.tonic_amp;
        eBOSC.theta_tonic_amp(night,ch) = amp_theta.tonic_amp;
        eBOSC.spindles_tonic_amp(night,ch) = amp_spindles.tonic_amp;

        eBOSC.alpha_nrem_amp(night,ch) = amp_alpha.nrem_amp;
        eBOSC.theta_nrem_amp(night,ch) = amp_theta.nrem_amp;
        eBOSC.spindles_nrem_amp(night,ch) = amp_spindles.nrem_amp;

        eBOSC.alpha_wake_amp(night,ch) = amp_alpha.wake_amp;
        eBOSC.theta_wake_amp(night,ch) = amp_theta.wake_amp;
        eBOSC.spindles_wake_amp(night,ch) = amp_spindles.wake_amp;
        
        
        eBOSC.alpha_rem_snr(night,ch) = snr_alpha.rem_snr;
        eBOSC.theta_rem_snr(night,ch) = snr_theta.rem_snr;
        eBOSC.spindles_rem_snr(night,ch) = snr_spindles.rem_snr;

        eBOSC.alpha_phasic_snr(night,ch) = snr_alpha.phasic_snr;
        eBOSC.theta_phasic_snr(night,ch) = snr_theta.phasic_snr;
        eBOSC.spindles_phasic_snr(night,ch) = snr_spindles.phasic_snr;

        eBOSC.alpha_tonic_snr(night,ch) = snr_alpha.tonic_snr;
        eBOSC.theta_tonic_snr(night,ch) = snr_theta.tonic_snr;
        eBOSC.spindles_tonic_snr(night,ch) = snr_spindles.tonic_snr;

        eBOSC.alpha_nrem_snr(night,ch) = snr_alpha.nrem_snr;
        eBOSC.theta_nrem_snr(night,ch) = snr_theta.nrem_snr;
        eBOSC.spindles_nrem_snr(night,ch) = snr_spindles.nrem_snr;

        eBOSC.alpha_wake_snr(night,ch) = snr_alpha.wake_snr;
        eBOSC.theta_wake_snr(night,ch) = snr_theta.wake_snr;
        eBOSC.spindles_wake_snr(night,ch) = snr_spindles.wake_snr;
        
        
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
        [IAPF_wake ITPF_wake ISPF_wake IAPF_wake_height ITPF_wake_height ISPF_wake_height h_values_wake h_bin_edges_wake] = peak_detection_vj(waves_wake_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title({filename(1:18) [EEG.chanlocs(ch).labels,' wake, IAPF: ', num2str(IAPF_wake),' Hz, height: ',num2str(round(IAPF_wake_height,2)), ', ITPF: ', num2str(ITPF_wake), ' Hz, ISPF: ', num2str(ISPF_wake)]});
        else
            IAPF_wake = NaN;
            ITPF_wake = NaN;
            ISPF_wake = NaN;
            IAPF_wake_height = NaN;
            ITPF_wake_height = NaN;
            ISPF_wake_height = NaN;
            h_values_wake = NaN(1,30);
            h_bin_edges_wake = NaN(1,31);
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
        [IAPF_rem ITPF_rem ISPF_rem IAPF_rem_height ITPF_rem_height ISPF_rem_height h_values_rem h_bin_edges_rem] = peak_detection_vj(waves_rem_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels,' rem, IAPF: ', num2str(IAPF_rem), ' Hz, height: ',num2str(round(IAPF_rem_height,2)), ', ITPF: ', num2str(ITPF_rem), ' Hz, ISPF: ', num2str(ISPF_rem)]);
        else
            IAPF_rem = NaN;
            ITPF_rem = NaN;
            ISPF_rem = NaN;
            IAPF_rem_height = NaN;
            ITPF_rem_height = NaN;
            ISPF_rem_height = NaN;
            h_values_rem = NaN(1,30);
            h_bin_edges_rem = NaN(1,31);
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
        [IAPF_phasic ITPF_phasic ISPF_phasic IAPF_phasic_height ITPF_phasic_height ISPF_phasic_height h_values_phasic h_bin_edges_phasic] = peak_detection_vj(waves_phasic_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels, ' phasic, IAPF: ', num2str(IAPF_phasic),' Hz, height: ',num2str(round(IAPF_phasic_height,2)), ', ITPF: ', num2str(ITPF_phasic), ' Hz, ISPF: ', num2str(ISPF_phasic)]);
        else
            IAPF_phasic = NaN;
            ITPF_phasic = NaN;
            ISPF_phasic = NaN; 
            IAPF_phasic_height = NaN;
            ITPF_phasic_height = NaN;
            ISPF_phasic_height = NaN; 
            h_values_phasic = NaN(1,30);
            h_bin_edges_phasic = NaN(1,31);
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
        [IAPF_tonic ITPF_tonic ISPF_tonic IAPF_tonic_height ITPF_tonic_height ISPF_tonic_height h_values_tonic h_bin_edges_tonic] = peak_detection_vj(waves_tonic_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels, ' tonic, IAPF: ', num2str(IAPF_tonic), ' Hz, height: ',num2str(round(IAPF_tonic_height,2)), ', ITPF: ', num2str(ITPF_tonic), ' Hz, ISPF: ', num2str(ISPF_tonic)]);
        else
           IAPF_tonic = NaN;
           ITPF_tonic = NaN;
           ISPF_tonic = NaN;  
           IAPF_tonic_height = NaN;
           ITPF_tonic_height = NaN;
           ISPF_tonic_height = NaN; 
           h_values_tonic = NaN(1,30);
           h_bin_edges_tonic = NaN(1,31);
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
        [IAPF_nrem ITPF_nrem ISPF_nrem IAPF_nrem_height ITPF_nrem_height ISPF_nrem_height h_values_nrem h_bin_edges_nrem] = peak_detection_vj(waves_nrem_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title([EEG.chanlocs(ch).labels,' nrem, IAPF: ', num2str(IAPF_nrem), ' Hz, height: ',num2str(round(IAPF_nrem_height,2)),', ITPF: ', num2str(ITPF_nrem), ' Hz, ISPF: ', num2str(ISPF_nrem)]);
        else
           IAPF_nrem = NaN;
           ITPF_nrem = NaN;
           ISPF_nrem = NaN;   
           IAPF_nrem_height = NaN;
           ITPF_nrem_height = NaN;
           ISPF_nrem_height = NaN;  
           h_values_nrem = NaN(1,30);
           h_bin_edges_nrem = NaN(1,31);
        end
        
        
        xlabel('Frequency (Hz)');
        ylabel('Number')    
        
        
%         if ch == 4 | ch == 8
%         saveas(fig,[Savefolder,'plots',filesep,filename(1:18),'_ch',num2str(ch),'_not_individualized_2_6_12.svg']);
%         close
%         end

        close

        %%
        eBOSC.IAPF_wake_all(night,ch) = IAPF_wake;
        eBOSC.IAPF_rem_all(night,ch) = IAPF_rem;
        eBOSC.IAPF_phasic_all(night,ch) = IAPF_phasic;
        eBOSC.IAPF_tonic_all(night,ch) = IAPF_tonic;
        eBOSC.IAPF_nrem_all(night,ch) = IAPF_nrem;
        
        eBOSC.ITPF_wake_all(night,ch) = ITPF_wake;
        eBOSC.ITPF_rem_all(night,ch) = ITPF_rem;
        eBOSC.ITPF_phasic_all(night,ch) = ITPF_phasic;
        eBOSC.ITPF_tonic_all(night,ch) = ITPF_tonic;
        eBOSC.ITPF_nrem_all(night,ch) = ITPF_nrem;
        
        eBOSC.ISPF_wake_all(night,ch) = ISPF_wake;
        eBOSC.ISPF_rem_all(night,ch) = ISPF_rem;
        eBOSC.ISPF_phasic_all(night,ch) = ISPF_phasic;
        eBOSC.ISPF_tonic_all(night,ch) = ISPF_tonic;
        eBOSC.ISPF_nrem_all(night,ch) = ISPF_nrem;
                
        eBOSC.IAPF_wake_height_all(night,ch) = IAPF_wake_height;   
        eBOSC.IAPF_rem_height_all(night,ch) = IAPF_rem_height;
        eBOSC.IAPF_phasic_height_all(night,ch) = IAPF_phasic_height;
        eBOSC.IAPF_tonic_height_all(night,ch) = IAPF_tonic_height;
        eBOSC.IAPF_nrem_height_all(night,ch) = IAPF_nrem_height;
        
        eBOSC.ITPF_wake_height_all(night,ch) = ITPF_wake_height;
        eBOSC.ITPF_rem_height_all(night,ch) = ITPF_rem_height;
        eBOSC.ITPF_phasic_height_all(night,ch) = ITPF_phasic_height;
        eBOSC.ITPF_tonic_height_all(night,ch) = ITPF_tonic_height;
        eBOSC.ITPF_nrem_height_all(night,ch) = ITPF_nrem_height;
        
        eBOSC.ISPF_wake_height_all(night,ch) = ISPF_wake_height;
        eBOSC.ISPF_rem_height_all(night,ch) = ISPF_rem_height;
        eBOSC.ISPF_phasic_height_all(night,ch) = ISPF_phasic_height;
        eBOSC.ISPF_tonic_height_all(night,ch) = ISPF_tonic_height;
        eBOSC.ISPF_nrem_height_all(night,ch) = ISPF_nrem_height;
        
        eBOSC.h_values_wake(night,ch,:) = h_values_wake;
        eBOSC.h_values_rem(night,ch,:) = h_values_rem;
        eBOSC.h_values_phasic(night,ch,:) = h_values_phasic;
        eBOSC.h_values_tonic(night,ch,:) = h_values_tonic;
        eBOSC.h_values_nrem(night,ch,:) = h_values_nrem;
        
        eBOSC.h_bin_edges_wake(night,ch,:) = h_bin_edges_wake;
        eBOSC.h_bin_edges_rem(night,ch,:) = h_bin_edges_rem;
        eBOSC.h_bin_edges_phasic(night,ch,:) = h_bin_edges_phasic;
        eBOSC.h_bin_edges_tonic(night,ch,:) = h_bin_edges_tonic;
        eBOSC.h_bin_edges_nrem(night,ch,:) = h_bin_edges_nrem;


        
        clear IAPF_wake IAPF_rem IAPF_nrem ITPF_wake ITPF_rem ITPF_nrem ISPF_wake ISPF_rem ISPF_nrem waves_ch
        clear IAPF_wake_height IAPF_rem_height IAPF_nrem_height ITPF_wake_height ITPF_rem_height ITPF_nrem_height ISPF_wake_height ISPF_rem_height ISPF_nrem_height waves_ch
        clear h_values_wake h_values_rem h_values_phasic h_values_tonic h_values_nrem h_bin_edges_wake h_bin_edges_rem h_bin_edges_phasic h_bin_edges_tonic h_bin_edges_nrem
        
        end

       clear hypno_aligned2 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phasic_epochs tonic_epochs art_epochs 

       
       clear offset_1_30_allep offset_30_45_allep offset_1_45_allep exponent_1_30_allep exponent_30_45_allep exponent_1_45_allep
 
       clear ap_fit_1_30_allep peak_fit_1_30_allep power_spectrum_1_30_allep
       clear ap_fit_30_45_allep peak_fit_30_45_allep power_spectrum_30_45_allep
       clear ap_fit_1_45_allep peak_fit_1_45_allep power_spectrum_1_45_allep
       
       clear log_ap_fit_1_30_allep log_peak_fit_1_30_allep log_power_spectrum_1_30_allep
       clear log_ap_fit_30_45_allep log_peak_fit_30_45_allep log_power_spectrum_30_45_allep
       clear  log_ap_fit_1_45_allep log_peak_fit_1_45_allep log_power_spectrum_1_45_allep
       
       clear r_squared_ap_fit_1_30_allep MSE_ap_fit_1_30_allep
       clear r_squared_ap_fit_30_45_allep MSE_ap_fit_30_45_allep
       clear r_squared_ap_fit1_45_allep MSE_ap_fit_1_45_allep
     
       
       
    end

    save([Savefolder, filename(1:12),'eBOSC_allsub_not_individualized_2_6_12_1s_osc_v3.mat'],'eBOSC')

%     clear eBOSC
    
% end


       
display('the end');

catch exception
    display(exception.message)
    display(exception.identifier)
    error()
end
    
    
end

