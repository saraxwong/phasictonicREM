clear all;
close all;

%%

waves_folder = '/parallel_scratch/nemo/AFdata/eBOSC';
waves_folder_dir = dir([waves_folder,filesep,'AFOSR*'])

load('/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_dynamics/eBOSC_allsub_not_individualized_2_6_12_dynamics01-Dec-2025.mat');
load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/eBOSC';

%% cycles

osc_cycles_table_all = [];
 
for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8
            
            sub = repmat({waves_folder_dir(s).name},10,1,1);
            if night < 10
                ni = repmat(night,10,1,1);
                con = repmat({'SE'},10,1,1);
            else
                ni = repmat((night-9),10,1,1);
                con = repmat({'SR'},10,1,1);
            end
            channel = repmat({EEG.chanlocs(ch).labels},10,1,1);
            cycle = 1:10;
            
            prob_phasic_cycles = squeeze(prob_phasic_cyc_allsub(s,night,ch,:)); 
            prob_tonic_cycles = squeeze((1-prob_phasic_cyc_allsub(s,night,ch,:))); 
            dur_cycles = squeeze(dur_cyc_min_allsub(s,night,ch,:));
               
            % rem
            exponent_1_30_allcycles_rem = squeeze(exponent_1_30_cyc_rem_allsub(s,night,ch,:));
            exponent_30_45_allcycles_rem  = squeeze(exponent_30_45_cyc_rem_allsub(s,night,ch,:));
            offset_1_30_allcycles_rem = squeeze(offset_1_30_cyc_rem_allsub(s,night,ch,:));
            offset_30_45_allcycles_rem  = squeeze(offset_30_45_cyc_rem_allsub(s,night,ch,:));
            
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
            
            
            % phasic
            exponent_1_30_allcycles_phasic = squeeze(exponent_1_30_cyc_phasic_allsub(s,night,ch,:));
            exponent_30_45_allcycles_phasic  = squeeze(exponent_30_45_cyc_phasic_allsub(s,night,ch,:));
            offset_1_30_allcycles_phasic = squeeze(offset_1_30_cyc_phasic_allsub(s,night,ch,:));
            offset_30_45_allcycles_phasic  = squeeze(offset_30_45_cyc_phasic_allsub(s,night,ch,:));
            
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
            
            
            % tonic
            exponent_1_30_allcycles_tonic = squeeze(exponent_1_30_cyc_tonic_allsub(s,night,ch,:));
            exponent_30_45_allcycles_tonic  = squeeze(exponent_30_45_cyc_tonic_allsub(s,night,ch,:));
            offset_1_30_allcycles_tonic = squeeze(offset_1_30_cyc_tonic_allsub(s,night,ch,:));
            offset_30_45_allcycles_tonic  = squeeze(offset_30_45_cyc_tonic_allsub(s,night,ch,:));
            
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
            
            
            % nrem
            exponent_1_30_allcycles_nrem = squeeze(exponent_1_30_cyc_nrem_allsub(s,night,ch,:));
            exponent_30_45_allcycles_nrem  = squeeze(exponent_30_45_cyc_nrem_allsub(s,night,ch,:));
            offset_1_30_allcycles_nrem = squeeze(offset_1_30_cyc_nrem_allsub(s,night,ch,:));
            offset_30_45_allcycles_nrem  = squeeze(offset_30_45_cyc_nrem_allsub(s,night,ch,:));
            
            IAPF_allcycles_nrem = squeeze(IAPF_nrem_cyc_allsub(s,night,ch,:));
            ITPF_allcycles_nrem = squeeze(ITPF_nrem_cyc_allsub(s,night,ch,:));
            ISPF_allcycles_nrem = squeeze(ISPF_nrem_cyc_allsub(s,night,ch,:));
            IAPF_height_allcycles_nrem = squeeze(IAPF_nrem_height_cyc_allsub(s,night,ch,:));
            ITPF_height_allcycles_nrem = squeeze(ITPF_nrem_height_cyc_allsub(s,night,ch,:));
            ISPF_height_allcycles_nrem = squeeze(ISPF_nrem_height_cyc_allsub(s,night,ch,:));                
          
            den_alpha_cycles_nrem = squeeze(alpha_nrem_den_cyc_allsub(s,night,ch,:)); 
            abu_alpha_cycles_nrem = squeeze(alpha_nrem_abu_cyc_allsub(s,night,ch,:)); 
            amp_alpha_cycles_nrem = squeeze(alpha_nrem_amp_cyc_allsub(s,night,ch,:)); 
            snr_alpha_cycles_nrem = squeeze(alpha_nrem_snr_cyc_allsub(s,night,ch,:)); 

            den_theta_cycles_nrem = squeeze(theta_nrem_den_cyc_allsub(s,night,ch,:)); 
            abu_theta_cycles_nrem = squeeze(theta_nrem_abu_cyc_allsub(s,night,ch,:)); 
            amp_theta_cycles_nrem = squeeze(theta_nrem_amp_cyc_allsub(s,night,ch,:)); 
            snr_theta_cycles_nrem = squeeze(theta_nrem_snr_cyc_allsub(s,night,ch,:)); 
            
            den_spindles_cycles_nrem = squeeze(spindles_nrem_den_cyc_allsub(s,night,ch,:)); 
            abu_spindles_cycles_nrem = squeeze(spindles_nrem_abu_cyc_allsub(s,night,ch,:)); 
            amp_spindles_cycles_nrem = squeeze(spindles_nrem_amp_cyc_allsub(s,night,ch,:)); 
            snr_spindles_cycles_nrem = squeeze(spindles_nrem_snr_cyc_allsub(s,night,ch,:));
            
            
            
            osc_dyn_table = table(sub,ni,con,channel,cycle',...
                prob_phasic_cycles,prob_tonic_cycles,dur_cycles,...
                exponent_1_30_allcycles_rem,exponent_30_45_allcycles_rem,...
                offset_1_30_allcycles_rem,offset_30_45_allcycles_rem,...
                IAPF_allcycles_rem,ITPF_allcycles_rem,ISPF_allcycles_rem,...
                IAPF_height_allcycles_rem,ITPF_height_allcycles_rem,ISPF_height_allcycles_rem,... 
                den_alpha_cycles_rem,abu_alpha_cycles_rem,amp_alpha_cycles_rem,snr_alpha_cycles_rem,...
                den_theta_cycles_rem,abu_theta_cycles_rem,amp_theta_cycles_rem,snr_theta_cycles_rem,...
                den_spindles_cycles_rem,abu_spindles_cycles_rem,amp_spindles_cycles_rem,snr_spindles_cycles_rem,...
                exponent_1_30_allcycles_phasic,exponent_30_45_allcycles_phasic,...
                offset_1_30_allcycles_phasic,offset_30_45_allcycles_phasic,...
                IAPF_allcycles_phasic,ITPF_allcycles_phasic,ISPF_allcycles_phasic,...
                IAPF_height_allcycles_phasic,ITPF_height_allcycles_phasic,ISPF_height_allcycles_phasic,... 
                den_alpha_cycles_phasic,abu_alpha_cycles_phasic,amp_alpha_cycles_phasic,snr_alpha_cycles_phasic,...
                den_theta_cycles_phasic,abu_theta_cycles_phasic,amp_theta_cycles_phasic,snr_theta_cycles_phasic,...
                den_spindles_cycles_phasic,abu_spindles_cycles_phasic,amp_spindles_cycles_phasic,snr_spindles_cycles_phasic,...
                exponent_1_30_allcycles_tonic,exponent_30_45_allcycles_tonic,...
                offset_1_30_allcycles_tonic,offset_30_45_allcycles_tonic,...
                IAPF_allcycles_tonic,ITPF_allcycles_tonic,ISPF_allcycles_tonic,...
                IAPF_height_allcycles_tonic,ITPF_height_allcycles_tonic,ISPF_height_allcycles_tonic,... 
                den_alpha_cycles_tonic,abu_alpha_cycles_tonic,amp_alpha_cycles_tonic,snr_alpha_cycles_tonic,...
                den_theta_cycles_tonic,abu_theta_cycles_tonic,amp_theta_cycles_tonic,snr_theta_cycles_tonic,...
                den_spindles_cycles_tonic,abu_spindles_cycles_tonic,amp_spindles_cycles_tonic,snr_spindles_cycles_tonic,...
                exponent_1_30_allcycles_nrem,exponent_30_45_allcycles_nrem,...
                offset_1_30_allcycles_nrem,offset_30_45_allcycles_nrem,...
                IAPF_allcycles_nrem,ITPF_allcycles_nrem,ISPF_allcycles_nrem,...
                IAPF_height_allcycles_nrem,ITPF_height_allcycles_nrem,ISPF_height_allcycles_nrem,... 
                den_alpha_cycles_nrem,abu_alpha_cycles_nrem,amp_alpha_cycles_nrem,snr_alpha_cycles_nrem,...
                den_theta_cycles_nrem,abu_theta_cycles_nrem,amp_theta_cycles_nrem,snr_theta_cycles_nrem,...
                den_spindles_cycles_nrem,abu_spindles_cycles_nrem,amp_spindles_cycles_nrem,snr_spindles_cycles_nrem);
                
                                    
            osc_cycles_table_all = vertcat(osc_cycles_table_all,osc_dyn_table);
            
            clear osc_dyn_table
            
        end
    end
