function B_sprint_allsub(s)

try

% clear all;
% close all;

addpath(genpath('/users/nemo/software/eeglab'));
addpath(genpath('/users/nemo/software/eBOSC'));
addpath(genpath('/users/nemo/projects/Airforce'));
addpath(genpath('/users/nemo/software/Henry/useful_functions'));

Folderpath = '/parallel_scratch/nemo/AFdata/aICA/'; 
aICA_file = dir([Folderpath,'*aICA.set']);

goodREM_folder = '/parallel_scratch/nemo/AFdata/goodREM2/';

waves_folder = '/parallel_scratch/nemo/AFdata/sprint_220125/';
waves_folder_dir = dir([waves_folder,'AFOSR*'])


for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub/';

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

%%
exponent_1_30_rem = NaN(18,8);
exponent_1_30_phasic = NaN(18,8);
exponent_1_30_tonic = NaN(18,8);
exponent_1_30_nrem = NaN(18,8);
exponent_1_30_n1 = NaN(18,8);
exponent_1_30_n2 = NaN(18,8);
exponent_1_30_n3 = NaN(18,8);
exponent_1_30_wake = NaN(18,8);

exponent_30_45_rem = NaN(18,8);
exponent_30_45_phasic = NaN(18,8);
exponent_30_45_tonic = NaN(18,8);
exponent_30_45_nrem = NaN(18,8);
exponent_30_45_n1 = NaN(18,8);
exponent_30_45_n2 = NaN(18,8);
exponent_30_45_n3 = NaN(18,8);
exponent_30_45_wake = NaN(18,8);

exponent_1_45_rem = NaN(18,8);
exponent_1_45_phasic = NaN(18,8);
exponent_1_45_tonic = NaN(18,8);
exponent_1_45_nrem = NaN(18,8);
exponent_1_45_n1 = NaN(18,8);
exponent_1_45_n2 = NaN(18,8);
exponent_1_45_n3 = NaN(18,8);
exponent_1_45_wake = NaN(18,8);


offset_1_30_rem = NaN(18,8);
offset_1_30_phasic = NaN(18,8);
offset_1_30_tonic = NaN(18,8);
offset_1_30_nrem = NaN(18,8);
offset_1_30_n1 = NaN(18,8);
offset_1_30_n2 = NaN(18,8);
offset_1_30_n3 = NaN(18,8);
offset_1_30_wake = NaN(18,8);

offset_30_45_rem = NaN(18,8);
offset_30_45_phasic = NaN(18,8);
offset_30_45_tonic = NaN(18,8);
offset_30_45_nrem = NaN(18,8);
offset_30_45_n1 = NaN(18,8);
offset_30_45_n2 = NaN(18,8);
offset_30_45_n3 = NaN(18,8);
offset_30_45_wake = NaN(18,8);

offset_1_45_rem = NaN(18,8);
offset_1_45_phasic = NaN(18,8);
offset_1_45_tonic = NaN(18,8);
offset_1_45_nrem = NaN(18,8);
offset_1_45_n1 = NaN(18,8);
offset_1_45_n2 = NaN(18,8);
offset_1_45_n3 = NaN(18,8);
offset_1_45_wake = NaN(18,8);


power_spectrum_1_30_rem = NaN(18,8,30);
power_spectrum_1_30_phasic = NaN(18,8,30);
power_spectrum_1_30_tonic = NaN(18,8,30);
power_spectrum_1_30_nrem = NaN(18,8,30);
power_spectrum_1_30_n1 = NaN(18,8,30);
power_spectrum_1_30_n2 = NaN(18,8,30);
power_spectrum_1_30_n3 = NaN(18,8,30);
power_spectrum_1_30_wake = NaN(18,8,30);

power_spectrum_30_45_rem = NaN(18,8,16);
power_spectrum_30_45_phasic = NaN(18,8,16);
power_spectrum_30_45_tonic = NaN(18,8,16);
power_spectrum_30_45_nrem = NaN(18,8,16);
power_spectrum_30_45_n1 = NaN(18,8,16);
power_spectrum_30_45_n2 = NaN(18,8,16);
power_spectrum_30_45_n3 = NaN(18,8,16);
power_spectrum_30_45_wake = NaN(18,8,16);

power_spectrum_1_45_rem = NaN(18,8,45);
power_spectrum_1_45_phasic = NaN(18,8,45);
power_spectrum_1_45_tonic = NaN(18,8,45);
power_spectrum_1_45_nrem = NaN(18,8,45);
power_spectrum_1_45_n1 = NaN(18,8,45);
power_spectrum_1_45_n2 = NaN(18,8,45);
power_spectrum_1_45_n3 = NaN(18,8,45);
power_spectrum_1_45_wake = NaN(18,8,45);


ap_fit_1_30_rem = NaN(18,8,30);
ap_fit_1_30_phasic = NaN(18,8,30);
ap_fit_1_30_tonic = NaN(18,8,30);
ap_fit_1_30_nrem = NaN(18,8,30);
ap_fit_1_30_n1 = NaN(18,8,30);
ap_fit_1_30_n2 = NaN(18,8,30);
ap_fit_1_30_n3 = NaN(18,8,30);
ap_fit_1_30_wake = NaN(18,8,30);

ap_fit_30_45_rem = NaN(18,8,16);
ap_fit_30_45_phasic = NaN(18,8,16);
ap_fit_30_45_tonic = NaN(18,8,16);
ap_fit_30_45_nrem = NaN(18,8,16);
ap_fit_30_45_n1 = NaN(18,8,16);
ap_fit_30_45_n2 = NaN(18,8,16);
ap_fit_30_45_n3 = NaN(18,8,16);
ap_fit_30_45_wake = NaN(18,8,16);

ap_fit_1_45_rem = NaN(18,8,45);
ap_fit_1_45_phasic = NaN(18,8,45);
ap_fit_1_45_tonic = NaN(18,8,45);
ap_fit_1_45_nrem = NaN(18,8,45);
ap_fit_1_45_n1 = NaN(18,8,45);
ap_fit_1_45_n2 = NaN(18,8,45);
ap_fit_1_45_n3 = NaN(18,8,45);
ap_fit_1_45_wake = NaN(18,8,45);


