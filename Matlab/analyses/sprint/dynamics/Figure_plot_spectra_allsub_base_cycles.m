clear all;
close all;

addpath(genpath('/users/nemo/software/Henry/useful_functions')); % contains linspecer function, circular statistics toolbox functions, echt function, shadedErrorBar function, see README on where to find this

load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub_dynamics/sprint_allsub_aperiodic_dynamics_16-Dec-2025.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/sprint';

%%

incl_sub = 1:36;
nights = [1 10]; 

channels = 1:8;

f1 = 1:30;
f2 = 30:45;
f3 = 1:45;

%%

last_cycle = [];

for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8

            exponent_1_30_cyc_nrem_allcycles = squeeze(exponent_1_30_cyc_nrem_all(s,night,ch,:));
            nonan_cycles = find(~isnan(exponent_1_30_cyc_nrem_allcycles) == 1);
            
            if ~isempty(nonan_cycles)
            last_cycle(s,night,ch) = nonan_cycles(end);
            else
            last_cycle(s,night,ch) = 1;    
            end


        end
        
    end
    
end
%% 

s = 6;
night = 1;
last_cycle_ni = last_cycle(s,night,1);

% psd_phasic_last_sub6 =
% squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni-1,:));
% 
% 
% for ch = 1:8
%    
%     plot(f2,psd_phasic_last_sub6(ch,:))
%     hold on
%     
% end

last_cycle(s,night,:) = repmat(last_cycle_ni-1,8,1); % use second last cycle for night 1 of participant 6 since it represented an outlier

%%

for s = 1:36

    for ni = 1:length(nights)

        night = nights(ni); 
        first_cycle_ni = 1;
        last_cycle_ni = last_cycle(s,ni,1); 

        mch_power_spectrum_30_45_nrem_allsub_first(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_nrem_allsub_last(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_phasic_allsub_first(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_phasic_allsub_last(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_tonic_allsub_first(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_tonic_allsub_last(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,last_cycle_ni,:)),1);
      
        
        mch_foofed_spectrum_30_45_nrem_allsub_first(s,ni,:) = nanmean(squeeze(log_foofed_spectrum_30_45_cyc_nrem_all(s,night,channels,first_cycle_ni,:)),1);
        mch_foofed_spectrum_30_45_nrem_allsub_last(s,ni,:) = nanmean(squeeze(log_foofed_spectrum_30_45_cyc_nrem_all(s,night,channels,last_cycle_ni,:)),1);

        mch_foofed_spectrum_30_45_phasic_allsub_first(s,ni,:) = nanmean(squeeze(log_foofed_spectrum_30_45_cyc_phasic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_foofed_spectrum_30_45_phasic_allsub_last(s,ni,:) = nanmean(squeeze(log_foofed_spectrum_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni,:)),1);

        mch_foofed_spectrum_30_45_tonic_allsub_first(s,ni,:) = nanmean(squeeze(log_foofed_spectrum_30_45_cyc_tonic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_foofed_spectrum_30_45_tonic_allsub_last(s,ni,:) = nanmean(squeeze(log_foofed_spectrum_30_45_cyc_tonic_all(s,night,channels,last_cycle_ni,:)),1);

        
        mch_ap_fit_30_45_nrem_allsub_first(s,ni,:) = nanmean(squeeze(log_ap_fit_30_45_cyc_nrem_all(s,night,channels,first_cycle_ni,:)),1);
        mch_ap_fit_30_45_nrem_allsub_last(s,ni,:) = nanmean(squeeze(log_ap_fit_30_45_cyc_nrem_all(s,night,channels,last_cycle_ni,:)),1);

        mch_ap_fit_30_45_phasic_allsub_first(s,ni,:) = nanmean(squeeze(log_ap_fit_30_45_cyc_phasic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_ap_fit_30_45_phasic_allsub_last(s,ni,:) = nanmean(squeeze(log_ap_fit_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni,:)),1);

        mch_ap_fit_30_45_tonic_allsub_first(s,ni,:) = nanmean(squeeze(log_ap_fit_30_45_cyc_tonic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_ap_fit_30_45_tonic_allsub_last(s,ni,:) = nanmean(squeeze(log_ap_fit_30_45_cyc_tonic_all(s,night,channels,last_cycle_ni,:)),1);

        
        
    end

end

%%

m_power_spectrum_30_45_nrem_allsub_first = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first(incl_sub,:,:),2),1));
sem_power_spectrum_30_45_nrem_allsub_first = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first(incl_sub,:,:),2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_nrem_allsub_last = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last(incl_sub,:,:),2),1));
sem_power_spectrum_30_45_nrem_allsub_last = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last(incl_sub,:,:),2),1)./sqrt(length(incl_sub)));


m_power_spectrum_30_45_phasic_allsub_first = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first(incl_sub,:,:),2),1));
sem_power_spectrum_30_45_phasic_allsub_first = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first(incl_sub,:,:),2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_phasic_allsub_last = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last(incl_sub,:,:),2),1));
sem_power_spectrum_30_45_phasic_allsub_last = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last(incl_sub,:,:),2),1)./sqrt(length(incl_sub)));


m_power_spectrum_30_45_tonic_allsub_first = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first(incl_sub,:,:),2),1));
sem_power_spectrum_30_45_tonic_allsub_first = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first(incl_sub,:,:),2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_tonic_allsub_last = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last(incl_sub,:,:),2),1));
sem_power_spectrum_30_45_tonic_allsub_last = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last(incl_sub,:,:),2),1)./sqrt(length(incl_sub)));

%% 30-45 Hz loglog - NREM

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)

shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub_first,sem_power_spectrum_30_45_nrem_allsub_first,'lineProps',{'-','Color',[0 0.6196 0.4510 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub_last,sem_power_spectrum_30_45_nrem_allsub_last,'lineProps',{'-','Color',[0.2510 0.8902 0.4196 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',15,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.16])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_base_cyc_nrem.svg']);


%% 30-45 Hz loglog - phasic

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,2)

shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub_first,sem_power_spectrum_30_45_phasic_allsub_first,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub_last,sem_power_spectrum_30_45_phasic_allsub_last,'lineProps',{'-','Color',[0.0745 0.6235 1 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',15,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.16])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_base_cyc_phasic.svg']);



%% 30-45 Hz loglog - tonic

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,3)

shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub_first,sem_power_spectrum_30_45_tonic_allsub_first,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub_last,sem_power_spectrum_30_45_tonic_allsub_last,'lineProps',{'-','Color',[0.9098 0.6353 0.0824 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',15,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.16])
legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_base_cyc_tonic.svg']);






