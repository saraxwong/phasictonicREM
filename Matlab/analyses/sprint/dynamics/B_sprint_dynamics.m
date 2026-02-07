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

exponent_1_30_cyc_nrem = NaN(10,1);
exponent_30_45_cyc_nrem = NaN(10,1);
exponent_1_45_cyc_nrem = NaN(10,1);
offset_1_30_cyc_nrem = NaN(10,1);
offset_30_45_cyc_nrem = NaN(10,1);
offset_1_45_cyc_nrem = NaN(10,1);

exponent_1_30_cyc_rem = NaN(10,1);
exponent_30_45_cyc_rem = NaN(10,1);
exponent_1_45_cyc_rem = NaN(10,1);
offset_1_30_cyc_rem = NaN(10,1);
offset_30_45_cyc_rem = NaN(10,1);
offset_1_45_cyc_rem = NaN(10,1);   

exponent_1_30_cyc_phasic = NaN(10,1);   
exponent_30_45_cyc_phasic = NaN(10,1);   
exponent_1_45_cyc_phasic = NaN(10,1); 
offset_1_30_cyc_phasic = NaN(10,1); 
offset_30_45_cyc_phasic = NaN(10,1); 
offset_1_45_cyc_phasic = NaN(10,1); 
       
exponent_1_30_cyc_tonic = NaN(10,1); 
exponent_30_45_cyc_tonic = NaN(10,1); 
exponent_1_45_cyc_tonic = NaN(10,1); 
offset_1_30_cyc_tonic = NaN(10,1); 
offset_30_45_cyc_tonic = NaN(10,1); 
offset_1_45_cyc_tonic = NaN(10,1); 

foofed_spectrum_1_30_cyc_nrem = NaN(10,30); 
foofed_spectrum_30_45_cyc_nrem = NaN(10,16);
ap_fit_1_30_cyc_nrem = NaN(10,30);
ap_fit_30_45_cyc_nrem = NaN(10,16);
peak_fit_1_30_cyc_nrem = NaN(10,30);
peak_fit_30_45_cyc_nrem = NaN(10,16);
power_spectrum_1_30_cyc_nrem = NaN(10,30);
power_spectrum_30_45_cyc_nrem = NaN(10,16);
log_foofed_spectrum_1_30_cyc_nrem = NaN(10,30);
log_foofed_spectrum_30_45_cyc_nrem = NaN(10,16);
log_ap_fit_1_30_cyc_nrem = NaN(10,30);
log_ap_fit_30_45_cyc_nrem = NaN(10,16);
log_peak_fit_1_30_cyc_nrem = NaN(10,30);
log_peak_fit_30_45_cyc_nrem = NaN(10,16);
log_power_spectrum_1_30_cyc_nrem = NaN(10,30);
log_power_spectrum_30_45_cyc_nrem = NaN(10,16);

foofed_spectrum_1_30_cyc_rem = NaN(10,30); 
foofed_spectrum_30_45_cyc_rem = NaN(10,16);
ap_fit_1_30_cyc_rem = NaN(10,30);
ap_fit_30_45_cyc_rem = NaN(10,16);
peak_fit_1_30_cyc_rem = NaN(10,30);
peak_fit_30_45_cyc_rem = NaN(10,16);
power_spectrum_1_30_cyc_rem = NaN(10,30);
power_spectrum_30_45_cyc_rem = NaN(10,16);
log_foofed_spectrum_1_30_cyc_rem = NaN(10,30);
log_foofed_spectrum_30_45_cyc_rem = NaN(10,16);
log_ap_fit_1_30_cyc_rem = NaN(10,30);
log_ap_fit_30_45_cyc_rem = NaN(10,16);
log_peak_fit_1_30_cyc_rem = NaN(10,30);
log_peak_fit_30_45_cyc_rem = NaN(10,16);
log_power_spectrum_1_30_cyc_rem = NaN(10,30);
log_power_spectrum_30_45_cyc_rem = NaN(10,16);

foofed_spectrum_1_30_cyc_phasic = NaN(10,30); 
foofed_spectrum_30_45_cyc_phasic = NaN(10,16);
ap_fit_1_30_cyc_phasic = NaN(10,30);
ap_fit_30_45_cyc_phasic = NaN(10,16);
peak_fit_1_30_cyc_phasic = NaN(10,30);
peak_fit_30_45_cyc_phasic = NaN(10,16);
power_spectrum_1_30_cyc_phasic = NaN(10,30);
power_spectrum_30_45_cyc_phasic = NaN(10,16);
log_foofed_spectrum_1_30_cyc_phasic = NaN(10,30);
log_foofed_spectrum_30_45_cyc_phasic = NaN(10,16);
log_ap_fit_1_30_cyc_phasic = NaN(10,30);
log_ap_fit_30_45_cyc_phasic = NaN(10,16);
log_peak_fit_1_30_cyc_phasic = NaN(10,30);
log_peak_fit_30_45_cyc_phasic = NaN(10,16);
log_power_spectrum_1_30_cyc_phasic = NaN(10,30);
log_power_spectrum_30_45_cyc_phasic = NaN(10,16);