peak_fit_1_30_rem = NaN(18,8,30);
peak_fit_1_30_phasic = NaN(18,8,30);
peak_fit_1_30_tonic = NaN(18,8,30);
peak_fit_1_30_nrem = NaN(18,8,30);
peak_fit_1_30_n1 = NaN(18,8,30);
peak_fit_1_30_n2 = NaN(18,8,30);
peak_fit_1_30_n3 = NaN(18,8,30);
peak_fit_1_30_wake = NaN(18,8,30);

peak_fit_30_45_rem = NaN(18,8,16);
peak_fit_30_45_phasic = NaN(18,8,16);
peak_fit_30_45_tonic = NaN(18,8,16);
peak_fit_30_45_nrem = NaN(18,8,16);
peak_fit_30_45_n1 = NaN(18,8,16);
peak_fit_30_45_n2 = NaN(18,8,16);
peak_fit_30_45_n3 = NaN(18,8,16);
peak_fit_30_45_wake = NaN(18,8,16);

peak_fit_1_45_rem = NaN(18,8,45);
peak_fit_1_45_phasic = NaN(18,8,45);
peak_fit_1_45_tonic = NaN(18,8,45);
peak_fit_1_45_nrem = NaN(18,8,45);
peak_fit_1_45_n1 = NaN(18,8,45);
peak_fit_1_45_n2 = NaN(18,8,45);
peak_fit_1_45_n3 = NaN(18,8,45);
peak_fit_1_45_wake = NaN(18,8,45);



foofed_spectrum_1_30_rem = NaN(18,8,30);
foofed_spectrum_1_30_phasic = NaN(18,8,30);
foofed_spectrum_1_30_tonic = NaN(18,8,30);
foofed_spectrum_1_30_nrem = NaN(18,8,30);
foofed_spectrum_1_30_n1 = NaN(18,8,30);
foofed_spectrum_1_30_n2 = NaN(18,8,30);
foofed_spectrum_1_30_n3 = NaN(18,8,30);
foofed_spectrum_1_30_wake = NaN(18,8,30);

foofed_spectrum_30_45_rem = NaN(18,8,16);
foofed_spectrum_30_45_phasic = NaN(18,8,16);
foofed_spectrum_30_45_tonic = NaN(18,8,16);
foofed_spectrum_30_45_nrem = NaN(18,8,16);
foofed_spectrum_30_45_n1 = NaN(18,8,16);
foofed_spectrum_30_45_n2 = NaN(18,8,16);
foofed_spectrum_30_45_n3 = NaN(18,8,16);
foofed_spectrum_30_45_wake = NaN(18,8,16);

foofed_spectrum_1_45_rem = NaN(18,8,45);
foofed_spectrum_1_45_phasic = NaN(18,8,45);
foofed_spectrum_1_45_tonic = NaN(18,8,45);
foofed_spectrum_1_45_nrem = NaN(18,8,45);
foofed_spectrum_1_45_n1 = NaN(18,8,45);
foofed_spectrum_1_45_n2 = NaN(18,8,45);
foofed_spectrum_1_45_n3 = NaN(18,8,45);
foofed_spectrum_1_45_wake = NaN(18,8,45);



log_power_spectrum_1_30_rem = NaN(18,8,30);
log_power_spectrum_1_30_phasic = NaN(18,8,30);
log_power_spectrum_1_30_tonic = NaN(18,8,30);
log_power_spectrum_1_30_nrem = NaN(18,8,30);
log_power_spectrum_1_30_n1 = NaN(18,8,30);
log_power_spectrum_1_30_n2 = NaN(18,8,30);
log_power_spectrum_1_30_n3 = NaN(18,8,30);
log_power_spectrum_1_30_wake = NaN(18,8,30);

log_power_spectrum_30_45_rem = NaN(18,8,16);
log_power_spectrum_30_45_phasic = NaN(18,8,16);
log_power_spectrum_30_45_tonic = NaN(18,8,16);
log_power_spectrum_30_45_nrem = NaN(18,8,16);
log_power_spectrum_30_45_n1 = NaN(18,8,16);
log_power_spectrum_30_45_n2 = NaN(18,8,16);
log_power_spectrum_30_45_n3 = NaN(18,8,16);
log_power_spectrum_30_45_wake = NaN(18,8,16);

log_power_spectrum_1_45_rem = NaN(18,8,45);
log_power_spectrum_1_45_phasic = NaN(18,8,45);
log_power_spectrum_1_45_tonic = NaN(18,8,45);
log_power_spectrum_1_45_nrem = NaN(18,8,45);
log_power_spectrum_1_45_n1 = NaN(18,8,45);
log_power_spectrum_1_45_n2 = NaN(18,8,45);
log_power_spectrum_1_45_n3 = NaN(18,8,45);
log_power_spectrum_1_45_wake = NaN(18,8,45);



log_ap_fit_1_30_rem = NaN(18,8,30);
log_ap_fit_1_30_phasic = NaN(18,8,30);
log_ap_fit_1_30_tonic = NaN(18,8,30);
log_ap_fit_1_30_nrem = NaN(18,8,30);
log_ap_fit_1_30_n1 = NaN(18,8,30);
log_ap_fit_1_30_n2 = NaN(18,8,30);
log_ap_fit_1_30_n3 = NaN(18,8,30);
log_ap_fit_1_30_wake = NaN(18,8,30);

log_ap_fit_30_45_rem = NaN(18,8,16);
log_ap_fit_30_45_phasic = NaN(18,8,16);
log_ap_fit_30_45_tonic = NaN(18,8,16);
log_ap_fit_30_45_nrem = NaN(18,8,16);
log_ap_fit_30_45_n1 = NaN(18,8,16);
log_ap_fit_30_45_n2 = NaN(18,8,16);
log_ap_fit_30_45_n3 = NaN(18,8,16);
log_ap_fit_30_45_wake = NaN(18,8,16);

