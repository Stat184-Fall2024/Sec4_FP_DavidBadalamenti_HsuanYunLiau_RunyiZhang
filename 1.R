# 加载必要的包
library(ggplot2)

# 读取数据
data <- read.csv("")

# 筛选出 Audi A1 的数据
audi_a1_data <- subset(data, make_model == "Audi A1")

# 检查数据结构
str(audi_a1_data)

# 创建 "age" 变量（假设当前年份为2024）
audi_a1_data$age <- 2024 - as.numeric(audi_a1_data$registration_date)

# 删除缺失值
audi_a1_data <- na.omit(audi_a1_data[, c("price", "age")])

# 绘制 price 和 age 的关系图
ggplot(audi_a1_data, aes(x = age, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Relationship between Price and Age for Audi A1",
       x = "Age (years)",
       y = "Price (EUR)") +
  theme_minimal()

# 构建线性回归模型
model <- lm(price ~ age, data = audi_a1_data)
summary(model)

# 输出回归模型的结果
cat("Regression model summary:\n")
print(summary(model))
