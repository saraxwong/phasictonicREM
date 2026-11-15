% function A_eBOSC(s)
% 
% try

clear all
close all

s = 1;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce/eBOSC'));

% Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
% aICA_file = dir([Folderpath,'*aICA.set']);
% 
% goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';
% goodREM_file = dir([goodREM_folder,'*goodREM.mat']);

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*SRBN2*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';
goodREM_file = dir([goodREM_folder,'*SRBN2*goodREM.mat']);

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights_episodes_powspec';

%%
% for s = 1:length(aICA_file)
%%

% for s = 1:length(mICA_file)
    
EEG = pop_loadset('filename',[aICA_file(s).name],'filepath',[Folderpath]);
    
load([goodREM_folder,aICA_file(s).name(1:18),'_goodREM.mat']); 

epochl = 30;
n_phasic_thresh = 1; 
   
%% eBOSC settings (1-30 Hz)
cfg = [];
cfg.eBOSC.channel = []; %[];%all channels
cfg.eBOSC.trial = 1;
cfg.eBOSC.trial_background = 1;

%cfg.eBOSC.F           = 1:.5:44;    % frequency sampling
cfg.eBOSC.F = 1:.25:30; %1:.25:30;%2.^[0:.0125:5];%1:.25:18;%
% f = cfg.eBOSC.F;
cfg.eBOSC.wavenumber  = 6;% wavelet family parameter (time-frequency tradeoff)
cfg.eBOSC.fsample     = fs;     % current sampling frequency of EEG data

cfg.eBOSC.pad.tfr_s = 1;            % padding following wavelet transform to avoid edge artifacts in seconds (bi-lateral)
cfg.eBOSC.pad.detection_s = .5;     % padding following rhythm detection in seconds (bi-lateral); 'shoulder' for BOSC eBOSC.detected matrix to account for duration threshold
cfg.eBOSC.pad.background_s = 1;     % padding of segments for BG (only avoiding edge artifacts)
cfg.eBOSC.threshold.excludePeak = [];                                   % lower and upper bound of frequencies to be excluded during background fit (Hz) (previously: LowFreqExcludeBG HighFreqExcludeBG)
cfg.eBOSC.threshold.duration	= repmat(3, 1, numel(cfg.eBOSC.F));         % vector of duration thresholds at each frequency (previously: ncyc)
cfg.eBOSC.threshold.percentile  = .95;                                      % percentile of background fit for power threshold

cfg.eBOSC.postproc.use      = 'no';         % Post-processing of rhythmic eBOSC.episodes, i.e., wavelet 'deconvolution' (default = 'no')
cfg.eBOSC.postproc.method   = 'MaxBias';	% Deconvolution method (default = 'MaxBias', FWHM: 'FWHM')
cfg.eBOSC.postproc.edgeOnly = 'yes';        % Deconvolution only at on- and offsets of eBOSC.episodes? (default = 'yes')
cfg.eBOSC.postproc.effSignal= 'PT'; 


%% eBOSC settings (30-45 Hz)
cfg2 = [];
cfg2.eBOSC.channel = []; %[];%all channels
cfg2.eBOSC.trial = 1;
cfg2.eBOSC.trial_background = 1;

%cfg.eBOSC.F           = 1:.5:44;    % frequency sampling
cfg2.eBOSC.F = 30:.25:45; %1:.25:30;%2.^[0:.0125:5];%1:.25:18;%
% f = cfg.eBOSC.F;
cfg2.eBOSC.wavenumber  = 6;% wavelet family parameter (time-frequency tradeoff)
cfg2.eBOSC.fsample     = fs;     % current sampling frequency of EEG data

cfg2.eBOSC.pad.tfr_s = 1;            % padding following wavelet transform to avoid edge artifacts in seconds (bi-lateral)
cfg2.eBOSC.pad.detection_s = .5;     % padding following rhythm detection in seconds (bi-lateral); 'shoulder' for BOSC eBOSC.detected matrix to account for duration threshold
cfg2.eBOSC.pad.background_s = 1;     % padding of segments for BG (only avoiding edge artifacts)
cfg2.eBOSC.threshold.excludePeak = [];                                   % lower and upper bound of frequencies to be excluded during background fit (Hz) (previously: LowFreqExcludeBG HighFreqExcludeBG)
cfg2.eBOSC.threshold.duration	= repmat(3, 1, numel(cfg2.eBOSC.F));         % vector of duration thresholds at each frequency (previously: ncyc)
cfg2.eBOSC.threshold.percentile  = .95;                                      % percentile of background fit for power threshold

