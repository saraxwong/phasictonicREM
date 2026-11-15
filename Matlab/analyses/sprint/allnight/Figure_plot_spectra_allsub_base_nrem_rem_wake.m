clear all;
close all;

addpath(genpath('/users/nemo/software/Henry/useful_functions')); % contains linspecer function, circular statistics toolbox functions, echt function, shadedErrorBar function, see README on where to find this
addpath(genpath('/users/nemo/software/eeglab')); % eeglab toolbox, see README on where to find this

% load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/sprint_allsub_16-Dec-2025.mat');
load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/allsub/sprint_allsub_13-Jul-2026.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/sprint';

%%

s = 1:36;
n = [1 10];

ch = 1:8;

f1 = 1:1:30;
f2 = 30:1:45;
f3 = 1:1:45;

%%

m_power_spectrum_1_45_nrem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_1_45_nrem_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_45_nrem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_1_45_nrem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_1_45_rem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_1_45_rem_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_45_rem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_1_45_rem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_1_45_wake_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_1_45_wake_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_45_wake_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_1_45_wake_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));


m_ap_fit_1_45_nrem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_1_45_nrem_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_45_nrem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_1_45_nrem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_1_45_rem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_1_45_rem_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_45_rem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_1_45_rem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_1_45_wake_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_1_45_wake_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_45_wake_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_1_45_wake_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));



m_power_spectrum_30_45_nrem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_30_45_nrem_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_30_45_nrem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_30_45_nrem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_30_45_rem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_30_45_rem_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_30_45_rem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_30_45_rem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_30_45_wake_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_30_45_wake_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_30_45_wake_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_power_spectrum_30_45_wake_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));


m_ap_fit_30_45_nrem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_30_45_nrem_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_30_45_nrem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_30_45_nrem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_30_45_rem_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_30_45_rem_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_30_45_rem_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_30_45_rem_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_30_45_wake_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_30_45_wake_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_30_45_wake_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(sprint_allsub.log_ap_fit_30_45_wake_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));


%% 1-45 Hz semilog

colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
shadedErrorBar(f3, m_power_spectrum_1_45_wake_allsub,sem_power_spectrum_1_45_wake_allsub,'lineProps',{'-','Color',[0.741, 0.694, 0.059 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
% plot(f3,m_ap_fit_1_45_wake_allsub,'--','Color',[0.6314 0.6314 0.1412],'LineWidth',2)
hold on
shadedErrorBar(f3, m_power_spectrum_1_45_nrem_allsub,sem_power_spectrum_1_45_nrem_allsub,'lineProps',{'-','Color',[0, 0.62, 0.451 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
% plot(f3,m_ap_fit_1_45_nrem_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f3, m_power_spectrum_1_45_rem_allsub,sem_power_spectrum_1_45_rem_allsub,'lineProps',{'-','Color',[0.80, 0.475, 0.655 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
% plot(f3,m_ap_fit_1_45_rem_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
h = xline(30);
h.LineStyle = '--';
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1 45])
xticks(0:5:45);

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_1_45Hz_allch_nrem_rem_wake.svg']);

%% 30-45 Hz loglog

colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
shadedErrorBar(f2, m_power_spectrum_30_45_wake_allsub,sem_power_spectrum_30_45_wake_allsub,'lineProps',{'-','Color',[0.741, 0.694, 0.059 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f2,m_ap_fit_30_45_wake_allsub,'--','Color',[0.541, 0.494, 0],'LineWidth',2)
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub,sem_power_spectrum_30_45_nrem_allsub,'lineProps',{'-','Color',[0, 0.62, 0.451 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f2,m_ap_fit_30_45_nrem_allsub,'--','Color',[0, 0.42, 0.251],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f2, m_power_spectrum_30_45_rem_allsub,sem_power_spectrum_30_45_rem_allsub,'lineProps',{'-','Color',[0.80, 0.475, 0.655 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f2,m_ap_fit_30_45_rem_allsub,'--','Color',[0.60, 0.275, 0.655],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
% ylim([0.02 1.5]);
saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_nrem_rem_wake.svg']);

