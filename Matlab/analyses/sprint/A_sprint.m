% https://neuroimage.usc.edu/brainstorm/Tutorials/SPRiNT

% function A_sprint(s)
% 
% try

clear all;
close all;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/sprint'));
addpath(genpath('/users/nemo/software/brainstorm3-master'));
addpath(genpath('/users/nemo/projects/Airforce'));

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*_aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';
goodREM_file = dir([goodREM_folder,'*_goodREM.mat']);

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125';

%%

% for s = 1:length(sub_Folderpath)
s = 480
        
EEG = pop_loadset('filename',[aICA_file(s).name],'filepath',[Folderpath]);
    
load([goodREM_folder,aICA_file(s).name(1:18),'_goodREM.mat']);


epochl = 1;
n_phasic_thresh = 1;
phato = calculate_phato(phasic_ep, tonic_ep, art_ep, epochl, n_phasic_thresh);

offset_1_30_allep = NaN(length(phasic_ep),8);
exponent_1_30_allep = NaN(length(phasic_ep),8);
offset_30_45_allep = NaN(length(phasic_ep),8);
exponent_30_45_allep = NaN(length(phasic_ep),8);
offset_1_45_allep = NaN(length(phasic_ep),8);
exponent_1_45_allep = NaN(length(phasic_ep),8);
foofed_spectrum_1_30_allep = NaN(length(phasic_ep),8,length(1:30));
ap_fit_1_30_allep = NaN(length(phasic_ep),8,length(1:30));
power_spectrum_1_30_allep = NaN(length(phasic_ep),8,length(1:30));
peak_fit_1_30_allep = NaN(length(phasic_ep),8,length(1:30));      
foofed_spectrum_30_45_allep = NaN(length(phasic_ep),8,length(30:45));
ap_fit_30_45_allep = NaN(length(phasic_ep),8,length(30:45));
power_spectrum_30_45_allep = NaN(length(phasic_ep),8,length(30:45));
peak_fit_30_45_allep = NaN(length(phasic_ep),8,length(30:45));  
foofed_spectrum_1_45_allep = NaN(length(phasic_ep),8,length(1:45));
ap_fit_1_45_allep = NaN(length(phasic_ep),8,length(1:45));
power_spectrum_1_45_allep = NaN(length(phasic_ep),8,length(1:45));
peak_fit_1_45_allep = NaN(length(phasic_ep),8,length(1:45));  
error_1_30_allep = NaN(length(phasic_ep),8);
r_squared_1_30_allep = NaN(length(phasic_ep),8);
error_30_45_allep = NaN(length(phasic_ep),8);
r_squared_30_45_allep = NaN(length(phasic_ep),8);
error_1_45_allep = NaN(length(phasic_ep),8);
r_squared_1_45_allep = NaN(length(phasic_ep),8);

%% SPRiNT (without Brainstorm), 1-30 Hz 

