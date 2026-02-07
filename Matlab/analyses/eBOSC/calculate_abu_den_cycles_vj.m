function  [den abu amp snr] = calculate_abu_den_cycles_vj(waves_ch, lower_freq_band, higher_freq_band,waves_rem_cyc_dur_freq_ndx, rem_epochs_cyc, waves_phasic_cyc_dur_freq_ndx, phasic_epochs_cyc, waves_tonic_cyc_dur_freq_ndx, tonic_epochs_cyc, waves_nrem_cyc_dur_freq_ndx, nrem_epochs_cyc, waves_wake_cyc_dur_freq_ndx, wake_epochs_cyc, epochlength, windowl, fs, phasic_ep, sleepcyc_ndx)   

        band_ndx = find(waves_ch.frequency > lower_freq_band & waves_ch.frequency < higher_freq_band);
        sleep_cyc_band_ndx = intersect(band_ndx,sleepcyc_ndx);
            
        waves_rem_cyc_dur_freq_band_ndx = intersect(waves_rem_cyc_dur_freq_ndx, sleep_cyc_band_ndx);
        waves_rem_cyc_dur_freq_band = waves_ch(waves_rem_cyc_dur_freq_band_ndx,:);
%         plot(waves_rem_cyc_dur_freq_band.nep,waves_rem_cyc_dur_freq_band.frequency)
        den.rem_density = length(waves_rem_cyc_dur_freq_band_ndx)/(length(rem_epochs_cyc)*windowl/60); % number of waves per min
        amp.rem_amp = nanmedian(waves_rem_cyc_dur_freq_band.power); 
        snr.rem_snr = nanmedian(waves_rem_cyc_dur_freq_band.SNR); 
         
        
        mini_eps_all = zeros(length(phasic_ep),1);
        mini_eps_samps_all = zeros(length(phasic_ep),1);
        for w = 1:size(waves_rem_cyc_dur_freq_band,1)
            mini_eps =  waves_rem_cyc_dur_freq_band.start_miniep(w):waves_rem_cyc_dur_freq_band.end_miniep(w);
            n_mini_eps = length(mini_eps);
            samps = waves_rem_cyc_dur_freq_band.startsamp(w):waves_rem_cyc_dur_freq_band.endsamp(w);
           
            for i = 1:length(mini_eps)
                if mini_eps(i) <= length(mini_eps_all)
                mini_eps_all(mini_eps(i)) = mini_eps_all(mini_eps(i))+1/n_mini_eps;
                ep_samp = ((mini_eps(i)-1)*fs*windowl+1):(mini_eps(i)*fs*windowl);
                ep_samp_wave = intersect(samps,ep_samp);
                n_ep_samps_wave = length(ep_samp_wave);
                mini_eps_samps_all(mini_eps(i)) = mini_eps_samps_all(mini_eps(i))+n_ep_samps_wave;
                end
            end
            
            clear n_mini_eps mini_eps
        end
        
        abu.rem_abu = nanmean(mini_eps_samps_all(rem_epochs_cyc))/(windowl*fs);
        
        den.phasic_density = nanmean(mini_eps_all(phasic_epochs_cyc))*60; % number of waves per min
        abu.phasic_abu = nanmean(mini_eps_samps_all(phasic_epochs_cyc))/(windowl*fs);
        
        waves_phasic_cyc_dur_freq_band_ndx = intersect(waves_phasic_cyc_dur_freq_ndx, sleep_cyc_band_ndx);
        waves_phasic_cyc_dur_freq_band = waves_ch(waves_phasic_cyc_dur_freq_band_ndx,:);
        amp.phasic_amp = nanmedian(waves_phasic_cyc_dur_freq_band.power); % number of waves per min
        snr.phasic_snr = nanmedian(waves_phasic_cyc_dur_freq_band.SNR); % number of waves per min

        
        den.tonic_density = nanmean(mini_eps_all(tonic_epochs_cyc))*60; % number of waves per min
        abu.tonic_abu = nanmean(mini_eps_samps_all(tonic_epochs_cyc))/(windowl*fs);
        
        waves_tonic_cyc_dur_freq_band_ndx = intersect(waves_tonic_cyc_dur_freq_ndx, sleep_cyc_band_ndx);
        waves_tonic_cyc_dur_freq_band = waves_ch(waves_tonic_cyc_dur_freq_band_ndx,:);
        amp.tonic_amp = nanmedian(waves_tonic_cyc_dur_freq_band.power); % number of waves per min
        snr.tonic_snr = nanmedian(waves_tonic_cyc_dur_freq_band.SNR); % number of waves per min


        waves_nrem_cyc_dur_freq_band_ndx = intersect(waves_nrem_cyc_dur_freq_ndx, sleep_cyc_band_ndx);
        waves_nrem_cyc_dur_freq_band = waves_ch(waves_nrem_cyc_dur_freq_band_ndx,:);
