# Дисперсионный анализ. Лабораторная
# Чуфаров К.Н. РИ-411055.

# Загрузим данные
data <- read.csv("data/diet.csv", row.names = 1)
summary(data)

# Переименуем колонки для удобства
colnames(data) <- c("gender", "age", "height", "initial.weight", 
                    "diet.type", "final.weight")
data$diet.type <- factor(c("A", "B", "C")[data$diet.type])

# Добавим новую колонку - Похудение
data$weight.loss <- data$initial.weight - data$final.weight

# Построим boxplot для визуализации потери веса по диетам
boxplot(weight.loss ~ diet.type, data = data, col = "light gray",
        ylab = "Weight loss (kg)", xlab = "Diet type")
abline(h = 0, col = "green")

# Проверим, сбалансированные ли данные
table(data$diet.type)

# График групповых средних
library(gplots) # библиотека устанавливается с помощью install.packages
plotmeans(weight.loss ~ diet.type, data = data)
aggregate(data$weight.loss, by = list(data$diet.type), FUN = sd)

# ANOVA модель для межгрупповых различий
fit <- aov(weight.loss ~ diet.type, data = data)
summary(fit)

# Пост-хок тест (Tukey HSD) для сравнения средних значений
TukeyHSD(fit)

# Tukey HSD график
library(multcomp)
par(mar = c(5, 4, 6, 2))
tuk <- glht(fit, linfct = mcp(diet.type = "Tukey"))
plot(cld(tuk, level = .05), col = "lightgrey")

# Удаление выбросов с использованием Z-оценки
data$z_scores <- (data$weight.loss - mean(data$weight.loss)) / sd(data$weight.loss)
data_no_outliers <- data[abs(data$z_scores) <= 3, ]

# ANOVA для данных без выбросов
fit_no_outliers <- aov(weight.loss ~ diet.type, data = data_no_outliers)
summary(fit_no_outliers)

# Пост-хок тест для данных без выбросов
TukeyHSD(fit_no_outliers)

# Исследовательские задания из Diet_data_description.docx:

# 1. Paired t-test: проверка потери веса без учета диет
t.test(data$initial.weight, data$final.weight, paired = TRUE)

# 2. Calculate weight loss (уже вычислено и добавлено в data$weight.loss)

# 3. Summary statistics by diet
aggregate(data$weight.loss, by = list(data$diet.type), FUN = summary)

# 4. One-way ANOVA: различия по диетам и гендерные различия
fit_diet <- aov(weight.loss ~ diet.type, data = data)
summary(fit_diet)

fit_gender <- aov(weight.loss ~ gender, data = data)
summary(fit_gender)

# 5. Two-way ANOVA: влияние диеты и пола на потерю веса
fit_two_way <- aov(weight.loss ~ diet.type * gender, data = data)
summary(fit_two_way)

# 6. Interactions: график средних значений потери веса по диете и полу
interaction.plot(data$diet.type, data$gender, data$weight.loss,
                 main = "Interaction Plot of Weight Loss by Diet and Gender",
                 ylab = "Weight Loss (kg)", xlab = "Diet Type")

# 7. ANCOVA: влияние диеты и пола на потерю веса с учетом роста
fit_ancova <- aov(weight.loss ~ diet.type * gender + height, data = data)
summary(fit_ancova)

