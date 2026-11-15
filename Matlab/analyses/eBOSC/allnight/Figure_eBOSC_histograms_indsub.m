clear all;
close all;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

waves_folder = '/parallel_scratch/nemo/AFdata/eBOSC/';
waves_folder_dir = dir([waves_folder,'AFOSR*'])

Savefolder = '/parallel_scratch/nemo/AFdata/Figures/eBOSC';

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

%% Average across on and off blocks and calculate change
lower_freq = 1;
higher_freq = 20;
lower_freq_alpha = 6;
higher_freq_alpha = 12;
lower_freq_theta = 2;
higher_freq_theta = 6;
lower_freq_spindles = 12;
higher_freq_spindles = 16;
peak_thresh = 0.03;

%%

fig = figure('Renderer','painters','units','normalized','outerposition',[0 0 1 1])
fig.WindowState = 'maximized';


for s = 33:36 %1:4 5:8 9:12 13:16 17:20 21:24 25:28 29:32 %length(waves_folder_dir)   
    
    display(['sub = ',num2str(s)]); 


    files = dir([waves_folder, waves_folder_dir(s).name(1:12),filesep,'AFOSR*']);
    
    
    for file = 1 %:length(files)
        
       display(['file = ',num2str(file)]); 
        
        %%
        filename = files(file).name;
        night = find_night(filename);
        
        load([waves_folder, waves_folder_dir(s).name(1:12),filesep,files(file).name]);
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
    
        
        for ch = 1:4 %8

%      density and abundance 

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
        
   
% find alpha peaks in wake, rem, and nrem

        colors = linspecer(8);
 

        subplot(4,4,(s-1-32)*4+ch)
        
        if ~isempty(waves_rem_cyc_dur_freq)
        [IAPF_rem ITPF_rem ISPF_rem IAPF_rem_height ITPF_rem_height ISPF_rem_height] = peak_detection_vj(waves_rem_cyc_dur_freq, peak_thresh, lower_freq_alpha,...
            higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors,1);
        title(['ID',num2str(s),' ', EEG.chanlocs(ch).labels,', IAPF: ', num2str(round(IAPF_rem,1)), ' Hz, ITPF: ', num2str(round(ITPF_rem,1)), ' Hz, ISPF: ', num2str(round(ISPF_rem,1))]);
        else
            IAPF_rem = NaN;
            ITPF_rem = NaN;
            ISPF_rem = NaN;
            IAPF_rem_height = NaN;
            ITPF_rem_height = NaN;
            ISPF_rem_height = NaN;
        end
        
        xline(2);
        xline(6);
        xline(12);
        xline(16);
        
        xlabel('Frequency (Hz)');
        ylabel('Number')    
        
  
 
        end

        %%
%        clear hypno_aligned2 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phasic_epochs tonic_epochs art_epochs 
%        clear cyc_ndx_hypno
       
    end


    
end


saveas(fig,[Savefolder,filesep,'Histograms_ID_',num2str(s-3),'_',num2str(s),'_not_individualized_2_6_12.svg']);

     