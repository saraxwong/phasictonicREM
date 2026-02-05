# Extracting tonic and phasic oscillations for appending to overnight (first last) excitability dataframe to measure correlations 

# import dataset from oscillations: osc_table_allsub_not_individualized_2_6_12_1s_osc_01-Dec-2025
cols <- c("participant", "condition", "night", "channel", "state")
df <- df  %>% mutate_at(cols, factor)

df_tonic <- df %>% 
  filter(state == "tonic") %>% 
  select(c(1:5,6,7,12,13,18,19,21,22)) %>% 
  pivot_wider(names_from = state, values_from = c(6:13))

df_phasic <- df %>% 
  filter(state == "phasic") %>% 
  select(c(1:5,6,7,12,13,18,19,21,22)) %>% 
  pivot_wider(names_from = state, values_from = c(6:13))
  
write.csv(df_tonic, 'tonic_for_excitabilitymod.csv')
write.csv(df_phasic, 'phasic_for_excitabilitymod.csv')