# Overview

This is the repository for the paper **“Tonic REM sleep EEG components predict better mood, cognition and reduce cortical excitability overnight”** by Sara Wong, Kiran K G Ravindran, Henry Hebron, Delia Lucarelli, June Lo, John Groeger, William Wisden, Ines R Violante, Derk-Jan Dijk, Valeria Jaramillo.

Preprint can be found here [link available upon publication]

Processed data to run the scripts and to create the figures are deposited at Zenodo [link available upon publication]



## 1. Requirements and Installation

- Matlab 2021a for EEG analyses 
- Additional Matlab toolboxes/functions: 
  - [eBOSC](https://github.com/jkosciessa/eBOSC)
  - [SPRiNT](https://github.com/lucwilson/SPRiNT)
  - [eeglab v2021.1](https://sccn.ucsd.edu/eeglab/download.php)
  - [fieldtrip revision ebc13229d](https://www.fieldtriptoolbox.org/) 
  - [linspecer](https://uk.mathworks.com/matlabcentral/fileexchange/42673-beautiful-and-distinguishable-line-colors-colormap)
  - [shadedErrorBar](https://uk.mathworks.com/matlabcentral/fileexchange/26311-raacampbell-shadederrorbar)
- R v4.4.1 for statistical analyses and figures
- R Packages:
  `devtools`, `tidyverse`, `modelbased`, `nplyr`, `dplyr`, `broom`, `kableExtra`, `ggpubr`, `lmerTest`, `lme4`, `MuMIn`, `effects`, `emmeans`, `ggprism`, `gghalves`, `haven`, `ggplot2`, `ggfortify`, `gridExtra`, `carData`, `car`, `factoextra`, `corrplot`, `mice`, `naniar`, `COINr`



## 2. Matlab

### 2.1 preprocessing

*A_align_data*: calculate how to align sleep scoring with data

*B_extract_REM*: align data and sleep scoring, read in phasic vs tonic scoring, find good REM samples 

*C_ICA_af_array*: script to run ICA using clean REM data and to remove independent components automatically

*D_insert_REM_after_ICA*: put REM data after independent component removal back into whole night data


### 2.2 analyses

#### 2.2.1 duration

*duration_common_sleep_duration_vj*: calculate sleep stage durations for whole night and for common sleep duration across all participants and across SS/IS for each night

#### 2.2.2 eBOSC

*A_eBOSC*: run eBOSC for 1-30 Hz, 30-45 Hz and 1-45 Hz range and save all wave characteristics for each night of each participant

**allnight**

*B_eBOSC_allsub*: calculate density, abundance, amplitude, peak frequency of oscillations in rem, phasic, tonic, nrem, and wake across whole night per participant

*C_eBOSC_allsub*: combine all characteristics from all night and all participants into one file

*D_eBOSC_make_tables*: make table of allnight wave characteristics
Figure_eBOSC_histograms: make histogram plots showing oscillation frequency distribution for individual participants

**dynamics**

*B_eBOSC_dynamics*: calculate density, abundance, amplitude, peak frequency of oscillations for rem, phasic, tonic, nrem, and wake for each sleep cycle and each quintile within sleep cycle

*C_eBOSC_dynamics_allsub*: combine all characteristics from all cycles and quintiles from all participants into one file

*D_eBOSC_dynamics_make_tables*: make table of characteristics for each sleep cycle and quintiles


#### 2.2.3 sprint

*A_sprint*: run sprint for 1-30 Hz, 30-45 Hz and 1-45 Hz range to extract aperiodic characteristics for each night of each participant 

**allnight**

*B_sprint_allnights*: calculate exponent and offset for rem, phasic, tonic, nrem, and wake across whole night per participant 

*C_sprint_allsub*: combine exponent and offset for rem, phasic, tonic, nrem, and wake from all night and all participants into one file

*D_sprint_make_tables*: make table of allnight exponent and offset

*Figure_plot_spectra_allsub_base*: plot spectra comparing phasic and tonic for baseline nights

**dynamics**

*B_sprint_dynamics*: calculate exponent, offset, and spectra for rem, phasic, tonic, nrem, and wake for each sleep cycle and quintile for all participants and nights

*C_sprint_dynamics_make_tables*: make tables of exponent and offset for first cycle, last cycle, first-last difference, all night, pre-post triplet difference averaged, rem in-between averaged, for each sleep cycle, and for each sleep cycle and quintile

*Figure_plot_spectra_allsub_base_cycles*: plot spectra for nrem, phasic and tonic for first and last cycle for baseline nights

*Figure_plot_spectra_allsub_SESR_cycles*: plot spectra for nrem, phasic and tonic for first and last cycle for SS/IS nights



## 3. R

### 3.1 Data preparation for statistics

*Aperiodic*: configures processed SPRINT table to produce final dataframe for statistical analyses that includes total sleep time, order, averaged values for frontal, central, posterior & occipital channels and baseline values  

*Oscillatory*: configures processed eBOSC table to produce final dataframe for statistical analyses that includes total sleep time, order, averaged values for frontal, central, posterior & occipital channels and baseline values  

*PANAS*: configures PANAS table to include duration, aperiodic and oscillatory values (using script arrange_data_for_PANAS_21Dec25), averaged values for frontal, central, posterior & occipital channels and baseline values  

*PCA (cognition)*: extract principal components from behavioural data (using script PCA_BSESR_protocol), configures PCA table to include duration, aperiodic and oscillatory values (using script arrange_data_for_PANAS_21Dec25), averaged values for frontal, central, posterior & occipital channels and baseline values  

*Slope modulation*: configures processed overnight and NREM-REM-NREM triplets aperiodic component table to produce final dataframe for statistical analyses that includes total sleep time, order, phasic and tonic oscillatory component values (using script arrange_data_for_excitability_29Dec25), averaged values for frontal, central, posterior & occipital channels and baseline values  

*Within night dynamics*: configures table to produce final dataframe for statistical analyses that includes total sleep time, order, averaged values for frontal, central, posterior & occipital channels


### 3.2 Statistical analyses and Figures

*Duration*: statistical analyses for duration changes for allnight and common sleep duration; creates Fig1, Suppl Fig S1, Table S1

*Aperiodic*: statistical analyses for aperiodic components differences during baseline nights for wake, NREM and REM, phasic and tonic and changes across sufficient sleep (SS) and insufficient sleep (IS) for phasic and tonic; creates Fig2, Fig3. Suppl Fig S3 - S4 

*Oscillatory*: statistical analyses for oscillatory components differences during baseline nights for wake, NREM and REM, phasic and tonic and changes across SS and IS for phasic and tonic; creates Fig2, Fig3. Suppl Fig S5 - S7

*PANAS*: statistical analyses for changes in PANAS positive and PANAS negative score for SS and IS, associations of duration, periodic and aperiodic components with PANAS positive and PANAS negative during baseline and during SS and IS nights; creates Fig4 and Table S2

*PCA (cognition)*: statistical analyses for changes in four PCA components for SS and IS, associations of duration, periodic and aperiodic components with each PCA component during baseline and during SS and IS nights; creates Fig5 and Table S3

*Slope modulation*: statistical analyses for NREM, phasic and tonic aperiodic component changes overnight and across NREM-REM-NREM triplets during baseline nights and across SS and IS as well as associations between phasic and tonic oscillatory components with slope changes; creates Fig6, Suppl Fig S9 - S12

*Within night dynamics*:  statistical analyses for phasic and tonic REM aperiodic and oscillatory component changes across REM cycles during baseline night; creates Suppl Fig S8