%         plot(waves_nrem_cyc_dur_freq_band.nep,waves_nrem_cyc_dur_freq_band.frequency)
        den.nrem_density = length(waves_nrem_cyc_dur_freq_band_ndx)/(length(nrem_epochs_cyc)*windowl/60); % number of waves per min
        amp.nrem_amp = nanmedian(waves_nrem_cyc_dur_freq_band.power); 
        snr.nrem_snr = nanmedian(waves_nrem_cyc_dur_freq_band.SNR); 
        
        
        mini_eps_all_nrem = zeros(length(phasic_ep),1);
        mini_eps_samps_all_nrem = zeros(length(phasic_ep),1);
        for w = 1:size(waves_nrem_cyc_dur_freq_band,1)
            mini_eps =  waves_nrem_cyc_dur_freq_band.start_miniep(w):waves_nrem_cyc_dur_freq_band.end_miniep(w);
            n_mini_eps = length(mini_eps);
            samps = waves_nrem_cyc_dur_freq_band.startsamp(w):waves_nrem_cyc_dur_freq_band.endsamp(w);
           
            for i = 1:length(mini_eps)
                if mini_eps(i) <= length(mini_eps_all_nrem)
                mini_eps_all_nrem(mini_eps(i)) = mini_eps_all_nrem(mini_eps(i))+1/n_mini_eps;
                ep_samp = ((mini_eps(i)-1)*fs*windowl+1):(mini_eps(i)*fs*windowl);
                ep_samp_wave = intersect(samps,ep_samp);
                n_ep_samps_wave = length(ep_samp_wave);
                mini_eps_samps_all_nrem(mini_eps(i)) = mini_eps_samps_all_nrem(mini_eps(i))+n_ep_samps_wave;
                end
            end
            
            clear n_mini_eps mini_eps
        end
        
        abu.nrem_abu = nanmean(mini_eps_samps_all_nrem(nrem_epochs_cyc))/(windowl*fs);
      
        
        waves_wake_cyc_dur_freq_band_ndx = intersect(waves_wake_cyc_dur_freq_ndx, sleep_cyc_band_ndx);
        waves_wake_cyc_dur_freq_band = waves_ch(waves_wake_cyc_dur_freq_band_ndx,:);
%         plot(waves_wake_cyc_dur_freq_band.nep,waves_wake_cyc_dur_freq_band.frequency)
        den.wake_density = length(waves_wake_cyc_dur_freq_band_ndx)/(length(wake_epochs_cyc)*windowl/60); % number of waves per min
        amp.wake_amp = nanmedian(waves_wake_cyc_dur_freq_band.power); 
        snr.wake_snr = nanmedian(waves_wake_cyc_dur_freq_band.SNR); 
        
        
        mini_eps_all_wake = zeros(length(phasic_ep),1);
        mini_eps_samps_all_wake = zeros(length(phasic_ep),1);
        for w = 1:size(waves_wake_cyc_dur_freq_band,1)
            mini_eps =  waves_wake_cyc_dur_freq_band.start_miniep(w):waves_wake_cyc_dur_freq_band.end_miniep(w);
            n_mini_eps = length(mini_eps);
            samps = waves_wake_cyc_dur_freq_band.startsamp(w):waves_wake_cyc_dur_freq_band.endsamp(w);
           
            for i = 1:length(mini_eps)
                if mini_eps(i) <= length(mini_eps_all_wake)
                mini_eps_all_wake(mini_eps(i)) = mini_eps_all_wake(mini_eps(i))+1/n_mini_eps;
                ep_samp = ((mini_eps(i)-1)*fs*windowl+1):(mini_eps(i)*fs*windowl);
                ep_samp_wave = intersect(samps,ep_samp);
                n_ep_samps_wave = length(ep_samp_wave);
                mini_eps_samps_all_wake(mini_eps(i)) = mini_eps_samps_all_wake(mini_eps(i))+n_ep_samps_wave;
                end
            end
            
            clear n_mini_eps mini_eps
        end
        
        abu.wake_abu = nanmean(mini_eps_samps_all_wake(wake_epochs_cyc))/(windowl*fs);
      
        
end