clear all;
close all;

%%

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);


load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub_dynamics/sprint_allsub_aperiodic_dynamics_16-Dec-2025.mat');

load('/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_dynamics/eBOSC_allsub_not_individualized_2_6_12_dynamics01-Dec-2025.mat','IAPF*','ITPF*','ISPF*','alpha*','theta*','spindles*');

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub_dynamics';

%% cycles

aperiodic_dyn_table_all = [];
aperiodic_osc_dyn_triplet_table_all = [];
aperiodic_dyn_table_allcyc_all = [];

for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8
            
            channel = {EEG.chanlocs(ch).labels};
            sub = {participants_uni{s}};
            sub_cyc = repmat({participants_uni{s}},10,1,1);
          
            if night < 10
                ni = night;
                con = {'SE'};
                ni_cyc = repmat(night,10,1,1);
                con_cyc = repmat({'SE'},10,1,1);
            else
                ni = night-9;
                con = {'SR'};
                ni_cyc = repmat((night-9),10,1,1);
                con_cyc = repmat({'SR'},10,1,1);
            end
            
            channel_cyc = repmat({EEG.chanlocs(ch).labels},10,1,1);
            cycle = 1:10;
            
            exponent_1_30_cyc_nrem_allcycles = squeeze(exponent_1_30_cyc_nrem_all(s,night,ch,:));
            exponent_30_45_cyc_nrem_allcycles = squeeze(exponent_30_45_cyc_nrem_all(s,night,ch,:));
            offset_1_30_cyc_nrem_allcycles = squeeze(offset_1_30_cyc_nrem_all(s,night,ch,:));
            offset_30_45_cyc_nrem_allcycles = squeeze(offset_30_45_cyc_nrem_all(s,night,ch,:));
            
            exponent_1_30_cyc_rem_allcycles = squeeze(exponent_1_30_cyc_rem_all(s,night,ch,:));
            exponent_30_45_cyc_rem_allcycles = squeeze(exponent_30_45_cyc_rem_all(s,night,ch,:));
            offset_1_30_cyc_rem_allcycles = squeeze(offset_1_30_cyc_rem_all(s,night,ch,:));
            offset_30_45_cyc_rem_allcycles = squeeze(offset_30_45_cyc_rem_all(s,night,ch,:));
            
            exponent_1_30_cyc_phasic_allcycles = squeeze(exponent_1_30_cyc_phasic_all(s,night,ch,:));
            exponent_30_45_cyc_phasic_allcycles = squeeze(exponent_30_45_cyc_phasic_all(s,night,ch,:));
            offset_1_30_cyc_phasic_allcycles = squeeze(offset_1_30_cyc_phasic_all(s,night,ch,:));
            offset_30_45_cyc_phasic_allcycles = squeeze(offset_30_45_cyc_phasic_all(s,night,ch,:));
            
            exponent_1_30_cyc_tonic_allcycles = squeeze(exponent_1_30_cyc_tonic_all(s,night,ch,:));
            exponent_30_45_cyc_tonic_allcycles = squeeze(exponent_30_45_cyc_tonic_all(s,night,ch,:));
            offset_1_30_cyc_tonic_allcycles = squeeze(offset_1_30_cyc_tonic_all(s,night,ch,:));
            offset_30_45_cyc_tonic_allcycles = squeeze(offset_30_45_cyc_tonic_all(s,night,ch,:));

            IAPF_allcycles_rem = squeeze(IAPF_rem_cyc_allsub(s,night,ch,:));
            ITPF_allcycles_rem = squeeze(ITPF_rem_cyc_allsub(s,night,ch,:));
            ISPF_allcycles_rem = squeeze(ISPF_rem_cyc_allsub(s,night,ch,:));
            IAPF_height_allcycles_rem = squeeze(IAPF_rem_height_cyc_allsub(s,night,ch,:));
            ITPF_height_allcycles_rem = squeeze(ITPF_rem_height_cyc_allsub(s,night,ch,:));
            ISPF_height_allcycles_rem = squeeze(ISPF_rem_height_cyc_allsub(s,night,ch,:));        
            
            den_alpha_cycles_rem = squeeze(alpha_rem_den_cyc_allsub(s,night,ch,:)); 
            abu_alpha_cycles_rem = squeeze(alpha_rem_abu_cyc_allsub(s,night,ch,:)); 
            amp_alpha_cycles_rem = squeeze(alpha_rem_amp_cyc_allsub(s,night,ch,:)); 
            snr_alpha_cycles_rem = squeeze(alpha_rem_snr_cyc_allsub(s,night,ch,:)); 

            den_theta_cycles_rem = squeeze(theta_rem_den_cyc_allsub(s,night,ch,:)); 
            abu_theta_cycles_rem = squeeze(theta_rem_abu_cyc_allsub(s,night,ch,:)); 
            amp_theta_cycles_rem = squeeze(theta_rem_amp_cyc_allsub(s,night,ch,:)); 
            snr_theta_cycles_rem = squeeze(theta_rem_snr_cyc_allsub(s,night,ch,:)); 
            
            den_spindles_cycles_rem = squeeze(spindles_rem_den_cyc_allsub(s,night,ch,:)); 
            abu_spindles_cycles_rem = squeeze(spindles_rem_abu_cyc_allsub(s,night,ch,:)); 
            amp_spindles_cycles_rem = squeeze(spindles_rem_amp_cyc_allsub(s,night,ch,:)); 
            snr_spindles_cycles_rem = squeeze(spindles_rem_snr_cyc_allsub(s,night,ch,:)); 
            
            
            IAPF_allcycles_phasic = squeeze(IAPF_phasic_cyc_allsub(s,night,ch,:));
            ITPF_allcycles_phasic = squeeze(ITPF_phasic_cyc_allsub(s,night,ch,:));
            ISPF_allcycles_phasic = squeeze(ISPF_phasic_cyc_allsub(s,night,ch,:));
            IAPF_height_allcycles_phasic = squeeze(IAPF_phasic_height_cyc_allsub(s,night,ch,:));
            ITPF_height_allcycles_phasic = squeeze(ITPF_phasic_height_cyc_allsub(s,night,ch,:));
            ISPF_height_allcycles_phasic = squeeze(ISPF_phasic_height_cyc_allsub(s,night,ch,:));                
          
            den_alpha_cycles_phasic = squeeze(alpha_phasic_den_cyc_allsub(s,night,ch,:)); 
            abu_alpha_cycles_phasic = squeeze(alpha_phasic_abu_cyc_allsub(s,night,ch,:)); 
            amp_alpha_cycles_phasic = squeeze(alpha_phasic_amp_cyc_allsub(s,night,ch,:)); 
            snr_alpha_cycles_phasic = squeeze(alpha_phasic_snr_cyc_allsub(s,night,ch,:)); 

            den_theta_cycles_phasic = squeeze(theta_phasic_den_cyc_allsub(s,night,ch,:)); 
            abu_theta_cycles_phasic = squeeze(theta_phasic_abu_cyc_allsub(s,night,ch,:)); 
            amp_theta_cycles_phasic = squeeze(theta_phasic_amp_cyc_allsub(s,night,ch,:)); 
            snr_theta_cycles_phasic = squeeze(theta_phasic_snr_cyc_allsub(s,night,ch,:)); 
            
            den_spindles_cycles_phasic = squeeze(spindles_phasic_den_cyc_allsub(s,night,ch,:)); 
            abu_spindles_cycles_phasic = squeeze(spindles_phasic_abu_cyc_allsub(s,night,ch,:)); 
            amp_spindles_cycles_phasic = squeeze(spindles_phasic_amp_cyc_allsub(s,night,ch,:)); 
            snr_spindles_cycles_phasic = squeeze(spindles_phasic_snr_cyc_allsub(s,night,ch,:));
            
            
            IAPF_allcycles_tonic = squeeze(IAPF_tonic_cyc_allsub(s,night,ch,:));
            ITPF_allcycles_tonic = squeeze(ITPF_tonic_cyc_allsub(s,night,ch,:));
            ISPF_allcycles_tonic = squeeze(ISPF_tonic_cyc_allsub(s,night,ch,:));
            IAPF_height_allcycles_tonic = squeeze(IAPF_tonic_height_cyc_allsub(s,night,ch,:));
            ITPF_height_allcycles_tonic = squeeze(ITPF_tonic_height_cyc_allsub(s,night,ch,:));
            ISPF_height_allcycles_tonic = squeeze(ISPF_tonic_height_cyc_allsub(s,night,ch,:));                
          
            den_alpha_cycles_tonic = squeeze(alpha_tonic_den_cyc_allsub(s,night,ch,:)); 
            abu_alpha_cycles_tonic = squeeze(alpha_tonic_abu_cyc_allsub(s,night,ch,:)); 
            amp_alpha_cycles_tonic = squeeze(alpha_tonic_amp_cyc_allsub(s,night,ch,:)); 
            snr_alpha_cycles_tonic = squeeze(alpha_tonic_snr_cyc_allsub(s,night,ch,:)); 

            den_theta_cycles_tonic = squeeze(theta_tonic_den_cyc_allsub(s,night,ch,:)); 
            abu_theta_cycles_tonic = squeeze(theta_tonic_abu_cyc_allsub(s,night,ch,:)); 
            amp_theta_cycles_tonic = squeeze(theta_tonic_amp_cyc_allsub(s,night,ch,:)); 
            snr_theta_cycles_tonic = squeeze(theta_tonic_snr_cyc_allsub(s,night,ch,:)); 
            
            den_spindles_cycles_tonic = squeeze(spindles_tonic_den_cyc_allsub(s,night,ch,:)); 
            abu_spindles_cycles_tonic = squeeze(spindles_tonic_abu_cyc_allsub(s,night,ch,:)); 
            amp_spindles_cycles_tonic = squeeze(spindles_tonic_amp_cyc_allsub(s,night,ch,:)); 
            snr_spindles_cycles_tonic = squeeze(spindles_tonic_snr_cyc_allsub(s,night,ch,:));
            
            
            nonan_cycles = find(~isnan(exponent_1_30_cyc_nrem_allcycles) == 1);
            
            if ~isempty(nonan_cycles)
            last_cycle = nonan_cycles(end);
            else
            last_cycle = 1;    
            end
            
            exponent_1_30_cyc_nrem_firstlast_diff = exponent_1_30_cyc_nrem_allcycles(last_cycle)-exponent_1_30_cyc_nrem_allcycles(1);
            exponent_30_45_cyc_nrem_firstlast_diff = exponent_30_45_cyc_nrem_allcycles(last_cycle)-exponent_30_45_cyc_nrem_allcycles(1);
            offset_1_30_cyc_nrem_firstlast_diff = offset_1_30_cyc_nrem_allcycles(last_cycle)-offset_1_30_cyc_nrem_allcycles(1);
            offset_30_45_cyc_nrem_firstlast_diff = offset_30_45_cyc_nrem_allcycles(last_cycle)-offset_30_45_cyc_nrem_allcycles(1);           
            
            exponent_1_30_cyc_rem_firstlast_diff = exponent_1_30_cyc_rem_allcycles(last_cycle)-exponent_1_30_cyc_rem_allcycles(1);
            exponent_30_45_cyc_rem_firstlast_diff = exponent_30_45_cyc_rem_allcycles(last_cycle)-exponent_30_45_cyc_rem_allcycles(1);
            offset_1_30_cyc_rem_firstlast_diff = offset_1_30_cyc_rem_allcycles(last_cycle)-offset_1_30_cyc_rem_allcycles(1);
            offset_30_45_cyc_rem_firstlast_diff = offset_30_45_cyc_rem_allcycles(last_cycle)-offset_30_45_cyc_rem_allcycles(1);  
            
            exponent_1_30_cyc_phasic_firstlast_diff = exponent_1_30_cyc_phasic_allcycles(last_cycle)-exponent_1_30_cyc_phasic_allcycles(1);
            exponent_30_45_cyc_phasic_firstlast_diff = exponent_30_45_cyc_phasic_allcycles(last_cycle)-exponent_30_45_cyc_phasic_allcycles(1);
            offset_1_30_cyc_phasic_firstlast_diff = offset_1_30_cyc_phasic_allcycles(last_cycle)-offset_1_30_cyc_phasic_allcycles(1);
            offset_30_45_cyc_phasic_firstlast_diff = offset_30_45_cyc_phasic_allcycles(last_cycle)-offset_30_45_cyc_phasic_allcycles(1);  
            
            exponent_1_30_cyc_tonic_firstlast_diff = exponent_1_30_cyc_tonic_allcycles(last_cycle)-exponent_1_30_cyc_tonic_allcycles(1);
            exponent_30_45_cyc_tonic_firstlast_diff = exponent_30_45_cyc_tonic_allcycles(last_cycle)-exponent_30_45_cyc_tonic_allcycles(1);
            offset_1_30_cyc_tonic_firstlast_diff = offset_1_30_cyc_tonic_allcycles(last_cycle)-offset_1_30_cyc_tonic_allcycles(1);
            offset_30_45_cyc_tonic_firstlast_diff = offset_30_45_cyc_tonic_allcycles(last_cycle)-offset_30_45_cyc_tonic_allcycles(1);  
 
            
            
            exponent_1_30_cyc_nrem_first = exponent_1_30_cyc_nrem_allcycles(1);
            exponent_30_45_cyc_nrem_first = exponent_30_45_cyc_nrem_allcycles(1);
            offset_1_30_cyc_nrem_first = offset_1_30_cyc_nrem_allcycles(1);
            offset_30_45_cyc_nrem_first = offset_30_45_cyc_nrem_allcycles(1);           
            
            exponent_1_30_cyc_rem_first = exponent_1_30_cyc_rem_allcycles(1);
            exponent_30_45_cyc_rem_first = exponent_30_45_cyc_rem_allcycles(1);
            offset_1_30_cyc_rem_first = offset_1_30_cyc_rem_allcycles(1);
            offset_30_45_cyc_rem_first = offset_30_45_cyc_rem_allcycles(1);  
            
            exponent_1_30_cyc_phasic_first = exponent_1_30_cyc_phasic_allcycles(1);
            exponent_30_45_cyc_phasic_first = exponent_30_45_cyc_phasic_allcycles(1);
            offset_1_30_cyc_phasic_first = offset_1_30_cyc_phasic_allcycles(1);
            offset_30_45_cyc_phasic_first = offset_30_45_cyc_phasic_allcycles(1);  
            
            exponent_1_30_cyc_tonic_first = exponent_1_30_cyc_tonic_allcycles(1);
            exponent_30_45_cyc_tonic_first = exponent_30_45_cyc_tonic_allcycles(1);
            offset_1_30_cyc_tonic_first = offset_1_30_cyc_tonic_allcycles(1);
            offset_30_45_cyc_tonic_first = offset_30_45_cyc_tonic_allcycles(1);  
            
            
            exponent_1_30_cyc_nrem_last = exponent_1_30_cyc_nrem_allcycles(last_cycle);
            exponent_30_45_cyc_nrem_last = exponent_30_45_cyc_nrem_allcycles(last_cycle);
            offset_1_30_cyc_nrem_last = offset_1_30_cyc_nrem_allcycles(last_cycle);
            offset_30_45_cyc_nrem_last = offset_30_45_cyc_nrem_allcycles(last_cycle);           
            
            exponent_1_30_cyc_rem_last = exponent_1_30_cyc_rem_allcycles(last_cycle);
            exponent_30_45_cyc_rem_last = exponent_30_45_cyc_rem_allcycles(last_cycle);
            offset_1_30_cyc_rem_last = offset_1_30_cyc_rem_allcycles(last_cycle);
            offset_30_45_cyc_rem_last = offset_30_45_cyc_rem_allcycles(last_cycle);  
            
            exponent_1_30_cyc_phasic_last = exponent_1_30_cyc_phasic_allcycles(last_cycle);
            exponent_30_45_cyc_phasic_last = exponent_30_45_cyc_phasic_allcycles(last_cycle);
            offset_1_30_cyc_phasic_last = offset_1_30_cyc_phasic_allcycles(last_cycle);
            offset_30_45_cyc_phasic_last = offset_30_45_cyc_phasic_allcycles(last_cycle);  
            
            exponent_1_30_cyc_tonic_last = exponent_1_30_cyc_tonic_allcycles(last_cycle);
            exponent_30_45_cyc_tonic_last = exponent_30_45_cyc_tonic_allcycles(last_cycle);
            offset_1_30_cyc_tonic_last = offset_1_30_cyc_tonic_allcycles(last_cycle);
            offset_30_45_cyc_tonic_last = offset_30_45_cyc_tonic_allcycles(last_cycle);  

            
            
            m_exponent_1_30_cyc_nrem = nanmean(exponent_1_30_cyc_nrem_allcycles);
            m_exponent_30_45_cyc_nrem = nanmean(exponent_30_45_cyc_nrem_allcycles);
            m_exponent_1_30_cyc_rem = nanmean(exponent_1_30_cyc_rem_allcycles);
            m_exponent_30_45_cyc_rem = nanmean(exponent_30_45_cyc_rem_allcycles);
            m_exponent_1_30_cyc_phasic = nanmean(exponent_1_30_cyc_phasic_allcycles);
            m_exponent_30_45_cyc_phasic = nanmean(exponent_30_45_cyc_phasic_allcycles);         
            m_exponent_1_30_cyc_tonic = nanmean(exponent_1_30_cyc_tonic_allcycles);
            m_exponent_30_45_cyc_tonic = nanmean(exponent_30_45_cyc_tonic_allcycles);
          
            m_offset_1_30_cyc_nrem = nanmean(offset_1_30_cyc_nrem_allcycles);
            m_offset_30_45_cyc_nrem = nanmean(offset_30_45_cyc_nrem_allcycles);
            m_offset_1_30_cyc_rem = nanmean(offset_1_30_cyc_rem_allcycles);
            m_offset_30_45_cyc_rem = nanmean(offset_30_45_cyc_rem_allcycles);
            m_offset_1_30_cyc_phasic = nanmean(offset_1_30_cyc_phasic_allcycles);
            m_offset_30_45_cyc_phasic = nanmean(offset_30_45_cyc_phasic_allcycles);         
            m_offset_1_30_cyc_tonic = nanmean(offset_1_30_cyc_tonic_allcycles);
            m_offset_30_45_cyc_tonic = nanmean(offset_30_45_cyc_tonic_allcycles); 
            
          
            if last_cycle > 1
               end_cyc = last_cycle-1; 
            else
               end_cyc = 1;
            end
            
            cycles = 1:end_cyc;
            sub_tri = repmat(sub,length(cycles),1);
            ni_tri = repmat(ni,length(cycles),1);
            con_tri = repmat(con,length(cycles),1);
            channel_tri = repmat(channel,length(cycles),1);
            
            for cyc = 1:end_cyc
                
               exponent_1_30_pre_nrem(cyc) = exponent_1_30_cyc_nrem_allcycles(cyc);
               exponent_1_30_post_nrem(cyc) = exponent_1_30_cyc_nrem_allcycles(cyc+1);
               exponent_1_30_prepost_diff(cyc) = exponent_1_30_post_nrem(cyc) - exponent_1_30_pre_nrem(cyc);
               exponent_1_30_between_rem(cyc) = exponent_1_30_cyc_rem_allcycles(cyc); 
               exponent_1_30_between_phasic(cyc) = exponent_1_30_cyc_phasic_allcycles(cyc); 
               exponent_1_30_between_tonic(cyc) = exponent_1_30_cyc_tonic_allcycles(cyc); 
               
               exponent_30_45_pre_nrem(cyc) = exponent_30_45_cyc_nrem_allcycles(cyc);
               exponent_30_45_post_nrem(cyc) = exponent_30_45_cyc_nrem_allcycles(cyc+1);
               exponent_30_45_prepost_diff(cyc) = exponent_30_45_post_nrem(cyc) - exponent_1_30_pre_nrem(cyc);
               exponent_30_45_between_rem(cyc) = exponent_30_45_cyc_rem_allcycles(cyc); 
               exponent_30_45_between_phasic(cyc) = exponent_30_45_cyc_phasic_allcycles(cyc); 
               exponent_30_45_between_tonic(cyc) = exponent_30_45_cyc_tonic_allcycles(cyc); 
               
               offset_1_30_pre_nrem(cyc) = offset_1_30_cyc_nrem_allcycles(cyc);
               offset_1_30_post_nrem(cyc) = offset_1_30_cyc_nrem_allcycles(cyc+1);
               offset_1_30_prepost_diff(cyc) = offset_1_30_post_nrem(cyc) - offset_1_30_pre_nrem(cyc);
               offset_1_30_between_rem(cyc) = offset_1_30_cyc_rem_allcycles(cyc); 
               offset_1_30_between_phasic(cyc) = offset_1_30_cyc_phasic_allcycles(cyc); 
               offset_1_30_between_tonic(cyc) = offset_1_30_cyc_tonic_allcycles(cyc); 
               
               offset_30_45_pre_nrem(cyc) = offset_30_45_cyc_nrem_allcycles(cyc);
               offset_30_45_post_nrem(cyc) = offset_30_45_cyc_nrem_allcycles(cyc+1);
               offset_30_45_prepost_diff(cyc) = offset_30_45_post_nrem(cyc) - offset_1_30_pre_nrem(cyc);
               offset_30_45_between_rem(cyc) = offset_30_45_cyc_rem_allcycles(cyc); 
               offset_30_45_between_phasic(cyc) = offset_30_45_cyc_phasic_allcycles(cyc); 
               offset_30_45_between_tonic(cyc) = offset_30_45_cyc_tonic_allcycles(cyc); 
               
               
               IAPF_between_rem(cyc) = IAPF_allcycles_rem(cyc); 
               ITPF_between_rem(cyc) = ITPF_allcycles_rem(cyc); 
               ISPF_between_rem(cyc) = ISPF_allcycles_rem(cyc); 
               den_alpha_between_rem(cyc) = den_alpha_cycles_rem(cyc);
               abu_alpha_between_rem(cyc) = abu_alpha_cycles_rem(cyc);
               amp_alpha_between_rem(cyc) = amp_alpha_cycles_rem(cyc);
               snr_alpha_between_rem(cyc) = snr_alpha_cycles_rem(cyc);
               den_theta_between_rem(cyc) = den_theta_cycles_rem(cyc);
               abu_theta_between_rem(cyc) = abu_theta_cycles_rem(cyc);
               amp_theta_between_rem(cyc) = amp_theta_cycles_rem(cyc);
               snr_theta_between_rem(cyc) = snr_theta_cycles_rem(cyc);
               den_spindles_between_rem(cyc) = den_spindles_cycles_rem(cyc);
               abu_spindles_between_rem(cyc) = abu_spindles_cycles_rem(cyc);
               amp_spindles_between_rem(cyc) = amp_spindles_cycles_rem(cyc);
               snr_spindles_between_rem(cyc) = snr_spindles_cycles_rem(cyc);
               
               IAPF_between_phasic(cyc) = IAPF_allcycles_phasic(cyc); 
               ITPF_between_phasic(cyc) = ITPF_allcycles_phasic(cyc); 
               ISPF_between_phasic(cyc) = ISPF_allcycles_phasic(cyc); 
               den_alpha_between_phasic(cyc) = den_alpha_cycles_phasic(cyc);
               abu_alpha_between_phasic(cyc) = abu_alpha_cycles_phasic(cyc);
               amp_alpha_between_phasic(cyc) = amp_alpha_cycles_phasic(cyc);
               snr_alpha_between_phasic(cyc) = snr_alpha_cycles_phasic(cyc);
               den_theta_between_phasic(cyc) = den_theta_cycles_phasic(cyc);
               abu_theta_between_phasic(cyc) = abu_theta_cycles_phasic(cyc);
               amp_theta_between_phasic(cyc) = amp_theta_cycles_phasic(cyc);
               snr_theta_between_phasic(cyc) = snr_theta_cycles_phasic(cyc);
               den_spindles_between_phasic(cyc) = den_spindles_cycles_phasic(cyc);
               abu_spindles_between_phasic(cyc) = abu_spindles_cycles_phasic(cyc);
               amp_spindles_between_phasic(cyc) = amp_spindles_cycles_phasic(cyc);
               snr_spindles_between_phasic(cyc) = snr_spindles_cycles_phasic(cyc);
               
               IAPF_between_tonic(cyc) = IAPF_allcycles_tonic(cyc); 
               ITPF_between_tonic(cyc) = ITPF_allcycles_tonic(cyc); 
               ISPF_between_tonic(cyc) = ISPF_allcycles_tonic(cyc); 
               den_alpha_between_tonic(cyc) = den_alpha_cycles_tonic(cyc);
               abu_alpha_between_tonic(cyc) = abu_alpha_cycles_tonic(cyc);
               amp_alpha_between_tonic(cyc) = amp_alpha_cycles_tonic(cyc);
               snr_alpha_between_tonic(cyc) = snr_alpha_cycles_tonic(cyc);
               den_theta_between_tonic(cyc) = den_theta_cycles_tonic(cyc);
               abu_theta_between_tonic(cyc) = abu_theta_cycles_tonic(cyc);
               amp_theta_between_tonic(cyc) = amp_theta_cycles_tonic(cyc);
               snr_theta_between_tonic(cyc) = snr_theta_cycles_tonic(cyc);
               den_spindles_between_tonic(cyc) = den_spindles_cycles_tonic(cyc);
               abu_spindles_between_tonic(cyc) = abu_spindles_cycles_tonic(cyc);
               amp_spindles_between_tonic(cyc) = amp_spindles_cycles_tonic(cyc);
               snr_spindles_between_tonic(cyc) = snr_spindles_cycles_tonic(cyc);
               
                
            end
            
            m_exponent_1_30_prepost_diff = nanmean(exponent_1_30_prepost_diff);
            m_exponent_30_45_prepost_diff = nanmean(exponent_30_45_prepost_diff);
            m_offset_1_30_prepost_diff = nanmean(offset_1_30_prepost_diff);
            m_offset_30_45_prepost_diff = nanmean(offset_30_45_prepost_diff);
            
            m_exponent_1_30_between_rem = nanmean(exponent_1_30_between_rem);
            m_exponent_30_45_between_rem = nanmean(exponent_30_45_between_rem);
            m_offset_1_30_between_rem = nanmean(offset_1_30_between_rem);
            m_offset_30_45_between_rem = nanmean(offset_30_45_between_rem);
            
            m_exponent_1_30_between_phasic = nanmean(exponent_1_30_between_phasic);
            m_exponent_30_45_between_phasic = nanmean(exponent_30_45_between_phasic);
            m_offset_1_30_between_phasic = nanmean(offset_1_30_between_phasic);
            m_offset_30_45_between_phasic = nanmean(offset_30_45_between_phasic);
            
            m_exponent_1_30_between_tonic = nanmean(exponent_1_30_between_tonic);
            m_exponent_30_45_between_tonic = nanmean(exponent_30_45_between_tonic);
            m_offset_1_30_between_tonic = nanmean(offset_1_30_between_tonic);
            m_offset_30_45_between_tonic = nanmean(offset_30_45_between_tonic);
            
            %%
            aperiodic_dyn_table = table(sub,ni,con,channel,...
            exponent_1_30_cyc_nrem_firstlast_diff, exponent_30_45_cyc_nrem_firstlast_diff,...
            offset_1_30_cyc_nrem_firstlast_diff, offset_30_45_cyc_nrem_firstlast_diff,...
            exponent_1_30_cyc_rem_firstlast_diff, exponent_30_45_cyc_rem_firstlast_diff,...
            offset_1_30_cyc_rem_firstlast_diff, offset_30_45_cyc_rem_firstlast_diff,...
            exponent_1_30_cyc_phasic_firstlast_diff, exponent_30_45_cyc_phasic_firstlast_diff,...
            offset_1_30_cyc_phasic_firstlast_diff, offset_30_45_cyc_phasic_firstlast_diff,...
            exponent_1_30_cyc_tonic_firstlast_diff, exponent_30_45_cyc_tonic_firstlast_diff,...
            offset_1_30_cyc_tonic_firstlast_diff, offset_30_45_cyc_tonic_firstlast_diff,...
            exponent_1_30_cyc_nrem_first, exponent_30_45_cyc_nrem_first,...
            offset_1_30_cyc_nrem_first, offset_30_45_cyc_nrem_first,...
            exponent_1_30_cyc_rem_first, exponent_30_45_cyc_rem_first,...
            offset_1_30_cyc_rem_first, offset_30_45_cyc_rem_first,...
            exponent_1_30_cyc_phasic_first, exponent_30_45_cyc_phasic_first,...
            offset_1_30_cyc_phasic_first, offset_30_45_cyc_phasic_first,...
            exponent_1_30_cyc_tonic_first, exponent_30_45_cyc_tonic_first,...
            offset_1_30_cyc_tonic_first, offset_30_45_cyc_tonic_first,...
            exponent_1_30_cyc_nrem_last, exponent_30_45_cyc_nrem_last,...
            offset_1_30_cyc_nrem_last, offset_30_45_cyc_nrem_last,...
            exponent_1_30_cyc_rem_last, exponent_30_45_cyc_rem_last,...
            offset_1_30_cyc_rem_last, offset_30_45_cyc_rem_last,...
            exponent_1_30_cyc_phasic_last, exponent_30_45_cyc_phasic_last,...
            offset_1_30_cyc_phasic_last, offset_30_45_cyc_phasic_last,...
            exponent_1_30_cyc_tonic_last, exponent_30_45_cyc_tonic_last,...
            offset_1_30_cyc_tonic_last, offset_30_45_cyc_tonic_last,...
            m_exponent_1_30_cyc_nrem, m_exponent_30_45_cyc_nrem,...
            m_offset_1_30_cyc_nrem, m_offset_30_45_cyc_nrem,...
            m_exponent_1_30_cyc_rem, m_exponent_30_45_cyc_rem,...
            m_offset_1_30_cyc_rem, m_offset_30_45_cyc_rem,...
            m_exponent_1_30_cyc_phasic, m_exponent_30_45_cyc_phasic,...
            m_offset_1_30_cyc_phasic, m_offset_30_45_cyc_phasic,...
            m_exponent_1_30_cyc_tonic, m_exponent_30_45_cyc_tonic,...
            m_offset_1_30_cyc_tonic, m_offset_30_45_cyc_tonic,...
            m_exponent_1_30_prepost_diff, m_exponent_30_45_prepost_diff,...
            m_offset_1_30_prepost_diff, m_offset_30_45_prepost_diff,...
            m_exponent_1_30_between_rem, m_exponent_30_45_between_rem,...
            m_offset_1_30_between_rem, m_offset_30_45_between_rem,...
            m_exponent_1_30_between_phasic, m_exponent_30_45_between_phasic,...
            m_offset_1_30_between_phasic, m_offset_30_45_between_phasic,...
            m_exponent_1_30_between_tonic, m_exponent_30_45_between_tonic,...
            m_offset_1_30_between_tonic, m_offset_30_45_between_tonic);
        
        
            aperiodic_osc_dyn_triplet_table = table(sub_tri, ni_tri, con_tri, channel_tri,cycles',...
            exponent_1_30_prepost_diff',exponent_30_45_prepost_diff',...
            offset_1_30_prepost_diff',offset_30_45_prepost_diff',...
            exponent_1_30_between_rem',exponent_30_45_between_rem',...
            offset_1_30_between_rem',offset_30_45_between_rem',...
            exponent_1_30_between_phasic',exponent_30_45_between_phasic',...
            offset_1_30_between_phasic',offset_30_45_between_phasic',...
            exponent_1_30_between_tonic',exponent_30_45_between_tonic',...
            offset_1_30_between_tonic',offset_30_45_between_tonic',...
            exponent_1_30_pre_nrem', exponent_30_45_pre_nrem',...
            offset_1_30_pre_nrem', offset_30_45_pre_nrem',...
            exponent_1_30_post_nrem', exponent_30_45_post_nrem',...
            offset_1_30_post_nrem', offset_30_45_post_nrem',...
            IAPF_between_rem',ITPF_between_rem',ISPF_between_rem',...
            den_alpha_between_rem',abu_alpha_between_rem',amp_alpha_between_rem',snr_alpha_between_rem',...
            den_theta_between_rem',abu_theta_between_rem',amp_theta_between_rem',snr_theta_between_rem',...
            den_spindles_between_rem',abu_spindles_between_rem',amp_spindles_between_rem',snr_spindles_between_rem',...
            IAPF_between_phasic',ITPF_between_phasic',ISPF_between_phasic',...
            den_alpha_between_phasic',abu_alpha_between_phasic',amp_alpha_between_phasic',snr_alpha_between_phasic',...
            den_theta_between_phasic',abu_theta_between_phasic',amp_theta_between_phasic',snr_theta_between_phasic',...
            den_spindles_between_phasic',abu_spindles_between_phasic',amp_spindles_between_phasic',snr_spindles_between_phasic',...            
            IAPF_between_tonic',ITPF_between_tonic',ISPF_between_tonic',...
            den_alpha_between_tonic',abu_alpha_between_tonic',amp_alpha_between_tonic',snr_alpha_between_tonic',...
            den_theta_between_tonic',abu_theta_between_tonic',amp_theta_between_tonic',snr_theta_between_tonic',...
            den_spindles_between_tonic',abu_spindles_between_tonic',amp_spindles_between_tonic',snr_spindles_between_tonic');
        
        
            aperiodic_dyn_table_allcyc = table(sub_cyc,ni_cyc,con_cyc,channel_cyc,cycle',...
                exponent_1_30_cyc_nrem_allcycles,exponent_30_45_cyc_nrem_allcycles,...
                offset_1_30_cyc_nrem_allcycles,offset_30_45_cyc_nrem_allcycles,...
                exponent_1_30_cyc_rem_allcycles,exponent_30_45_cyc_rem_allcycles,...
                offset_1_30_cyc_rem_allcycles,offset_30_45_cyc_rem_allcycles,...
                exponent_1_30_cyc_phasic_allcycles,exponent_30_45_cyc_phasic_allcycles,...
                offset_1_30_cyc_phasic_allcycles,offset_30_45_cyc_phasic_allcycles,...
                exponent_1_30_cyc_tonic_allcycles,exponent_30_45_cyc_tonic_allcycles,...
                offset_1_30_cyc_tonic_allcycles,offset_30_45_cyc_tonic_allcycles);
              

           
            aperiodic_dyn_table_all = vertcat(aperiodic_dyn_table_all,aperiodic_dyn_table);
            aperiodic_osc_dyn_triplet_table_all = vertcat(aperiodic_osc_dyn_triplet_table_all,aperiodic_osc_dyn_triplet_table);
            aperiodic_dyn_table_allcyc_all = vertcat(aperiodic_dyn_table_allcyc_all,aperiodic_dyn_table_allcyc);

            
            clear exponent*allcycles* offset*allcycles
            clear last_cycle cycles aperiodic_dyn_table aperiodic_osc_dyn_triplet_table sub* ni ni_tri con* channel*
            clear exponent*firstlast_diff offset*firstlast_diff exponent*first offset*first exponent*last offset*last m_exponent* m_offset*
            clear exponent*pre* offset*pre* exponent*post* offset*post* exponent*prepost_diff offset*prepost_diff exponent*_between* offset*_between*
            clear IAPF*between* ITPF*between* ISPF*between* den*between* abu*between* amp*between* snr*between*

        end
    end
