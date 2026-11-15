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


m_eBOSC_allsub_phasic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_phasic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_tonic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_tonic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_phasic_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_phasic_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_phasic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.4471 0.6980];
% b.FaceAlpha = 0.5;
% hold on
% 
% b = bar(f,m_eBOSC_allsub_tonic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.8353 0.3686 0];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic);    
% er.Color = [0 0.4471 0.6980];                            
% er.LineStyle = 'none';  
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic);    
% er2.Color = [0.8353 0.3686 0];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_tonic_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'phasic' 'tonic'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'.svg']);

%% central

nights = [1 10];
ch = [2 7];

sub = 1:36;


m_eBOSC_allsub_phasic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_phasic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_tonic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_tonic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_phasic_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_phasic_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_phasic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.4471 0.6980];
% b.FaceAlpha = 0.5;
% hold on
% 
% b = bar(f,m_eBOSC_allsub_tonic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.8353 0.3686 0];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic);    
% er.Color = [0 0.4471 0.6980];                            
% er.LineStyle = 'none';  
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic);    
% er2.Color = [0.8353 0.3686 0];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_tonic_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'phasic' 'tonic'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'.svg']);

%% parietal

nights = [1 10];
ch = [3 6];

sub = 1:36;


m_eBOSC_allsub_phasic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_phasic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_tonic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_tonic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_phasic_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_phasic_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_phasic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.4471 0.6980];
% b.FaceAlpha = 0.5;
% hold on
% 
% b = bar(f,m_eBOSC_allsub_tonic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.8353 0.3686 0];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic);    
% er.Color = [0 0.4471 0.6980];                            
% er.LineStyle = 'none';  
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic);    
% er2.Color = [0.8353 0.3686 0];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_tonic_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'phasic' 'tonic'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'.svg']);

%% occipital

nights = [1 10];
ch = [4 5];

sub = 1:36;


m_eBOSC_allsub_phasic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_phasic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_phasic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));

m_eBOSC_allsub_tonic = smoothdata(squeeze(nanmean(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)),'movmean',3);
sem_eBOSC_allsub_tonic = squeeze(nanstd(nanmean(nanmean(eBOSC_allsub.h_values_tonic_allsub(sub,nights,ch,:),2),3),1)./sqrt(length(sub)));


bin_edges = squeeze(eBOSC_allsub.h_bin_edges_phasic_allsub(1,1,1,:));
f = (bin_edges(1:30) + bin_edges(2:31))/2;


colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
% hold on
% plot(f1,m_peak_fit_1_30_phasic_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f, m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f, m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on

% b = bar(f,m_eBOSC_allsub_phasic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0 0.4471 0.6980];
% b.FaceAlpha = 0.5;
% hold on
% 
% b = bar(f,m_eBOSC_allsub_tonic,'hist')
% b.EdgeColor = 'w';
% b.FaceColor = [0.8353 0.3686 0];
% b.FaceAlpha = 0.5;
% 
% hold on
% 
% er = errorbar(f,m_eBOSC_allsub_phasic,sem_eBOSC_allsub_phasic);    
% er.Color = [0 0.4471 0.6980];                            
% er.LineStyle = 'none';  
% 
% hold on
% 
% er2 = errorbar(f,m_eBOSC_allsub_tonic,sem_eBOSC_allsub_tonic);    
% er2.Color = [0.8353 0.3686 0];                            
% er2.LineStyle = 'none';  

% hold on
% plot(f1,m_peak_fit_1_30_tonic_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Probability (-)');
% set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1.3 20]);
xticks(0:2:20);
% legend({'phasic' 'tonic'})
l2 = xline(2);
l6 = xline(6);
l12 = xline(12);
l2.LineWidth = 1.5;
l6.LineWidth = 1.5;
l12.LineWidth = 1.5;

% xline(12);
% xline(16);


saveas(fig,[Savefolder,filesep,'histogram_plot_ch',num2str(ch),'.svg']);

