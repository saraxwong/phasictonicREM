library(devtools)
library(lmerTest)
library(lme4)
library(emmeans)
library(tidyverse)
library(broom)
library(kableExtra)
library(ggpubr)
library(ggprism)
library(modelbased)

df_dynamics <- read_csv("duration_dynamics_per2h_13-Aug-2026.csv", show_col_types = FALSE)


cols <- c("participant", "condition", "night", "order", "twohour")
df_dynamics <- df_dynamics %>% mutate_at(cols, factor) %>% filter(!night=="9")
factor(df_dynamics$night, order=TRUE)
factor(df_dynamics$twohour, order=TRUE)

## percentage ---- 
fit.REMperc <- lmer(REM_perc ~ twohour*night*condition + tst_min + (1|participant), data=df_dynamics)
esmmeans_REMperc <- estimate_means(fit.REMperc , by = c("twohour", "night", "condition"))
anova.REMperc <- anova(fit.REMperc)
emmeans(fit.REMperc, ~ twohour | night * condition,
        lmer.df = "kenward-roger", pbkrtest.limit = 5102) %>%
  contrast("trt.vs.ctrl", ref = 1,    # all twohours vs twohour 1
           adjust = "tukey")

pairs(emmeans(fit.REMperc, ~ condition | twohour * night,
              lmer.df = "kenward-roger",
              pbkrtest.limit = 5000),
      simple = "condition",
      adjust = "tukey")

plotREMperc <- ggplot(esmmeans_REMperc,
                  aes(x = twohour, y = Mean, group = condition, shape = condition)) +
  scale_shape_manual(values = c(16, 21)) +
  
  # Estimated means lines
  geom_line(data = subset(esmmeans_REMperc, condition == "SE"),
            aes(x = twohour, y = Mean, group = condition),
            linewidth = 0.3, position = position_nudge(-0.05),
            colour = "black") +
  geom_line(data = subset(esmmeans_REMperc, condition == "SR"),
            aes(x = twohour, y = Mean, group = condition),
            linewidth = 0.3, position = position_nudge(0.15),
            colour = "black") +
  
  # Error bars
  geom_errorbar(data = subset(esmmeans_REMperc, condition == "SE"),
                aes(x = twohour, y = Mean, ymin = Mean - SE, ymax = Mean + SE),
                colour = "black", width = 0.4, lwd = 0.3,
                position = position_nudge(-0.05)) +
  geom_errorbar(data = subset(esmmeans_REMperc, condition == "SR"),
                aes(x = twohour, y = Mean, ymin = Mean - SE, ymax = Mean + SE),
                colour = "black", width = 0.4, lwd = 0.3,
                position = position_nudge(0.15)) +
  
  # Estimated means points
  geom_point(data = subset(esmmeans_REMperc, condition == "SE"),
             aes(shape = condition),
             colour = "black",
             position = position_nudge(-0.05), size = 2) +
  geom_point(data = subset(esmmeans_REMperc, condition == "SR"),
             aes(shape = condition),
             colour = "black", fill = "white",
             position = position_nudge(0.15), size = 2) +
  
  labs(x      = "Time in bed (h)",
       y      = "REM % per total sleep time",
       colour = "Condition",
       shape  = "Condition",
       title  = "REM across the night") +
  facet_wrap(~ night,
             nrow     = 1,
             labeller = as_labeller(c(
               "1" = "B",
               "2" = "1",
               "3" = "2",
               "4" = "3",
               "5" = "4",
               "6" = "5",
               "7" = "6",
               "8" = "7"
             ))) +
  theme_prism(base_size = 9, base_fontface = "plain", base_line_size = 0.2) +
  theme(legend.position = "none") +
  scale_y_continuous(limits = c(0, 50), breaks = seq(0, 50, 5), expand = c(0, NA)) 



## NREM percentage ---- 
fit.NREMperc <- lmer(NREM_perc ~ twohour*night*condition + tst_min + (1|participant), data=df_dynamics)
esmmeans_NREMperc <- estimate_means(fit.NREMperc , by = c("twohour", "night", "condition"))
anova.NREMperc <- anova(fit.NREMperc)
emmeans(fit.REMperc, ~ twohour | night * condition,
        lmer.df = "kenward-roger", pbkrtest.limit = 5102) %>%
  contrast("trt.vs.ctrl", ref = 1,    # all twohours vs twohour 1
           adjust = "tukey")

plotNREMperc <- ggplot(esmmeans_NREMperc,
                      aes(x = twohour, y = Mean, group = condition, shape = condition)) +
  scale_shape_manual(values = c(16, 21)) +
  
  # Estimated means lines
  geom_line(data = subset(esmmeans_NREMperc, condition == "SE"),
            aes(x = twohour, y = Mean, group = condition),
            linewidth = 0.3, position = position_nudge(-0.05),
            colour = "black") +
  geom_line(data = subset(esmmeans_NREMperc, condition == "SR"),
            aes(x = twohour, y = Mean, group = condition),
            linewidth = 0.3, position = position_nudge(0.15),
            colour = "black") +
  
  # Error bars
  geom_errorbar(data = subset(esmmeans_NREMperc, condition == "SE"),
                aes(x = twohour, y = Mean, ymin = Mean - SE, ymax = Mean + SE),
                colour = "black", width = 0.4, lwd = 0.3,
                position = position_nudge(-0.05)) +
  geom_errorbar(data = subset(esmmeans_NREMperc, condition == "SR"),
                aes(x = twohour, y = Mean, ymin = Mean - SE, ymax = Mean + SE),
                colour = "black", width = 0.4, lwd = 0.3,
                position = position_nudge(0.15)) +
  
  # Estimated means points
  geom_point(data = subset(esmmeans_NREMperc, condition == "SE"),
             aes(shape = condition),
             colour = "black",
             position = position_nudge(-0.05), size = 2) +
  geom_point(data = subset(esmmeans_NREMperc, condition == "SR"),
             aes(shape = condition),
             colour = "black", fill = "white",
             position = position_nudge(0.15), size = 2) +
  
  labs(x      = "Time in bed (h)",
       y      = "REM % per total sleep time",
       colour = "Condition",
       shape  = "Condition",
       title  = "NREM across the night") +
  facet_wrap(~ night,
             nrow     = 1,
             labeller = as_labeller(c(
               "1" = "B",
               "2" = "1",
               "3" = "2",
               "4" = "3",
               "5" = "4",
               "6" = "5",
               "7" = "6",
               "8" = "7"
             ))) +
  theme_prism(base_size = 9, base_fontface = "plain", base_line_size = 0.2) +
  theme(legend.position = "none") +
  scale_y_continuous(limits = c(20, 100), breaks = seq(20, 100, 20), expand = c(0, NA)) 



ggsave("figure/plot_NREM.svg", plot=plotNREMperc, width=9, height=3)
ggsave("figure/plot_REM.svg", plot=plotREMperc, width=9, height=3)