end

%%
aperiodic_dyn_table_all.Properties.VariableNames{2} = 'night';
aperiodic_dyn_table_all.Properties.VariableNames{3} = 'condition';

aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{1} = 'sub';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{2} = 'night';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{3} = 'condition';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{4} = 'channel';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{5} = 'cycle';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{6} = 'exponent_1_30_prepost_diff';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{7} = 'exponent_30_45_prepost_diff';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{8} = 'offset_1_30_prepost_diff';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{9} = 'offset_30_45_prepost_diff';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{10} = 'exponent_1_30_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{11} = 'exponent_30_45_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{12} = 'offset_1_30_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{13} = 'offset_30_45_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{14} = 'exponent_1_30_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{15} = 'exponent_30_45_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{16} = 'offset_1_30_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{17} = 'offset_30_45_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{18} = 'exponent_1_30_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{19} = 'exponent_30_45_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{20} = 'offset_1_30_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{21} = 'offset_30_45_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{22} = 'exponent_1_30_pre_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{23} = 'exponent_30_45_pre_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{24} = 'offset_1_30_pre_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{25} = 'offset_30_45_pre_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{26} = 'exponent_1_30_post_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{27} = 'exponent_30_45_post_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{28} = 'offset_1_30_post_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{29} = 'offset_30_45_post_nrem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{30} = 'IAPF_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{31} = 'ITPF_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{32} = 'ISPF_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{33} = 'den_alpha_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{34} = 'abu_alpha_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{35} = 'amp_alpha_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{36} = 'snr_alpha_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{37} = 'den_theta_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{38} = 'abu_theta_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{39} = 'amp_theta_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{40} = 'snr_theta_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{41} = 'den_spindles_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{42} = 'abu_spindles_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{43} = 'amp_spindles_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{44} = 'snr_spindles_between_rem';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{45} = 'IAPF_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{46} = 'ITPF_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{47} = 'ISPF_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{48} = 'den_alpha_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{49} = 'abu_alpha_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{50} = 'amp_alpha_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{51} = 'snr_alpha_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{52} = 'den_theta_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{53} = 'abu_theta_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{54} = 'amp_theta_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{55} = 'snr_theta_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{56} = 'den_spindles_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{57} = 'abu_spindles_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{58} = 'amp_spindles_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{59} = 'snr_spindles_between_phasic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{60} = 'IAPF_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{61} = 'ITPF_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{62} = 'ISPF_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{63} = 'den_alpha_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{64} = 'abu_alpha_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{65} = 'amp_alpha_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{66} = 'snr_alpha_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{67} = 'den_theta_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{68} = 'abu_theta_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{69} = 'amp_theta_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{70} = 'snr_theta_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{71} = 'den_spindles_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{72} = 'abu_spindles_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{73} = 'amp_spindles_between_tonic';
aperiodic_osc_dyn_triplet_table_all.Properties.VariableNames{74} = 'snr_spindles_between_tonic';


