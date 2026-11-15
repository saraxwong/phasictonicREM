%%
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
waves_folder_dir = dir([waves_folder,'AFOSR*']);

for f = 1:length(aICA_file)

participants{f} = aICA_file(f).name(1:12);

end

participants_uni = unique(participants);

Savefolder = '/parallel_scratch/nemo/AFdata/sprint_220125/allsub_dynamics/';

load('/users/nemo/projects/Airforce/paper/preprocessing/EEG_template_AF_10ch.mat');

%%
swa_freq = [1 4];
spindles_freq = [11 16];

f1 = 1:30;
f2 = 30:45;
f3 = 1:45;

swa_ndx = find(f1 >= swa_freq(1) & f1 < swa_freq(2));
spindle_power_ndx = find(f1 >= spindles_freq(1) & f1 < spindles_freq(2));
freq_resolution = f1(2)-f1(1);

%%

exponent_1_30_cyc_nrem_all = NaN(36,18,8,10);
exponent_30_45_cyc_nrem_all = NaN(36,18,8,10);
exponent_1_45_cyc_nrem_all = NaN(36,18,8,10);
offset_1_30_cyc_nrem_all = NaN(36,18,8,10);
offset_30_45_cyc_nrem_all = NaN(36,18,8,10);
offset_1_45_cyc_nrem_all = NaN(36,18,8,10);

exponent_1_30_cyc_quint_nrem_all = NaN(36,18,8,10,5);
exponent_30_45_cyc_quint_nrem_all = NaN(36,18,8,10,5);
exponent_1_45_cyc_quint_nrem_all = NaN(36,18,8,10,5);
offset_1_30_cyc_quint_nrem_all = NaN(36,18,8,10,5);
offset_30_45_cyc_quint_nrem_all = NaN(36,18,8,10,5);
offset_1_45_cyc_quint_nrem_all = NaN(36,18,8,10,5);


exponent_1_30_cyc_rem_all = NaN(36,18,8,10);
exponent_30_45_cyc_rem_all = NaN(36,18,8,10);
exponent_1_45_cyc_rem_all = NaN(36,18,8,10);
offset_1_30_cyc_rem_all = NaN(36,18,8,10);
offset_30_45_cyc_rem_all = NaN(36,18,8,10);
offset_1_45_cyc_rem_all = NaN(36,18,8,10);
        
exponent_1_30_cyc_quint_rem_all = NaN(36,18,8,10,5);
exponent_30_45_cyc_quint_rem_all = NaN(36,18,8,10,5);
exponent_1_45_cyc_quint_rem_all = NaN(36,18,8,10,5);
offset_1_30_cyc_quint_rem_all = NaN(36,18,8,10,5);
offset_30_45_cyc_quint_rem_all = NaN(36,18,8,10,5);
offset_1_45_cyc_quint_rem_all = NaN(36,18,8,10,5);


exponent_1_30_cyc_phasic_all = NaN(36,18,8,10);
exponent_30_45_cyc_phasic_all = NaN(36,18,8,10);
exponent_1_45_cyc_phasic_all = NaN(36,18,8,10);
offset_1_30_cyc_phasic_all = NaN(36,18,8,10);
offset_30_45_cyc_phasic_all = NaN(36,18,8,10);
offset_1_45_cyc_phasic_all = NaN(36,18,8,10);
        
exponent_1_30_cyc_quint_phasic_all = NaN(36,18,8,10,5);
exponent_30_45_cyc_quint_phasic_all = NaN(36,18,8,10,5);
exponent_1_45_cyc_quint_phasic_all = NaN(36,18,8,10,5);
offset_1_30_cyc_quint_phasic_all = NaN(36,18,8,10,5);
offset_30_45_cyc_quint_phasic_all = NaN(36,18,8,10,5);
offset_1_45_cyc_quint_phasic_all = NaN(36,18,8,10,5);


