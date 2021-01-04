# Combining both boxplot and violin plots in one.

library(tidyverse)

diamonds_df <- diamonds

diamonds_df %>% 
  ggplot(aes(x = cut, y = price, color = cut)) +
  geom_point(position = "jitter", alpha = 0.2) +
  geom_boxplot(alpha = 0, width = 0.3) +
  geom_violin(alpha = 0.5) +
  theme_classic() +
  theme(legend.position = "none") +
  labs(x = "Cut of the diamond",
       y = "Price of the diamonds (USD)",
       title = "Diamond cut against price",
       subtitle = "Diamond cut versus price",
       caption = "Data source: gglot2 dataset") +
  theme(axis.text=element_text(size=16),
        axis.title=element_text(size=16,face="bold")) +
  theme(plot.title = element_text(color = 'red', size = 18, face = 'bold'),
        plot.subtitle = element_text(color = 'green', size = 14, face = 'italic'),
        plot.caption = element_text(color = 'blue', face = 'italic'))

diamonds %>% 
  filter(cut == 'Very Good') %>% 
  nrow()


diamonds %>% 
  select(cut) %>% 
  table() %>% 
  barplot(col = c('green', 'red', 'blue', 'yellow', 'purple'))
