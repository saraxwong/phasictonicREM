function [IAPF ITPF ISPF IAPF_height ITPF_height ISPF_height h_values h_bin_edges f xi] = peak_detection_hist_vj(waves, peak_thresh, lower_freq_alpha, ...
    higher_freq_alpha, lower_freq_theta, higher_freq_theta, lower_freq_spindles, higher_freq_spindles, colors, color_no)

%     figure
%     h = histogram(waves.frequency,30,'FaceColor',colors(color_no,:),'FaceAlpha',0.5)
%     figure
    h_prob = histogram(waves.frequency,30,'BinLimits',[1 20],'Normalization','probability','FaceColor',colors(color_no,:),'FaceAlpha',0.5)
    
    h_values = h_prob.Values;
    h_bin_edges = h_prob.BinEdges;
    
    [f,xi] = ksdensity(waves.frequency); 
    hold on
%     plot(xi,f*length(waves.frequency)/2,'Color',colors(color_no,:),'LineWidth',5)
    plot(xi,f*0.8,'Color',colors(color_no,:),'LineWidth',5)
    hold on

    [pks,locs] = findpeaks(f);
    
    

    if find(f(locs)>= peak_thresh)
            
        [row,col] = find(f(locs)>=peak_thresh);
        

    xlim([0 20]);
    xticks(0:2:20);
    
    alpha_peaks = find(xi(locs(col)) > lower_freq_alpha & xi(locs(col)) < higher_freq_alpha);
    
    if length(alpha_peaks) > 1
        peaks_freq = xi(locs(col(alpha_peaks)));
        peaks_height = f(locs(col(alpha_peaks)));
        [max_peak max_ndx]= max(peaks_height);
        IAPF = peaks_freq(max_ndx);
        IAPF_height = peaks_height(max_ndx);
%         scatter(IAPF,peaks_height(max_ndx)*length(waves.frequency)/2,30,'o','MarkerFaceColor',colors(color_no+1,:),'MarkerEdgeColor','k','LineWidth',3)
        scatter(IAPF,peaks_height(max_ndx)*0.8,30,'o','MarkerFaceColor',colors(color_no+1,:),'MarkerEdgeColor','k','LineWidth',3)

    elseif length(alpha_peaks) == 1
        peaks_freq = xi(locs(col(alpha_peaks)));
        peaks_height = f(locs(col(alpha_peaks)));
        IAPF = peaks_freq;
        IAPF_height = peaks_height;
%         scatter(IAPF,peaks_height*length(waves.frequency)/2,30,'o','MarkerFaceColor',colors(color_no+1,:),'MarkerEdgeColor','k','LineWidth',3)
        scatter(IAPF,peaks_height*0.8,30,'o','MarkerFaceColor',colors(color_no+1,:),'MarkerEdgeColor','k','LineWidth',3)
       
        hold on
    else
        IAPF = NaN;
        IAPF_height = NaN;
    end
    
    
    theta_peaks = find(xi(locs(col)) > lower_freq_theta & xi(locs(col)) < higher_freq_theta);
    
    if length(theta_peaks) > 1
        peaks_freq = xi(locs(col(theta_peaks)));
        peaks_height = f(locs(col(theta_peaks)));
        [max_peak max_ndx]= max(peaks_height);
        ITPF = peaks_freq(max_ndx);
        ITPF_height = peaks_height(max_ndx);
%         scatter(ITPF,peaks_height(max_ndx)*length(waves.frequency)/2,30,'o','MarkerFaceColor',colors(color_no+2,:),'MarkerEdgeColor','k','LineWidth',3)
        scatter(ITPF,peaks_height(max_ndx)*0.8,30,'o','MarkerFaceColor',colors(color_no+2,:),'MarkerEdgeColor','k','LineWidth',3)
    elseif length(theta_peaks) == 1
        peaks_freq = xi(locs(col(theta_peaks)));
        peaks_height = f(locs(col(theta_peaks)));
        ITPF = peaks_freq;
        ITPF_height = peaks_height;
%         scatter(ITPF,peaks_height*length(waves.frequency)/2,30,'o','MarkerFaceColor',colors(color_no+2,:),'MarkerEdgeColor','k','LineWidth',3)
        scatter(ITPF,peaks_height*0.8,30,'o','MarkerFaceColor',colors(color_no+2,:),'MarkerEdgeColor','k','LineWidth',3)
        hold on
    else
        ITPF = NaN;
        ITPF_height = NaN;
    end
        
   
    spindles_peaks = find(xi(locs(col)) > lower_freq_spindles & xi(locs(col)) < higher_freq_spindles);
    
    if length(spindles_peaks) > 1
        peaks_freq = xi(locs(col(spindles_peaks)));
        peaks_height = f(locs(col(spindles_peaks)));
        [max_peak max_ndx]= max(peaks_height);
        ISPF = peaks_freq(max_ndx);
        ISPF_height = peaks_height(max_ndx);
%         scatter(ISPF,peaks_height(max_ndx)*length(waves.frequency)/2,30,'o','MarkerFaceColor',colors(color_no+3,:),'MarkerEdgeColor','k','LineWidth',3)
        scatter(ISPF,peaks_height(max_ndx)*0.8,30,'o','MarkerFaceColor',colors(color_no+3,:),'MarkerEdgeColor','k','LineWidth',3)
    elseif length(spindles_peaks) == 1
        peaks_freq = xi(locs(col(spindles_peaks)));
        peaks_height = f(locs(col(spindles_peaks)));
        ISPF = peaks_freq;
        ISPF_height = peaks_height;
%         scatter(ISPF,peaks_height*length(waves.frequency)/2,30,'o','MarkerFaceColor',colors(color_no+3,:),'MarkerEdgeColor','k','LineWidth',3)
        scatter(ISPF,peaks_height*0.8,30,'o','MarkerFaceColor',colors(color_no+3,:),'MarkerEdgeColor','k','LineWidth',3)
        hold on
    else
        ISPF = NaN;
        ISPF_height = NaN;
    end
    
    
    else
        IAPF = NaN;
        ITPF = NaN;
        ISPF = NaN;

        IAPF_height = NaN;
        ITPF_height = NaN;
        ISPF_height = NaN;

    end

end