exponent_1_30_cyc_tonic_all = NaN(36,18,8,10);
exponent_30_45_cyc_tonic_all = NaN(36,18,8,10);
exponent_1_45_cyc_tonic_all = NaN(36,18,8,10);
offset_1_30_cyc_tonic_all = NaN(36,18,8,10);
offset_30_45_cyc_tonic_all = NaN(36,18,8,10);
offset_1_45_cyc_tonic_all = NaN(36,18,8,10);
        
exponent_1_30_cyc_quint_tonic_all = NaN(36,18,8,10,5);
exponent_30_45_cyc_quint_tonic_all = NaN(36,18,8,10,5);
exponent_1_45_cyc_quint_tonic_all = NaN(36,18,8,10,5);
offset_1_30_cyc_quint_tonic_all = NaN(36,18,8,10,5);
offset_30_45_cyc_quint_tonic_all = NaN(36,18,8,10,5);
offset_1_45_cyc_quint_tonic_all = NaN(36,18,8,10,5);


foofed_spectrum_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
foofed_spectrum_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
ap_fit_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
ap_fit_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
peak_fit_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
peak_fit_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
power_spectrum_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
power_spectrum_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
log_foofed_spectrum_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
log_foofed_spectrum_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
log_ap_fit_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
log_ap_fit_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
log_peak_fit_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
log_peak_fit_30_45_cyc_nrem_all = NaN(36,18,8,10,16);
log_power_spectrum_1_30_cyc_nrem_all = NaN(36,18,8,10,30);
log_power_spectrum_30_45_cyc_nrem_all = NaN(36,18,8,10,16);


foofed_spectrum_1_30_cyc_rem_all = NaN(36,18,8,10,30);
foofed_spectrum_30_45_cyc_rem_all = NaN(36,18,8,10,16);
ap_fit_1_30_cyc_rem_all = NaN(36,18,8,10,30);
ap_fit_30_45_cyc_rem_all = NaN(36,18,8,10,16);
peak_fit_1_30_cyc_rem_all = NaN(36,18,8,10,30);
peak_fit_30_45_cyc_rem_all = NaN(36,18,8,10,16);
power_spectrum_1_30_cyc_rem_all = NaN(36,18,8,10,30);
power_spectrum_30_45_cyc_rem_all = NaN(36,18,8,10,16);
log_foofed_spectrum_1_30_cyc_rem_all = NaN(36,18,8,10,30);
log_foofed_spectrum_30_45_cyc_rem_all = NaN(36,18,8,10,16);
log_ap_fit_1_30_cyc_rem_all = NaN(36,18,8,10,30);
log_ap_fit_30_45_cyc_rem_all = NaN(36,18,8,10,16);
log_peak_fit_1_30_cyc_rem_all = NaN(36,18,8,10,30);
log_peak_fit_30_45_cyc_rem_all = NaN(36,18,8,10,16);
log_power_spectrum_1_30_cyc_rem_all = NaN(36,18,8,10,30);
log_power_spectrum_30_45_cyc_rem_all = NaN(36,18,8,10,16);


foofed_spectrum_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
foofed_spectrum_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
ap_fit_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
ap_fit_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
peak_fit_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
peak_fit_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
power_spectrum_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
power_spectrum_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
log_foofed_spectrum_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
log_foofed_spectrum_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
log_ap_fit_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
log_ap_fit_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
log_peak_fit_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
log_peak_fit_30_45_cyc_phasic_all = NaN(36,18,8,10,16);
log_power_spectrum_1_30_cyc_phasic_all = NaN(36,18,8,10,30);
log_power_spectrum_30_45_cyc_phasic_all = NaN(36,18,8,10,16);



foofed_spectrum_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
foofed_spectrum_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
ap_fit_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
ap_fit_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
peak_fit_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
peak_fit_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
power_spectrum_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
power_spectrum_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
log_foofed_spectrum_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
log_foofed_spectrum_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
log_ap_fit_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
log_ap_fit_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
log_peak_fit_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
log_peak_fit_30_45_cyc_tonic_all = NaN(36,18,8,10,16);
log_power_spectrum_1_30_cyc_tonic_all = NaN(36,18,8,10,30);
log_power_spectrum_30_45_cyc_tonic_all = NaN(36,18,8,10,16);