cfg2.eBOSC.postproc.use      = 'no';         % Post-processing of rhythmic eBOSC.episodes, i.e., wavelet 'deconvolution' (default = 'no')
cfg2.eBOSC.postproc.method   = 'MaxBias';	% Deconvolution method (default = 'MaxBias', FWHM: 'FWHM')
cfg2.eBOSC.postproc.edgeOnly = 'yes';        % Deconvolution only at on- and offsets of eBOSC.episodes? (default = 'yes')
cfg2.eBOSC.postproc.effSignal= 'PT'; 


%% eBOSC settings (1-45 Hz)
cfg3 = [];
cfg3.eBOSC.channel = []; %[];%all channels
cfg3.eBOSC.trial = 1;
cfg3.eBOSC.trial_background = 1;

%cfg.eBOSC.F           = 1:.5:44;    % frequency sampling
cfg3.eBOSC.F = 1:.25:45; %1:.25:30;%2.^[0:.0125:5];%1:.25:18;%
% f = cfg.eBOSC.F;
cfg3.eBOSC.wavenumber  = 6;% wavelet family parameter (time-frequency tradeoff)
cfg3.eBOSC.fsample     = fs;     % current sampling frequency of EEG data

cfg3.eBOSC.pad.tfr_s = 1;            % padding following wavelet transform to avoid edge artifacts in seconds (bi-lateral)
cfg3.eBOSC.pad.detection_s = .5;     % padding following rhythm detection in seconds (bi-lateral); 'shoulder' for BOSC eBOSC.detected matrix to account for duration threshold
cfg3.eBOSC.pad.background_s = 1;     % padding of segments for BG (only avoiding edge artifacts)
cfg3.eBOSC.threshold.excludePeak = [];                                   % lower and upper bound of frequencies to be excluded during background fit (Hz) (previously: LowFreqExcludeBG HighFreqExcludeBG)
cfg3.eBOSC.threshold.duration	= repmat(3, 1, numel(cfg3.eBOSC.F));         % vector of duration thresholds at each frequency (previously: ncyc)
cfg3.eBOSC.threshold.percentile  = .95;                                      % percentile of background fit for power threshold

cfg3.eBOSC.postproc.use      = 'no';         % Post-processing of rhythmic eBOSC.episodes, i.e., wavelet 'deconvolution' (default = 'no')
cfg3.eBOSC.postproc.method   = 'MaxBias';	% Deconvolution method (default = 'MaxBias', FWHM: 'FWHM')
cfg3.eBOSC.postproc.edgeOnly = 'yes';        % Deconvolution only at on- and offsets of eBOSC.episodes? (default = 'yes')
cfg3.eBOSC.postproc.effSignal= 'PT'; 

%%

data = double(EEG.data);


waves_allepch = [];
waves_allepch3 = [];