foofed_spectrum_1_30_cyc_tonic = NaN(10,30); 
foofed_spectrum_30_45_cyc_tonic = NaN(10,16);
ap_fit_1_30_cyc_tonic = NaN(10,30);
ap_fit_30_45_cyc_tonic = NaN(10,16);
peak_fit_1_30_cyc_tonic = NaN(10,30);
peak_fit_30_45_cyc_tonic = NaN(10,16);
power_spectrum_1_30_cyc_tonic = NaN(10,30);
power_spectrum_30_45_cyc_tonic = NaN(10,16);
log_foofed_spectrum_1_30_cyc_tonic = NaN(10,30);
log_foofed_spectrum_30_45_cyc_tonic = NaN(10,16);
log_ap_fit_1_30_cyc_tonic = NaN(10,30);
log_ap_fit_30_45_cyc_tonic = NaN(10,16);
log_peak_fit_1_30_cyc_tonic = NaN(10,30);
log_peak_fit_30_45_cyc_tonic = NaN(10,16);
log_power_spectrum_1_30_cyc_tonic = NaN(10,30);
log_power_spectrum_30_45_cyc_tonic = NaN(10,16);

%% rem cycles - aperiodic

         for c = 1:max(cyc_ndx_hypno)

             cyc_ndx = find(cyc_ndx_hypno == c);
             cyc_ndx_nrem = intersect(cyc_ndx,nrem_epochs);
             cyc_ndx_rem = intersect(cyc_ndx,rem_epochs);
             cyc_ndx_phasic = intersect(cyc_ndx,phasic_epochs);
             cyc_ndx_tonic = intersect(cyc_ndx,tonic_epochs);

             if ~isempty(cyc_ndx_nrem)
             exponent_1_30_cyc_nrem(c) = nanmean(exponent_1_30_allep(cyc_ndx_nrem,ch),1);
             exponent_30_45_cyc_nrem(c) = nanmean(exponent_30_45_allep(cyc_ndx_nrem,ch),1);
%              exponent_1_45_cyc_nrem(c) = nanmean(exponent_1_45_allep(cyc_ndx_nrem,ch),1);
             offset_1_30_cyc_nrem(c) = nanmean(offset_1_30_allep(cyc_ndx_nrem,ch),1);
             offset_30_45_cyc_nrem(c) = nanmean(offset_30_45_allep(cyc_ndx_nrem,ch),1);
%              offset_1_45_cyc_nrem(c) = nanmean(offset_1_45_allep(cyc_ndx_nrem,ch),1);
             foofed_spectrum_1_30_cyc_nrem(c,:) = squeeze(nanmean(foofed_spectrum_1_30_allep(cyc_ndx_nrem,ch,:),1)); 
             foofed_spectrum_30_45_cyc_nrem(c,:) = squeeze(nanmean(foofed_spectrum_30_45_allep(cyc_ndx_nrem,ch,:),1));  
             ap_fit_1_30_cyc_nrem(c,:) = squeeze(nanmean(ap_fit_1_30_allep(cyc_ndx_nrem,ch,:),1));  
             ap_fit_30_45_cyc_nrem(c,:) = squeeze(nanmean(ap_fit_30_45_allep(cyc_ndx_nrem,ch,:),1));  
             peak_fit_1_30_cyc_nrem(c,:) = squeeze(nanmean(peak_fit_1_30_allep(cyc_ndx_nrem,ch,:),1));  
             peak_fit_30_45_cyc_nrem(c,:) = squeeze(nanmean(peak_fit_30_45_allep(cyc_ndx_nrem,ch,:),1));  
             power_spectrum_1_30_cyc_nrem(c,:) = squeeze(nanmean(power_spectrum_1_30_allep(cyc_ndx_nrem,ch,:),1));
             power_spectrum_30_45_cyc_nrem(c,:) = squeeze(nanmean(power_spectrum_30_45_allep(cyc_ndx_nrem,ch,:),1));
             log_foofed_spectrum_1_30_cyc_nrem(c,:) = squeeze(nanmean(log10(foofed_spectrum_1_30_allep(cyc_ndx_nrem,ch,:)),1)); 
             log_foofed_spectrum_30_45_cyc_nrem(c,:) = squeeze(nanmean(log10(foofed_spectrum_30_45_allep(cyc_ndx_nrem,ch,:)),1));  
             log_ap_fit_1_30_cyc_nrem(c,:) = squeeze(nanmean(log10(ap_fit_1_30_allep(cyc_ndx_nrem,ch,:)),1));  
             log_ap_fit_30_45_cyc_nrem(c,:) = squeeze(nanmean(log10(ap_fit_30_45_allep(cyc_ndx_nrem,ch,:)),1)); 
             log_peak_fit_1_30_cyc_nrem(c,:) = squeeze(nanmean(log10(peak_fit_1_30_allep(cyc_ndx_nrem,ch,:)),1));  
             log_peak_fit_30_45_cyc_nrem(c,:) = squeeze(nanmean(log10(peak_fit_30_45_allep(cyc_ndx_nrem,ch,:)),1));
             log_power_spectrum_1_30_cyc_nrem(c,:) = squeeze(nanmean(log10(power_spectrum_1_30_allep(cyc_ndx_nrem,ch,:)),1));
             log_power_spectrum_30_45_cyc_nrem(c,:) = squeeze(nanmean(log10(power_spectrum_30_45_allep(cyc_ndx_nrem,ch,:)),1));
             end
             
             if ~isempty(cyc_ndx_rem)
             exponent_1_30_cyc_rem(c) = nanmean(exponent_1_30_allep(cyc_ndx_rem,ch),1);
             exponent_30_45_cyc_rem(c) = nanmean(exponent_30_45_allep(cyc_ndx_rem,ch),1);
