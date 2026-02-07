clear all;
close all;

addpath(genpath('/users/nemo/software/Henry/useful_functions')); % contains linspecer function, circular statistics toolbox functions, echt function, shadedErrorBar function, see README on where to find this

load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/sprint_allsub_16-Dec-2025.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/sprint';

%%

s = 1:36;
n = [1 10];

ch = 1:8;

f1 = 1:1:30;
f2 = 30:1:45;
f3 = 1:1:45;

%%

m_power_spectrum_1_45_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_1_45_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_45_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_1_45_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_1_45_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_1_45_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_45_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_1_45_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

log_power_spectrum_1_45_ratio_allsub = log_power_spectrum_1_45_phasic_allsub-log_power_spectrum_1_45_tonic_allsub;
m_power_spectrum_1_45_ratio_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_1_45_ratio_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_45_ratio_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_1_45_ratio_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_1_30_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_1_30_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_30_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_1_30_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_1_30_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_1_30_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_1_30_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_1_30_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_30_45_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_30_45_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_30_45_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_30_45_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_power_spectrum_30_45_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_power_spectrum_30_45_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_power_spectrum_30_45_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_power_spectrum_30_45_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));


m_foofed_spectrum_1_45_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_foofed_spectrum_1_45_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_foofed_spectrum_1_45_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_foofed_spectrum_1_45_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_foofed_spectrum_1_45_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_foofed_spectrum_1_45_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_foofed_spectrum_1_45_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_foofed_spectrum_1_45_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_foofed_spectrum_1_30_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_foofed_spectrum_1_30_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_foofed_spectrum_1_30_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_foofed_spectrum_1_30_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_foofed_spectrum_1_30_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_foofed_spectrum_1_30_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_foofed_spectrum_1_30_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_foofed_spectrum_1_30_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_foofed_spectrum_30_45_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_foofed_spectrum_30_45_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_foofed_spectrum_30_45_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_foofed_spectrum_30_45_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_foofed_spectrum_30_45_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_foofed_spectrum_30_45_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_foofed_spectrum_30_45_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_foofed_spectrum_30_45_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));


m_ap_fit_1_45_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_ap_fit_1_45_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_45_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_ap_fit_1_45_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_1_45_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_ap_fit_1_45_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_45_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_ap_fit_1_45_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_1_30_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_ap_fit_1_30_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_30_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_ap_fit_1_30_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_1_30_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_ap_fit_1_30_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_1_30_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_ap_fit_1_30_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_30_45_phasic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_ap_fit_30_45_phasic_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_30_45_phasic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_ap_fit_30_45_phasic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));

m_ap_fit_30_45_tonic_allsub = (squeeze(nanmean(10.^(nanmean(nanmean(log_ap_fit_30_45_tonic_allsub(s,n,ch,:),2),3)),1)));
sem_ap_fit_30_45_tonic_allsub = (squeeze(nanstd(10.^(nanmean(nanmean(log_ap_fit_30_45_tonic_allsub(s,n,ch,:),2),3)),1)))./sqrt(length(s));


%% Compare phasic/tonic using a lme


