#Style Guide: Tidyverse Style Guide (https://style.tidyverse.org/)
{r keyStats, ref.label=knitr::all_labels(), echo=TRUE, eval=FALSE}
#Provides key statistics for price, mileage, and age
summary_table <- data %>%
  filter(make_model %in% c("Audi A3", "Opel Insignia", "Audi A1")) %>%
  group_by(make_model) %>%
  summarise(
    Avg_Price = mean(price, na.rm = TRUE),
    Median_Price = median(price, na.rm = TRUE),
    Min_Price = min(price, na.rm = TRUE),
    Max_Price = max(price, na.rm = TRUE),
    Avg_Mileage = mean(mileage_km, na.rm = TRUE),
    Median_Mileage = median(mileage_km, na.rm = TRUE),
    Min_Mileage = min(mileage_km, na.rm = TRUE),
    Max_Mileage = max(mileage_km, na.rm = TRUE),
    Avg_Age = mean(age, na.rm = TRUE),
    Median_Age = median(age, na.rm = TRUE),
    Min_Age = min(age, na.rm = TRUE),
    Max_Age = max(age, na.rm = TRUE)
  )

print(summary_table)

{r ageModels, ref.label=knitr::all_labels(), echo=TRUE, eval=FALSE}
audi_a3_data <- data %>% filter(make_model == "Audi A3")

# Scatter plot with regression line
#ggplot(audi_a3_data, aes(x = age, y = price)) +
#geom_point(alpha = 0.6) +
#geom_smooth(method = "lm", se = TRUE, color = "red") +
#labs(
#title = "Price vs Age for Audi A3",
#x = "Age (years)",
#y = "Price (in units)"
#) +
#theme_minimal()
#audi_age_model <- lm(price ~ age, data = audi_a3_data)
#summary(audi_age_model)


# Boxplot
ggplot(audi_a3_data, aes(x = factor(age), y = price)) +
  geom_boxplot(fill = "pink") +
  labs(
    title = "Boxplot of Price by Age for Audi A3",
    x = "Age (years)",
    y = "Price (in units)"
  ) +
  theme_minimal()

opel_insignia_data <- data %>% filter(make_model == "Opel Insignia")

# Scatter plot with regression line
# ggplot(opel_insignia_data, aes(x = age, y = price)) +
#   geom_point(alpha = 0.6) +
#   geom_smooth(method = "lm", se = TRUE, color = "blue") +
#   labs(
#     title = "Price vs Age for Opel Insignia",
#     x = "Age (years)",
#     y = "Price (in units)"
#   ) +
#   theme_minimal()
# 
# opel_age_model <- lm(price ~ age, data = opel_insignia_data)
# summary(opel_age_model)

# Boxplot
ggplot(opel_insignia_data, aes(x = factor(age), y = price)) +
  geom_boxplot(fill = "lightblue") +
  labs(
    title = "Boxplot of Price by Age for Opel Insignia",
    x = "Age (years)",
    y = "Price (in units)"
  ) +
  theme_minimal()
audi_a1_data <- data %>% filter(make_model == "Audi A1")

# Scatter plot with regression line
# ggplot(audi_a1_data, aes(x = age, y = price)) +
#   geom_point(alpha = 0.6) +
#   geom_smooth(method = "lm", se = TRUE, color = "green") +
#   labs(
#     title = "Price vs Age for Audi A1",
#     x = "Age (years)",
#     y = "Price (in units)"
#   ) +
#   theme_minimal()
# 
# audi1_age_model <- lm(price ~ age, data = audi_a1_data)
# summary(audi1_age_model)

# Boxplot for price by age for Audi A1
ggplot(audi_a1_data, aes(x = factor(age), y = price)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Boxplot of Price by Age for Audi A1",
    x = "Age (years)",
    y = "Price (in units)"
  ) +
  theme_minimal()
{r mileModels, ref.label=knitr::all_labels(), echo=TRUE, eval=FALSE}
# #scatter plot
# ggplot(audi_a3_data, aes(x = mileage_km, y = price)) +
#   geom_point(alpha = 0.6) +
#   geom_smooth(method = "lm", se = TRUE, color = "red") +
#   scale_x_continuous(labels = scales::comma, breaks = seq(0, 300000, by = 50000)) +
#   labs(
#     title = "Price vs Mileage for Audi A3",
#     x = "Mileage (km)",
#     y = "Price (in units)"
#   ) +
#   theme_minimal()
# 
# audi_mile_model <- lm(price ~ mileage_km, data = audi_a3_data)
# summary(audi_mile_model)

# Boxplot
ggplot(audi_a3_data, aes(x = cut(mileage_km, breaks = c(0, 50000, 100000, 150000, 200000, 250000, 300000),
                                 labels = c("0-50k", "50k-100k", "100k-150k", "150k-200k", "200k-250k", "250k-300k")),
                         y = price)) +
  geom_boxplot(fill = "pink") +
  labs(
    title = "Boxplot of Price by Mileage for Audi A3",
    x = "Mileage Range (km)",
    y = "Price (in units)"
  ) +
  theme_minimal()

# Boxplot
ggplot(opel_insignia_data, aes(x = cut(mileage_km, breaks = c(0, 50000, 100000, 150000, 200000, 250000, 300000),
                                       labels = c("0-50k", "50k-100k", "100k-150k", "150k-200k", "200k-250k", "250k-300k")),
                               y = price)) +
  geom_boxplot(fill = "lightblue") +
  labs(
    title = "Boxplot of Price by Mileage for Opel Insignia",
    x = "Mileage Range (km)",
    y = "Price (in units)"
  ) +
  theme_minimal()

# Boxplot
# This plot shows the distribution of price for each mileage group
ggplot(audi_a1_data, aes(x = cut(mileage_km, breaks = c(0, 50000, 100000, 150000, 200000, 250000, 300000),
                                 labels = c("0-50k", "50k-100k", "100k-150k", "150k-200k", "200k-250k", "250k-300k")),
                         y = price)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Boxplot of Price by Mileage for Audi A1",
    x = "Mileage Range (km)",
    y = "Price (in units)"
  ) +
  theme_minimal()
