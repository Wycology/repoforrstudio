# Combining both boxplot and violin plots in one.

library(tidyverse)
diamonds_df <- diamonds

diamonds_df %>% 
  ggplot(aes(x = cut, y = price, color = cut)) +
  geom_point(position = "jitter", alpha = 0.1)+
  geom_boxplot(alpha = 0, width = 0.15) +
  geom_violin(alpha = 0) +
  theme(legend.position = "none")
