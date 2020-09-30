# library()
# pools= read.csv("Data//swimming_pools.csv", stringsAsFactors = FALSE)
# str(pools)

hotdogs = read.delim("Data//hotdogs.txt", header = FALSE)
summary(hotdogs)

hotdogs2 = read.delim("Data//hotdogs.txt", header = FALSE,
                      col.names = c("type", "calories", "sodium"),
                      colClasses = c("factor", "NULL", "numeric"))

str(hotdogs2)

hotdogs2 %>% 
  View()


hotdogs = read.table("Data//hotdogs.txt", sep="\t", col.names = c("type", "calories", "sodium"))

head(hotdogs)

leastcalories = hotdogs[which.min(hotdogs$calories),]
mostsodium = hotdogs[which.max(hotdogs$sodium),]

leastcalories
mostsodium


install.packages("readr")
library(readr)

properties = c("area", "temp", "size", "storage", "method", "texture", "flavor", "moistness")

potatoes_char = read_tsv("Data//potatoes.txt", col_types = "cccccccc", col_names = properties)

str(potatoes_char)

potatoes_fragment = read_tsv("Data//potatoes.txt", skip=6, n_max = 5, col_names = properties)

str(potatoes_fragment)
install.packages("readxl")
library(readxl)



excel_sheets(file.path("Data", "urbanpop.xlsx"))


pop_1 = read_excel("Data//urbanpop.xlsx", sheet = 1)
pop_2 = read_excel("Data//urbanpop.xlsx", sheet = 2)
pop_3 = read_excel("Data//urbanpop.xlsx", sheet = 3)

pop_list = list(pop_1, pop_2, pop_3)
str(pop_list)

pop_list = lapply(excel_sheets("Data//urbanpop.xlsx"), read_excel, path = "Data//urbanpop.xlsx")

str(pop_list)


pop_a = read_excel("data//urbanpop_nonames.xlsx", col_names = FALSE)
cols = c("country", paste0("year_", 1960:1966))
pop_b = read_excel("data//urbanpop_nonames.xlsx", col_names = cols)

summary(pop_a)
summary(pop_b)


urbanpop_sel = read_excel("urbanpop.xlsx", sheet = 2, col_names = FALSE, skip = 21)
# urbanpop_sel = read_excel("urbanpop.xlsx", sheet = 2, col_names = FALSE, skip = 22)

urbanpop_sel[1,]