%              exponent_1_45_cyc_rem(c) = nanmean(exponent_1_45_allep(cyc_ndx_rem,ch),1);
             offset_1_30_cyc_rem(c) = nanmean(offset_1_30_allep(cyc_ndx_rem,ch),1);
             offset_30_45_cyc_rem(c) = nanmean(offset_30_45_allep(cyc_ndx_rem,ch),1);
%              offset_1_45_cyc_rem(c) = nanmean(offset_1_45_allep(cyc_ndx_rem,ch),1);
             foofed_spectrum_1_30_cyc_rem(c,:,:) = nanmean(foofed_spectrum_1_30_allep(cyc_ndx_rem,ch,:),1); 
             foofed_spectrum_30_45_cyc_rem(c,:,:) = nanmean(foofed_spectrum_30_45_allep(cyc_ndx_rem,ch,:),1);  
             ap_fit_1_30_cyc_rem(c,:,:) = nanmean(ap_fit_1_30_allep(cyc_ndx_rem,ch,:),1);  
             ap_fit_30_45_cyc_rem(c,:,:) = nanmean(ap_fit_30_45_allep(cyc_ndx_rem,ch,:),1);  
             peak_fit_1_30_cyc_rem(c,:,:) = nanmean(peak_fit_1_30_allep(cyc_ndx_rem,ch,:),1);  
             peak_fit_30_45_cyc_rem(c,:,:) = nanmean(peak_fit_30_45_allep(cyc_ndx_rem,ch,:),1);  
             power_spectrum_1_30_cyc_rem(c,:,:) = nanmean(power_spectrum_1_30_allep(cyc_ndx_rem,ch,:),1);
             power_spectrum_30_45_cyc_rem(c,:,:) = nanmean(power_spectrum_30_45_allep(cyc_ndx_rem,ch,:),1);
             log_foofed_spectrum_1_30_cyc_rem(c,:,:) = nanmean(log10(foofed_spectrum_1_30_allep(cyc_ndx_rem,ch,:)),1); 
             log_foofed_spectrum_30_45_cyc_rem(c,:,:) = nanmean(log10(foofed_spectrum_30_45_allep(cyc_ndx_rem,ch,:)),1);  
             log_ap_fit_1_30_cyc_rem(c,:,:) = nanmean(log10(ap_fit_1_30_allep(cyc_ndx_rem,ch,:)),1);  
             log_ap_fit_30_45_cyc_rem(c,:,:) = nanmean(log10(ap_fit_30_45_allep(cyc_ndx_rem,ch,:)),1); 
             log_peak_fit_1_30_cyc_rem(c,:,:) = nanmean(log10(peak_fit_1_30_allep(cyc_ndx_rem,ch,:)),1);  
             log_peak_fit_30_45_cyc_rem(c,:,:) = nanmean(log10(peak_fit_30_45_allep(cyc_ndx_rem,ch,:)),1);
             log_power_spectrum_1_30_cyc_rem(c,:,:) = nanmean(log10(power_spectrum_1_30_allep(cyc_ndx_rem,ch,:)),1);
             log_power_spectrum_30_45_cyc_rem(c,:,:) = nanmean(log10(power_spectrum_30_45_allep(cyc_ndx_rem,ch,:)),1);
             end

             if ~isempty(cyc_ndx_phasic)
             exponent_1_30_cyc_phasic(c) = nanmean(exponent_1_30_allep(cyc_ndx_phasic,ch),1);
             exponent_30_45_cyc_phasic(c) = nanmean(exponent_30_45_allep(cyc_ndx_phasic,ch),1);
%              exponent_1_45_cyc_phasic(c) = nanmean(exponent_1_45_allep(cyc_ndx_phasic,ch),1);
             offset_1_30_cyc_phasic(c) = nanmean(offset_1_30_allep(cyc_ndx_phasic,ch),1);
             offset_30_45_cyc_phasic(c) = nanmean(offset_30_45_allep(cyc_ndx_phasic,ch),1);
