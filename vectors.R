# Чуфаров К.Н.

# Векторы числовой и строковый
num_vector <- c(1, 10, 49)
char_vector <- c("a", "b", "c")

# Заполните булевый вектор (например, пусть первые два элемента TRUE, а третий - FALSE)
bool_vector <- c(TRUE, TRUE, FALSE)

# Выберите из числового вектора значения при помощи булевого вектора
selected_num <- num_vector[bool_vector]
print(selected_num)

# Повторите то же самое для строкового вектора
selected_char <- char_vector[bool_vector]
print(selected_char)

# Составьте булевый вектор из числового, выбрав элементы, большие 10
x <- num_vector > 10
print(x)

# С помощью вектора x выберите из числового вектора данные
selected_num_gt10 <- num_vector[x]
print(selected_num_gt10)

# Запишите то же самое без применения промежуточной переменной x
selected_num_gt10_direct <- num_vector[num_vector > 10]
print(selected_num_gt10_direct)

# Придумайте подобный пример для строкового вектора (например, выберем элементы, которые не равны "b")
char_vector_not_b <- char_vector[char_vector != "b"]
print(char_vector_not_b)