% STFT opts
opt.sfreq = fs;                    % Input sampling rate
opt.WinLength = 1;                  % STFT window length
opt.WinOverlap = 0.5;                % Overlap between sliding windows (in %)
opt.WinAverage = 5;                 % Number of sliding windows averaged by time point
% specparam opts
opt.freq_range          = [1 30];
opt.peak_width_limits   = [1.5 6];
opt.max_peaks           = 4;
opt.min_peak_height     = 6 / 10; % convert from dB to B
opt.aperiodic_mode      = 'fixed'; % fixed, alternative: knee
opt.peak_threshold      = 2;   % 2 std dev: parameter for interface simplification
% Matlab-only options
opt.peak_type           = 'gaussian'; % alternative: cauchy
opt.proximity_threshold = 2;
opt.guess_weight        = 'none';
opt.thresh_after        = true;   % Threshold after fitting, always selected for Matlab 
                                  % (mirrors the Python FOOOF closest by removing peaks
                                  % that do not satisfy a user's predetermined conditions)
                                  % only used in the absence of the
if license('test','optimization_toolbox') % check for optimization toolbox
    opt.hOT = 1;
    disp('Using constrained optimization, Guess Weight ignored.')
else
    opt.hOT = 0;
    disp('Using unconstrained optimization, with Guess Weights.')
end
opt.rmoutliers          = 'no';
opt.maxfreq             = 2.5;
opt.maxtime             = 6;
opt.minnear             = 3;  


%% SPRiNT (without Brainstorm), 30-45 Hz 

% STFT opts
opt2.sfreq = fs;                    % Input sampling rate
opt2.WinLength = 1;                  % STFT window length
opt2.WinOverlap = 0.5;                % Overlap between sliding windows (in %)
opt2.WinAverage = 5;                 % Number of sliding windows averaged by time point
% specparam opts
opt2.freq_range          = [30 45];
opt2.peak_width_limits   = [1.5 6];
opt2.max_peaks           = 4;
opt2.min_peak_height     = 6 / 10; % convert from dB to B
opt2.aperiodic_mode      = 'fixed'; % fixed, alternative: knee
opt2.peak_threshold      = 2;   % 2 std dev: parameter for interface simplification
% Matlab-only options
opt2.peak_type           = 'gaussian'; % alternative: cauchy
opt2.proximity_threshold = 2;
opt2.guess_weight        = 'none';
opt2.thresh_after        = true;   % Threshold after fitting, always selected for Matlab 
                                  % (mirrors the Python FOOOF closest by removing peaks
                                  % that do not satisfy a user's predetermined conditions)
                                  % only used in the absence of the
if license('test','optimization_toolbox') % check for optimization toolbox
    opt2.hOT = 1;
    disp('Using constrained optimization, Guess Weight ignored.')
else
    opt2.hOT = 0;
    disp('Using unconstrained optimization, with Guess Weights.')
end
opt2.rmoutliers          = 'no';
opt2.maxfreq             = 2.5;
opt2.maxtime             = 6;
opt2.minnear             = 3;  



%% SPRiNT (without Brainstorm), 1-45 Hz 

% STFT opts
opt3.sfreq = fs;                    % Input sampling rate
opt3.WinLength = 1;                  % STFT window length
opt3.WinOverlap = 0.5;                % Overlap between sliding windows (in %)
opt3.WinAverage = 5;                 % Number of sliding windows averaged by time point
% specparam opts
opt3.freq_range          = [1 45];
opt3.peak_width_limits   = [1.5 6];
opt3.max_peaks           = 4;
opt3.min_peak_height     = 6 / 10; % convert from dB to B
opt3.aperiodic_mode      = 'fixed'; % fixed, alternative: knee
opt3.peak_threshold      = 2;   % 2 std dev: parameter for interface simplification
% Matlab-only options
opt3.peak_type           = 'gaussian'; % alternative: cauchy
opt3.proximity_threshold = 2;
opt3.guess_weight        = 'none';
opt3.thresh_after        = true;   % Threshold after fitting, always selected for Matlab 
                                  % (mirrors the Python FOOOF closest by removing peaks
                                  % that do not satisfy a user's predetermined conditions)
                                  % only used in the absence of the
if license('test','optimization_toolbox') % check for optimization toolbox
    opt3.hOT = 1;
    disp('Using constrained optimization, Guess Weight ignored.')
else
    opt3.hOT = 0;
    disp('Using unconstrained optimization, with Guess Weights.')
end
opt3.rmoutliers          = 'no';
opt3.maxfreq             = 2.5;
opt3.maxtime             = 6;
opt3.minnear             = 3;  

%%

waves_allepch = [];
waves_allepch2 = [];
waves_allepch3 = [];

%%
for ch = 1:8
display(['ch = ',num2str(ch)]);
% Inputs 
F = EEG.data(ch,:);                           % Input time series

%% 1-30 Hz

Freqs = 0:1/opt.WinLength:opt.sfreq/2;
channel = struct('data',[],'peaks',[],'aperiodics',[],'stats',[]);
% Compute short-time Fourier transform
[TF, ts] = SPRiNT_stft(F,opt);
outputStruct = struct('opts',opt,'freqs',Freqs,'channel',channel);
% Parameterize STFTs
s_data = SPRiNT_specparam_matlab(TF,outputStruct.freqs,outputStruct.opts,ts);
% save([Savefolder_sdata,filesep,aICA_file(s).name(1:end-9),'_ch',num2str(ch),'_1_30_sdata.mat'],'s_data','-v7.3');

%% Plot fits

% ep = rem_ndx(1);
% 
% figure
% semilogy(s_data.Freqs,s_data.SPRiNT.channel.data(ep).fooofed_spectrum,'-','Color','b','LineWidth',5)
% hold on
% semilogy(s_data.Freqs,s_data.SPRiNT.channel.data(ep).ap_fit,'--','Color',[0.6153 0.0816 0.0878],'LineWidth',5)
% hold on
% semilogy(s_data.Freqs,s_data.SPRiNT.channel.data(ep).power_spectrum,'--','Color','r','LineWidth',1)
% hold on
% semilogy(s_data.Freqs,s_data.SPRiNT.channel.data(ep).peak_fit,'--','Color','r','LineWidth',1)


% for ep = 1:length(s_data.SPRiNT.channel.data)
%     
% foofed_spectrum(ep+2,:) = s_data.SPRiNT.channel.data(ep).fooofed_spectrum;
% ap_fit(ep+2,:) = s_data.SPRiNT.channel.data(ep).ap_fit;
% power_spectrum(ep+2,:) = s_data.SPRiNT.channel.data(ep).power_spectrum;
% peak_fit(ep+2,:) = s_data.SPRiNT.channel.data(ep).peak_fit;
% 
% end
% 
% foofed_spectrum(1:2,:) = NaN;
% ap_fit(1:2,:) = NaN;
% power_spectrum(1:2,:) = NaN;
% peak_fit(1:2,:) = NaN;

% rem_foofed_spectrum = foofed_spectrum(rem_ndx,:);
% nrem_foofed_spectrum = foofed_spectrum(nrem_ndx,:);
% 
% rem_ap_fit = ap_fit(rem_ndx,:);
% nrem_ap_fit = ap_fit(nrem_ndx,:);
% 
% rem_power_spectrum = power_spectrum(rem_ndx,:);
% nrem_power_spectrum = power_spectrum(nrem_ndx,:);
% 
% rem_peak_fit = peak_fit(rem_ndx,:);
% nrem_peak_fit = peak_fit(nrem_ndx,:);
% 
% m_rem_foofed_spectrum = nanmean(rem_foofed_spectrum,1);
% m_nrem_foofed_spectrum = nanmean(nrem_foofed_spectrum,1);
% 
% m_rem_ap_fit = nanmean(rem_ap_fit,1);
% m_nrem_ap_fit = nanmean(nrem_ap_fit,1);
% 
% m_rem_power_spectrum = nanmean(rem_power_spectrum,1);
% m_nrem_power_spectrum = nanmean(nrem_power_spectrum,1);
% 
% m_rem_peak_fit = nanmean(rem_peak_fit,1);
% m_nrem_peak_fit = nanmean(nrem_peak_fit,1);

% 
% semilogy(s_data.Freqs,m_rem_foofed_spectrum,'-','Color','r','LineWidth',5)
% hold on
% semilogy(s_data.Freqs,m_rem_ap_fit,'--','Color',[0.6153 0.0816 0.0878],'LineWidth',5)
% hold on
% semilogy(s_data.Freqs,m_rem_power_spectrum,'--','Color','k','LineWidth',1)
% hold on
% semilogy(s_data.Freqs,m_rem_peak_fit,'--','Color',[0.5 0.5 0.5],'LineWidth',1)
% 
% loglog(s_data.Freqs,m_nrem_foofed_spectrum,'-','Color','b','LineWidth',5)
% hold on
% loglog(s_data.Freqs,m_nrem_ap_fit,'--','Color',[0.5 0.5 0.5],'LineWidth',5)

%% 30-45 Hz

Freqs2 = 0:1/opt2.WinLength:opt2.sfreq/2;
channel2 = struct('data',[],'peaks',[],'aperiodics',[],'stats',[]);
% Compute short-time Fourier transform
[TF2, ts2] = SPRiNT_stft(F,opt2);
outputStruct2 = struct('opts',opt2,'freqs',Freqs2,'channel',channel2);
% Parameterize STFTs
s_data2 = SPRiNT_specparam_matlab(TF2,outputStruct2.freqs,outputStruct2.opts,ts2);
% save([Savefolder_sdata,filesep,aICA_file(s).name(1:end-9),'_ch',num2str(ch),'_30_45_sdata2.mat'],'s_data2','-v7.3');

%% Plot fits

% ep = rem_ndx(1);
% 
% figure
% semilogy(s_data2.Freqs,s_data2.SPRiNT.channel.data(ep).fooofed_spectrum,'-','Color','b','LineWidth',5)
% hold on
% semilogy(s_data2.Freqs,s_data2.SPRiNT.channel.data(ep).ap_fit,'--','Color',[0.6153 0.0816 0.0878],'LineWidth',5)
% hold on
% semilogy(s_data2.Freqs,s_data2.SPRiNT.channel.data(ep).power_spectrum,'--','Color','r','LineWidth',1)
% hold on
% semilogy(s_data2.Freqs,s_data2.SPRiNT.channel.data(ep).peak_fit,'--','Color','r','LineWidth',1)
% 
% 
% for ep = 1:length(s_data2.SPRiNT.channel.data)
%     
% foofed_spectrum(ep+2,:) = s_data2.SPRiNT.channel.data(ep).fooofed_spectrum;
% ap_fit(ep+2,:) = s_data2.SPRiNT.channel.data(ep).ap_fit;
% power_spectrum(ep+2,:) = s_data2.SPRiNT.channel.data(ep).power_spectrum;
% peak_fit(ep+2,:) = s_data2.SPRiNT.channel.data(ep).peak_fit;
% 
% end
% 
% foofed_spectrum(1:2,:) = NaN;
% ap_fit(1:2,:) = NaN;
% power_spectrum(1:2,:) = NaN;
% peak_fit(1:2,:) = NaN;
% 
% rem_foofed_spectrum = foofed_spectrum(rem_ndx,:);
% nrem_foofed_spectrum = foofed_spectrum(nrem_ndx,:);
% 
% rem_ap_fit = ap_fit(rem_ndx,:);
% nrem_ap_fit = ap_fit(nrem_ndx,:);
% 
% rem_power_spectrum = power_spectrum(rem_ndx,:);
% nrem_power_spectrum = power_spectrum(nrem_ndx,:);
% 
% rem_peak_fit = peak_fit(rem_ndx,:);
% nrem_peak_fit = peak_fit(nrem_ndx,:);
% 
% m_rem_foofed_spectrum = nanmean(rem_foofed_spectrum,1);
% m_nrem_foofed_spectrum = nanmean(nrem_foofed_spectrum,1);
% 
% m_rem_ap_fit = nanmean(rem_ap_fit,1);
% m_nrem_ap_fit = nanmean(nrem_ap_fit,1);
% 
% m_rem_power_spectrum = nanmean(rem_power_spectrum,1);
% m_nrem_power_spectrum = nanmean(nrem_power_spectrum,1);
% 
% m_rem_peak_fit = nanmean(rem_peak_fit,1);
% m_nrem_peak_fit = nanmean(nrem_peak_fit,1);
% 
% 
% semilogy(s_data2.Freqs,m_rem_foofed_spectrum,'-','Color','r','LineWidth',5)
% hold on
% semilogy(s_data2.Freqs,m_rem_ap_fit,'--','Color',[0.6153 0.0816 0.0878],'LineWidth',5)
% hold on
% semilogy(s_data2.Freqs,m_rem_power_spectrum,'--','Color','k','LineWidth',1)
% hold on
% semilogy(s_data2.Freqs,m_rem_peak_fit,'--','Color',[0.5 0.5 0.5],'LineWidth',1)
% 
% loglog(s_data2.Freqs,m_nrem_foofed_spectrum,'-','Color','b','LineWidth',5)
% hold on
% loglog(s_data2.Freqs,m_nrem_ap_fit,'--','Color',[0.5 0.5 0.5],'LineWidth',5)

%% 1-45 Hz

Freqs3 = 0:1/opt3.WinLength:opt3.sfreq/2;
channel3 = struct('data',[],'peaks',[],'aperiodics',[],'stats',[]);
% Compute short-time Fourier transform
[TF3, ts3] = SPRiNT_stft(F,opt3);
outputStruct3 = struct('opts',opt3,'freqs',Freqs3,'channel',channel3);
% Parameterize STFTs
s_data3 = SPRiNT_specparam_matlab(TF3,outputStruct3.freqs,outputStruct3.opts,ts3);

%% 1-30 Hz

peak_params = {s_data.SPRiNT.channel.data.peak_params};
f1 = s_data.Freqs;

       for ep = 1:length(s_data.SPRiNT.channel.data)

           mini_ep = ceil(s_data.SPRiNT.channel.data(ep).time);
           aperiodic_params_ep = s_data.SPRiNT.channel.data(ep).aperiodic_params;
           
           foofed_spectrum_ep = s_data.SPRiNT.channel.data(ep).fooofed_spectrum;
           ap_fit_ep = s_data.SPRiNT.channel.data(ep).ap_fit;
           power_spectrum_ep = s_data.SPRiNT.channel.data(ep).power_spectrum;
           peak_fit_ep = s_data.SPRiNT.channel.data(ep).peak_fit;
           error_ep = s_data.SPRiNT.channel.data(ep).error;
           r_squared_ep = s_data.SPRiNT.channel.data(ep).r_squared;

           if ~isnan(aperiodic_params_ep)
                offset_1_30_allep(mini_ep,ch) = aperiodic_params_ep(1);
                exponent_1_30_allep(mini_ep,ch) = aperiodic_params_ep(2);
                foofed_spectrum_1_30_allep(mini_ep,ch,:) = foofed_spectrum_ep;
                ap_fit_1_30_allep(mini_ep,ch,:) = ap_fit_ep;
                power_spectrum_1_30_allep(mini_ep,ch,:) = power_spectrum_ep;
                peak_fit_1_30_allep(mini_ep,ch,:) = peak_fit_ep; 
                error_1_30_allep(mini_ep,ch) = error_ep;
                r_squared_1_30_allep(mini_ep,ch) = r_squared_ep;           
           end

           peak_params_ep = peak_params{ep};

                if peak_params_ep(1) ~= 0 & ~isnan(peak_params_ep(1))

                    for w = 1:size(peak_params_ep,1)


                        frequency(w) = peak_params_ep(w,1);
                        amplitude(w) = peak_params_ep(w,2);
                        st_dev(w) = peak_params_ep(w,3);
                        nep(w) = ceil(s_data.SPRiNT.channel.data(ep).time/epochlength);
                        nmini_ep(w) = mini_ep;
                        if mini_ep <= length(phato)
                        substage(w) = phato(mini_ep);
                        else
                        substage = repelem({'N'},1,size(peak_params_ep,1));                           
                        end
%                         substage(w) = phato(mini_ep);
                        chan(w)  = ch;
                        if nep(w) <= length(hypno_aligned2)
                        stage(w) = {hypno_aligned2(nep(w))};
                        else
                        stage = repelem({'?'},1,size(peak_params_ep,1));
                        end


                    end


                    waves_ep = table(chan',frequency',amplitude',st_dev',nep',stage',nmini_ep',substage','VariableNames',{'channel','frequency','amplitude','st_dev','nep','stage','n_mini_ep','substage'});
                    waves_allepch = vertcat(waves_allepch,waves_ep);

                end

            clear frequency amplitude st_dev nep stage nmini_ep substage chan waves_ep aperiodic_params_ep peak_params_ep

            clear foofed_spectrum_ep ap_fit_ep power_spectrum_ep peak_fit_ep error_ep r_squared_ep

       end

       clear s_data


%% 30-45 Hz

peak_params2 = {s_data2.SPRiNT.channel.data.peak_params};
f2 = s_data2.Freqs;


       for ep = 1:length(s_data2.SPRiNT.channel.data)

           mini_ep = ceil(s_data2.SPRiNT.channel.data(ep).time);
           aperiodic_params_ep = s_data2.SPRiNT.channel.data(ep).aperiodic_params;
           
           foofed_spectrum_ep = s_data2.SPRiNT.channel.data(ep).fooofed_spectrum;
           ap_fit_ep = s_data2.SPRiNT.channel.data(ep).ap_fit;
           power_spectrum_ep = s_data2.SPRiNT.channel.data(ep).power_spectrum;
           peak_fit_ep = s_data2.SPRiNT.channel.data(ep).peak_fit;
           error_ep = s_data2.SPRiNT.channel.data(ep).error;
           r_squared_ep = s_data2.SPRiNT.channel.data(ep).r_squared;

           if ~isnan(aperiodic_params_ep)
                offset_30_45_allep(mini_ep,ch) = aperiodic_params_ep(1);
                exponent_30_45_allep(mini_ep,ch) = aperiodic_params_ep(2);
                foofed_spectrum_30_45_allep(mini_ep,ch,:) = foofed_spectrum_ep;
                ap_fit_30_45_allep(mini_ep,ch,:) = ap_fit_ep;
                power_spectrum_30_45_allep(mini_ep,ch,:) = power_spectrum_ep;
                peak_fit_30_45_allep(mini_ep,ch,:) = peak_fit_ep; 
                error_30_45_allep(mini_ep,ch) = error_ep;
                r_squared_30_45_allep(mini_ep,ch) = r_squared_ep;                 
                
           end

           peak_params_ep = peak_params2{ep};

                if peak_params_ep(1) ~= 0 & ~isnan(peak_params_ep(1))

                    for w = 1:size(peak_params_ep,1)


                        frequency(w) = peak_params_ep(w,1);
                        amplitude(w) = peak_params_ep(w,2);
                        st_dev(w) = peak_params_ep(w,3);
                        nep(w) = ceil(s_data2.SPRiNT.channel.data(ep).time/epochlength);
                        nmini_ep(w) = mini_ep;
                        if mini_ep <= length(phato)
                        substage(w) = phato(mini_ep);
                        else
                        substage = repelem({'N'},1,size(peak_params_ep,1));                           
                        end
%                         substage(w) = phato(mini_ep);
                        chan(w)  = ch;
                        if nep(w) <= length(hypno_aligned2)
                        stage(w) = {hypno_aligned2(nep(w))};
                        else
                        stage = repelem({'?'},1,size(peak_params_ep,1));
                        end                  

                    end


                    waves_ep2 = table(chan',frequency',amplitude',st_dev',nep',stage',nmini_ep',substage','VariableNames',{'channel','frequency','amplitude','st_dev','nep','stage','n_mini_ep','substage'});
                    waves_allepch2 = vertcat(waves_allepch2,waves_ep2);

                end

            clear frequency amplitude st_dev nep stage nmini_ep substage chan waves_ep2 aperiodic_params_ep peak_params_ep

            clear foofed_spectrum_ep ap_fit_ep power_spectrum_ep peak_fit_ep error_ep r_squared_ep


       end

       clear s_data2




%% 1-45 Hz

peak_params3 = {s_data3.SPRiNT.channel.data.peak_params};
f3 = s_data3.Freqs;


       for ep = 1:length(s_data3.SPRiNT.channel.data)

           mini_ep = ceil(s_data3.SPRiNT.channel.data(ep).time);
           aperiodic_params_ep = s_data3.SPRiNT.channel.data(ep).aperiodic_params;
           
           foofed_spectrum_ep = s_data3.SPRiNT.channel.data(ep).fooofed_spectrum;
           ap_fit_ep = s_data3.SPRiNT.channel.data(ep).ap_fit;
           power_spectrum_ep = s_data3.SPRiNT.channel.data(ep).power_spectrum;
           peak_fit_ep = s_data3.SPRiNT.channel.data(ep).peak_fit;
           error_ep = s_data3.SPRiNT.channel.data(ep).error;
           r_squared_ep = s_data3.SPRiNT.channel.data(ep).r_squared;

           if ~isnan(aperiodic_params_ep)
                offset_1_45_allep(mini_ep,ch) = aperiodic_params_ep(1);
                exponent_1_45_allep(mini_ep,ch) = aperiodic_params_ep(2);
                foofed_spectrum_1_45_allep(mini_ep,ch,:) = foofed_spectrum_ep;
                ap_fit_1_45_allep(mini_ep,ch,:) = ap_fit_ep;
                power_spectrum_1_45_allep(mini_ep,ch,:) = power_spectrum_ep;
                peak_fit_1_45_allep(mini_ep,ch,:) = peak_fit_ep; 
                error_1_45_allep(mini_ep,ch) = error_ep;
                r_squared_1_45_allep(mini_ep,ch) = r_squared_ep; 
           end

           peak_params_ep = peak_params3{ep};

                if peak_params_ep(1) ~= 0 & ~isnan(peak_params_ep(1))

                    for w = 1:size(peak_params_ep,1)


                        frequency(w) = peak_params_ep(w,1);
                        amplitude(w) = peak_params_ep(w,2);
                        st_dev(w) = peak_params_ep(w,3);
                        nep(w) = ceil(s_data3.SPRiNT.channel.data(ep).time/epochlength);
                        nmini_ep(w) = mini_ep;
                        if mini_ep <= length(phato)
                        substage(w) = phato(mini_ep);
                        else
                        substage = repelem({'N'},1,size(peak_params_ep,1));                           
                        end
%                         substage(w) = phato(mini_ep);
                        chan(w)  = ch;
                        if nep(w) <= length(hypno_aligned2)
                        stage(w) = {hypno_aligned2(nep(w))};
                        else
                        stage = repelem({'?'},1,size(peak_params_ep,1));
                        end                  

                    end


                    waves_ep3 = table(chan',frequency',amplitude',st_dev',nep',stage',nmini_ep',substage','VariableNames',{'channel','frequency','amplitude','st_dev','nep','stage','n_mini_ep','substage'});
                    waves_allepch3 = vertcat(waves_allepch3,waves_ep3);

                end

            clear frequency amplitude st_dev nep stage nmini_ep substage chan waves_ep3 aperiodic_params_ep peak_params_ep

            clear foofed_spectrum_ep ap_fit_ep power_spectrum_ep peak_fit_ep error_ep r_squared_ep


       end

       clear s_data3
       
       
end

%%

% if ~exist([Savefolder,filesep,aICA_file(s).name(1:12)])
%    mkdir([Savefolder,filesep,aICA_file(s).name(1:12)]); 
% end

save([Savefolder,filesep,aICA_file(s).name(1:end-9),'_sprint_waves.mat'],'waves_allepch','waves_allepch2','offset_1_30_allep','exponent_1_30_allep','foofed_spectrum_1_30_allep','ap_fit_1_30_allep','power_spectrum_1_30_allep','peak_fit_1_30_allep',...
'offset_30_45_allep','exponent_30_45_allep','foofed_spectrum_30_45_allep','ap_fit_30_45_allep','power_spectrum_30_45_allep','peak_fit_30_45_allep',...
'offset_1_45_allep','exponent_1_45_allep','foofed_spectrum_1_45_allep','ap_fit_1_45_allep','power_spectrum_1_45_allep','peak_fit_1_45_allep',...
'error_1_30_allep', 'r_squared_1_30_allep','error_30_45_allep', 'r_squared_30_45_allep','error_1_45_allep', 'r_squared_1_45_allep',...
'f1','f2','f3','-v7.3')


clear waves_allepch waves_allepch3 abundance_f1 abundance_f2 abundance_f3 offset_1_30_allep exponent_1_30_allep offset_30_45_allep exponent_30_45_allep offset_1_45_allep exponent_1_45_allep f1 f2 f3

clear foofed_spectrum_1_30_allep ap_fit_1_30_allep power_spectrum_1_30_allep peak_fit_1_30_allep
clear foofed_spectrum_30_45_allep ap_fit_30_45_allep power_spectrum_30_45_allep peak_fit_30_45_allep
clear foofed_spectrum_1_45_allep ap_fit_1_45_allep power_spectrum_1_45_allep peak_fit_1_45_allep
clear error_1_30_allep r_squared_1_30_allep error_30_45_allep r_squared_30_45_allep error_1_45_allep r_squared_1_45_allep


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