%              offset_1_45_cyc_phasic(c) = nanmean(offset_1_45_allep(cyc_ndx_phasic,ch),1);
             foofed_spectrum_1_30_cyc_phasic(c,:,:) = nanmean(foofed_spectrum_1_30_allep(cyc_ndx_phasic,ch,:),1); 
             foofed_spectrum_30_45_cyc_phasic(c,:,:) = nanmean(foofed_spectrum_30_45_allep(cyc_ndx_phasic,ch,:),1);  
             ap_fit_1_30_cyc_phasic(c,:,:) = nanmean(ap_fit_1_30_allep(cyc_ndx_phasic,ch,:),1);  
             ap_fit_30_45_cyc_phasic(c,:,:) = nanmean(ap_fit_30_45_allep(cyc_ndx_phasic,ch,:),1);  
             peak_fit_1_30_cyc_phasic(c,:,:) = nanmean(peak_fit_1_30_allep(cyc_ndx_phasic,ch,:),1);  
             peak_fit_30_45_cyc_phasic(c,:,:) = nanmean(peak_fit_30_45_allep(cyc_ndx_phasic,ch,:),1);  
             power_spectrum_1_30_cyc_phasic(c,:,:) = nanmean(power_spectrum_1_30_allep(cyc_ndx_phasic,ch,:),1);
             power_spectrum_30_45_cyc_phasic(c,:,:) = nanmean(power_spectrum_30_45_allep(cyc_ndx_phasic,ch,:),1);
             log_foofed_spectrum_1_30_cyc_phasic(c,:,:) = nanmean(log10(foofed_spectrum_1_30_allep(cyc_ndx_phasic,ch,:)),1); 
             log_foofed_spectrum_30_45_cyc_phasic(c,:,:) = nanmean(log10(foofed_spectrum_30_45_allep(cyc_ndx_phasic,ch,:)),1);  
             log_ap_fit_1_30_cyc_phasic(c,:,:) = nanmean(log10(ap_fit_1_30_allep(cyc_ndx_phasic,ch,:)),1);  
             log_ap_fit_30_45_cyc_phasic(c,:,:) = nanmean(log10(ap_fit_30_45_allep(cyc_ndx_phasic,ch,:)),1); 
             log_peak_fit_1_30_cyc_phasic(c,:,:) = nanmean(log10(peak_fit_1_30_allep(cyc_ndx_phasic,ch,:)),1);  
             log_peak_fit_30_45_cyc_phasic(c,:,:) = nanmean(log10(peak_fit_30_45_allep(cyc_ndx_phasic,ch,:)),1);
             log_power_spectrum_1_30_cyc_phasic(c,:,:) = nanmean(log10(power_spectrum_1_30_allep(cyc_ndx_phasic,ch,:)),1);
             log_power_spectrum_30_45_cyc_phasic(c,:,:) = nanmean(log10(power_spectrum_30_45_allep(cyc_ndx_phasic,ch,:)),1);
             end

             if ~isempty(cyc_ndx_tonic)
             exponent_1_30_cyc_tonic(c) = nanmean(exponent_1_30_allep(cyc_ndx_tonic,ch),1);
             exponent_30_45_cyc_tonic(c) = nanmean(exponent_30_45_allep(cyc_ndx_tonic,ch),1);
%              exponent_1_45_cyc_tonic(c) = nanmean(exponent_1_45_allep(cyc_ndx_tonic,ch),1);
             offset_1_30_cyc_tonic(c) = nanmean(offset_1_30_allep(cyc_ndx_tonic,ch),1);
             offset_30_45_cyc_tonic(c) = nanmean(offset_30_45_allep(cyc_ndx_tonic,ch),1);
%              offset_1_45_cyc_tonic(c) = nanmean(offset_1_45_allep(cyc_ndx_tonic,ch),1);
             foofed_spectrum_1_30_cyc_tonic(c,:,:) = nanmean(foofed_spectrum_1_30_allep(cyc_ndx_tonic,ch,:),1); 
             foofed_spectrum_30_45_cyc_tonic(c,:,:) = nanmean(foofed_spectrum_30_45_allep(cyc_ndx_tonic,ch,:),1);  
             ap_fit_1_30_cyc_tonic(c,:,:) = nanmean(ap_fit_1_30_allep(cyc_ndx_tonic,ch,:),1);  
             ap_fit_30_45_cyc_tonic(c,:,:) = nanmean(ap_fit_30_45_allep(cyc_ndx_tonic,ch,:),1);  
             peak_fit_1_30_cyc_tonic(c,:,:) = nanmean(peak_fit_1_30_allep(cyc_ndx_tonic,ch,:),1);  
             peak_fit_30_45_cyc_tonic(c,:,:) = nanmean(peak_fit_30_45_allep(cyc_ndx_tonic,ch,:),1);  
             power_spectrum_1_30_cyc_tonic(c,:,:) = nanmean(power_spectrum_1_30_allep(cyc_ndx_tonic,ch,:),1);
             power_spectrum_30_45_cyc_tonic(c,:,:) = nanmean(power_spectrum_30_45_allep(cyc_ndx_tonic,ch,:),1);
             log_foofed_spectrum_1_30_cyc_tonic(c,:,:) = nanmean(log10(foofed_spectrum_1_30_allep(cyc_ndx_tonic,ch,:)),1); 
             log_foofed_spectrum_30_45_cyc_tonic(c,:,:) = nanmean(log10(foofed_spectrum_30_45_allep(cyc_ndx_tonic,ch,:)),1);  
             log_ap_fit_1_30_cyc_tonic(c,:,:) = nanmean(log10(ap_fit_1_30_allep(cyc_ndx_tonic,ch,:)),1);  
             log_ap_fit_30_45_cyc_tonic(c,:,:) = nanmean(log10(ap_fit_30_45_allep(cyc_ndx_tonic,ch,:)),1); 
             log_peak_fit_1_30_cyc_tonic(c,:,:) = nanmean(log10(peak_fit_1_30_allep(cyc_ndx_tonic,ch,:)),1);  
             log_peak_fit_30_45_cyc_tonic(c,:,:) = nanmean(log10(peak_fit_30_45_allep(cyc_ndx_tonic,ch,:)),1);
             log_power_spectrum_1_30_cyc_tonic(c,:,:) = nanmean(log10(power_spectrum_1_30_allep(cyc_ndx_tonic,ch,:)),1);
             log_power_spectrum_30_45_cyc_tonic(c,:,:) = nanmean(log10(power_spectrum_30_45_allep(cyc_ndx_tonic,ch,:)),1);
             end
             
             n_cyc_ep_nrem = length(cyc_ndx_nrem);
             n_cyc_ep_nrem_quint = floor(n_cyc_ep_nrem/5);
             
             n_cyc_ep_rem = length(cyc_ndx_rem);
             n_cyc_ep_rem_quint = floor(n_cyc_ep_rem/5);
             
             for q = 1:5
                 
                 cyc_quint_ndx_nrem = cyc_ndx_nrem((q-1)*n_cyc_ep_nrem_quint+1:q*n_cyc_ep_nrem_quint);
                 cyc_quint_ndx_rem = cyc_ndx_rem((q-1)*n_cyc_ep_rem_quint+1:q*n_cyc_ep_rem_quint);
                 cyc_quint_ndx_phasic = intersect(cyc_quint_ndx_rem,phasic_epochs);
                 cyc_quint_ndx_tonic = intersect(cyc_quint_ndx_rem,tonic_epochs);
                 
                 exponent_1_30_cyc_quint_nrem(c,q) = nanmean(exponent_1_30_allep(cyc_quint_ndx_nrem,ch),1);
                 exponent_30_45_cyc_quint_nrem(c,q) = nanmean(exponent_30_45_allep(cyc_quint_ndx_nrem,ch),1);