log_ap_fit_1_45_rem = NaN(18,8,45);
log_ap_fit_1_45_phasic = NaN(18,8,45);
log_ap_fit_1_45_tonic = NaN(18,8,45);
log_ap_fit_1_45_nrem = NaN(18,8,45);
log_ap_fit_1_45_n1 = NaN(18,8,45);
log_ap_fit_1_45_n2 = NaN(18,8,45);
log_ap_fit_1_45_n3 = NaN(18,8,45);
log_ap_fit_1_45_wake = NaN(18,8,45);



log_peak_fit_1_30_rem = NaN(18,8,30);
log_peak_fit_1_30_phasic = NaN(18,8,30);
log_peak_fit_1_30_tonic = NaN(18,8,30);
log_peak_fit_1_30_nrem = NaN(18,8,30);
log_peak_fit_1_30_n1 = NaN(18,8,30);
log_peak_fit_1_30_n2 = NaN(18,8,30);
log_peak_fit_1_30_n3 = NaN(18,8,30);
log_peak_fit_1_30_wake = NaN(18,8,30);

log_peak_fit_30_45_rem = NaN(18,8,16);
log_peak_fit_30_45_phasic = NaN(18,8,16);
log_peak_fit_30_45_tonic = NaN(18,8,16);
log_peak_fit_30_45_nrem = NaN(18,8,16);
log_peak_fit_30_45_n1 = NaN(18,8,16);
log_peak_fit_30_45_n2 = NaN(18,8,16);
log_peak_fit_30_45_n3 = NaN(18,8,16);
log_peak_fit_30_45_wake = NaN(18,8,16);

log_peak_fit_1_45_rem = NaN(18,8,45);
log_peak_fit_1_45_phasic = NaN(18,8,45);
log_peak_fit_1_45_tonic = NaN(18,8,45);
log_peak_fit_1_45_nrem = NaN(18,8,45);
log_peak_fit_1_45_n1 = NaN(18,8,45);
log_peak_fit_1_45_n2 = NaN(18,8,45);
log_peak_fit_1_45_n3 = NaN(18,8,45);
log_peak_fit_1_45_wake = NaN(18,8,45);



log_foofed_spectrum_1_30_rem = NaN(18,8,30);
log_foofed_spectrum_1_30_phasic = NaN(18,8,30);
log_foofed_spectrum_1_30_tonic = NaN(18,8,30);
log_foofed_spectrum_1_30_nrem = NaN(18,8,30);
log_foofed_spectrum_1_30_n1 = NaN(18,8,30);
log_foofed_spectrum_1_30_n2 = NaN(18,8,30);
log_foofed_spectrum_1_30_n3 = NaN(18,8,30);
log_foofed_spectrum_1_30_wake = NaN(18,8,30);

log_foofed_spectrum_30_45_rem = NaN(18,8,16);
log_foofed_spectrum_30_45_phasic = NaN(18,8,16);
log_foofed_spectrum_30_45_tonic = NaN(18,8,16);
log_foofed_spectrum_30_45_nrem = NaN(18,8,16);
log_foofed_spectrum_30_45_n1 = NaN(18,8,16);
log_foofed_spectrum_30_45_n2 = NaN(18,8,16);
log_foofed_spectrum_30_45_n3 = NaN(18,8,16);
log_foofed_spectrum_30_45_wake = NaN(18,8,16);

log_foofed_spectrum_1_45_rem = NaN(18,8,45);
log_foofed_spectrum_1_45_phasic = NaN(18,8,45);
log_foofed_spectrum_1_45_tonic = NaN(18,8,45);
log_foofed_spectrum_1_45_nrem = NaN(18,8,45);
log_foofed_spectrum_1_45_n1 = NaN(18,8,45);
log_foofed_spectrum_1_45_n2 = NaN(18,8,45);
log_foofed_spectrum_1_45_n3 = NaN(18,8,45);
log_foofed_spectrum_1_45_wake = NaN(18,8,45);

%%

% for s = 1:36 %length(waves_folder_dir)   
    
%     display(['sub = ',num2str(s)]); 

    files = dir([waves_folder, participants_uni{s},'*']);
    
    
    for file = 1:length(files)
        
       display(['file = ',num2str(file)]); 
        
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
         
        for ch = 1:8
 
            
         %% remove outliers
            
%         histogram(exponent_1_30_allep)
%         hold on 
        outlier_matrix_1_30 = exponent_1_30_allep < 0.2;
%         outlier_matrix_1_30 = r_squared_1_30_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_1_30_allep(outlier_matrix_1_30) = NaN;
        offset_1_30_allep(outlier_matrix_1_30) = NaN;
        for b = 1:size(foofed_spectrum_1_30_allep,3)
            foofed_spectrum_1_30_allep_bin = squeeze(foofed_spectrum_1_30_allep(:,:,b));
            foofed_spectrum_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            foofed_spectrum_1_30_allep(:,:,b) = foofed_spectrum_1_30_allep_bin;
            ap_fit_1_30_allep_bin = squeeze(ap_fit_1_30_allep(:,:,b));
            ap_fit_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            ap_fit_1_30_allep(:,:,b) = ap_fit_1_30_allep_bin;
            peak_fit_1_30_allep_bin = squeeze(peak_fit_1_30_allep(:,:,b));
            peak_fit_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            peak_fit_1_30_allep(:,:,b) = peak_fit_1_30_allep_bin;
            power_spectrum_1_30_allep_bin = squeeze(power_spectrum_1_30_allep(:,:,b));
            power_spectrum_1_30_allep_bin(outlier_matrix_1_30) = NaN;
            power_spectrum_1_30_allep(:,:,b) = power_spectrum_1_30_allep_bin;
        end      
%         clear outlier_matrix_1_30
%         histogram(exponent_1_30_allep)
 
%         histogram(exponent_30_45_allep)
%         hold on
        outlier_matrix_30_45 = exponent_30_45_allep < 0.2;
