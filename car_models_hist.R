library(ggplot2)

data <- read.csv("final_scout_not_dummy.csv")

ggplot(data, aes(x = make_model)) +
  geom_bar(fill = "steelblue") +
  theme_minimal() +
  labs(title = "Frequency of Each Car Model",
       x = "Car Model",
       y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
