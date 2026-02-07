function  [den abu amp snr] = calculate_abu_den_vj(waves_ch, lower_freq_band, higher_freq_band,waves_rem_cyc_dur_freq_ndx, rem_epochs, waves_phasic_cyc_dur_freq_ndx, phasic_goodndx, waves_tonic_cyc_dur_freq_ndx, tonic_goodndx, waves_nrem_cyc_dur_freq_ndx, nrem_epochs, waves_wake_cyc_dur_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep)   

        band_ndx = find(waves_ch.frequency > lower_freq_band & waves_ch.frequency < higher_freq_band);
            
        waves_rem_cyc_dur_freq_band_ndx = intersect(waves_rem_cyc_dur_freq_ndx, band_ndx);
        waves_rem_cyc_dur_freq_band = waves_ch(waves_rem_cyc_dur_freq_band_ndx,:);
%         plot(waves_rem_cyc_dur_freq_band.nep,waves_rem_cyc_dur_freq_band.frequency)
        den.rem_density = length(waves_rem_cyc_dur_freq_band_ndx)/(length(rem_epochs)*epochlength/60); % number of waves per min
        amp.rem_amp = nanmedian(waves_rem_cyc_dur_freq_band.power); % number of waves per min
        snr.rem_snr = nanmedian(waves_rem_cyc_dur_freq_band.SNR); % number of waves per min
 
        band_rem_abu_allep = NaN(length(rem_epochs),1,1);
        for ep = 1:length(rem_epochs)
            waves_rem_cyc_dur_freq_band_ep = waves_rem_cyc_dur_freq_band(find(waves_rem_cyc_dur_freq_band.nep == rem_epochs(ep)),:);
            band_rem_abu_allep(ep) = sum(waves_rem_cyc_dur_freq_band_ep.duration)/epochlength;
        end
        abu.rem_abu = nanmean(band_rem_abu_allep);
        
        
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
        
        den.phasic_density = nanmean(mini_eps_all(phasic_goodndx))*60; % number of waves per min
        abu.phasic_abu = nanmean(mini_eps_samps_all(phasic_goodndx))/(windowl*fs);
        
        waves_phasic_cyc_dur_freq_band_ndx = intersect(waves_phasic_cyc_dur_freq_ndx, band_ndx);
        waves_phasic_cyc_dur_freq_band = waves_ch(waves_phasic_cyc_dur_freq_band_ndx,:);
        amp.phasic_amp = nanmedian(waves_phasic_cyc_dur_freq_band.power); % number of waves per min
        snr.phasic_snr = nanmedian(waves_phasic_cyc_dur_freq_band.SNR); % number of waves per min

        
        den.tonic_density = nanmean(mini_eps_all(tonic_goodndx))*60; % number of waves per min
        abu.tonic_abu = nanmean(mini_eps_samps_all(tonic_goodndx))/(windowl*fs);
        
        waves_tonic_cyc_dur_freq_band_ndx = intersect(waves_tonic_cyc_dur_freq_ndx, band_ndx);
        waves_tonic_cyc_dur_freq_band = waves_ch(waves_tonic_cyc_dur_freq_band_ndx,:);
        amp.tonic_amp = nanmedian(waves_tonic_cyc_dur_freq_band.power); % number of waves per min
        snr.tonic_snr = nanmedian(waves_tonic_cyc_dur_freq_band.SNR); % number of waves per min


        waves_nrem_cyc_dur_freq_band_ndx = intersect(waves_nrem_cyc_dur_freq_ndx, band_ndx);
        waves_nrem_cyc_dur_freq_band = waves_ch(waves_nrem_cyc_dur_freq_band_ndx,:);
        den.nrem_density = length(waves_nrem_cyc_dur_freq_band_ndx)/(length(nrem_epochs)*epochlength/60); % number of waves per min
        amp.nrem_amp = nanmedian(waves_nrem_cyc_dur_freq_band.power); % number of waves per min
        snr.nrem_snr = nanmedian(waves_nrem_cyc_dur_freq_band.SNR); % number of waves per min

        band_nrem_abu_allep = NaN(length(nrem_epochs),1,1);
        for ep = 1:length(nrem_epochs)
            waves_nrem_cyc_dur_freq_band_ep = waves_nrem_cyc_dur_freq_band(find(waves_nrem_cyc_dur_freq_band.nep == nrem_epochs(ep)),:);
            band_nrem_abu_allep(ep) = sum(waves_nrem_cyc_dur_freq_band_ep.duration)/epochlength;
        end
        abu.nrem_abu = nanmean(band_nrem_abu_allep);
    
        
        
        waves_wake_cyc_dur_freq_band_ndx = intersect(waves_wake_cyc_dur_freq_ndx, band_ndx);
        waves_wake_cyc_dur_freq_band = waves_ch(waves_wake_cyc_dur_freq_band_ndx,:);
        den.wake_density = length(waves_wake_cyc_dur_freq_band_ndx)/(length(wake_epochs)*epochlength/60); % number of waves per min
        amp.wake_amp = nanmedian(waves_wake_cyc_dur_freq_band.power); % number of waves per min
        snr.wake_snr = nanmedian(waves_wake_cyc_dur_freq_band.SNR); % number of waves per min

        band_wake_abu_allep = NaN(length(wake_epochs),1,1);
        for ep = 1:length(wake_epochs)
            waves_wake_cyc_dur_freq_band_ep = waves_wake_cyc_dur_freq_band(find(waves_wake_cyc_dur_freq_band.nep == wake_epochs(ep)),:);
            band_wake_abu_allep(ep) = sum(waves_wake_cyc_dur_freq_band_ep.duration)/epochlength;
        end
        abu.wake_abu = nanmean(band_wake_abu_allep);
      
        
end