abundance_f1 = NaN(nepochs,8,117);
abundance_f2 = NaN(nepochs,8,61);
abundance_f3 = NaN(nepochs,8,177);
offset_1_30_allep = NaN(nepochs,8);
exponent_1_30_allep = NaN(nepochs,8);
offset_30_45_allep = NaN(nepochs,8);
exponent_30_45_allep = NaN(nepochs,8);
offset_1_45_allep = NaN(nepochs,8);
exponent_1_45_allep = NaN(nepochs,8);
MSE_ap_fit_1_30_allep = NaN(nepochs,8);
MSE_ap_fit_30_45_allep = NaN(nepochs,8);
MSE_ap_fit_1_45_allep = NaN(nepochs,8);
r_squared_ap_fit_1_30_allep = NaN(nepochs,8);
r_squared_ap_fit_30_45_allep = NaN(nepochs,8);
r_squared_ap_fit_1_45_allep = NaN(nepochs,8);
power_spectrum_1_30 = NaN(nepochs,8,length(cfg.eBOSC.F));
power_spectrum_30_45 = NaN(nepochs,8,length(cfg2.eBOSC.F));
power_spectrum_1_45 = NaN(nepochs,8,length(cfg3.eBOSC.F));
log_power_spectrum_1_30 = NaN(nepochs,8,length(cfg.eBOSC.F));
log_power_spectrum_30_45 = NaN(nepochs,8,length(cfg2.eBOSC.F));
log_power_spectrum_1_45 = NaN(nepochs,8,length(cfg3.eBOSC.F));
ap_fit_1_30 = NaN(nepochs,8,length(cfg.eBOSC.F));
ap_fit_30_45  = NaN(nepochs,8,length(cfg2.eBOSC.F));
ap_fit_1_45 = NaN(nepochs,8,length(cfg3.eBOSC.F));
log_ap_fit_1_30 = NaN(nepochs,8,length(cfg.eBOSC.F));
log_ap_fit_30_45  = NaN(nepochs,8,length(cfg2.eBOSC.F));
log_ap_fit_1_45 = NaN(nepochs,8,length(cfg3.eBOSC.F));
pt_1_30 = NaN(nepochs,8,length(cfg.eBOSC.F));
pt_30_45 = NaN(nepochs,8,length(cfg2.eBOSC.F));
pt_1_45 = NaN(nepochs,8,length(cfg3.eBOSC.F));
log_pt_1_30 = NaN(nepochs,8,length(cfg.eBOSC.F));
log_pt_30_45 = NaN(nepochs,8,length(cfg2.eBOSC.F));
log_pt_1_45 = NaN(nepochs,8,length(cfg3.eBOSC.F));

%%
for ch = 1:8
    

    for ep = 1:nepochs
        
    display(['Electrode ', num2str(ch), ', Epoch ', num2str(ep)]);

    %%
    samp_ep = (ep-1)*epochl*fs+1:ep*epochl*fs;
    
    signal.label{1} =  EEG.chanlocs(ch).labels;
    signal.trial{1} = data(ch,samp_ep);
    signal.time{1} = (1:length(signal.trial{1}))./fs;


    [eBOSC, ~] = eBOSC_wrapper(cfg, signal);
    [eBOSC2, ~] = eBOSC_wrapper(cfg2, signal);
    [eBOSC3, ~] = eBOSC_wrapper(cfg3, signal);
    
    %%
