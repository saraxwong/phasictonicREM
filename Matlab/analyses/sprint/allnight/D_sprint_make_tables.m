clear all;
close all;

%%

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*_aICA.set']);

for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

% load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/sprint_allsub_not_individualized_2_6_12_1s_osc_21-Feb-2025.mat');
% load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/sprint_allsub_16-Dec-2025.mat');
% load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/sprint_allsub_28-Jun-2026.mat');
load('/parallel_scratch/nemo/AFdata/sprint_220125/allsub/allsub/sprint_allsub_13-Jul-2026.mat');

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

Savefolder = '/parallel_scratch/nemo/AFdata/Tables';

%%

aperiodic_table_all = [];
 
for s = 1:36
    
    for night = 1:18
        
        for ch = 1:8
            
            sub = repmat({participants_uni{s}},8,1,1);
            if night < 10
                ni = repmat(night,8,1,1);
                con = repmat({'SE'},8,1,1);
            else
                ni = repmat((night-9),8,1,1);
                con = repmat({'SR'},8,1,1);
            end
            channel = repmat({EEG.chanlocs(ch).labels},8,1,1);
            stage = {'R';'P';'T';'N';'N1';'N2';'N3';'W'};
            
            exponent_1_30_allstages = vertcat(sprint_allsub.exponent_1_30_rem_allsub(s,night,ch), sprint_allsub.exponent_1_30_phasic_allsub(s,night,ch), sprint_allsub.exponent_1_30_tonic_allsub(s,night,ch),...
                    sprint_allsub.exponent_1_30_nrem_allsub(s,night,ch), sprint_allsub.exponent_1_30_n1_allsub(s,night,ch), sprint_allsub.exponent_1_30_n2_allsub(s,night,ch), ...
                    sprint_allsub.exponent_1_30_n3_allsub(s,night,ch), sprint_allsub.exponent_1_30_wake_allsub(s,night,ch));
 
                
            exponent_30_45_allstages = vertcat(sprint_allsub.exponent_30_45_rem_allsub(s,night,ch), sprint_allsub.exponent_30_45_phasic_allsub(s,night,ch), sprint_allsub.exponent_30_45_tonic_allsub(s,night,ch),...
                    sprint_allsub.exponent_30_45_nrem_allsub(s,night,ch), sprint_allsub.exponent_30_45_n1_allsub(s,night,ch), sprint_allsub.exponent_30_45_n2_allsub(s,night,ch), ...
                    sprint_allsub.exponent_30_45_n3_allsub(s,night,ch), sprint_allsub.exponent_30_45_wake_allsub(s,night,ch));
                
%             sprint_allsub.exponent_1_45_allstages = vertcat(sprint_allsub.exponent_1_45_rem_allsub(s,night,ch), sprint_allsub.exponent_1_45_phasic_allsub(s,night,ch), sprint_allsub.exponent_1_45_tonic_allsub(s,night,ch),...
%                     sprint_allsub.exponent_1_45_nrem_allsub(s,night,ch), sprint_allsub.exponent_1_45_n1_allsub(s,night,ch), sprint_allsub.exponent_1_45_n2_allsub(s,night,ch), ...
%                     sprint_allsub.exponent_1_45_n3_allsub(s,night,ch), sprint_allsub.exponent_1_45_wake_allsub(s,night,ch));

                
                
            offset_1_30_allstages = vertcat(sprint_allsub.offset_1_30_rem_allsub(s,night,ch), sprint_allsub.offset_1_30_phasic_allsub(s,night,ch), sprint_allsub.offset_1_30_tonic_allsub(s,night,ch),...
                    sprint_allsub.offset_1_30_nrem_allsub(s,night,ch), sprint_allsub.offset_1_30_n1_allsub(s,night,ch), sprint_allsub.offset_1_30_n2_allsub(s,night,ch), ...
                    sprint_allsub.offset_1_30_n3_allsub(s,night,ch), sprint_allsub.offset_1_30_wake_allsub(s,night,ch));
 
                
            offset_30_45_allstages = vertcat(sprint_allsub.offset_30_45_rem_allsub(s,night,ch), sprint_allsub.offset_30_45_phasic_allsub(s,night,ch), sprint_allsub.offset_30_45_tonic_allsub(s,night,ch),...
                    sprint_allsub.offset_30_45_nrem_allsub(s,night,ch), sprint_allsub.offset_30_45_n1_allsub(s,night,ch), sprint_allsub.offset_30_45_n2_allsub(s,night,ch), ...
                    sprint_allsub.offset_30_45_n3_allsub(s,night,ch), sprint_allsub.offset_30_45_wake_allsub(s,night,ch));
   
               