%%

for s = 1:36

    display(['sub = ', num2str(s)]);
    
    files = dir([waves_folder, participants_uni{s},'*']);
   
    
    for file = 1:length(files)
        
        display(['file = ', num2str(file)]);
      
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
              
%% find nrem-rem cycles

        diff_rem_epochs = diff(rem_epochs);
%         diff_nrem_epochs = diff(nrem_epochs);
        
        rem_break_ndx = find(diff_rem_epochs > 5*60/epochl);
%         nrem_per_ndx = find(diff_nrem_epochs < 15*60/epochl);
       
        cyc_ndx_hypno = zeros(length(hypno3),1);
        
        n = 1;
        r = 1;
        cy = 1;
        last_rem = [];
            
        while r <= length(rem_break_ndx)
            if r == 1 % first cycle, at least 15 min NREM, no duration criterion for REM
                cyc_ndx_rem = rem_epochs(1:rem_break_ndx(r));
                cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1)));
                if length(cyc_ndx_nrem)*epochl/60 > 15
                cyc_ndx_hypno(cyc_ndx_rem) = cy;
                cyc_ndx_hypno(cyc_ndx_nrem) = cy;
                cy = cy+1;
                last_rem = cyc_ndx_rem(end);
                clear cyc_ndx_rem cyc_ndx_nrem
                end
                r = r+1;
            elseif r <= length(rem_break_ndx) % second to second last cycle, at least 15 min NREM and 5 min REM
                cyc_ndx_rem = rem_epochs(rem_break_ndx(r-1)+1:rem_break_ndx(r));
                if ~isempty(last_rem)
                    cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1) & nrem_epochs > last_rem));
                else
                    cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1)));
                end
                if length(cyc_ndx_rem)*epochl/60 > 5 & length(cyc_ndx_nrem)*epochl/60 > 15
                   cyc_ndx_hypno(cyc_ndx_rem) = cy;
                   cyc_ndx_hypno(cyc_ndx_nrem) = cy;
                   cy = cy+1;
                   last_rem = cyc_ndx_rem(end);
                   clear cyc_ndx_rem cyc_ndx_nrem
                end
                r = r+1;
            end
        end
         
        cyc_ndx_rem = rem_epochs(rem_break_ndx(length(rem_break_ndx))+1:end);  % last cycle, at least 15 min NREM and 5 min REM
        if ~isempty(last_rem)
           cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1) & nrem_epochs > last_rem));
        else
           cyc_ndx_nrem = nrem_epochs(find(nrem_epochs < cyc_ndx_rem(1)));
        end
        
        if length(cyc_ndx_rem)*epochl/60 > 5 & length(cyc_ndx_nrem)*epochl/60 > 15
           cyc_ndx_hypno(cyc_ndx_rem) = cy;
           cyc_ndx_hypno(cyc_ndx_nrem) = cy;
           clear cyc_ndx_rem cyc_ndx_nrem
        end      
        
%%
    
        
        for ch = 1:8
            
%             outlier_ndx = find(exponent_30_45_allep(:,ch) < 0.2);
%             exponent_30_45_allep(outlier_ndx,ch) = NaN;
%             offset_30_45_allep(outlier_ndx,ch) = NaN;
%             clear outlier_ndx
      

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
        clear outlier_matrix_1_30
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
        clear outlier_matrix_30_45
%         histogram(exponent_30_45_allep)

%         histogram(exponent_1_45_allep)
%         hold on
         outlier_matrix_1_45 = exponent_1_45_allep < 0.2;
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
        
        clear outlier_matrix_1_45
%         histogram(exponent_1_45_allep)

%%

