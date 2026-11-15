clear all;
close all;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));


Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

waves_folder = '/parallel_scratch/nemo/AFdata/sprint_220125/';
waves_folder_dir = dir([waves_folder,'AFOSR*'])

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub/swa_spindles_power/';

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

%%
swa_freq = [1 4];
spindles_freq = [11 16];

f1 = 1:30;
f2 = 30:45;
f3 = 1:45;

swa_ndx = find(f1 >= swa_freq(1) & f1 < swa_freq(2));
spindle_power_ndx = find(f1 >= spindles_freq(1) & f1 < spindles_freq(2));

%%

for s = 21:36

display(['Participant ', num2str(s)])
    
for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);


%%

swa_rem = NaN(18,8);
swa_phasic = NaN(18,8);
swa_tonic = NaN(18,8);
swa_nrem = NaN(18,8);
swa_n1 = NaN(18,8);
swa_n2 = NaN(18,8);
swa_n3 = NaN(18,8);
swa_wake = NaN(18,8);

spindle_power_rem = NaN(18,8);
spindle_power_phasic = NaN(18,8);
spindle_power_tonic = NaN(18,8);
spindle_power_nrem = NaN(18,8);
spindle_power_n1 = NaN(18,8);
spindle_power_n2 = NaN(18,8);
spindle_power_n3 = NaN(18,8);
spindle_power_wake = NaN(18,8);

%%

    files = dir([waves_folder, participants_uni{s},'*']);
    
    for file = 1:length(files)
           
        display(['File ', num2str(file)])
      
        %%
        filename = files(file).name;
        night = find_night(filename);
        
        load([waves_folder, filesep,files(file).name]);

        clear phato_30
        
        load([goodREM_folder,files(file).name(1:18),'_goodREM.mat']);
        
        if length(hypno3) > size(exponent_1_30_allep,1)
           hypno3 = hypno3(1:size(exponent_1_30_allep,1));   
        end
        
        rem_epochs = find(hypno3 == 'R');
        nrem_epochs = find(hypno3 == '2'| hypno3 == '3' | hypno3 == '4');
        n1_epochs = find(hypno3 == '1');
        n2_epochs = find(hypno3 == '2');
        n3_epochs = find(hypno3 == '3' | hypno3 == '4');
        wake_epochs = find(hypno3 == 'W');
        
        
        epochl = 1;
        n_phasic_thresh = 1;
        phato = calculate_phato(phasic_ep, tonic_ep, art_ep, epochl, n_phasic_thresh); 
        
        phasic_epochs = find(string(phato) == 'P');
        tonic_epochs = find(string(phato) == 'T');
        art_epochs = find(string(phato) == 'A');

        
        epochs_art_good = find(nrem_art_ep3 == 0);
        nrem_epochs_art_goodndx = intersect(nrem_epochs,epochs_art_good);
        n1_epochs_art_goodndx = intersect(n1_epochs,epochs_art_good);
        n2_epochs_art_goodndx = intersect(n2_epochs,epochs_art_good);
        n3_epochs_art_goodndx = intersect(n3_epochs,epochs_art_good);
        
        for ch = 1:8

            swa_rem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(rem_epochs,ch,swa_ndx),3),1);
            swa_phasic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(phasic_epochs,ch,swa_ndx),3),1);
            swa_tonic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(tonic_epochs,ch,swa_ndx),3),1);
            swa_nrem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(nrem_epochs_art_goodndx,ch,swa_ndx),3),1);
            swa_n1(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n1_epochs_art_goodndx,ch,swa_ndx),3),1);
            swa_n2(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n2_epochs_art_goodndx,ch,swa_ndx),3),1);
            swa_n3(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n3_epochs_art_goodndx,ch,swa_ndx),3),1);
            swa_wake(night,ch) = nanmean(sum(power_spectrum_1_30_allep(wake_epochs,ch,swa_ndx),3),1);
            
            
            spindle_power_rem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(rem_epochs,ch,spindle_power_ndx),3),1);
            spindle_power_phasic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(phasic_epochs,ch,spindle_power_ndx),3),1);
            spindle_power_tonic(night,ch) = nanmean(sum(power_spectrum_1_30_allep(tonic_epochs,ch,spindle_power_ndx),3),1);
            spindle_power_nrem(night,ch) = nanmean(sum(power_spectrum_1_30_allep(nrem_epochs_art_goodndx,ch,spindle_power_ndx),3),1);
            spindle_power_n1(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n1_epochs_art_goodndx,ch,spindle_power_ndx),3),1);
            spindle_power_n2(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n2_epochs_art_goodndx,ch,spindle_power_ndx),3),1);
            spindle_power_n3(night,ch) = nanmean(sum(power_spectrum_1_30_allep(n3_epochs_art_goodndx,ch,spindle_power_ndx),3),1);
            spindle_power_wake(night,ch) = nanmean(sum(power_spectrum_1_30_allep(wake_epochs,ch,spindle_power_ndx),3),1);
          
            
        end
     
        %%    
       
       
    end
    
    
    save([Savefolder, filename(1:12),'_sprint_swa_spindles_allnights.mat'],'swa*','spindle*')
    
    clear files filename night hypno3 rem_epochs nrem_epochs phasic_epochs tonic_epochs n1_epochs n2_epochs n3_epochs wake_epochs

    clear epochs_art_good nrem_epochs_art_goodndx n1_epochs_art_goodndx n2_epochs_art_goodndx n3_epochs_art_goodndx power_spectrum*
    
end
