clear all;
close all;

addpath(genpath('/users/nemo/software/Henry/useful_functions')); % contains linspecer function, circular statistics toolbox functions, echt function, shadedErrorBar function, see README on where to find this

load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub_dynamics/sprint_allsub_aperiodic_dynamics_16-Dec-2025.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/sprint';

%%

incl_sub = 1:36;
nights_base = [1 10];
nights_ext = 2:8;
nights_rest = 11:17;

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

for s = 1:length(incl_sub)

    for ni = 1:length(nights_base)

        night = nights_base(ni); 
        first_cycle_ni = 1;
        last_cycle_ni = last_cycle(s,ni,1); 

        mch_power_spectrum_30_45_nrem_allsub_first_base(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_nrem_allsub_last_base(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_phasic_allsub_first_base(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_phasic_allsub_last_base(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_tonic_allsub_first_base(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_tonic_allsub_last_base(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,last_cycle_ni,:)),1);
      
        
    end

end


for s = 1:length(incl_sub)

    for ni = 1:length(nights_ext)

        night = nights_ext(ni); 
        first_cycle_ni = 1;
        last_cycle_ni = last_cycle(s,ni,1); 

        mch_power_spectrum_30_45_nrem_allsub_first_ext(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_nrem_allsub_last_ext(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_phasic_allsub_first_ext(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_phasic_allsub_last_ext(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_tonic_allsub_first_ext(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_tonic_allsub_last_ext(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,last_cycle_ni,:)),1);
      
        
    end

end


for s = 1:length(incl_sub)

    for ni = 1:length(nights_rest)

        night = nights_rest(ni); 
        first_cycle_ni = 1;
        last_cycle_ni = last_cycle(s,ni,1); 

        mch_power_spectrum_30_45_nrem_allsub_first_rest(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_nrem_allsub_last_rest(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_nrem_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_phasic_allsub_first_rest(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_phasic_allsub_last_rest(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_phasic_all(s,night,channels,last_cycle_ni,:)),1);

        mch_power_spectrum_30_45_tonic_allsub_first_rest(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,first_cycle_ni,:)),1);
        mch_power_spectrum_30_45_tonic_allsub_last_rest(s,ni,:) = nanmean(squeeze(log_power_spectrum_30_45_cyc_tonic_all(s,night,channels,last_cycle_ni,:)),1);
      
        
    end

end

%%

m_power_spectrum_30_45_nrem_allsub_first_base = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first_base,2),1));
sem_power_spectrum_30_45_nrem_allsub_first_base = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first_base,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_nrem_allsub_last_base = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last_base,2),1));
sem_power_spectrum_30_45_nrem_allsub_last_base = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last_base,2),1)./sqrt(length(incl_sub)));


m_power_spectrum_30_45_phasic_allsub_first_base = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first_base,2),1));
sem_power_spectrum_30_45_phasic_allsub_first_base = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first_base,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_phasic_allsub_last_base = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last_base,2),1));
sem_power_spectrum_30_45_phasic_allsub_last_base = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last_base,2),1)./sqrt(length(incl_sub)));



m_power_spectrum_30_45_tonic_allsub_first_base = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first_base,2),1));
sem_power_spectrum_30_45_tonic_allsub_first_base = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first_base,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_tonic_allsub_last_base = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last_base,2),1));
sem_power_spectrum_30_45_tonic_allsub_last_base = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last_base,2),1)./sqrt(length(incl_sub)));

%%

m_power_spectrum_30_45_nrem_allsub_first_ext = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first_ext,2),1));
sem_power_spectrum_30_45_nrem_allsub_first_ext = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first_ext,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_nrem_allsub_last_ext = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last_ext,2),1));
sem_power_spectrum_30_45_nrem_allsub_last_ext = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last_ext,2),1)./sqrt(length(incl_sub)));


m_power_spectrum_30_45_phasic_allsub_first_ext = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first_ext,2),1));
sem_power_spectrum_30_45_phasic_allsub_first_ext = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first_ext,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_phasic_allsub_last_ext = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last_ext,2),1));
sem_power_spectrum_30_45_phasic_allsub_last_ext = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last_ext,2),1)./sqrt(length(incl_sub)));



m_power_spectrum_30_45_tonic_allsub_first_ext = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first_ext,2),1));
sem_power_spectrum_30_45_tonic_allsub_first_ext = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first_ext,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_tonic_allsub_last_ext = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last_ext,2),1));
sem_power_spectrum_30_45_tonic_allsub_last_ext = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last_ext,2),1)./sqrt(length(incl_sub)));

%%