%                  exponent_1_45_cyc_quint_nrem(c,q) = nanmean(exponent_1_45_allep(cyc_quint_ndx_nrem,ch),1);
                 offset_1_30_cyc_quint_nrem(c,q) = nanmean(offset_1_30_allep(cyc_quint_ndx_nrem,ch),1);
                 offset_30_45_cyc_quint_nrem(c,q) = nanmean(offset_30_45_allep(cyc_quint_ndx_nrem,ch),1);
%                  offset_1_45_cyc_quint_nrem(c,q) = nanmean(offset_1_45_allep(cyc_quint_ndx_nrem,ch),1);

                 exponent_1_30_cyc_quint_rem(c,q) = nanmean(exponent_1_30_allep(cyc_quint_ndx_rem,ch),1);
                 exponent_30_45_cyc_quint_rem(c,q) = nanmean(exponent_30_45_allep(cyc_quint_ndx_rem,ch),1);
%                  exponent_1_45_cyc_quint_rem(c,q) = nanmean(exponent_1_45_allep(cyc_quint_ndx_rem,ch),1);
                 offset_1_30_cyc_quint_rem(c,q) = nanmean(offset_1_30_allep(cyc_quint_ndx_rem,ch),1);
                 offset_30_45_cyc_quint_rem(c,q) = nanmean(offset_30_45_allep(cyc_quint_ndx_rem,ch),1);
%                  offset_1_45_cyc_quint_rem(c,q) = nanmean(offset_1_45_allep(cyc_quint_ndx_rem,ch),1);

                 exponent_1_30_cyc_quint_phasic(c,q) = nanmean(exponent_1_30_allep(cyc_quint_ndx_phasic,ch),1);
                 exponent_30_45_cyc_quint_phasic(c,q) = nanmean(exponent_30_45_allep(cyc_quint_ndx_phasic,ch),1);
%                  exponent_1_45_cyc_quint_phasic(c,q) = nanmean(exponent_1_45_allep(cyc_quint_ndx_phasic,ch),1);
                 offset_1_30_cyc_quint_phasic(c,q) = nanmean(offset_1_30_allep(cyc_quint_ndx_phasic,ch),1);
                 offset_30_45_cyc_quint_phasic(c,q) = nanmean(offset_30_45_allep(cyc_quint_ndx_phasic,ch),1);
%                  offset_1_45_cyc_quint_phasic(c,q) = nanmean(offset_1_45_allep(cyc_quint_ndx_phasic,ch),1);

                 exponent_1_30_cyc_quint_tonic(c,q) = nanmean(exponent_1_30_allep(cyc_quint_ndx_tonic,ch),1);
                 exponent_30_45_cyc_quint_tonic(c,q) = nanmean(exponent_30_45_allep(cyc_quint_ndx_tonic,ch),1);
%                  exponent_1_45_cyc_quint_tonic(c,q) = nanmean(exponent_1_45_allep(cyc_quint_ndx_tonic,ch),1);
                 offset_1_30_cyc_quint_tonic(c,q) = nanmean(offset_1_30_allep(cyc_quint_ndx_tonic,ch),1);
                 offset_30_45_cyc_quint_tonic(c,q) = nanmean(offset_30_45_allep(cyc_quint_ndx_tonic,ch),1);
%                  offset_1_45_cyc_quint_tonic(c,q) = nanmean(offset_1_45_allep(cyc_quint_ndx_tonic,ch),1);
                 
                 clear cyc_quint_ndx_nrem cyc_quint_ndx_rem cyc_quint_ndx_phasic cyc_quint_ndx_tonic
                 
             end
             
             clear cyc_ndx_nrem cyc_ndx_rem cyc_ndx_phasic cyc_ndx_tonic 
                
         end
             
        %%
        
        exponent_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem)) = exponent_1_30_cyc_nrem;
        exponent_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem)) = exponent_30_45_cyc_nrem;