end

%%
osc_cycles_table_all.Properties.VariableNames{2} = 'night';
osc_cycles_table_all.Properties.VariableNames{3} = 'condition';
osc_cycles_table_all.Properties.VariableNames{5} = 'cycle';


writetable(osc_cycles_table_all,[Savefolder,filesep,'cycles_table_allsub_not_individualized_2_6_12_v2_',date,'.xlsx']);              


%% quintiles

quintiles_table_all = [];
 
for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8
            
            for cyc = 1:10
            
            sub = repmat({waves_folder_dir(s).name},5,1,1);
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
            
            prob_phasic_quintiles = squeeze(prob_phasic_cyc_quint_allsub(s,night,ch,cyc,:)); 
            dur_quintiles = squeeze(dur_cyc_quint_min_allsub(s,night,ch,cyc,:));
                 
            % rem
            exponent_1_30_allquintiles_rem = squeeze(exponent_1_30_cyc_quint_rem_allsub(s,night,ch,cyc,:));
            exponent_30_45_allquintiles_rem = squeeze(exponent_30_45_cyc_quint_rem_allsub(s,night,ch,cyc,:));
            offset_1_30_allquintiles_rem = squeeze(offset_1_30_cyc_quint_rem_allsub(s,night,ch,cyc,:));
            offset_30_45_allquintiles_rem = squeeze(offset_30_45_cyc_quint_rem_allsub(s,night,ch,cyc,:));
            
            IAPF_allquintiles_rem = squeeze(IAPF_rem_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_allquintiles_rem = squeeze(ITPF_rem_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_allquintiles_rem = squeeze(ISPF_rem_cyc_quint_allsub(s,night,ch,cyc,:));
            IAPF_height_allquintiles_rem = squeeze(IAPF_rem_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_height_allquintiles_rem = squeeze(ITPF_rem_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_height_allquintiles_rem = squeeze(ISPF_rem_height_cyc_quint_allsub(s,night,ch,cyc,:));
                   
            den_alpha_quintiles_rem = squeeze(alpha_rem_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_alpha_quintiles_rem = squeeze(alpha_rem_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_alpha_quintiles_rem = squeeze(alpha_rem_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_alpha_quintiles_rem = squeeze(alpha_rem_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_theta_quintiles_rem = squeeze(theta_rem_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_theta_quintiles_rem = squeeze(theta_rem_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_theta_quintiles_rem = squeeze(theta_rem_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_theta_quintiles_rem = squeeze(theta_rem_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_spindles_quintiles_rem = squeeze(spindles_rem_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_spindles_quintiles_rem = squeeze(spindles_rem_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_spindles_quintiles_rem = squeeze(spindles_rem_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_spindles_quintiles_rem = squeeze(spindles_rem_snr_cyc_quint_allsub(s,night,ch,cyc,:)); 
            
            
            % phasic
            exponent_1_30_allquintiles_phasic = squeeze(exponent_1_30_cyc_quint_phasic_allsub(s,night,ch,cyc,:));
            exponent_30_45_allquintiles_phasic = squeeze(exponent_30_45_cyc_quint_phasic_allsub(s,night,ch,cyc,:));
            offset_1_30_allquintiles_phasic = squeeze(offset_1_30_cyc_quint_phasic_allsub(s,night,ch,cyc,:));
            offset_30_45_allquintiles_phasic = squeeze(offset_30_45_cyc_quint_phasic_allsub(s,night,ch,cyc,:));
            
            IAPF_allquintiles_phasic = squeeze(IAPF_phasic_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_allquintiles_phasic = squeeze(ITPF_phasic_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_allquintiles_phasic = squeeze(ISPF_phasic_cyc_quint_allsub(s,night,ch,cyc,:));
            IAPF_height_allquintiles_phasic = squeeze(IAPF_phasic_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_height_allquintiles_phasic = squeeze(ITPF_phasic_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_height_allquintiles_phasic = squeeze(ISPF_phasic_height_cyc_quint_allsub(s,night,ch,cyc,:));
                   
            den_alpha_quintiles_phasic = squeeze(alpha_phasic_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_alpha_quintiles_phasic = squeeze(alpha_phasic_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_alpha_quintiles_phasic = squeeze(alpha_phasic_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_alpha_quintiles_phasic = squeeze(alpha_phasic_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_theta_quintiles_phasic = squeeze(theta_phasic_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_theta_quintiles_phasic = squeeze(theta_phasic_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_theta_quintiles_phasic = squeeze(theta_phasic_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_theta_quintiles_phasic = squeeze(theta_phasic_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_spindles_quintiles_phasic = squeeze(spindles_phasic_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_spindles_quintiles_phasic = squeeze(spindles_phasic_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_spindles_quintiles_phasic = squeeze(spindles_phasic_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_spindles_quintiles_phasic = squeeze(spindles_phasic_snr_cyc_quint_allsub(s,night,ch,cyc,:)); 
            
            
            % tonic
            exponent_1_30_allquintiles_tonic = squeeze(exponent_1_30_cyc_quint_tonic_allsub(s,night,ch,cyc,:));
            exponent_30_45_allquintiles_tonic = squeeze(exponent_30_45_cyc_quint_tonic_allsub(s,night,ch,cyc,:));
            offset_1_30_allquintiles_tonic = squeeze(offset_1_30_cyc_quint_tonic_allsub(s,night,ch,cyc,:));
            offset_30_45_allquintiles_tonic = squeeze(offset_30_45_cyc_quint_tonic_allsub(s,night,ch,cyc,:));
            
            IAPF_allquintiles_tonic = squeeze(IAPF_tonic_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_allquintiles_tonic = squeeze(ITPF_tonic_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_allquintiles_tonic = squeeze(ISPF_tonic_cyc_quint_allsub(s,night,ch,cyc,:));
            IAPF_height_allquintiles_tonic = squeeze(IAPF_tonic_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_height_allquintiles_tonic = squeeze(ITPF_tonic_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_height_allquintiles_tonic = squeeze(ISPF_tonic_height_cyc_quint_allsub(s,night,ch,cyc,:));
                   
            den_alpha_quintiles_tonic = squeeze(alpha_tonic_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_alpha_quintiles_tonic = squeeze(alpha_tonic_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_alpha_quintiles_tonic = squeeze(alpha_tonic_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_alpha_quintiles_tonic = squeeze(alpha_tonic_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_theta_quintiles_tonic = squeeze(theta_tonic_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_theta_quintiles_tonic = squeeze(theta_tonic_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_theta_quintiles_tonic = squeeze(theta_tonic_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_theta_quintiles_tonic = squeeze(theta_tonic_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_spindles_quintiles_tonic = squeeze(spindles_tonic_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_spindles_quintiles_tonic = squeeze(spindles_tonic_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_spindles_quintiles_tonic = squeeze(spindles_tonic_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_spindles_quintiles_tonic = squeeze(spindles_tonic_snr_cyc_quint_allsub(s,night,ch,cyc,:)); 


            % nrem
            exponent_1_30_allquintiles_nrem = squeeze(exponent_1_30_cyc_quint_nrem_allsub(s,night,ch,cyc,:));
            exponent_30_45_allquintiles_nrem = squeeze(exponent_30_45_cyc_quint_nrem_allsub(s,night,ch,cyc,:));
            offset_1_30_allquintiles_nrem = squeeze(offset_1_30_cyc_quint_nrem_allsub(s,night,ch,cyc,:));
            offset_30_45_allquintiles_nrem = squeeze(offset_30_45_cyc_quint_nrem_allsub(s,night,ch,cyc,:));
            
            IAPF_allquintiles_nrem = squeeze(IAPF_nrem_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_allquintiles_nrem = squeeze(ITPF_nrem_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_allquintiles_nrem = squeeze(ISPF_nrem_cyc_quint_allsub(s,night,ch,cyc,:));
            IAPF_height_allquintiles_nrem = squeeze(IAPF_nrem_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ITPF_height_allquintiles_nrem = squeeze(ITPF_nrem_height_cyc_quint_allsub(s,night,ch,cyc,:));
            ISPF_height_allquintiles_nrem = squeeze(ISPF_nrem_height_cyc_quint_allsub(s,night,ch,cyc,:));
                   
            den_alpha_quintiles_nrem = squeeze(alpha_nrem_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_alpha_quintiles_nrem = squeeze(alpha_nrem_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_alpha_quintiles_nrem = squeeze(alpha_nrem_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_alpha_quintiles_nrem = squeeze(alpha_nrem_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_theta_quintiles_nrem = squeeze(theta_nrem_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_theta_quintiles_nrem = squeeze(theta_nrem_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_theta_quintiles_nrem = squeeze(theta_nrem_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_theta_quintiles_nrem = squeeze(theta_nrem_snr_cyc_quint_allsub(s,night,ch,cyc,:));
            
            den_spindles_quintiles_nrem = squeeze(spindles_nrem_den_cyc_quint_allsub(s,night,ch,cyc,:)); 
            abu_spindles_quintiles_nrem = squeeze(spindles_nrem_abu_cyc_quint_allsub(s,night,ch,cyc,:)); 
            amp_spindles_quintiles_nrem = squeeze(spindles_nrem_amp_cyc_quint_allsub(s,night,ch,cyc,:)); 
            snr_spindles_quintiles_nrem = squeeze(spindles_nrem_snr_cyc_quint_allsub(s,night,ch,cyc,:)); 

            
            quintiles_table = table(sub,ni,con,channel,cycle,quintile',...
                prob_phasic_quintiles,dur_quintiles,...
                exponent_1_30_allquintiles_rem,exponent_30_45_allquintiles_rem,...
                offset_1_30_allquintiles_rem,offset_30_45_allquintiles_rem,...
                IAPF_allquintiles_rem,ITPF_allquintiles_rem,ISPF_allquintiles_rem,...
                IAPF_height_allquintiles_rem,ITPF_height_allquintiles_rem,ISPF_height_allquintiles_rem,...
                den_alpha_quintiles_rem,abu_alpha_quintiles_rem,amp_alpha_quintiles_rem,snr_alpha_quintiles_rem,...
                den_theta_quintiles_rem,abu_theta_quintiles_rem,amp_theta_quintiles_rem,snr_theta_quintiles_rem,...
                den_spindles_quintiles_rem,abu_spindles_quintiles_rem,amp_spindles_quintiles_rem,snr_spindles_quintiles_rem);
            
            quintiles_table_all = vertcat(quintiles_table_all,quintiles_table);
            
            clear quintiles_table
            
            end
            
        end
    end
end

%%
quintiles_table_all.Properties.VariableNames{2} = 'night';
quintiles_table_all.Properties.VariableNames{3} = 'condition';
quintiles_table_all.Properties.VariableNames{6} = 'quintile';

writetable(quintiles_table_all,[Savefolder,filesep,'quintiles_table_allsub_not_individualized_2_6_12_v2_',date,'.xlsx']);              

clear stage