%             offset_1_45_allstages = vertcat(sprint_allsub.offset_1_45_rem_allsub(s,night,ch), sprint_allsub.offset_1_45_phasic_allsub(s,night,ch), sprint_allsub.offset_1_45_tonic_allsub(s,night,ch),...
%                     sprint_allsub.offset_1_45_nrem_allsub(s,night,ch), sprint_allsub.offset_1_45_n1_allsub(s,night,ch), sprint_allsub.offset_1_45_n2_allsub(s,night,ch), ...
%                     sprint_allsub.offset_1_45_n3_allsub(s,night,ch), sprint_allsub.offset_1_45_wake_allsub(s,night,ch));    
                
            
            swa_allstages = vertcat(sprint_allsub.swa_rem_allsub(s,night,ch),sprint_allsub.swa_phasic_allsub(s,night,ch),sprint_allsub.swa_tonic_allsub(s,night,ch),...
                    sprint_allsub.swa_nrem_allsub(s,night,ch),sprint_allsub.swa_n1_allsub(s,night,ch),sprint_allsub.swa_n2_allsub(s,night,ch),sprint_allsub.swa_n3_allsub(s,night,ch),sprint_allsub.swa_wake_allsub(s,night,ch));

            spindle_power_allstages = vertcat(sprint_allsub.spindle_power_rem_allsub(s,night,ch),sprint_allsub.spindle_power_phasic_allsub(s,night,ch),sprint_allsub.spindle_power_tonic_allsub(s,night,ch),...
                    sprint_allsub.spindle_power_nrem_allsub(s,night,ch),sprint_allsub.spindle_power_n1_allsub(s,night,ch),sprint_allsub.spindle_power_n2_allsub(s,night,ch),sprint_allsub.spindle_power_n3_allsub(s,night,ch),sprint_allsub.spindle_power_wake_allsub(s,night,ch));

            aperiodic_table = table(sub,ni,con,channel,stage,exponent_1_30_allstages,exponent_30_45_allstages,offset_1_30_allstages,offset_30_45_allstages,swa_allstages,spindle_power_allstages);
            
            aperiodic_table_all = vertcat(aperiodic_table_all,aperiodic_table);
            
            clear aperiodic_table
            

        end
    end
end

%%
aperiodic_table_all.Properties.VariableNames{2} = 'night';
aperiodic_table_all.Properties.VariableNames{3} = 'condition';
aperiodic_table_all.Properties.VariableNames{6} = 'exp_1_30';
aperiodic_table_all.Properties.VariableNames{7} = 'exp_30_45';
% aperiodic_table_all.Properties.VariableNames{8} = 'exp_1_45';
aperiodic_table_all.Properties.VariableNames{8} = 'off_1_30';
aperiodic_table_all.Properties.VariableNames{9} = 'off_30_45';
% aperiodic_table_all.Properties.VariableNames{11} = 'off_1_45';
aperiodic_table_all.Properties.VariableNames{10} = 'swa';
aperiodic_table_all.Properties.VariableNames{11} = 'spindle_power';

writetable(aperiodic_table_all,[Savefolder,filesep,'aperiodic_table_sprint_allsub_not_individualized_2_6_12_1s_osc_',date,'.xlsx']);              

clear stage

