clear all
close all

s = 1;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce/eBOSC'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));


Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

Folderpath_aux = '/parallel_scratch/nemo/AFdata/allnight'; 
aux_file = dir([Folderpath_aux,filesep,'*allnight.set']); 

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';
goodREM_file = dir([goodREM_folder,'*goodREM.mat']);

waves_folder = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/';
waves_folder_dir = dir([waves_folder,'AFOSR*'])

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/eBOSC';


%%

EEG = pop_loadset('filename',[aICA_file(s).name],'filepath',[Folderpath]);

EEG_aux = pop_loadset('filename',[aICA_file(s).name(1:18),'_allnight.set'],'filepath',[Folderpath_aux]);


load([goodREM_folder,aICA_file(s).name(1:18),'_goodREM.mat']); 

load([waves_folder, filesep,aICA_file(s).name(1:18),'_eBOSC_waves.mat']);

epochl = 30;
n_phasic_thresh = 1; 


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


        rem_epochs = find(hypno_aligned2 == 'R');
        nrem_epochs = find(hypno_aligned2 == '2'| hypno_aligned2 == '3' | hypno_aligned2 == '4');
        n1_epochs = find(hypno_aligned2 == '1');
        n2_epochs = find(hypno_aligned2 == '2');
        n3_epochs = find(hypno_aligned2 == '3' | hypno_aligned2 == '4');
        wake_epochs = find(hypno_aligned2 == 'W');
        
      
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

 
   lEOG = EEG_aux.data(10,:);
   rEOG = EEG_aux.data(11,:);
   EMG = EEG_aux.data(9,:);
   
   % filter EEG data in broad range
%    filt_order = 2;
%    filt_lf = 6;
%    filt_hf = 12;
%    [b,a] = butter(filt_order, [filt_lf filt_hf]/(fs/2), 'bandpass');
%    
%    data_filt = filtfilt(b,a,data);


data = eeglab2fieldtrip(EEG, 'raw', 'none');      

addpath(genpath('/users/nemo/software/fieldtrip'));
     
% high-pass filter to remove slow drifts in data
cfg.hpfiltord = 5;
cfg.hpfilter = 'yes';
cfg.hpfreq = 0.1;
data = ft_preprocessing(cfg,data);                  
EEG.data = data.trial{1};
data = eeglab2fieldtrip(EEG, 'raw', 'none');       

% high-pass filter and band-stop filter to remove line noise
cfg = [];
cfg.hpfilter = 'yes';
cfg.hpfreq = 0.7;
cfg.bsfilter = 'yes';
cfg.bsfreq = [45 55;95 105];
% cfg.lpfilter = 'yes';
% cfg.lpfreq = 40;
     
data = ft_preprocessing(cfg,data);                  
EEG.data = data.trial{1};


%%
   ch = 4; 
   waves_ch = waves_allepch(find(waves_allepch.channel == ch),:);

 
 % extract data for channels to plot
   data = double(EEG.data(ch,:));

   
    % filter EMG data
   order=4;
   Lp=(20/(fs/2)); Hp=(40/(fs/2));
   [b,a] = butter(order,[Lp Hp],'bandpass');
   
   EMG_filt = filtfilt(b,a,EMG);

   

   plot_start = 8528 %9275 %9105% 9073;
   plot_epochl = 7;
   
   samp_ep = (plot_start-1)*windowl*fs+1:(plot_start+plot_epochl-1)*windowl*fs;
  
   phasic_samp_ep = intersect(phasicgoodrem_samp,samp_ep);
   tonic_samp_ep = intersect(tonicgoodrem_samp,samp_ep);
   
   [startsamp waves_ep_ndx] = intersect(waves_ch.startsamp,samp_ep);
   waves_ep = waves_ch(waves_ep_ndx,:);
   startsamp = waves_ep.startsamp;
   endsamp = waves_ep.endsamp;
   duration = waves_ep.duration;
   frequency = waves_ep.frequency;
   cycles = waves_ep.cycles;
   SNR = waves_ep.SNR;
   
     
   theta_ndx = find(frequency > lower_freq_theta & frequency < higher_freq_theta);
   alpha_ndx = find(frequency > lower_freq_alpha & frequency < higher_freq_alpha);
