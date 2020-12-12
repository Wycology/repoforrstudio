library(tidyverse)
diamonds_df <- diamonds

plotty <- diamonds_df %>% 
  ggplot(aes(x = cut, y = price, color = cut)) +
  geom_boxplot(alpha = 0, width = 0.15) +
  geom_violin(alpha = 0) +
  theme(legend.position = "none")