%         exponent_1_45_cyc_nrem(s,night,ch,1:length(exponent_1_30_cyc_nrem)) = exponent_1_45_cyc_nrem;
        offset_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem)) = offset_1_30_cyc_nrem;
        offset_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem)) = offset_30_45_cyc_nrem;
%         offset_1_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem)) = offset_1_45_cyc_nrem;
        foofed_spectrum_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = foofed_spectrum_1_30_cyc_nrem;
        foofed_spectrum_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = foofed_spectrum_30_45_cyc_nrem;
        ap_fit_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = ap_fit_1_30_cyc_nrem;
        ap_fit_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = ap_fit_30_45_cyc_nrem;
        peak_fit_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = peak_fit_1_30_cyc_nrem;
        peak_fit_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = peak_fit_30_45_cyc_nrem;
        power_spectrum_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = power_spectrum_1_30_cyc_nrem;
        power_spectrum_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = power_spectrum_30_45_cyc_nrem;
        log_foofed_spectrum_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_foofed_spectrum_1_30_cyc_nrem;
        log_foofed_spectrum_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_foofed_spectrum_30_45_cyc_nrem;
        log_ap_fit_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_ap_fit_1_30_cyc_nrem;
        log_ap_fit_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_ap_fit_30_45_cyc_nrem;
        log_peak_fit_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_peak_fit_1_30_cyc_nrem;
        log_peak_fit_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_peak_fit_30_45_cyc_nrem;
        log_power_spectrum_1_30_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_power_spectrum_1_30_cyc_nrem;
        log_power_spectrum_30_45_cyc_nrem_all(s,night,ch,1:length(exponent_1_30_cyc_nrem),:) = log_power_spectrum_30_45_cyc_nrem;

        
        exponent_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem)) = exponent_1_30_cyc_rem;
        exponent_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem)) = exponent_30_45_cyc_rem;
%         exponent_1_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem)) = exponent_1_45_cyc_rem;
        offset_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem)) = offset_1_30_cyc_rem;
        offset_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem)) = offset_30_45_cyc_rem;
%         offset_1_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem)) = offset_1_45_cyc_rem;
        foofed_spectrum_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = foofed_spectrum_1_30_cyc_rem;
        foofed_spectrum_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = foofed_spectrum_30_45_cyc_rem;
        ap_fit_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = ap_fit_1_30_cyc_rem;
        ap_fit_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = ap_fit_30_45_cyc_rem;
        peak_fit_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = peak_fit_1_30_cyc_rem;
        peak_fit_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = peak_fit_30_45_cyc_rem;
        power_spectrum_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = power_spectrum_1_30_cyc_rem;
        power_spectrum_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = power_spectrum_30_45_cyc_rem;
        log_foofed_spectrum_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_foofed_spectrum_1_30_cyc_rem;
        log_foofed_spectrum_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_foofed_spectrum_30_45_cyc_rem;
        log_ap_fit_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_ap_fit_1_30_cyc_rem;
        log_ap_fit_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_ap_fit_30_45_cyc_rem;
        log_peak_fit_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_peak_fit_1_30_cyc_rem;
        log_peak_fit_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_peak_fit_30_45_cyc_rem;
        log_power_spectrum_1_30_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_power_spectrum_1_30_cyc_rem;
        log_power_spectrum_30_45_cyc_rem_all(s,night,ch,1:length(exponent_1_30_cyc_rem),:) = log_power_spectrum_30_45_cyc_rem;


        exponent_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic)) = exponent_1_30_cyc_phasic;
        exponent_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic)) = exponent_30_45_cyc_phasic;
%         exponent_1_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic)) = exponent_1_45_cyc_phasic;
        offset_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic)) = offset_1_30_cyc_phasic;
        offset_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic)) = offset_30_45_cyc_phasic;
%         offset_1_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic)) = offset_1_45_cyc_phasic;
        foofed_spectrum_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = foofed_spectrum_1_30_cyc_phasic;
        foofed_spectrum_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = foofed_spectrum_30_45_cyc_phasic;
        ap_fit_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = ap_fit_1_30_cyc_phasic;
        ap_fit_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = ap_fit_30_45_cyc_phasic;
        peak_fit_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = peak_fit_1_30_cyc_phasic;
        peak_fit_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = peak_fit_30_45_cyc_phasic;
        power_spectrum_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = power_spectrum_1_30_cyc_phasic;
        power_spectrum_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = power_spectrum_30_45_cyc_phasic;
        log_foofed_spectrum_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_foofed_spectrum_1_30_cyc_phasic;
        log_foofed_spectrum_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_foofed_spectrum_30_45_cyc_phasic;
        log_ap_fit_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_ap_fit_1_30_cyc_phasic;
        log_ap_fit_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_ap_fit_30_45_cyc_phasic;
        log_peak_fit_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_peak_fit_1_30_cyc_phasic;
        log_peak_fit_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_peak_fit_30_45_cyc_phasic;
        log_power_spectrum_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_power_spectrum_1_30_cyc_phasic;
        log_power_spectrum_30_45_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = log_power_spectrum_30_45_cyc_phasic;
        
        exponent_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic)) = exponent_1_30_cyc_tonic;
        exponent_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic)) = exponent_30_45_cyc_tonic;
