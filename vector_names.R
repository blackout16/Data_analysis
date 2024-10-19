# Чуфаров К.Н.

# Урал (Домашние матчи)
ural_home <- c(2, 0, 1, 0)

# Выездные
ural_away <- c(0, 0, 1, 1)

# Напечатайте на консоль оба вектора
print(ural_home)
print(ural_away)

# Назначим имена элементам вектора (Команды Гости)
names(ural_home) <- c("Ufa", "CSKA", "Arsenal", "Anzhi")

# Проделайте то же самое для вектора ural_away, назначив имена команд гостей (away_names)
away_names <- c("Rostov", "Amkar", "Rubin", "Orenburg")
names(ural_away) <- away_names

# Напечатайте на консоль оба вектора, заметьте разницу
print(ural_home)
print(ural_away)

# Посчитайте статистику домашних и выездных матчей (общее количество голов, среднее количество голов)
total_home_goals <- sum(ural_home)
total_away_goals <- sum(ural_away)
mean_home_goals <- mean(ural_home)
mean_away_goals <- mean(ural_away)

print(paste("Всего голов дома - ", total_home_goals))
print(paste("Всего голов в гостях - :", total_away_goals))
print(paste("Среднее количество голов дома - ", mean_home_goals))
print(paste("Среднее количество голов в гостях - ", mean_away_goals))

# Сравните векторы ural_home и ural_away и сделайте вывод
if (mean_home_goals > mean_away_goals) {
  print("В среднем, Урал забивает больше голов дома.")
} else if (mean_home_goals < mean_away_goals) {
  print("В среднем, Урал забивает больше голов на выезде.")
} else {
  print("Среднее количество голов дома и на выезде одинаково.")
}