%     h = figure('units','normalized','position',[.1 .1 .5 .7]);
%     subplot(2,2,1)
%     plot(cfg.eBOSC.F, eBOSC.static.bg_pow, 'k', 'LineWidth', 2); hold on;
%     plot(cfg.eBOSC.F, eBOSC.static.pt, 'Color', 'r', 'LineWidth', 2); hold on
%     plot(cfg.eBOSC.F, 10.^polyval(eBOSC.static.pv,log10(cfg.eBOSC.F)), 'Color', 'b', 'LineWidth', 2)
%     subplot(2,2,2)
%     plot(log10(cfg.eBOSC.F), log10(eBOSC.static.bg_pow), 'k', 'LineWidth', 2); hold on;
%     plot(log10(cfg.eBOSC.F), log10(eBOSC.static.pt), 'Color', 'r', 'LineWidth', 2); hold on
%     plot(log10(cfg.eBOSC.F), polyval(eBOSC.static.pv,log10(cfg.eBOSC.F)), 'Color', 'b', 'LineWidth', 2)
%     title('Background fit'); xlabel('Frequency [Hz]'); ylabel('Power [a.u.]');

    % Calculate error and correlation between ap_fit and power spectrum    
    power_spectrum_1_30(ep,ch,:) = eBOSC.static.bg_pow;
    pt_1_30(ep,ch,:) = eBOSC.static.pt;
    ap_fit_1_30(ep,ch,:) = 10.^polyval(eBOSC.static.pv,log10(cfg.eBOSC.F));
    log_power_spectrum_1_30(ep,ch,:) = eBOSC.static.bg_log10_pow;
    log_pt_1_30(ep,ch,:) = log10(eBOSC.static.pt);
    log_ap_fit_1_30(ep,ch,:) = polyval(eBOSC.static.pv,log10(cfg.eBOSC.F));
    model_fit_ap_1_30 = squeeze(log_ap_fit_1_30(ep,ch,:));
    MSE_ap_fit_1_30_allep(ep,ch) = sum((eBOSC.static.bg_log10_pow -model_fit_ap_1_30').^2)/length(model_fit_ap_1_30);
    rsq_tmp_1_30 = corrcoef(eBOSC.static.bg_log10_pow,model_fit_ap_1_30').^2;
    r_squared_ap_fit_1_30_allep(ep,ch) = rsq_tmp_1_30(2,1);
 
    power_spectrum_30_45(ep,ch,:) = eBOSC2.static.bg_pow;
    pt_30_45(ep,ch,:) = eBOSC2.static.pt;
    ap_fit_30_45(ep,ch,:) = 10.^polyval(eBOSC2.static.pv,log10(cfg2.eBOSC.F));
    log_power_spectrum_30_45(ep,ch,:) = eBOSC2.static.bg_log10_pow;
    log_pt_30_45(ep,ch,:) = log10(eBOSC2.static.pt);
    log_ap_fit_30_45(ep,ch,:) = polyval(eBOSC2.static.pv,log10(cfg2.eBOSC.F));
    model_fit_ap_30_45 = squeeze(log_ap_fit_30_45(ep,ch,:));
    MSE_ap_fit_30_45_allep(ep,ch) = sum((eBOSC2.static.bg_log10_pow -model_fit_ap_30_45').^2)/length(model_fit_ap_30_45);
    rsq_tmp_30_45 = corrcoef(eBOSC2.static.bg_log10_pow,model_fit_ap_30_45').^2;
    r_squared_ap_fit_30_45_allep(ep,ch) = rsq_tmp_30_45(2,1);
    
    power_spectrum_1_45(ep,ch,:) = eBOSC3.static.bg_pow;
    pt_1_45(ep,ch,:) = eBOSC3.static.pt;
    ap_fit_1_45(ep,ch,:) = 10.^polyval(eBOSC3.static.pv,log10(cfg3.eBOSC.F));
    log_power_spectrum_1_45(ep,ch,:) = eBOSC3.static.bg_log10_pow;
    log_pt_1_45(ep,ch,:) = log10(eBOSC3.static.pt);
    log_ap_fit_1_45(ep,ch,:) = polyval(eBOSC3.static.pv,log10(cfg3.eBOSC.F));
    model_fit_ap_1_45 = squeeze(log_ap_fit_1_45(ep,ch,:));
    MSE_ap_fit_1_45_allep(ep,ch) = sum((eBOSC3.static.bg_log10_pow -model_fit_ap_1_45').^2)/length(model_fit_ap_1_45);
    rsq_tmp_1_45 = corrcoef(eBOSC3.static.bg_log10_pow,model_fit_ap_1_45').^2;
    r_squared_ap_fit_1_45_allep(ep,ch) = rsq_tmp_1_45(2,1);
    
    clear model_fit*
    
    f1 = cfg.eBOSC.F;
    f2 = cfg2.eBOSC.F;
    f3 = cfg3.eBOSC.F;

    
    abundance_f1(ep,ch,:) = squeeze(eBOSC.abundance_ep);
    abundance_f2(ep,ch,:) = squeeze(eBOSC2.abundance_ep);
    abundance_f3(ep,ch,:) = squeeze(eBOSC3.abundance_ep);
    
    
    offset_1_30_allep(ep,ch) = eBOSC.static.pv(:,2);
    exponent_1_30_allep(ep,ch) = eBOSC.static.pv(:,1);
    offset_30_45_allep(ep,ch) = eBOSC2.static.pv(:,2);
    exponent_30_45_allep(ep,ch) = eBOSC2.static.pv(:,1);
    offset_1_45_allep(ep,ch) = eBOSC3.static.pv(:,2);
    exponent_1_45_allep(ep,ch) = eBOSC3.static.pv(:,1);
   
   startsamp = (ep-1)*fs*epochl + eBOSC.episodes.Onset*fs;  
   endsamp = (ep-1)*fs*epochl + eBOSC.episodes.Offset*fs;
   duration = (endsamp-startsamp)/fs;
   cycles = eBOSC.episodes.DurationC;
   power = eBOSC.episodes.PowerMean;
   SNR = eBOSC.episodes.SNRMean;
   frequency = eBOSC.episodes.FrequencyMean;
   nep = repmat(ep,length(startsamp),1);
   stage = repelem({hypno_aligned2(ep)},length(startsamp),1);
   channel  = repmat(ch,length(startsamp),1);
%    snr_pow_spec = eBOSC.episodes.snr_pow_spec;
   snrMean_pow_spec = eBOSC.episodes.snrMean_pow_spec;
   frequency_ndx_all = eBOSC.episodes.RowID;
                
   waves_ep = table(channel,startsamp,endsamp,duration,cycles,power,SNR,frequency,nep,stage,snrMean_pow_spec,frequency_ndx_all);
   waves_allepch = vertcat(waves_allepch,waves_ep);
   
   
   startsamp3 = (ep-1)*fs*epochl + eBOSC3.episodes.Onset*fs;  
   endsamp3 = (ep-1)*fs*epochl + eBOSC3.episodes.Offset*fs;
   duration3 = (endsamp3-startsamp3)/fs;
   cycles3 = eBOSC3.episodes.DurationC;
   power3 = eBOSC3.episodes.PowerMean;
   SNR3 = eBOSC3.episodes.SNRMean;
   frequency3 = eBOSC3.episodes.FrequencyMean;
   nep3 = repmat(ep,length(startsamp3),1);
   stage3 = repelem({hypno_aligned2(ep)},length(startsamp3),1);
   channel3  = repmat(ch,length(startsamp3),1);
%    snr_pow_spec3 = eBOSC3.episodes.snr_pow_spec;
   snrMean_pow_spec3 = eBOSC3.episodes.snrMean_pow_spec;
   frequency_ndx_all3 = eBOSC3.episodes.RowID;
                
   waves_ep3 = table(channel3,startsamp3,endsamp3,duration3,cycles3,power3,SNR3,frequency3,nep3,stage3,snrMean_pow_spec3,frequency_ndx_all3);
   waves_allepch3 = vertcat(waves_allepch3,waves_ep3);
   
   clear eBOSC eBOSC2 eBOSC3 waves_ep waves_ep3 channel channel3 startsamp startsamp3 endsamp endsamp3 duration duration3 cycles cycles3 power power3 SNR SNR3 frequency frequency3 nep nep3 stage stage3 substage substage3
   clear pow_spec snr_pow_spec snrMean_pow_spec frequency_ndx_all pow_spec3 snr_pow_spec3 snrMean_pow_spec3 frequency_ndx_all3
   
   %%
    end
    
      
end

%%

% if ~exist([Savefolder,aICA_file(s).name(1:12)])
%    mkdir([Savefolder,aICA_file(s).name(1:12)]); 
% end

save([Savefolder,filesep,aICA_file(s).name(1:end-9),'_eBOSC_waves.mat'],'waves_allepch','waves_allepch3','abundance_f1','abundance_f2','abundance_f3','offset_1_30_allep','exponent_1_30_allep','offset_30_45_allep','exponent_30_45_allep','offset_1_45_allep','exponent_1_45_allep',...
    'MSE_ap_fit_1_30_allep','MSE_ap_fit_30_45_allep','MSE_ap_fit_1_45_allep','r_squared_ap_fit_1_30_allep','r_squared_ap_fit_30_45_allep','r_squared_ap_fit_1_45_allep','power_spectrum*','ap_fit*','log_power_spectrum*','log_ap_fit*','pt*','log_pt*','f1','f2','f3','-v7.3')


clear waves_allepch waves_allepch3 abundance_f1 abundance_f2 abundance_f3 offset_1_30_allep exponent_1_30_allep offset_30_45_allep exponent_30_45_allep offset_1_45_allep exponent_1_45_allep f1 f2 f3

clear MSE_ap_fit_1_30_allep MSE_ap_fit_30_45_allep MSE_ap_fit_1_45_allep r_squared_ap_fit_1_30 r_squared_ap_fit_30_45 r_squared_ap_fit_1_45

clear power_spectrum* log_power_spectrum* ap_fit* log_ap_fit* pt* log_pt*

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
% 