%         exponent_1_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic)) = exponent_1_45_cyc_tonic;
        offset_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic)) = offset_1_30_cyc_tonic;
        offset_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic)) = offset_30_45_cyc_tonic;
%         offset_1_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic)) = offset_1_45_cyc_tonic; foofed_spectrum_1_30_cyc_phasic_all(s,night,ch,1:length(exponent_1_30_cyc_phasic),:) = foofed_spectrum_1_30_cyc_phasic;
        foofed_spectrum_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = foofed_spectrum_30_45_cyc_tonic;
        ap_fit_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = ap_fit_1_30_cyc_tonic;
        ap_fit_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = ap_fit_30_45_cyc_tonic;
        peak_fit_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = peak_fit_1_30_cyc_tonic;
        peak_fit_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = peak_fit_30_45_cyc_tonic;
        power_spectrum_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = power_spectrum_1_30_cyc_tonic;
        power_spectrum_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = power_spectrum_30_45_cyc_tonic;
        log_foofed_spectrum_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_foofed_spectrum_1_30_cyc_tonic;
        log_foofed_spectrum_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_foofed_spectrum_30_45_cyc_tonic;
        log_ap_fit_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_ap_fit_1_30_cyc_tonic;
        log_ap_fit_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_ap_fit_30_45_cyc_tonic;
        log_peak_fit_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_peak_fit_1_30_cyc_tonic;
        log_peak_fit_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_peak_fit_30_45_cyc_tonic;
        log_power_spectrum_1_30_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_power_spectrum_1_30_cyc_tonic;
        log_power_spectrum_30_45_cyc_tonic_all(s,night,ch,1:length(exponent_1_30_cyc_tonic),:) = log_power_spectrum_30_45_cyc_tonic;

        
        exponent_1_30_cyc_quint_nrem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_nrem,1),:) = exponent_1_30_cyc_quint_nrem;
        exponent_30_45_cyc_quint_nrem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_nrem,1),:) = exponent_30_45_cyc_quint_nrem;
%         exponent_1_45_cyc_quint_nrem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_nrem,1),:) = exponent_1_45_cyc_quint_nrem;
        offset_1_30_cyc_quint_nrem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_nrem,1),:) = offset_1_30_cyc_quint_nrem;
        offset_30_45_cyc_quint_nrem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_nrem,1),:) = offset_30_45_cyc_quint_nrem;
%         offset_1_45_cyc_quint_nrem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_nrem,1),:) = offset_1_45_cyc_quint_nrem;
        
        exponent_1_30_cyc_quint_rem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_rem,1),:) = exponent_1_30_cyc_quint_rem;
        exponent_30_45_cyc_quint_rem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_rem,1),:) = exponent_30_45_cyc_quint_rem;
%         exponent_1_45_cyc_quint_rem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_rem,1),:) = exponent_1_45_cyc_quint_rem;
        offset_1_30_cyc_quint_rem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_rem,1),:) = offset_1_30_cyc_quint_rem;
        offset_30_45_cyc_quint_rem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_rem,1),:) = offset_30_45_cyc_quint_rem;
%         offset_1_45_cyc_quint_rem_all(s,night,ch,1:size(exponent_1_30_cyc_quint_rem,1),:) = offset_1_45_cyc_quint_rem;
       
        exponent_1_30_cyc_quint_phasic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_phasic,1),:) = exponent_1_30_cyc_quint_phasic;
        exponent_30_45_cyc_quint_phasic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_phasic,1),:) = exponent_30_45_cyc_quint_phasic;
%         exponent_1_45_cyc_quint_phasic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_phasic,1),:) = exponent_1_45_cyc_quint_phasic;
        offset_1_30_cyc_quint_phasic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_phasic,1),:) = offset_1_30_cyc_quint_phasic;
        offset_30_45_cyc_quint_phasic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_phasic,1),:) = offset_30_45_cyc_quint_phasic;
%         offset_1_45_cyc_quint_phasic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_phasic,1),:) = offset_1_45_cyc_quint_phasic;
        
        exponent_1_30_cyc_quint_tonic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_tonic,1),:) = exponent_1_30_cyc_quint_tonic;
        exponent_30_45_cyc_quint_tonic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_tonic,1),:) = exponent_30_45_cyc_quint_tonic;
%         exponent_1_45_cyc_quint_tonic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_tonic,1),:) = exponent_1_45_cyc_quint_tonic;
        offset_1_30_cyc_quint_tonic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_tonic,1),:) = offset_1_30_cyc_quint_tonic;
        offset_30_45_cyc_quint_tonic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_tonic,1),:) = offset_30_45_cyc_quint_tonic;