aperiodic_dyn_table_allcyc_all.Properties.VariableNames{1} = 'sub';
aperiodic_dyn_table_allcyc_all.Properties.VariableNames{2} = 'night';
aperiodic_dyn_table_allcyc_all.Properties.VariableNames{3} = 'condition';
aperiodic_dyn_table_allcyc_all.Properties.VariableNames{4} = 'channel';
aperiodic_dyn_table_allcyc_all.Properties.VariableNames{5} = 'cycle';


writetable(aperiodic_dyn_table_all,[Savefolder,filesep,'aperiodic_dyn_table_all_sprint_',date,'.xlsx']);              
writetable(aperiodic_osc_dyn_triplet_table_all,[Savefolder,filesep,'aperiodic_osc_dyn_triplet_table_all_sprint_',date,'.xlsx']);              
writetable(aperiodic_dyn_table_allcyc_all,[Savefolder,filesep,'aperiodic_dyn_table_allcyc_allsub_not_individualized_2_6_12_v2_',date,'.xlsx']);              

%% quintiles

aperiodic_quintiles_table_all = [];
 
for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8
            
            for cyc = 1:10
            
            sub = repmat({participants_uni{s}},5,1,1);
            if night < 10
                ni = repmat(night,5,1,1);
                con = repmat({'SE'},5,1,1);
            else
                ni = repmat((night-9),5,1,1);
                con = repmat({'SR'},5,1,1);
            end
            channel = repmat({EEG.chanlocs(ch).labels},5,1,1);
            cycle = repmat(cyc,5,1,1);
            quintile = 1:5;
                        
            exponent_1_30_nrem_allquintiles = squeeze(exponent_1_30_cyc_quint_nrem_all(s,night,ch,cyc,:));
            exponent_30_45_nrem_allquintiles = squeeze(exponent_30_45_cyc_quint_nrem_all(s,night,ch,cyc,:));
            offset_1_30_nrem_allquintiles = squeeze(offset_1_30_cyc_quint_nrem_all(s,night,ch,cyc,:));
            offset_30_45_nrem_allquintiles = squeeze(offset_30_45_cyc_quint_nrem_all(s,night,ch,cyc,:));      
            
            exponent_1_30_rem_allquintiles = squeeze(exponent_1_30_cyc_quint_rem_all(s,night,ch,cyc,:));
            exponent_30_45_rem_allquintiles = squeeze(exponent_30_45_cyc_quint_rem_all(s,night,ch,cyc,:));
            offset_1_30_rem_allquintiles = squeeze(offset_1_30_cyc_quint_rem_all(s,night,ch,cyc,:));
            offset_30_45_rem_allquintiles = squeeze(offset_30_45_cyc_quint_rem_all(s,night,ch,cyc,:));  
            
            exponent_1_30_phasic_allquintiles = squeeze(exponent_1_30_cyc_quint_phasic_all(s,night,ch,cyc,:));
            exponent_30_45_phasic_allquintiles = squeeze(exponent_30_45_cyc_quint_phasic_all(s,night,ch,cyc,:));
            offset_1_30_phasic_allquintiles = squeeze(offset_1_30_cyc_quint_phasic_all(s,night,ch,cyc,:));
            offset_30_45_phasic_allquintiles = squeeze(offset_30_45_cyc_quint_phasic_all(s,night,ch,cyc,:));     
            
            exponent_1_30_tonic_allquintiles = squeeze(exponent_1_30_cyc_quint_tonic_all(s,night,ch,cyc,:));
            exponent_30_45_tonic_allquintiles = squeeze(exponent_30_45_cyc_quint_tonic_all(s,night,ch,cyc,:));
            offset_1_30_tonic_allquintiles = squeeze(offset_1_30_cyc_quint_tonic_all(s,night,ch,cyc,:));
            offset_30_45_tonic_allquintiles = squeeze(offset_30_45_cyc_quint_tonic_all(s,night,ch,cyc,:));     

          
            aperiodic_quintiles_table = table(sub,ni,con,channel,cycle,quintile',...
                exponent_1_30_nrem_allquintiles,exponent_30_45_nrem_allquintiles,...
                offset_1_30_nrem_allquintiles,offset_30_45_nrem_allquintiles,...
                exponent_1_30_rem_allquintiles,exponent_30_45_rem_allquintiles,...
                offset_1_30_rem_allquintiles,offset_30_45_rem_allquintiles,...              
                exponent_1_30_phasic_allquintiles,exponent_30_45_phasic_allquintiles,...
                offset_1_30_phasic_allquintiles,offset_30_45_phasic_allquintiles,...        
                exponent_1_30_tonic_allquintiles,exponent_30_45_tonic_allquintiles,...
                offset_1_30_tonic_allquintiles,offset_30_45_tonic_allquintiles);     
                
            aperiodic_quintiles_table_all = vertcat(aperiodic_quintiles_table_all,aperiodic_quintiles_table);
            
            clear aperiodic_quintiles_table
            
            end
            
        end
    end
end

%%
aperiodic_quintiles_table_all.Properties.VariableNames{2} = 'night';
aperiodic_quintiles_table_all.Properties.VariableNames{3} = 'condition';
aperiodic_quintiles_table_all.Properties.VariableNames{6} = 'quintile';
aperiodic_quintiles_table_all.Properties.VariableNames{7} = 'nrem_exponent_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{8} = 'nrem_exponent_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{9} = 'nrem_offset_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{10} = 'nrem_offset_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{11} = 'rem_exponent_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{12} = 'rem_exponent_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{13} = 'rem_offset_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{14} = 'rem_offset_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{15} = 'phasic_exponent_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{16} = 'phasic_exponent_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{17} = 'phasic_offset_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{18} = 'phasic_offset_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{19} = 'tonic_exponent_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{20} = 'tonic_exponent_30_45';
aperiodic_quintiles_table_all.Properties.VariableNames{21} = 'tonic_offset_1_30';
aperiodic_quintiles_table_all.Properties.VariableNames{22} = 'tonic_offset_30_45';

writetable(aperiodic_quintiles_table_all,[Savefolder,filesep,'aperiodic_quintiles_table_all_sprint_',date,'.xlsx']);              

clear stage