%    sigma_ndx = find(frequency > 12.5 & frequency < 16.5);
   cycles_ndx = find(cycles > 3);
   duration_ndx = find(duration > 0.3);

   theta_cycles_ndx = intersect(theta_ndx,cycles_ndx);
   alpha_cycles_ndx = intersect(alpha_ndx,cycles_ndx);
%    sigma_cycles_ndx = intersect(sigma_ndx,cycles_ndx);
   
   theta_cycles_duration_ndx = intersect(theta_cycles_ndx,duration_ndx);
   alpha_cycles_duration_ndx = intersect(alpha_cycles_ndx,duration_ndx);
%    sigma_cycles_duration_ndx = intersect(sigma_cycles_ndx,duration_ndx);


   colors = linspecer(4);
   
 
  
   fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
   fig.WindowState = 'maximized';

   tileplot = tiledlayout(6,2);
   nexttile(1)
   plot(samp_ep,data(samp_ep),'k','LineWidth',1.5);
   hold on
%    plot(bad_samps,data(bad_samps),'Color',[0.7 0.7 0.7]) % plot badsamps in orange
%    hold on
   for c = 1:length(theta_cycles_duration_ndx)   % plot detected theta waves in color
   plot_samps_orig = round(startsamp(theta_cycles_duration_ndx(c)):endsamp(theta_cycles_duration_ndx(c)));
%         if ~isempty(intersect(plot_samps_orig,samp_ep))
%             plot(plot_samps_orig,data(plot_samps_orig),'Color',[0.4660 0.6740 0.1880]) %green 
%             plot(plot_samps_orig,data(plot_samps_orig),'Color',[1.0000    0.0745    0.6510]) %pink
%             hold on
%         end
   end
   hold on
   for c = 1:length(alpha_cycles_duration_ndx)   % plot detected alpha waves in color
   plot_samps_orig = round(startsamp(alpha_cycles_duration_ndx(c)):endsamp(alpha_cycles_duration_ndx(c)));
%            if ~isempty(intersect(plot_samps_orig,samp_ep))
%               plot(plot_samps_orig,data(plot_samps_orig),'Color',[0.3922    0.8314    0.0745]) %green
%               hold on
%            end
   end
   hold on
%    xticks((ep-1)*epochl*fs+1:2*fs:ep*epochl*fs);
   xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0:1:epochl);
%    for c = 1:length(sigma_cycles_duration_ndx)   
%    plot_samps_orig = round(startsamp(sigma_cycles_duration_ndx(c)):endsamp(sigma_cycles_duration_ndx(c)));
%    plot(plot_samps_orig,data(ch,plot_samps_orig),'Color',[0.8500 0.3250 0.0980]) %orange
%    hold on
%    end
%    title('Fz')
   ylim([-50 50])
   yticks(-50:10:50);
   set(gca,'Fontsize',15);
%    ylabel('Amplitude (\muV)');
   set(gca, 'box','off');
   h = gca;
   h.XAxis.Visible = 'off';
   h.YAxis.Visible = 'off';
    xlim([samp_ep(1) samp_ep(end)])
   xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0-plot_start:1:epochl-plot_start);
   for e = 1:plot_epochl
      xline(samp_ep(e*fs));
      hold on
   end
   

   %%%%%%%%% Phasic - EOG left %%%%%%%%%

    nexttile(3)
    plot(samp_ep(1:4*fs),lEOG(samp_ep(1:4*fs)),'Color',[0 0.4471 0.6980],'LineWidth',1.5)
    hold on
%    for p = 1:length(phasic_start)
%    area([phasic_start(p) phasic_end(p)],[150 150],-150,'FaceColor',[0.3 0.3 0.3],'FaceAlpha',.1,'EdgeColor','none','LineStyle','none')
%    end
    ylim([-200 200])
%     title('EOG')
%     legend({'lEOG' 'rEOG'})
     xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0:1:epochl);
    set(gca,'Fontsize',15);
%     ylabel('Amplitude (\muV)');
    set(gca, 'box','off');
    h = gca;
    h.XAxis.Visible = 'off';
    h.YAxis.Visible = 'off';
    xlim([samp_ep(1) samp_ep(end)]);
%     for e = 1:plot_epochl
%       xline(samp_ep(e*fs));
%       hold on
%    end
    
    
%%%%%%%%% Phasic - EOG right %%%%%%%%%

    nexttile(5)
    plot(samp_ep(1:4*fs),rEOG(samp_ep(1:4*fs)),'Color',[0 0.4471 0.6980],'LineWidth',1.5)
    hold on