swa_cyc_nrem = NaN(10,1);
spindle_power_cyc_nrem = NaN(10,1);
swa_cyc_rem = NaN(10,1);
spindle_power_cyc_rem = NaN(10,1);
swa_cyc_phasic = NaN(10,1);
spindle_power_cyc_phasic = NaN(10,1);
swa_cyc_tonic = NaN(10,1);
spindle_power_cyc_tonic = NaN(10,1);

%% rem cycles - swa and spindle power

         for c = 1:max(cyc_ndx_hypno)

             cyc_ndx = find(cyc_ndx_hypno == c);
             cyc_ndx_nrem = intersect(cyc_ndx,nrem_epochs_art_goodndx);
             cyc_ndx_rem = intersect(cyc_ndx,rem_epochs);
             cyc_ndx_phasic = intersect(cyc_ndx,phasic_epochs);
             cyc_ndx_tonic = intersect(cyc_ndx,tonic_epochs);

             if ~isempty(cyc_ndx_nrem)
                swa_cyc_nrem(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_nrem,ch,swa_ndx),3).*freq_resolution,1);
                spindle_power_cyc_nrem(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_nrem,ch,spindle_power_ndx),3).*freq_resolution,1);
             end
             
              if ~isempty(cyc_ndx_rem)
                swa_cyc_rem(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_rem,ch,swa_ndx),3).*freq_resolution,1);
                spindle_power_cyc_rem(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_rem,ch,spindle_power_ndx),3).*freq_resolution,1);
              end

            
             if ~isempty(cyc_ndx_phasic)
                swa_cyc_phasic(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_phasic,ch,swa_ndx),3).*freq_resolution,1);
                spindle_power_cyc_phasic(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_phasic,ch,spindle_power_ndx),3).*freq_resolution,1);
             end
             
             if ~isempty(cyc_ndx_tonic)
                swa_cyc_tonic(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_tonic,ch,swa_ndx),3).*freq_resolution,1);
                spindle_power_cyc_tonic(c) = nanmean(sum(power_spectrum_1_30_allep(cyc_ndx_tonic,ch,spindle_power_ndx),3).*freq_resolution,1);
             end

             
             clear cyc_ndx_nrem cyc_ndx_rem cyc_ndx_phasic cyc_ndx_tonic 
                
         end
             
        %%
        
        swa_cyc_nrem_all(s,night,ch,1:length(swa_cyc_nrem)) = swa_cyc_nrem;
        spindle_power_cyc_nrem_all(s,night,ch,1:length(spindle_power_cyc_nrem)) = spindle_power_cyc_nrem;

        swa_cyc_rem_all(s,night,ch,1:length(swa_cyc_rem)) = swa_cyc_rem;
        spindle_power_cyc_rem_all(s,night,ch,1:length(spindle_power_cyc_rem)) = spindle_power_cyc_rem;
        
        swa_cyc_phasic_all(s,night,ch,1:length(swa_cyc_phasic)) = swa_cyc_phasic;
        spindle_power_cyc_phasic_all(s,night,ch,1:length(spindle_power_cyc_phasic)) = spindle_power_cyc_phasic;
        
        swa_cyc_tonic_all(s,night,ch,1:length(swa_cyc_tonic)) = swa_cyc_tonic;
        spindle_power_cyc_tonic_all(s,night,ch,1:length(spindle_power_cyc_tonic)) = spindle_power_cyc_tonic;
        
        clear swa_cyc_nrem spindle_power_cyc_nrem swa_cyc_rem spindle_power_cyc_rem swa_cyc_phasic spindle_power_cyc_phasic swa_cyc_tonic spindle_power_cyc_tonic
      
        end

       clear hypno_aligned2 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phasic_epochs tonic_epochs art_epochs 
       clear cyc_ndx_hypno
       
    end
    

end

    save([Savefolder, 'sprint_allsub_swa_spindles_dynamics_',date,'.mat'],'swa*','spindle*','-v7.3');
    
    
   