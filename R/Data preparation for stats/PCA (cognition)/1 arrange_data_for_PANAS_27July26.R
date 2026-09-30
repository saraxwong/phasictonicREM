# Sorting duration, osc and aperiodic data to append to PANAS and PCA

#duration ----
# Load duration_allnight_7Dec2025.csv
df_duration <- duration_allnight  %>%  
  select(c(1:22))

cols <- c("participant", "condition", "night")
df_duration <- df_duration  %>% mutate_at(cols, factor)

df_duration_nest <- df_duration %>%  
  filter(!night==9) %>%
  group_by(night,condition) %>%
  nest() %>%
  nest_slice(data, rep(1:n(), each = 5)) %>% 
  unnest()

write.csv(df_duration_nest, 'duration_for_panas.csv')

# Oscillations ----
# Run oscillations_fortable_27July26.Rmd to acquire df_average 
df_osc_nest <- df_average %>%  
  filter(!night==9) %>%
  pivot_wider(
    names_from = state, values_from = c(8:25)
  ) %>% 
  pivot_wider(
    names_from = channel, values_from = c(7:96)
  ) %>% 
  group_by(night, condition) %>% 
  nest()

df_osc_nest_rep <- df_osc_nest %>% 
  nest_slice(data, rep(1:n(), each = 5)) %>% unnest()

write.csv(df_osc_nest_rep, 'oscillations_for_panas_27July26.csv')

# Aperiodic ----
# Run aperiodic_fortable_27July26.csv to acquire df_average 
df_aperiodic_nest <- df_average %>%  
  filter(!night==9) %>%
  pivot_wider(
    names_from = state, values_from = c(8:13)
  ) 

df_aperiodic_nest <- df_aperiodic_nest %>% 
  pivot_wider(
    names_from = channel, values_from = c(7:54)
  ) %>% 
  group_by(night, condition) %>% 
  nest()

df_aperiodic_nest_rep <- df_aperiodic_nest %>% 
  nest_slice(data, rep(1:n(), each = 5)) %>% unnest()

write.csv(df_aperiodic_nest_rep, 'aperiodic_for_panas_27July26.csv')