%         outlier_matrix_30_45 = r_squared_30_45_allep < 0.01;
%          sum_outliers = sum(outlier_matrix,1)
        exponent_30_45_allep(outlier_matrix_30_45) = NaN;
        offset_30_45_allep(outlier_matrix_30_45) = NaN;
         for b = 1:size(foofed_spectrum_30_45_allep,3)
            foofed_spectrum_30_45_allep_bin = squeeze(foofed_spectrum_30_45_allep(:,:,b));
            foofed_spectrum_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            foofed_spectrum_30_45_allep(:,:,b) = foofed_spectrum_30_45_allep_bin;
            ap_fit_30_45_allep_bin = squeeze(ap_fit_30_45_allep(:,:,b));
            ap_fit_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            ap_fit_30_45_allep(:,:,b) = ap_fit_30_45_allep_bin;
            peak_fit_30_45_allep_bin = squeeze(peak_fit_30_45_allep(:,:,b));
            peak_fit_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            peak_fit_30_45_allep(:,:,b) = peak_fit_30_45_allep_bin;
            power_spectrum_30_45_allep_bin = squeeze(power_spectrum_30_45_allep(:,:,b));
            power_spectrum_30_45_allep_bin(outlier_matrix_30_45) = NaN;
            power_spectrum_30_45_allep(:,:,b) = power_spectrum_30_45_allep_bin;
         end
%         clear outlier_matrix_30_45
%         histogram(exponent_30_45_allep)

%         histogram(exponent_1_45_allep)
%         hold on
%          outlier_matrix_1_45 = exponent_1_45_allep < 0.2;
        outlier_matrix_1_45 = logical(outlier_matrix_1_30 + outlier_matrix_30_45); %exponent_1_45_allep < 0.2;
%         outlier_matrix_1_45 = r_squared_1_45_allep < 0.01;
        %  sum_outliers = sum(outlier_matrix,1)
        exponent_1_45_allep(outlier_matrix_1_45) = NaN;
        offset_1_45_allep(outlier_matrix_1_45) = NaN;
         for b = 1:size(foofed_spectrum_1_45_allep,3)
            foofed_spectrum_1_45_allep_bin = squeeze(foofed_spectrum_1_45_allep(:,:,b));
            foofed_spectrum_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            foofed_spectrum_1_45_allep(:,:,b) = foofed_spectrum_1_45_allep_bin;
            ap_fit_1_45_allep_bin = squeeze(ap_fit_1_45_allep(:,:,b));
            ap_fit_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            ap_fit_1_45_allep(:,:,b) = ap_fit_1_45_allep_bin;
            peak_fit_1_45_allep_bin = squeeze(peak_fit_1_45_allep(:,:,b));
            peak_fit_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            peak_fit_1_45_allep(:,:,b) = peak_fit_1_45_allep_bin;
            power_spectrum_1_45_allep_bin = squeeze(power_spectrum_1_45_allep(:,:,b));
            power_spectrum_1_45_allep_bin(outlier_matrix_1_45) = NaN;
            power_spectrum_1_45_allep(:,:,b) = power_spectrum_1_45_allep_bin;
         end
        clear outlier_matrix_1_30 outlier_matrix_30_45 outlier_matrix_1_45
        
        %%
        
