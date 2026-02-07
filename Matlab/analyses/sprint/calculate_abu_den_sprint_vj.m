function  [den amp] = calculate_abu_den_sprint_vj(waves_ch, lower_freq_band, higher_freq_band,waves_rem_cyc_dur_freq_ndx, rem_epochs, waves_phasic_cyc_dur_freq_ndx, phasic_goodndx, waves_tonic_cyc_dur_freq_ndx, tonic_goodndx, waves_nrem_cyc_dur_freq_ndx, nrem_epochs, waves_wake_cyc_dur_freq_ndx, wake_epochs, epochlength, windowl, fs, phasic_ep)   

        band_ndx = find(waves_ch.frequency > lower_freq_band & waves_ch.frequency < higher_freq_band);
            
        waves_rem_cyc_dur_freq_band_ndx = intersect(waves_rem_cyc_dur_freq_ndx, band_ndx);
        waves_rem_cyc_dur_freq_band = waves_ch(waves_rem_cyc_dur_freq_band_ndx,:);

        den.rem_density = length(waves_rem_cyc_dur_freq_band_ndx)/(length(rem_epochs)*windowl/60); % number of waves per min
        amp.rem_amp = nanmean(waves_rem_cyc_dur_freq_band.amplitude); % number of waves per min


        waves_phasic_cyc_dur_freq_band_ndx = intersect(waves_phasic_cyc_dur_freq_ndx, band_ndx);
        waves_phasic_cyc_dur_freq_band = waves_ch(waves_phasic_cyc_dur_freq_band_ndx,:);             
        den.phasic_density = length(waves_phasic_cyc_dur_freq_band_ndx)/(length(phasic_goodndx)*windowl/60); % number of waves per min
        amp.phasic_amp = nanmean(waves_phasic_cyc_dur_freq_band.amplitude); % number of waves per min

        waves_tonic_cyc_dur_freq_band_ndx = intersect(waves_tonic_cyc_dur_freq_ndx, band_ndx);
        waves_tonic_cyc_dur_freq_band = waves_ch(waves_tonic_cyc_dur_freq_band_ndx,:);             
        den.tonic_density = length(waves_tonic_cyc_dur_freq_band_ndx)/(length(tonic_goodndx)*windowl/60); % number of waves per min
        amp.tonic_amp = nanmean(waves_tonic_cyc_dur_freq_band.amplitude); % number of waves per min
       

        waves_nrem_cyc_dur_freq_band_ndx = intersect(waves_nrem_cyc_dur_freq_ndx, band_ndx);
        waves_nrem_cyc_dur_freq_band = waves_ch(waves_nrem_cyc_dur_freq_band_ndx,:);
        den.nrem_density = length(waves_nrem_cyc_dur_freq_band_ndx)/(length(nrem_epochs)*windowl/60); % number of waves per min
        amp.nrem_amp = nanmean(waves_nrem_cyc_dur_freq_band.amplitude); % number of waves per min
      
        
        waves_wake_cyc_dur_freq_band_ndx = intersect(waves_wake_cyc_dur_freq_ndx, band_ndx);
        waves_wake_cyc_dur_freq_band = waves_ch(waves_wake_cyc_dur_freq_band_ndx,:);
        den.wake_density = length(waves_wake_cyc_dur_freq_band_ndx)/(length(wake_epochs)*windowl/60); % number of waves per min
        amp.wake_amp = nanmean(waves_wake_cyc_dur_freq_band.amplitude); % number of waves per min

      
        
end