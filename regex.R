# Чуфаров К.Н.

# Скачайте сведения о тектонических изменениях
shakes <- readLines("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2017/master/data/earthquakes_2011.html", warn=FALSE)

# Примените фильтрацию с регулярными масками и используйте отбор через grep
# Найдите строчки, начинающиеся с числового набора в формате ГГГГ/ММ/ДД
mask <- "^\\d{4}/\\d{2}/\\d{2}"
filtered_lines <- grep(mask, shakes, value = TRUE)


# Проверить, что все считалось нормально
# Показать начальные и конечные элементы для проверки
cat("Найденные строки с шаблоном (ПЕРВЫЕ): \n")
print(head(filtered_lines, 5))
cat("Найденные строки с шаблоном (ПОСЛЕДНИЕ): \n")
print(tail(filtered_lines, 5))