%         clear outlier_matrix_1_45
%         histogram(exponent_1_45_allep)
        
        
        exponent_1_30_rem(night,ch) = nanmean(exponent_1_30_allep(rem_epochs,ch),1);
        exponent_1_30_phasic(night,ch) = nanmean(exponent_1_30_allep(phasic_epochs,ch),1);
        exponent_1_30_tonic(night,ch) = nanmean(exponent_1_30_allep(tonic_epochs,ch),1);
        exponent_1_30_nrem(night,ch) = nanmean(exponent_1_30_allep(nrem_epochs,ch),1);
        exponent_1_30_n1(night,ch) = nanmean(exponent_1_30_allep(n1_epochs,ch),1);
        exponent_1_30_n2(night,ch) = nanmean(exponent_1_30_allep(n2_epochs,ch),1);
        exponent_1_30_n3(night,ch) = nanmean(exponent_1_30_allep(n3_epochs,ch),1);
        exponent_1_30_wake(night,ch) = nanmean(exponent_1_30_allep(wake_epochs,ch),1);
      
        exponent_30_45_rem(night,ch) = nanmean(exponent_30_45_allep(rem_epochs,ch),1);
        exponent_30_45_phasic(night,ch) = nanmean(exponent_30_45_allep(phasic_epochs,ch),1);
        exponent_30_45_tonic(night,ch) = nanmean(exponent_30_45_allep(tonic_epochs,ch),1);
        exponent_30_45_nrem(night,ch) = nanmean(exponent_30_45_allep(nrem_epochs,ch),1);
        exponent_30_45_n1(night,ch) = nanmean(exponent_30_45_allep(n1_epochs,ch),1);
        exponent_30_45_n2(night,ch) = nanmean(exponent_30_45_allep(n2_epochs,ch),1);
        exponent_30_45_n3(night,ch) = nanmean(exponent_30_45_allep(n3_epochs,ch),1);
        exponent_30_45_wake(night,ch) = nanmean(exponent_30_45_allep(wake_epochs,ch),1);
        
        exponent_1_45_rem(night,ch) = nanmean(exponent_1_45_allep(rem_epochs,ch),1);
        exponent_1_45_phasic(night,ch) = nanmean(exponent_1_45_allep(phasic_epochs,ch),1);
        exponent_1_45_tonic(night,ch) = nanmean(exponent_1_45_allep(tonic_epochs,ch),1);
        exponent_1_45_nrem(night,ch) = nanmean(exponent_1_45_allep(nrem_epochs,ch),1);
        exponent_1_45_n1(night,ch) = nanmean(exponent_1_45_allep(n1_epochs,ch),1);
        exponent_1_45_n2(night,ch) = nanmean(exponent_1_45_allep(n2_epochs,ch),1);
        exponent_1_45_n3(night,ch) = nanmean(exponent_1_45_allep(n3_epochs,ch),1);
        exponent_1_45_wake(night,ch) = nanmean(exponent_1_45_allep(wake_epochs,ch),1);
        

        
                
        offset_1_30_rem(night,ch) = nanmean(offset_1_30_allep(rem_epochs,ch),1);
        offset_1_30_phasic(night,ch) = nanmean(offset_1_30_allep(phasic_epochs,ch),1);
        offset_1_30_tonic(night,ch) = nanmean(offset_1_30_allep(tonic_epochs,ch),1);
        offset_1_30_nrem(night,ch) = nanmean(offset_1_30_allep(nrem_epochs,ch),1);
        offset_1_30_n1(night,ch) = nanmean(offset_1_30_allep(n1_epochs,ch),1);
        offset_1_30_n2(night,ch) = nanmean(offset_1_30_allep(n2_epochs,ch),1);
        offset_1_30_n3(night,ch) = nanmean(offset_1_30_allep(n3_epochs,ch),1);
        offset_1_30_wake(night,ch) = nanmean(offset_1_30_allep(wake_epochs,ch),1);
      
        offset_30_45_rem(night,ch) = nanmean(offset_30_45_allep(rem_epochs,ch),1);
        offset_30_45_phasic(night,ch) = nanmean(offset_30_45_allep(phasic_epochs,ch),1);
        offset_30_45_tonic(night,ch) = nanmean(offset_30_45_allep(tonic_epochs,ch),1);
        offset_30_45_nrem(night,ch) = nanmean(offset_30_45_allep(nrem_epochs,ch),1);
        offset_30_45_n1(night,ch) = nanmean(offset_30_45_allep(n1_epochs,ch),1);
        offset_30_45_n2(night,ch) = nanmean(offset_30_45_allep(n2_epochs,ch),1);
        offset_30_45_n3(night,ch) = nanmean(offset_30_45_allep(n3_epochs,ch),1);
        offset_30_45_wake(night,ch) = nanmean(offset_30_45_allep(wake_epochs,ch),1);
        
        offset_1_45_rem(night,ch) = nanmean(offset_1_45_allep(rem_epochs,ch),1);
        offset_1_45_phasic(night,ch) = nanmean(offset_1_45_allep(phasic_epochs,ch),1);
        offset_1_45_tonic(night,ch) = nanmean(offset_1_45_allep(tonic_epochs,ch),1);
        offset_1_45_nrem(night,ch) = nanmean(offset_1_45_allep(nrem_epochs,ch),1);
        offset_1_45_n1(night,ch) = nanmean(offset_1_45_allep(n1_epochs,ch),1);
        offset_1_45_n2(night,ch) = nanmean(offset_1_45_allep(n2_epochs,ch),1);
        offset_1_45_n3(night,ch) = nanmean(offset_1_45_allep(n3_epochs,ch),1);
        offset_1_45_wake(night,ch) = nanmean(offset_1_45_allep(wake_epochs,ch),1);
       

        
        power_spectrum_1_30_rem(night,ch,:) = nanmean(power_spectrum_1_30_allep(rem_epochs,ch,:),1);
        power_spectrum_1_30_phasic(night,ch,:) = nanmean(power_spectrum_1_30_allep(phasic_epochs,ch,:),1);
        power_spectrum_1_30_tonic(night,ch,:) = nanmean(power_spectrum_1_30_allep(tonic_epochs,ch,:),1);
        power_spectrum_1_30_nrem(night,ch,:) = nanmean(power_spectrum_1_30_allep(nrem_epochs,ch,:),1);
        power_spectrum_1_30_n1(night,ch,:) = nanmean(power_spectrum_1_30_allep(n1_epochs,ch,:),1);
        power_spectrum_1_30_n2(night,ch,:) = nanmean(power_spectrum_1_30_allep(n2_epochs,ch,:),1);
        power_spectrum_1_30_n3(night,ch,:) = nanmean(power_spectrum_1_30_allep(n3_epochs,ch,:),1);
        power_spectrum_1_30_wake(night,ch,:) = nanmean(power_spectrum_1_30_allep(wake_epochs,ch,:),1);


        power_spectrum_30_45_rem(night,ch,:) = nanmean(power_spectrum_30_45_allep(rem_epochs,ch,:),1);
        power_spectrum_30_45_phasic(night,ch,:) = nanmean(power_spectrum_30_45_allep(phasic_epochs,ch,:),1);
        power_spectrum_30_45_tonic(night,ch,:) = nanmean(power_spectrum_30_45_allep(tonic_epochs,ch,:),1);
        power_spectrum_30_45_nrem(night,ch,:) = nanmean(power_spectrum_30_45_allep(nrem_epochs,ch,:),1);
        power_spectrum_30_45_n1(night,ch,:) = nanmean(power_spectrum_30_45_allep(n1_epochs,ch,:),1);
        power_spectrum_30_45_n2(night,ch,:) = nanmean(power_spectrum_30_45_allep(n2_epochs,ch,:),1);
        power_spectrum_30_45_n3(night,ch,:) = nanmean(power_spectrum_30_45_allep(n3_epochs,ch,:),1);
        power_spectrum_30_45_wake(night,ch,:) = nanmean(power_spectrum_30_45_allep(wake_epochs,ch,:),1);


        power_spectrum_1_45_rem(night,ch,:) = nanmean(power_spectrum_1_45_allep(rem_epochs,ch,:),1);
        power_spectrum_1_45_phasic(night,ch,:) = nanmean(power_spectrum_1_45_allep(phasic_epochs,ch,:),1);
        power_spectrum_1_45_tonic(night,ch,:) = nanmean(power_spectrum_1_45_allep(tonic_epochs,ch,:),1);
        power_spectrum_1_45_nrem(night,ch,:) = nanmean(power_spectrum_1_45_allep(nrem_epochs,ch,:),1);
        power_spectrum_1_45_n1(night,ch,:) = nanmean(power_spectrum_1_45_allep(n1_epochs,ch,:),1);
        power_spectrum_1_45_n2(night,ch,:) = nanmean(power_spectrum_1_45_allep(n2_epochs,ch,:),1);
        power_spectrum_1_45_n3(night,ch,:) = nanmean(power_spectrum_1_45_allep(n3_epochs,ch,:),1);
        power_spectrum_1_45_wake(night,ch,:) = nanmean(power_spectrum_1_45_allep(wake_epochs,ch,:),1);



        
        ap_fit_1_30_rem(night,ch,:) = nanmean(ap_fit_1_30_allep(rem_epochs,ch,:),1);
        ap_fit_1_30_phasic(night,ch,:) = nanmean(ap_fit_1_30_allep(phasic_epochs,ch,:),1);
        ap_fit_1_30_tonic(night,ch,:) = nanmean(ap_fit_1_30_allep(tonic_epochs,ch,:),1);
        ap_fit_1_30_nrem(night,ch,:) = nanmean(ap_fit_1_30_allep(nrem_epochs,ch,:),1);
        ap_fit_1_30_n1(night,ch,:) = nanmean(ap_fit_1_30_allep(n1_epochs,ch,:),1);
        ap_fit_1_30_n2(night,ch,:) = nanmean(ap_fit_1_30_allep(n2_epochs,ch,:),1);
        ap_fit_1_30_n3(night,ch,:) = nanmean(ap_fit_1_30_allep(n3_epochs,ch,:),1);
        ap_fit_1_30_wake(night,ch,:) = nanmean(ap_fit_1_30_allep(wake_epochs,ch,:),1);


        ap_fit_30_45_rem(night,ch,:) = nanmean(ap_fit_30_45_allep(rem_epochs,ch,:),1);
        ap_fit_30_45_phasic(night,ch,:) = nanmean(ap_fit_30_45_allep(phasic_epochs,ch,:),1);
        ap_fit_30_45_tonic(night,ch,:) = nanmean(ap_fit_30_45_allep(tonic_epochs,ch,:),1);
        ap_fit_30_45_nrem(night,ch,:) = nanmean(ap_fit_30_45_allep(nrem_epochs,ch,:),1);
        ap_fit_30_45_n1(night,ch,:) = nanmean(ap_fit_30_45_allep(n1_epochs,ch,:),1);
        ap_fit_30_45_n2(night,ch,:) = nanmean(ap_fit_30_45_allep(n2_epochs,ch,:),1);
        ap_fit_30_45_n3(night,ch,:) = nanmean(ap_fit_30_45_allep(n3_epochs,ch,:),1);
        ap_fit_30_45_wake(night,ch,:) = nanmean(ap_fit_30_45_allep(wake_epochs,ch,:),1);


        ap_fit_1_45_rem(night,ch,:) = nanmean(ap_fit_1_45_allep(rem_epochs,ch,:),1);
        ap_fit_1_45_phasic(night,ch,:) = nanmean(ap_fit_1_45_allep(phasic_epochs,ch,:),1);
        ap_fit_1_45_tonic(night,ch,:) = nanmean(ap_fit_1_45_allep(tonic_epochs,ch,:),1);
        ap_fit_1_45_nrem(night,ch,:) = nanmean(ap_fit_1_45_allep(nrem_epochs,ch,:),1);
        ap_fit_1_45_n1(night,ch,:) = nanmean(ap_fit_1_45_allep(n1_epochs,ch,:),1);
        ap_fit_1_45_n2(night,ch,:) = nanmean(ap_fit_1_45_allep(n2_epochs,ch,:),1);
        ap_fit_1_45_n3(night,ch,:) = nanmean(ap_fit_1_45_allep(n3_epochs,ch,:),1);
        ap_fit_1_45_wake(night,ch,:) = nanmean(ap_fit_1_45_allep(wake_epochs,ch,:),1);
        
                
         
        peak_fit_1_30_rem(night,ch,:) = nanmean(peak_fit_1_30_allep(rem_epochs,ch,:),1);
        peak_fit_1_30_phasic(night,ch,:) = nanmean(peak_fit_1_30_allep(phasic_epochs,ch,:),1);
        peak_fit_1_30_tonic(night,ch,:) = nanmean(peak_fit_1_30_allep(tonic_epochs,ch,:),1);
        peak_fit_1_30_nrem(night,ch,:) = nanmean(peak_fit_1_30_allep(nrem_epochs,ch,:),1);
        peak_fit_1_30_n1(night,ch,:) = nanmean(peak_fit_1_30_allep(n1_epochs,ch,:),1);
        peak_fit_1_30_n2(night,ch,:) = nanmean(peak_fit_1_30_allep(n2_epochs,ch,:),1);
        peak_fit_1_30_n3(night,ch,:) = nanmean(peak_fit_1_30_allep(n3_epochs,ch,:),1);
        peak_fit_1_30_wake(night,ch,:) = nanmean(peak_fit_1_30_allep(wake_epochs,ch,:),1);


        peak_fit_30_45_rem(night,ch,:) = nanmean(peak_fit_30_45_allep(rem_epochs,ch,:),1);
        peak_fit_30_45_phasic(night,ch,:) = nanmean(peak_fit_30_45_allep(phasic_epochs,ch,:),1);
        peak_fit_30_45_tonic(night,ch,:) = nanmean(peak_fit_30_45_allep(tonic_epochs,ch,:),1);
        peak_fit_30_45_nrem(night,ch,:) = nanmean(peak_fit_30_45_allep(nrem_epochs,ch,:),1);
        peak_fit_30_45_n1(night,ch,:) = nanmean(peak_fit_30_45_allep(n1_epochs,ch,:),1);
        peak_fit_30_45_n2(night,ch,:) = nanmean(peak_fit_30_45_allep(n2_epochs,ch,:),1);
        peak_fit_30_45_n3(night,ch,:) = nanmean(peak_fit_30_45_allep(n3_epochs,ch,:),1);
        peak_fit_30_45_wake(night,ch,:) = nanmean(peak_fit_30_45_allep(wake_epochs,ch,:),1);


        peak_fit_1_45_rem(night,ch,:) = nanmean(peak_fit_1_45_allep(rem_epochs,ch,:),1);
        peak_fit_1_45_phasic(night,ch,:) = nanmean(peak_fit_1_45_allep(phasic_epochs,ch,:),1);
        peak_fit_1_45_tonic(night,ch,:) = nanmean(peak_fit_1_45_allep(tonic_epochs,ch,:),1);
        peak_fit_1_45_nrem(night,ch,:) = nanmean(peak_fit_1_45_allep(nrem_epochs,ch,:),1);
        peak_fit_1_45_n1(night,ch,:) = nanmean(peak_fit_1_45_allep(n1_epochs,ch,:),1);
        peak_fit_1_45_n2(night,ch,:) = nanmean(peak_fit_1_45_allep(n2_epochs,ch,:),1);
        peak_fit_1_45_n3(night,ch,:) = nanmean(peak_fit_1_45_allep(n3_epochs,ch,:),1);
        peak_fit_1_45_wake(night,ch,:) = nanmean(peak_fit_1_45_allep(wake_epochs,ch,:),1);
        

        
        
        foofed_spectrum_1_30_rem(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(rem_epochs,ch,:),1);
        foofed_spectrum_1_30_phasic(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(phasic_epochs,ch,:),1);
        foofed_spectrum_1_30_tonic(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(tonic_epochs,ch,:),1);
        foofed_spectrum_1_30_nrem(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(nrem_epochs,ch,:),1);
        foofed_spectrum_1_30_n1(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(n1_epochs,ch,:),1);
        foofed_spectrum_1_30_n2(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(n2_epochs,ch,:),1);
        foofed_spectrum_1_30_n3(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(n3_epochs,ch,:),1);
        foofed_spectrum_1_30_wake(night,ch,:) = nanmean(foofed_spectrum_1_30_allep(wake_epochs,ch,:),1);


        foofed_spectrum_30_45_rem(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(rem_epochs,ch,:),1);
        foofed_spectrum_30_45_phasic(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(phasic_epochs,ch,:),1);
        foofed_spectrum_30_45_tonic(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(tonic_epochs,ch,:),1);
        foofed_spectrum_30_45_nrem(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(nrem_epochs,ch,:),1);
        foofed_spectrum_30_45_n1(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(n1_epochs,ch,:),1);
        foofed_spectrum_30_45_n2(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(n2_epochs,ch,:),1);
        foofed_spectrum_30_45_n3(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(n3_epochs,ch,:),1);
        foofed_spectrum_30_45_wake(night,ch,:) = nanmean(foofed_spectrum_30_45_allep(wake_epochs,ch,:),1);


        foofed_spectrum_1_45_rem(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(rem_epochs,ch,:),1);
        foofed_spectrum_1_45_phasic(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(phasic_epochs,ch,:),1);
        foofed_spectrum_1_45_tonic(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(tonic_epochs,ch,:),1);
        foofed_spectrum_1_45_nrem(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(nrem_epochs,ch,:),1);
        foofed_spectrum_1_45_n1(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(n1_epochs,ch,:),1);
        foofed_spectrum_1_45_n2(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(n2_epochs,ch,:),1);
        foofed_spectrum_1_45_n3(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(n3_epochs,ch,:),1);
        foofed_spectrum_1_45_wake(night,ch,:) = nanmean(foofed_spectrum_1_45_allep(wake_epochs,ch,:),1);
        



        log_power_spectrum_1_30_rem(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(rem_epochs,ch,:)),1);
        log_power_spectrum_1_30_phasic(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(phasic_epochs,ch,:)),1);
        log_power_spectrum_1_30_tonic(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(tonic_epochs,ch,:)),1);
        log_power_spectrum_1_30_nrem(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(nrem_epochs,ch,:)),1);
        log_power_spectrum_1_30_n1(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n1_epochs,ch,:)),1);
        log_power_spectrum_1_30_n2(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n2_epochs,ch,:)),1);
        log_power_spectrum_1_30_n3(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(n3_epochs,ch,:)),1);
        log_power_spectrum_1_30_wake(night,ch,:) = nanmean(log10(power_spectrum_1_30_allep(wake_epochs,ch,:)),1);


        log_power_spectrum_30_45_rem(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(rem_epochs,ch,:)),1);
        log_power_spectrum_30_45_phasic(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(phasic_epochs,ch,:)),1);
        log_power_spectrum_30_45_tonic(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(tonic_epochs,ch,:)),1);
        log_power_spectrum_30_45_nrem(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(nrem_epochs,ch,:)),1);
        log_power_spectrum_30_45_n1(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n1_epochs,ch,:)),1);
        log_power_spectrum_30_45_n2(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n2_epochs,ch,:)),1);
        log_power_spectrum_30_45_n3(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(n3_epochs,ch,:)),1);
        log_power_spectrum_30_45_wake(night,ch,:) = nanmean(log10(power_spectrum_30_45_allep(wake_epochs,ch,:)),1);


        log_power_spectrum_1_45_rem(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(rem_epochs,ch,:)),1);
        log_power_spectrum_1_45_phasic(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(phasic_epochs,ch,:)),1);
        log_power_spectrum_1_45_tonic(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(tonic_epochs,ch,:)),1);
        log_power_spectrum_1_45_nrem(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(nrem_epochs,ch,:)),1);
        log_power_spectrum_1_45_n1(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n1_epochs,ch,:)),1);
        log_power_spectrum_1_45_n2(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n2_epochs,ch,:)),1);
        log_power_spectrum_1_45_n3(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(n3_epochs,ch,:)),1);
        log_power_spectrum_1_45_wake(night,ch,:) = nanmean(log10(power_spectrum_1_45_allep(wake_epochs,ch,:)),1);



        
        log_ap_fit_1_30_rem(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(rem_epochs,ch,:)),1);
        log_ap_fit_1_30_phasic(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(phasic_epochs,ch,:)),1);
        log_ap_fit_1_30_tonic(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(tonic_epochs,ch,:)),1);
        log_ap_fit_1_30_nrem(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(nrem_epochs,ch,:)),1);
        log_ap_fit_1_30_n1(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n1_epochs,ch,:)),1);
        log_ap_fit_1_30_n2(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n2_epochs,ch,:)),1);
        log_ap_fit_1_30_n3(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(n3_epochs,ch,:)),1);
        log_ap_fit_1_30_wake(night,ch,:) = nanmean(log10(ap_fit_1_30_allep(wake_epochs,ch,:)),1);


        log_ap_fit_30_45_rem(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(rem_epochs,ch,:)),1);
        log_ap_fit_30_45_phasic(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(phasic_epochs,ch,:)),1);
        log_ap_fit_30_45_tonic(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(tonic_epochs,ch,:)),1);
        log_ap_fit_30_45_nrem(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(nrem_epochs,ch,:)),1);
        log_ap_fit_30_45_n1(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n1_epochs,ch,:)),1);
        log_ap_fit_30_45_n2(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n2_epochs,ch,:)),1);
        log_ap_fit_30_45_n3(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(n3_epochs,ch,:)),1);
        log_ap_fit_30_45_wake(night,ch,:) = nanmean(log10(ap_fit_30_45_allep(wake_epochs,ch,:)),1);


        log_ap_fit_1_45_rem(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(rem_epochs,ch,:)),1);
        log_ap_fit_1_45_phasic(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(phasic_epochs,ch,:)),1);
        log_ap_fit_1_45_tonic(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(tonic_epochs,ch,:)),1);
        log_ap_fit_1_45_nrem(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(nrem_epochs,ch,:)),1);
        log_ap_fit_1_45_n1(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n1_epochs,ch,:)),1);
        log_ap_fit_1_45_n2(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n2_epochs,ch,:)),1);
        log_ap_fit_1_45_n3(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(n3_epochs,ch,:)),1);
        log_ap_fit_1_45_wake(night,ch,:) = nanmean(log10(ap_fit_1_45_allep(wake_epochs,ch,:)),1);
        
                
         
        log_peak_fit_1_30_rem(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(rem_epochs,ch,:)),1);
        log_peak_fit_1_30_phasic(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(phasic_epochs,ch,:)),1);
        log_peak_fit_1_30_tonic(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(tonic_epochs,ch,:)),1);
        log_peak_fit_1_30_nrem(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(nrem_epochs,ch,:)),1);
        log_peak_fit_1_30_n1(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n1_epochs,ch,:)),1);
        log_peak_fit_1_30_n2(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n2_epochs,ch,:)),1);
        log_peak_fit_1_30_n3(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(n3_epochs,ch,:)),1);
        log_peak_fit_1_30_wake(night,ch,:) = nanmean(log10(peak_fit_1_30_allep(wake_epochs,ch,:)),1);


        log_peak_fit_30_45_rem(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(rem_epochs,ch,:)),1);
        log_peak_fit_30_45_phasic(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(phasic_epochs,ch,:)),1);
        log_peak_fit_30_45_tonic(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(tonic_epochs,ch,:)),1);
        log_peak_fit_30_45_nrem(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(nrem_epochs,ch,:)),1);
        log_peak_fit_30_45_n1(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n1_epochs,ch,:)),1);
        log_peak_fit_30_45_n2(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n2_epochs,ch,:)),1);
        log_peak_fit_30_45_n3(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(n3_epochs,ch,:)),1);
        log_peak_fit_30_45_wake(night,ch,:) = nanmean(log10(peak_fit_30_45_allep(wake_epochs,ch,:)),1);


        log_peak_fit_1_45_rem(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(rem_epochs,ch,:)),1);
        log_peak_fit_1_45_phasic(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(phasic_epochs,ch,:)),1);
        log_peak_fit_1_45_tonic(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(tonic_epochs,ch,:)),1);
        log_peak_fit_1_45_nrem(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(nrem_epochs,ch,:)),1);
        log_peak_fit_1_45_n1(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n1_epochs,ch,:)),1);
        log_peak_fit_1_45_n2(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n2_epochs,ch,:)),1);
        log_peak_fit_1_45_n3(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(n3_epochs,ch,:)),1);
        log_peak_fit_1_45_wake(night,ch,:) = nanmean(log10(peak_fit_1_45_allep(wake_epochs,ch,:)),1);

        
        
        log_foofed_spectrum_1_30_rem(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(rem_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_phasic(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(phasic_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_tonic(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(tonic_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_nrem(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(nrem_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_n1(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(n1_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_n2(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(n2_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_n3(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(n3_epochs,ch,:)),1);
        log_foofed_spectrum_1_30_wake(night,ch,:) = nanmean(log10(foofed_spectrum_1_30_allep(wake_epochs,ch,:)),1);


        log_foofed_spectrum_30_45_rem(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(rem_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_phasic(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(phasic_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_tonic(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(tonic_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_nrem(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(nrem_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_n1(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(n1_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_n2(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(n2_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_n3(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(n3_epochs,ch,:)),1);
        log_foofed_spectrum_30_45_wake(night,ch,:) = nanmean(log10(foofed_spectrum_30_45_allep(wake_epochs,ch,:)),1);


        log_foofed_spectrum_1_45_rem(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(rem_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_phasic(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(phasic_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_tonic(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(tonic_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_nrem(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(nrem_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_n1(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(n1_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_n2(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(n2_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_n3(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(n3_epochs,ch,:)),1);
        log_foofed_spectrum_1_45_wake(night,ch,:) = nanmean(log10(foofed_spectrum_1_45_allep(wake_epochs,ch,:)),1);




        end

       clear hypno_aligned2 hypno3 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phato phasic_epochs tonic_epochs art_epochs 


       clear offset_1_30_allep offset_30_45_allep offset_1_45_allep exponent_1_30_allep exponent_30_45_allep exponent_1_45_allep
 
       clear foofed_spectrum_1_30_allep ap_fit_1_30_allep peak_fit_1_30_allep power_spectrum_1_30_allep
       clear foofed_spectrum_30_45_allep ap_fit_30_45_allep peak_fit_30_45_allep power_spectrum_30_45_allep
       clear foofed_spectrum_1_45_allep ap_fit_1_45_allep peak_fit_1_45_allep power_spectrum_1_45_allep
       
    end

    save([Savefolder, filename(1:12),'_sprint_allnights.mat'],'exponent*','offset*','power_spectrum*','ap_fit*','peak_fit*','foofed_spectrum*','log_power_spectrum*','log_ap_fit*','log_peak_fit*','log_foofed_spectrum*')

    
% end

       
display('the end');

catch exception
    display(exception.message)
    display(exception.identifier)
    error()
end
    
    
end