%         offset_1_45_cyc_quint_tonic_all(s,night,ch,1:size(exponent_1_30_cyc_quint_tonic,1),:) = offset_1_45_cyc_quint_tonic;
        
        clear exponent_1_30_cyc_nrem exponent_30_45_cyc_nrem exponent_1_45_cyc_nrem offset_1_30_cyc_nrem offset_30_45_cyc_nrem offset_1_45_cyc_nrem
        clear exponent_1_30_cyc_rem exponent_30_45_cyc_rem exponent_1_45_cyc_rem offset_1_30_cyc_rem offset_30_45_cyc_rem offset_1_45_cyc_rem
        clear exponent_1_30_cyc_phasic exponent_30_45_cyc_phasic exponent_1_45_cyc_phasic offset_1_30_cyc_phasic offset_30_45_cyc_phasic offset_1_45_cyc_phasic
        clear exponent_1_30_cyc_tonic exponent_30_45_cyc_tonic exponent_1_45_cyc_tonic offset_1_30_cyc_tonic offset_30_45_cyc_tonic offset_1_45_cyc_tonic

        clear exponent_1_30_cyc_quint_nrem exponent_30_45_cyc_quint_nrem exponent_1_45_cyc_quint_nrem offset_1_30_cyc_quint_nrem offset_30_45_cyc_quint_nrem offset_1_45_cyc_quint_nrem
        clear exponent_1_30_cyc_quint_rem exponent_30_45_cyc_quint_rem exponent_1_45_cyc_quint_rem offset_1_30_cyc_quint_rem offset_30_45_cyc_quint_rem offset_1_45_cyc_quint_rem
        clear exponent_1_30_cyc_quint_phasic exponent_30_45_cyc_quint_phasic exponent_1_45_cyc_quint_phasic offset_1_30_cyc_quint_phasic offset_30_45_cyc_quint_phasic offset_1_45_cyc_quint_phasic
        clear exponent_1_30_cyc_quint_tonic exponent_30_45_cyc_quint_tonic exponent_1_45_cyc_quint_tonic offset_1_30_cyc_quint_tonic offset_30_45_cyc_quint_tonic offset_1_45_cyc_quint_tonic
      
        clear foofed_spectrum_1_30_cyc_nrem foofed_spectrum_30_45_cyc_nrem ap_fit_1_30_cyc_nrem ap_fit_30_45_cyc_nrem peak_fit_1_30_cyc_nrem peak_fit_30_45_cyc_nrem power_spectrum_1_30_cyc_nrem power_spectrum_30_45_cyc_nrem
        clear log_foofed_spectrum_1_30_cyc_nrem log_foofed_spectrum_30_45_cyc_nrem log_ap_fit_1_30_cyc_nrem log_ap_fit_30_45_cyc_nrem log_peak_fit_1_30_cyc_nrem log_peak_fit_30_45_cyc_nrem log_power_spectrum_1_30_cyc_nrem log_power_spectrum_30_45_cyc_nrem
        
        clear foofed_spectrum_1_30_cyc_rem foofed_spectrum_30_45_cyc_rem ap_fit_1_30_cyc_rem ap_fit_30_45_cyc_rem peak_fit_1_30_cyc_rem peak_fit_30_45_cyc_rem power_spectrum_1_30_cyc_rem power_spectrum_30_45_cyc_rem
        clear log_foofed_spectrum_1_30_cyc_rem log_foofed_spectrum_30_45_cyc_rem log_ap_fit_1_30_cyc_rem log_ap_fit_30_45_cyc_rem log_peak_fit_1_30_cyc_rem log_peak_fit_30_45_cyc_rem log_power_spectrum_1_30_cyc_rem log_power_spectrum_30_45_cyc_rem
        
        clear foofed_spectrum_1_30_cyc_phasic foofed_spectrum_30_45_cyc_phasic ap_fit_1_30_cyc_phasic ap_fit_30_45_cyc_phasic peak_fit_1_30_cyc_phasic peak_fit_30_45_cyc_phasic power_spectrum_1_30_cyc_phasic power_spectrum_30_45_cyc_phasic
        clear log_foofed_spectrum_1_30_cyc_phasic log_foofed_spectrum_30_45_cyc_phasic log_ap_fit_1_30_cyc_phasic log_ap_fit_30_45_cyc_phasic log_peak_fit_1_30_cyc_phasic log_peak_fit_30_45_cyc_phasic log_power_spectrum_1_30_cyc_phasic log_power_spectrum_30_45_cyc_phasic

        clear foofed_spectrum_1_30_cyc_tonic foofed_spectrum_30_45_cyc_tonic ap_fit_1_30_cyc_tonic ap_fit_30_45_cyc_tonic peak_fit_1_30_cyc_tonic peak_fit_30_45_cyc_tonic power_spectrum_1_30_cyc_tonic power_spectrum_30_45_cyc_tonic
        clear log_foofed_spectrum_1_30_cyc_tonic log_foofed_spectrum_30_45_cyc_tonic log_ap_fit_1_30_cyc_tonic log_ap_fit_30_45_cyc_tonic log_peak_fit_1_30_cyc_tonic log_peak_fit_30_45_cyc_tonic log_power_spectrum_1_30_cyc_tonic log_power_spectrum_30_45_cyc_tonic
        

        end

       clear hypno_aligned2 rem_epochs nrem_epochs n1_epochs n2_epochs n3_epochs wake_epochs phato_30 phasic_epochs tonic_epochs art_epochs 
       clear cyc_ndx_hypno
       
    end
    

end

    save([Savefolder, 'sprint_allsub_aperiodic_dynamics_',date,'.mat'],'exponent*','offset*','foofed*','ap_fit*','peak_fit*','power_spectrum*','log_foofed*','log_ap_fit*','log_peak_fit*','log_power_spectrum*','-v7.3');
    
    
   