clear all;
close all;

%%

Folderpath = '/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/allsub/';
dir_Folderpath = dir([Folderpath,filesep,'AFOSR*']);

% load('/parallel_scratch/nemo/AFdata/eBOSC/abu_den_amp_freq/histograms_allstages_1s_osc4/eBOSC_allsub_not_individualized_2_6_12_1s_osc_01-Dec-2025.mat');

load('/parallel_scratch/nemo/AFdata/eBOSC/waves_allnights/allsub/allsub/eBOSC_allsub_21-Jul-2026.mat');

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/Tables';

%%
osc_table_all = [];
 
for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8
            
            sub = repmat({dir_Folderpath(s).name(1:12)},5,1,1);
            if night < 10
                ni = repmat(night,5,1,1);
                con = repmat({'SE'},5,1,1);
            else
                ni = repmat((night-9),5,1,1);
                con = repmat({'SR'},5,1,1);
            end
            channel = repmat({EEG.chanlocs(ch).labels},5,1,1);
            stage = {'W';'R';'P';'T';'N'};
            
            IAPF_allstages = vertcat(eBOSC_allsub.IAPF_wake_allsub(s,night,ch), eBOSC_allsub.IAPF_rem_allsub(s,night,ch), eBOSC_allsub.IAPF_phasic_allsub(s,night,ch), eBOSC_allsub.IAPF_tonic_allsub(s,night,ch), eBOSC_allsub.IAPF_nrem_allsub(s,night,ch));
            ITPF_allstages = vertcat(eBOSC_allsub.ITPF_wake_allsub(s,night,ch), eBOSC_allsub.ITPF_rem_allsub(s,night,ch), eBOSC_allsub.ITPF_phasic_allsub(s,night,ch), eBOSC_allsub.ITPF_tonic_allsub(s,night,ch), eBOSC_allsub.ITPF_nrem_allsub(s,night,ch));
            ISPF_allstages = vertcat(eBOSC_allsub.ISPF_wake_allsub(s,night,ch), eBOSC_allsub.ISPF_rem_allsub(s,night,ch), eBOSC_allsub.ISPF_phasic_allsub(s,night,ch), eBOSC_allsub.ISPF_tonic_allsub(s,night,ch), eBOSC_allsub.ISPF_nrem_allsub(s,night,ch));
            IAPF_height_allstages = vertcat(eBOSC_allsub.IAPF_wake_height_allsub(s,night,ch), eBOSC_allsub.IAPF_rem_height_allsub(s,night,ch), eBOSC_allsub.IAPF_phasic_height_allsub(s,night,ch), eBOSC_allsub.IAPF_tonic_height_allsub(s,night,ch), eBOSC_allsub.IAPF_nrem_height_allsub(s,night,ch));
            ITPF_height_allstages = vertcat(eBOSC_allsub.ITPF_wake_height_allsub(s,night,ch), eBOSC_allsub.ITPF_rem_height_allsub(s,night,ch), eBOSC_allsub.ITPF_phasic_height_allsub(s,night,ch), eBOSC_allsub.ITPF_tonic_height_allsub(s,night,ch), eBOSC_allsub.ITPF_nrem_height_allsub(s,night,ch));
            ISPF_height_allstages = vertcat(eBOSC_allsub.ISPF_wake_height_allsub(s,night,ch), eBOSC_allsub.ISPF_rem_height_allsub(s,night,ch), eBOSC_allsub.ISPF_phasic_height_allsub(s,night,ch), eBOSC_allsub.ISPF_tonic_height_allsub(s,night,ch), eBOSC_allsub.ISPF_nrem_height_allsub(s,night,ch));
            
            alpha_den_allstages = vertcat(eBOSC_allsub.alpha_wake_den_allsub(s,night,ch),eBOSC_allsub.alpha_rem_den_allsub(s,night,ch),eBOSC_allsub.alpha_phasic_den_allsub(s,night,ch),eBOSC_allsub.alpha_tonic_den_allsub(s,night,ch),eBOSC_allsub.alpha_nrem_den_allsub(s,night,ch));
            alpha_abu_allstages = vertcat(eBOSC_allsub.alpha_wake_abu_allsub(s,night,ch),eBOSC_allsub.alpha_rem_abu_allsub(s,night,ch),eBOSC_allsub.alpha_phasic_abu_allsub(s,night,ch),eBOSC_allsub.alpha_tonic_abu_allsub(s,night,ch),eBOSC_allsub.alpha_nrem_abu_allsub(s,night,ch));
            alpha_amp_allstages = vertcat(eBOSC_allsub.alpha_wake_amp_allsub(s,night,ch),eBOSC_allsub.alpha_rem_amp_allsub(s,night,ch),eBOSC_allsub.alpha_phasic_amp_allsub(s,night,ch),eBOSC_allsub.alpha_tonic_amp_allsub(s,night,ch),eBOSC_allsub.alpha_nrem_amp_allsub(s,night,ch));
            alpha_snr_allstages = vertcat(eBOSC_allsub.alpha_wake_snr_allsub(s,night,ch),eBOSC_allsub.alpha_rem_snr_allsub(s,night,ch),eBOSC_allsub.alpha_phasic_snr_allsub(s,night,ch),eBOSC_allsub.alpha_tonic_snr_allsub(s,night,ch),eBOSC_allsub.alpha_nrem_snr_allsub(s,night,ch));
           
            theta_den_allstages = vertcat(eBOSC_allsub.theta_wake_den_allsub(s,night,ch),eBOSC_allsub.theta_rem_den_allsub(s,night,ch),eBOSC_allsub.theta_phasic_den_allsub(s,night,ch),eBOSC_allsub.theta_tonic_den_allsub(s,night,ch),eBOSC_allsub.theta_nrem_den_allsub(s,night,ch));
            theta_abu_allstages = vertcat(eBOSC_allsub.theta_wake_abu_allsub(s,night,ch),eBOSC_allsub.theta_rem_abu_allsub(s,night,ch),eBOSC_allsub.theta_phasic_abu_allsub(s,night,ch),eBOSC_allsub.theta_tonic_abu_allsub(s,night,ch),eBOSC_allsub.theta_nrem_abu_allsub(s,night,ch));
            theta_amp_allstages = vertcat(eBOSC_allsub.theta_wake_amp_allsub(s,night,ch),eBOSC_allsub.theta_rem_amp_allsub(s,night,ch),eBOSC_allsub.theta_phasic_amp_allsub(s,night,ch),eBOSC_allsub.theta_tonic_amp_allsub(s,night,ch),eBOSC_allsub.theta_nrem_amp_allsub(s,night,ch));
            theta_snr_allstages = vertcat(eBOSC_allsub.theta_wake_snr_allsub(s,night,ch),eBOSC_allsub.theta_rem_snr_allsub(s,night,ch),eBOSC_allsub.theta_phasic_snr_allsub(s,night,ch),eBOSC_allsub.theta_tonic_snr_allsub(s,night,ch),eBOSC_allsub.theta_nrem_snr_allsub(s,night,ch));
 
            spindles_den_allstages = vertcat(eBOSC_allsub.spindles_wake_den_allsub(s,night,ch),eBOSC_allsub.spindles_rem_den_allsub(s,night,ch),eBOSC_allsub.spindles_phasic_den_allsub(s,night,ch),eBOSC_allsub.spindles_tonic_den_allsub(s,night,ch),eBOSC_allsub.spindles_nrem_den_allsub(s,night,ch));
            spindles_abu_allstages = vertcat(eBOSC_allsub.spindles_wake_abu_allsub(s,night,ch),eBOSC_allsub.spindles_rem_abu_allsub(s,night,ch),eBOSC_allsub.spindles_phasic_abu_allsub(s,night,ch),eBOSC_allsub.spindles_tonic_abu_allsub(s,night,ch),eBOSC_allsub.spindles_nrem_abu_allsub(s,night,ch));
            spindles_amp_allstages = vertcat(eBOSC_allsub.spindles_wake_amp_allsub(s,night,ch),eBOSC_allsub.spindles_rem_amp_allsub(s,night,ch),eBOSC_allsub.spindles_phasic_amp_allsub(s,night,ch),eBOSC_allsub.spindles_tonic_amp_allsub(s,night,ch),eBOSC_allsub.spindles_nrem_amp_allsub(s,night,ch));
            spindles_snr_allstages = vertcat(eBOSC_allsub.spindles_wake_snr_allsub(s,night,ch),eBOSC_allsub.spindles_rem_snr_allsub(s,night,ch),eBOSC_allsub.spindles_phasic_snr_allsub(s,night,ch),eBOSC_allsub.spindles_tonic_snr_allsub(s,night,ch),eBOSC_allsub.spindles_nrem_snr_allsub(s,night,ch));

            osc_table = table(sub,ni,con,channel,stage,IAPF_allstages,ITPF_allstages,ISPF_allstages,IAPF_height_allstages,ITPF_height_allstages,ISPF_height_allstages,alpha_den_allstages,theta_den_allstages,spindles_den_allstages,alpha_abu_allstages,theta_abu_allstages,spindles_abu_allstages,...
                alpha_amp_allstages,theta_amp_allstages,spindles_amp_allstages,alpha_snr_allstages,theta_snr_allstages,spindles_snr_allstages);
            
            osc_table_all = vertcat(osc_table_all,osc_table);
            
            clear osc_table
            
        end
    end
