# Extracting tonic and phasic oscillations for appending to overnight (first last) excitability dataframe to measure correlations 
# import dataset from oscillations: osc_table_allsub_not_individualized_2_6_12_1s_osc_21-Jul-2026
cols <- c("participant", "condition", "night", "channel", "state")
df <- df  %>% mutate_at(cols, factor)

df_tonic <- df %>% 
  filter(state == "tonic") %>% 
  select(c(1:7,12,13,18,19,21,22)) %>% 
  pivot_wider(names_from = state, values_from = c(6:13))

df_phasic <- df %>% 
  filter(state == "phasic") %>% 
  select(c(1:7,12,13,18,19,21,22)) %>% 
  pivot_wider(names_from = state, values_from = c(6:13))

# extracting SWA
# import dataset from aperiodic sprint: aperiodic_table_sprint_allsub_not_individualized_2_6_12_1s_osc_21-Jul-2026
df_swa_NREM <- df %>% 
  filter(state == "NREM")  %>% 
  dplyr::select(c(1:5,10,11)) %>% 
  pivot_wider(names_from = state, values_from = c(6:7))

#extracting NREM_perc
# import dataset from duration: duration_allnight_07-Dec-2025
df <-duration_allnight_07_Dec_2025
df <- df %>% 
dplyr::select(c(1:3,19)) %>%
  group_by(night,condition) %>%
  nest() %>%
  nest_slice(data, rep(1:n(), each = 8)) %>% 
  unnest()



write.csv(df_tonic, 'tonic_for_excitabilitymod_30July26.csv')
write.csv(df_phasic, 'phasic_for_excitabilitymod_30July26.csv')
write.csv(df_swa_NREM, 'swa_for_excitabilitymod_30July26.csv')
write.csv(df, 'NREMperc_for_excitabilitymod_30July26.csv')
