function phato = calculate_phato(phasic_ep, tonic_ep, art_ep, new_windowl,n_phasic_thresh)

    phato_cell = {};
    
    phasic_ndx = find(phasic_ep == 1);
    tonic_ndx = find(tonic_ep == 1);
    art_ndx = find(art_ep == 1);
    
    new_nepochs = floor(length(phasic_ep)/new_windowl);

    for h = 1:new_nepochs
        
        ep_ndx = ((h-1)*new_windowl+1):h*new_windowl;

        if sum(ismember(ep_ndx,art_ndx))>0
            phato_cell{h} = 'A';
        elseif sum(ismember(ep_ndx,phasic_ndx))>= n_phasic_thresh
            phato_cell{h} = 'P';
        elseif sum(ismember(ep_ndx,tonic_ndx))>0 & sum(ismember(ep_ndx,phasic_ndx))< n_phasic_thresh
            phato_cell{h} = 'T';
        else
            phato_cell{h} = 'N';
        end
        
    end
    

    phato = phato_cell;
    
end