end

osc_table_all.Properties.VariableNames{2} = 'night';
osc_table_all.Properties.VariableNames{3} = 'condition';
osc_table_all.Properties.VariableNames{6} = 'IAPF';
osc_table_all.Properties.VariableNames{7} = 'ITPF';
osc_table_all.Properties.VariableNames{8} = 'ISPF';
osc_table_all.Properties.VariableNames{9} = 'IAPF_height';
osc_table_all.Properties.VariableNames{10} = 'ITPF_height';
osc_table_all.Properties.VariableNames{11} = 'ISPF_height';
osc_table_all.Properties.VariableNames{12} = 'alpha_density';
osc_table_all.Properties.VariableNames{13} = 'theta_density';
osc_table_all.Properties.VariableNames{14} = 'spindles_density';
osc_table_all.Properties.VariableNames{15} = 'alpha_abundance';
osc_table_all.Properties.VariableNames{16} = 'theta_abundance';
osc_table_all.Properties.VariableNames{17} = 'spindles_abundance';
osc_table_all.Properties.VariableNames{18} = 'alpha_amplitude';
osc_table_all.Properties.VariableNames{19} = 'theta_amplitude';
osc_table_all.Properties.VariableNames{20} = 'spindles_amplitude';
osc_table_all.Properties.VariableNames{21} = 'alpha_snr';
osc_table_all.Properties.VariableNames{22} = 'theta_snr';
osc_table_all.Properties.VariableNames{23} = 'spindles_snr';