for b = 1:size(log_power_spectrum_1_45_phasic_allsub,4)
   
    power_phasic_bin = squeeze(log_power_spectrum_1_45_phasic_allsub(:,:,:,b));
    power_tonic_bin = squeeze(log_power_spectrum_1_45_tonic_allsub(:,:,:,b));
  
    table_bin_night_ch_all = [];
    
    for night = 1:2
        
        for channel = 1:8
            
            sub = vertcat(s',s');
            ni = repmat(night,length(s)*2,1);
            chan = repmat(channel,length(s)*2,1);
            substage = vertcat(repmat(1,length(s),1),repmat(2,length(s),1));
            power_bin_night_ch = vertcat(power_phasic_bin(:,n(night),channel),power_tonic_bin(:,n(night),channel));
            table_bin_night_ch = table(sub,ni,chan,substage,power_bin_night_ch,'VariableNames',{'sub','night','channel','substage','power'});
            table_bin_night_ch_all = vertcat(table_bin_night_ch_all,table_bin_night_ch);
        
        end
    end
    
    table_bin_night_ch_all.sub = categorical(table_bin_night_ch_all.sub);
    table_bin_night_ch_all.night = categorical(table_bin_night_ch_all.night);
    table_bin_night_ch_all.channel = categorical(table_bin_night_ch_all.channel);
    
   lme = fitlme(table_bin_night_ch_all,'power ~ night + channel + substage + (1|sub)','FitMethod','REML','DummyVarCoding','effects');

   stats = anova(lme);
   p_night(b) = stats.pValue(2);
   p_channel(b) = stats.pValue(3);
   p_substage(b) = stats.pValue(4);

    
end

%% 1-45 Hz logy

colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
hold on
shadedErrorBar(f3, m_power_spectrum_1_45_phasic_allsub,sem_power_spectrum_1_45_phasic_allsub,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f3, m_power_spectrum_1_45_tonic_allsub,sem_power_spectrum_1_45_tonic_allsub,'lineProps',{'-','Color', [0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
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

saveas(fig,[Savefolder,filesep,'Sprint_illustration_logy_1_45Hz_allch.svg']);

%% 1-45 Hz ratio

colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,1)
shadedErrorBar(f3, m_power_spectrum_1_45_ratio_allsub,sem_power_spectrum_1_45_ratio_allsub,'lineProps',{'-','Color', [0.4 0.4 0.4],'LineWidth',2},'patchSaturation',.1);
hold on
sig_bins = find(p_substage <= 0.05);
diff_sig_bins = diff(sig_bins);
end_sig_bins = find(diff_sig_bins > 1);
sig_bins1 = sig_bins(1:end_sig_bins(1));
sig_bins2 = sig_bins(end_sig_bins(1)+1:end_sig_bins(2));
sig_bins3 = sig_bins(end_sig_bins(2)+1:end);
plot([sig_bins1(1) sig_bins1(end)],ones(2,1)*0.8,'-','Color','k','LineWidth',3);
hold on
plot([sig_bins2(1) sig_bins2(end)],ones(2,1)*0.8,'-','Color','k','LineWidth',3);
hold on
plot([sig_bins3(1) sig_bins3(end)],ones(2,1)*0.8,'-','Color','k','LineWidth',3);

xlabel('Frequency (Hz)');
ylabel('Power phasic/tonic (-)');
h = xline(30);
k = yline(1);
h.LineStyle = '--';
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2);
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1 45])
ylim([0.75 1.7])
xticks(0:5:45);

saveas(fig,[Savefolder,filesep,'Sprint_illustration_power_ratio_1_45Hz_allch.svg']);

%% 1-30 Hz loglog

colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,2)
shadedErrorBar(f1, m_power_spectrum_1_30_phasic_allsub,sem_power_spectrum_1_30_phasic_allsub,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f1,m_ap_fit_1_30_phasic_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f1, m_power_spectrum_1_30_tonic_allsub,sem_power_spectrum_1_30_tonic_allsub,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f1,m_ap_fit_1_30_tonic_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([1 30])
xticks(0:5:30);

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_1_30Hz_allch.svg']);

%% 30-45 Hz loglog

colors = linspecer(4)

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,3,3)
shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub,sem_power_spectrum_30_45_phasic_allsub,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f2,m_ap_fit_30_45_phasic_allsub,'--','Color',[0 0.2471 0.4980],'LineWidth',2)
hold on
ff1 = 1;
shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub,sem_power_spectrum_30_45_tonic_allsub,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
plot(f2,m_ap_fit_30_45_tonic_allsub,'--','Color',[0.6392 0.2941 0.0314],'LineWidth',2)
hold on
xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch.svg']);