m_power_spectrum_30_45_nrem_allsub_first_rest = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first_rest,2),1));
sem_power_spectrum_30_45_nrem_allsub_first_rest = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_first_rest,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_nrem_allsub_last_rest = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last_rest,2),1));
sem_power_spectrum_30_45_nrem_allsub_last_rest = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_nrem_allsub_last_rest,2),1)./sqrt(length(incl_sub)));


m_power_spectrum_30_45_phasic_allsub_first_rest = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first_rest,2),1));
sem_power_spectrum_30_45_phasic_allsub_first_rest = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_first_rest,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_phasic_allsub_last_rest = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last_rest,2),1));
sem_power_spectrum_30_45_phasic_allsub_last_rest = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_phasic_allsub_last_rest,2),1)./sqrt(length(incl_sub)));



m_power_spectrum_30_45_tonic_allsub_first_rest = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first_rest,2),1));
sem_power_spectrum_30_45_tonic_allsub_first_rest = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_first_rest,2),1)./sqrt(length(incl_sub)));

m_power_spectrum_30_45_tonic_allsub_last_rest = squeeze(nanmean(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last_rest,2),1));
sem_power_spectrum_30_45_tonic_allsub_last_rest = squeeze(nanstd(10.^nanmean(mch_power_spectrum_30_45_tonic_allsub_last_rest,2),1)./sqrt(length(incl_sub)));



%% 30-45 Hz loglog NREM ext

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,6,1)

shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub_first_ext,sem_power_spectrum_30_45_nrem_allsub_first_ext,'lineProps',{'-','Color',[0 0.6196 0.4510 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub_last_ext,sem_power_spectrum_30_45_nrem_allsub_last_ext,'lineProps',{'-','Color',[0.2510 0.8902 0.4196 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.13])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_cyc_nrem_SE.svg']);


%% 30-45 Hz loglog NREM rest

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,6,2)

shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub_first_rest,sem_power_spectrum_30_45_nrem_allsub_first_rest,'lineProps',{'-','Color',[0 0.6196 0.4510 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_nrem_allsub_last_rest,sem_power_spectrum_30_45_nrem_allsub_last_rest,'lineProps',{'-','Color',[0.2510 0.8902 0.4196 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.13])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_cyc_nrem_SR.svg']);


%% 30-45 Hz loglog phasic ext

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,6,3)

shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub_first_ext,sem_power_spectrum_30_45_phasic_allsub_first_ext,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub_last_ext,sem_power_spectrum_30_45_phasic_allsub_last_ext,'lineProps',{'-','Color',[0.0745 0.6235 1 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.13])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_cyc_phasic_SE.svg']);


%% 30-45 Hz loglog phasic rest

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,6,4)

shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub_first_rest,sem_power_spectrum_30_45_phasic_allsub_first_rest,'lineProps',{'-','Color',[0 0.4471 0.6980 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_phasic_allsub_last_rest,sem_power_spectrum_30_45_phasic_allsub_last_rest,'lineProps',{'-','Color',[0.0745 0.6235 1 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.13])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_cyc_phasic_SR.svg']);


%% 30-45 Hz loglog tonic ext

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,6,5)

shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub_first_ext,sem_power_spectrum_30_45_tonic_allsub_first_ext,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub_last_ext,sem_power_spectrum_30_45_tonic_allsub_last_ext,'lineProps',{'-','Color',[0.9098 0.6353 0.0824 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.13])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_cyc_tonic_SE.svg']);


%% 30-45 Hz loglog tonic rest

colors = linspecer(4)


fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])    
fig.WindowState = 'maximized';

subplot(1,6,6)

shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub_first_rest,sem_power_spectrum_30_45_tonic_allsub_first_rest,'lineProps',{'-','Color',[0.8353 0.3686 0 0.7],'LineWidth',2},'patchSaturation',.1);
hold on
shadedErrorBar(f2, m_power_spectrum_30_45_tonic_allsub_last_rest,sem_power_spectrum_30_45_tonic_allsub_last_rest,'lineProps',{'-','Color',[0.9098 0.6353 0.0824 0.7],'LineWidth',2},'patchSaturation',.1);

xlabel('Frequency (Hz)');
ylabel('Power (\muV^2)');
set(gca,'Fontsize',10,'TickDir','out','LineWidth',2,'YScale','log','XScale','log');
box off
set(groot,'defaultAxesXTickLabelRotationMode','manual')
xlim([30 45])
xticks(0:5:45);
ylim([0 0.13])

legend({'first' 'last'});

saveas(fig,[Savefolder,filesep,'Sprint_illustration_loglog_30_45Hz_allch_cyc_tonic_SR.svg']);