%    for p = 1:length(phasic_start)
%    area([phasic_start(p) phasic_end(p)],[150 150],-150,'FaceColor',[0.3 0.3 0.3],'FaceAlpha',.1,'EdgeColor','none','LineStyle','none')
%    end
    ylim([-200 200])
%     title('EOG')
%     legend({'lEOG' 'rEOG'})
     xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0:1:epochl);
    set(gca,'Fontsize',15);
%     ylabel('Amplitude (\muV)');
    set(gca, 'box','off');
    h = gca;
    h.XAxis.Visible = 'off';
    h.YAxis.Visible = 'off';
    xlim([samp_ep(1) samp_ep(end)]);
%   for e = 1:plot_epochl
%       xline(samp_ep(e*fs));
%       hold on
%   end
    

%%%%%%%%% Tonic - EOG left %%%%%%%%%

    nexttile(3)
    plot(samp_ep(4*fs+1:end),lEOG(samp_ep(4*fs+1:end)),'Color',[0.8353 0.3686 0],'LineWidth',1.5)
    hold on
%    for p = 1:length(phasic_start)
%    area([phasic_start(p) phasic_end(p)],[150 150],-150,'FaceColor',[0.3 0.3 0.3],'FaceAlpha',.1,'EdgeColor','none','LineStyle','none')
%    end
    ylim([-200 200])
%     title('EOG')
%     legend({'lEOG' 'rEOG'})
     xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0:1:epochl);
    set(gca,'Fontsize',15);
%     ylabel('Amplitude (\muV)');
    set(gca, 'box','off');
    h = gca;
    h.XAxis.Visible = 'off';
    h.YAxis.Visible = 'off';
    xlim([samp_ep(1) samp_ep(end)]);
    for e = 1:plot_epochl
      xline(samp_ep(e*fs));
      hold on
   end
    
    
%%%%%%%%% Tonic - EOG right %%%%%%%%%

    nexttile(5)
    plot(samp_ep(4*fs+1:end),rEOG(samp_ep(4*fs+1:end)),'Color',[0.8353 0.3686 0],'LineWidth',1.5)
    hold on
%    for p = 1:length(phasic_start)
%    area([phasic_start(p) phasic_end(p)],[150 150],-150,'FaceColor',[0.3 0.3 0.3],'FaceAlpha',.1,'EdgeColor','none','LineStyle','none')
%    end
    ylim([-200 200])
%     title('EOG')
%     legend({'lEOG' 'rEOG'})
     xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0:1:epochl);
    set(gca,'Fontsize',15);
%     ylabel('Amplitude (\muV)');
    set(gca, 'box','off');
    h = gca;
    h.XAxis.Visible = 'off';
    h.YAxis.Visible = 'off';
    xlim([samp_ep(1) samp_ep(end)]);
  for e = 1:plot_epochl
      xline(samp_ep(e*fs));
      hold on
   end   
  
  
  
%%%%%%%%% EMG %%%%%%%%%

    nexttile(7)
%     plot(samp_ep,EMG_filt(samp_ep),'Color','b','LineWidth',1.5)
    plot(samp_ep,EMG_filt(samp_ep),'Color',[ 0.4667    0.6745    0.1882],'LineWidth',1.5)
    hold on
%    for p = 1:length(phasic_start)
%    area([phasic_start(p) phasic_end(p)],[50 50],-50,'FaceColor',[0.3 0.3 0.3],'FaceAlpha',.1,'EdgeColor','none','LineStyle','none')
%    end
   ylim([-50 50])
    yticks(-50:10:50);
%     title('EMG')
    xticks((ep-1)*epochl*fs+1:1*fs:ep*epochl*fs);
   xticklabels(0-plot_start:1:epochl-plot_start);
    set(gca,'Fontsize',15);
    set(gca, 'box','off');
%     xlabel('Time (s)');
%     ylabel('Amplitude (\muV)');
    h = gca;
    h.XAxis.Visible = 'off';
    h.YAxis.Visible = 'off';
    xlim([samp_ep(1) samp_ep(end)])
  for e = 1:plot_epochl
      xline(samp_ep(e*fs));
      hold on
   end

    tileplot.TileSpacing = 'tight';
    tileplot.Padding = 'compact';
    
    
    saveas(fig,[Savefolder,filesep,'Figure_eBOSC_schematic_ch',num2str(ch),'.svg']);

    