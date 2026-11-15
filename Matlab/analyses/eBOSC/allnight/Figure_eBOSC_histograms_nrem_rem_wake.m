clear all;
close all;

load('/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/allsub/allsub/eBOSC_allsub_19-Aug-2026.mat');

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');
chans = EEG.chanlocs;

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/eBOSC';

%% frontal

nights = [1 10];
ch = [1 8];

sub = 1:36;

m_eBOSC_allsub_wake = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_wake = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_nrem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_nrem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_rem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_rem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_nrem_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_nrem_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake,'lineProps',{'-','Color',[0.741 0.694 0.059 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem,'lineProps',{'-','Color',[0 0.62 0.451 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem,'lineProps',{'-','Color',[0.80 0.475 0.655 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_wake,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.741 0.694 0.059];
% b.FaceAlpha = 0.5;
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake);    
% er.Color = [0.741 0.694 0.059];                            
% er.LineStyle = 'none';  
% 
% subplot(1,3,2)
% b = bar(f,m_eBOSC_allsub_nrem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.62 0.451];
% b.FaceAlpha = 0.5;
% hold on
% 
% er1 = errorbar(f,m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem);    
% er1.Color = [0 0.62 0.451];                            
% er1.LineStyle = 'none';  
% 
% subplot(1,3,3)
% b = bar(f,m_eBOSC_allsub_rem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.80 0.475 0.655];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem);    
% er2.Color = [0.80 0.475 0.655];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_rem_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'nrem' 'rem'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'_nrem_rem_wake.svg']);

%% central

nights = [1 10];
ch = [2 7];

sub = 1:36;

m_eBOSC_allsub_wake = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_wake = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_nrem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_nrem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_rem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_rem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_nrem_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_nrem_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake,'lineProps',{'-','Color',[0.741 0.694 0.059 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem,'lineProps',{'-','Color',[0 0.62 0.451 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem,'lineProps',{'-','Color',[0.80 0.475 0.655 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_wake,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.741 0.694 0.059];
% b.FaceAlpha = 0.5;
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake);    
% er.Color = [0.741 0.694 0.059];                            
% er.LineStyle = 'none';  
% 
% subplot(1,3,2)
% b = bar(f,m_eBOSC_allsub_nrem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.62 0.451];
% b.FaceAlpha = 0.5;
% hold on
% 
% er1 = errorbar(f,m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem);    
% er1.Color = [0 0.62 0.451];                            
% er1.LineStyle = 'none';  
% 
% subplot(1,3,3)
% b = bar(f,m_eBOSC_allsub_rem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.80 0.475 0.655];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem);    
% er2.Color = [0.80 0.475 0.655];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_rem_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'nrem' 'rem'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'_nrem_rem_wake.svg']);

%% parietal

nights = [1 10];
ch = [3 6];

sub = 1:36;

m_eBOSC_allsub_wake = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_wake = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_nrem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_nrem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_rem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_rem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_nrem_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_nrem_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake,'lineProps',{'-','Color',[0.741 0.694 0.059 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem,'lineProps',{'-','Color',[0 0.62 0.451 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem,'lineProps',{'-','Color',[0.80 0.475 0.655 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_wake,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.741 0.694 0.059];
% b.FaceAlpha = 0.5;
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake);    
% er.Color = [0.741 0.694 0.059];                            
% er.LineStyle = 'none';  
% 
% subplot(1,3,2)
% b = bar(f,m_eBOSC_allsub_nrem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.62 0.451];
% b.FaceAlpha = 0.5;
% hold on
% 
% er1 = errorbar(f,m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem);    
% er1.Color = [0 0.62 0.451];                            
% er1.LineStyle = 'none';  
% 
% subplot(1,3,3)
% b = bar(f,m_eBOSC_allsub_rem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.80 0.475 0.655];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem);    
% er2.Color = [0.80 0.475 0.655];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_rem_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'nrem' 'rem'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'_nrem_rem_wake.svg']);


%% occipital

nights = [1 10];
ch = [4 5];

sub = 1:36;

m_eBOSC_allsub_wake = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_wake = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_wake_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_nrem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_nrem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_nrem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_rem = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_rem = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_rem_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_nrem_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_nrem_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake,'lineProps',{'-','Color',[0.741 0.694 0.059 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem,'lineProps',{'-','Color',[0 0.62 0.451 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem,'lineProps',{'-','Color',[0.80 0.475 0.655 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_wake,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.741 0.694 0.059];
% b.FaceAlpha = 0.5;
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_wake,sem_eBOSC_allsub_wake);    
% er.Color = [0.741 0.694 0.059];                            
% er.LineStyle = 'none';  
% 
% subplot(1,3,2)
% b = bar(f,m_eBOSC_allsub_nrem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.62 0.451];
% b.FaceAlpha = 0.5;
% hold on
% 
% er1 = errorbar(f,m_eBOSC_allsub_nrem,sem_eBOSC_allsub_nrem);    
% er1.Color = [0 0.62 0.451];                            
% er1.LineStyle = 'none';  
% 
% subplot(1,3,3)
% b = bar(f,m_eBOSC_allsub_rem,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.80 0.475 0.655];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_rem,sem_eBOSC_allsub_rem);    
% er2.Color = [0.80 0.475 0.655];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_rem_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'nrem' 'rem'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'_nrem_rem_wake.svg']);

