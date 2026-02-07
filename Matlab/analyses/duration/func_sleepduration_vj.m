function [WASO_dur, N1_dur, N2_dur, N3_dur, NREM_dur, REM_dur, tst, phasic_dur, tonic_dur] = func_sleepduration_vj(hypno_aligned2, epochlength, phasic_ep, tonic_ep)

n2_ndx = find(hypno_aligned2 == '2'); %create separate hypnogram to detect wake only during sleep
n2_first_ndx = n2_ndx(1);
hypno_aligned2_ASO = hypno_aligned2(n2_first_ndx:end);

WASO_dur = length(find(hypno_aligned2_ASO == '?' | hypno_aligned2_ASO == 'W'))*epochlength/60; %min
N1_dur = length(find(hypno_aligned2 == '1'))*epochlength/60;
N2_dur = length(find(hypno_aligned2 == '2'))*epochlength/60;
N3_dur = length(find(hypno_aligned2 == '3' | hypno_aligned2 == '4'))*epochlength/60;
NREM_dur = N2_dur + N3_dur;
REM_dur = length(find(hypno_aligned2 == 'R'))*30/60;

tst = N1_dur + NREM_dur + REM_dur; %total sleep time 


phasic_dur = length(find(phasic_ep == 1))/60; %min
tonic_dur = length(find(tonic_ep == 1))/60; %min
   
end 