writetable(osc_table_all,[Savefolder,filesep,'osc_table_allsub_not_individualized_2_6_12_1s_osc_',date,'.xlsx']);              

clear stage

%%

% aperiodic_table_all = [];
%  
% for s = 1:36
%     
%     for night = 1:18
%         
%         for ch = 1:8
%             
%             sub = repmat({waves_folder_dir(s).name},8,1,1);
%             if night < 10
%                 ni = repmat(night,8,1,1);
%                 con = repmat({'SE'},8,1,1);
%             else
%                 ni = repmat((night-9),8,1,1);
%                 con = repmat({'SR'},8,1,1);
%             end
%             channel = repmat({EEG.chanlocs(ch).labels},8,1,1);
%             stage = {'R';'P';'T';'N';'N1';'N2';'N3';'W'};
%             
%             exponent_1_30_allstages = vertcat(exponent_1_30_rem_allsub(s,night,ch), exponent_1_30_phasic_allsub(s,night,ch), exponent_1_30_tonic_allsub(s,night,ch),...
%                     exponent_1_30_nrem_allsub(s,night,ch), exponent_1_30_n1_allsub(s,night,ch), exponent_1_30_n2_allsub(s,night,ch), ...
%                     exponent_1_30_n3_allsub(s,night,ch), exponent_1_30_wake_allsub(s,night,ch));
%  
%                 
%             exponent_30_45_allstages = vertcat(exponent_30_45_rem_allsub(s,night,ch), exponent_30_45_phasic_allsub(s,night,ch), exponent_30_45_tonic_allsub(s,night,ch),...
%                     exponent_30_45_nrem_allsub(s,night,ch), exponent_30_45_n1_allsub(s,night,ch), exponent_30_45_n2_allsub(s,night,ch), ...
%                     exponent_30_45_n3_allsub(s,night,ch), exponent_30_45_wake_allsub(s,night,ch));
%                 
%             exponent_1_45_allstages = vertcat(exponent_1_45_rem_allsub(s,night,ch), exponent_1_45_phasic_allsub(s,night,ch), exponent_1_45_tonic_allsub(s,night,ch),...
%                     exponent_1_45_nrem_allsub(s,night,ch), exponent_1_45_n1_allsub(s,night,ch), exponent_1_45_n2_allsub(s,night,ch), ...
%                     exponent_1_45_n3_allsub(s,night,ch), exponent_1_45_wake_allsub(s,night,ch));
% 
%                 
%                 
%             offset_1_30_allstages = vertcat(offset_1_30_rem_allsub(s,night,ch), offset_1_30_phasic_allsub(s,night,ch), offset_1_30_tonic_allsub(s,night,ch),...
%                     offset_1_30_nrem_allsub(s,night,ch), offset_1_30_n1_allsub(s,night,ch), offset_1_30_n2_allsub(s,night,ch), ...
%                     offset_1_30_n3_allsub(s,night,ch), offset_1_30_wake_allsub(s,night,ch));
%  
%                 
%             offset_30_45_allstages = vertcat(offset_30_45_rem_allsub(s,night,ch), offset_30_45_phasic_allsub(s,night,ch), offset_30_45_tonic_allsub(s,night,ch),...
%                     offset_30_45_nrem_allsub(s,night,ch), offset_30_45_n1_allsub(s,night,ch), offset_30_45_n2_allsub(s,night,ch), ...
%                     offset_30_45_n3_allsub(s,night,ch), offset_30_45_wake_allsub(s,night,ch));
%    
%                
%             offset_1_45_allstages = vertcat(offset_1_45_rem_allsub(s,night,ch), offset_1_45_phasic_allsub(s,night,ch), offset_1_45_tonic_allsub(s,night,ch),...
%                     offset_1_45_nrem_allsub(s,night,ch), offset_1_45_n1_allsub(s,night,ch), offset_1_45_n2_allsub(s,night,ch), ...
%                     offset_1_45_n3_allsub(s,night,ch), offset_1_45_wake_allsub(s,night,ch));    
%                 
%             aperiodic_table = table(sub,ni,con,channel,stage,exponent_1_30_allstages,exponent_30_45_allstages,exponent_1_45_allstages,offset_1_30_allstages,offset_30_45_allstages,offset_1_45_allstages);
%             
%             aperiodic_table_all = vertcat(aperiodic_table_all,aperiodic_table);
%             
%             clear aperiodic_table
%             
% 
%         end
%     end
% end
% 
% aperiodic_table_all.Properties.VariableNames{2} = 'night';
% aperiodic_table_all.Properties.VariableNames{3} = 'condition';
% aperiodic_table_all.Properties.VariableNames{6} = 'exp_1_30';
% aperiodic_table_all.Properties.VariableNames{7} = 'exp_30_45';
% aperiodic_table_all.Properties.VariableNames{8} = 'exp_1_45';
% aperiodic_table_all.Properties.VariableNames{9} = 'off_1_30';
% aperiodic_table_all.Properties.VariableNames{10} = 'off_30_45';
% aperiodic_table_all.Properties.VariableNames{11} = 'off_1_45';
% 
% 
% writetable(aperiodic_table_all,[Savefolder,filesep,'aperiodic_table_allsub_not_individualized_2_6_12_1s_osc_',date,'.xlsx']);              
% 
% clear stage
% 
