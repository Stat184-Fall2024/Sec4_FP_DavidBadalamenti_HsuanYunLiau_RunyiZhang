library(tidyverse)

data <- read.csv("C:\\Users\\z1889\\OneDrive\\桌面\\184\\final_scout_not_dummy.csv")

missing_summary <- colSums(is.na(data))
print(missing_summary)

# Step 2: Data type conversion
cols_to_numeric <- c("price", "km", "hp_kW", "Displacement_cc", "Weight_kg", "cons_comb")
data[cols_to_numeric] <- lapply(data[cols_to_numeric], as.numeric)

data <- data %>% distinct()

#Rename columns for consistency
data <- data %>% rename(
  make_model = make_model,
  body_type = body_type,
  price = price,
  mileage_km = km,
  fuel_type = Fuel,
  gears = Gears,
  gearing_type = Gearing_Type,
  horsepower_kW = hp_kW,
  displacement_cc = Displacement_cc,
  weight_kg = Weight_kg,
  consumption_comb = cons_comb
)

# Handle outliers
# I remove rows where price or mileage is unrealistically high/low
data <- data %>% 
  filter(price > 1000 & price < 100000, mileage_km > 0 & mileage_km < 500000)

data$fuel_type <- tolower(data$fuel_type)
data$fuel_type <- str_replace_all(data$fuel_type, "benzin", "benzine")

write.csv(data, "C:/Users/z1889/OneDrive/桌面/184/cleaned_scout_data.csv", row.names = FALSE)

summary(data)
