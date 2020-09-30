# install.packages("fivethirtyeight")
# library(fivethirtyeight)
# library(dplyr)
# head(biopics, 10)
# 
# biopics %>% 
#   is.na() %>%   
#   colSums()  
# 
# 
# biopics %>% 
#   View()
# 
# 
# model_1 = lm(box_office ~ country+year_release, data = biopics)
# median(abs(biopics$box_office - model_1$fitted.values), na.rm=TRUE)
# 
# 
install.packages("VIM")
library(VIM)

head(tao)
tao %>% 
  is.na() %>% 
  colSums() %>% 
  

    
tao %>% 
  group_by(Year) %>% 
  summarise(sumAirTem = sum(is.na(Air.Temp)))
  

# Create a binary indicator for missing values in air_temp
tao_imp = tao %>% 
mutate(Air.Temp_imp = ifelse(is.na(Air.Temp), TRUE, FALSE)) %>%
  # Impute air_temp with its mean
mutate(Air.Temp = ifelse(is.na(Air.Temp), mean(Air.Temp, na.rm = TRUE), Air.Temp))



tao_imp %>% 
  select(Air.Temp, Sea.Surface.Temp, Air.Temp_imp) %>%
  marginplot(delimiter = "imp")



#
tao_imp <- hotdeck(tao, variable = "Air.Temp")


tao_imp %>% 
  is.na() %>% 
  colSums() 

tao_imp %>% 
  select(Air.Temp, Sea.Surface.Temp, Air.Temp_imp) %>% 
  marginplot(delimiter = "imp")


tao %>% 
  group_by(Year) %>% 
  summarize(average_air_temp = mean(Air.Temp, na.rm = TRUE))


tao_imp <- hotdeck(tao, variable = "Air.Temp", domain_var = "Year")

tao_imp %>% 
  select(Air.Temp, Sea.Surface.Temp, Air.Temp_imp) %>% 
  marginplot(delimiter = "imp")


tao_imp <- hotdeck(tao, variable = "Air.Temp", ord_var = "Sea.Surface.Temp")


tao_imp %>% 
  select(Air.Temp, Sea.Surface.Temp, Air.Temp_imp) %>% 
  marginplot(delimiter = "imp")





# KNN
tao_imp <- kNN(tao, k = 30, variable = "Humidity")

tao_imp %>% 
  select(Sea.Surface.Temp, Humidity, Humidity_imp) %>% 
  marginplot(delimiter = "imp", main = "k = 30")



tao_imp <- kNN(tao, k = 30, variable = "Humidity")

tao_imp %>% 
  select(Sea.Surface.Temp, Humidity, Humidity_imp) %>% 
  marginplot(delimiter = "imp", main = "k = 30")


tao_imp <- kNN(tao, k = 15, variable = "Humidity")

tao_imp %>% 
  select(Sea.Surface.Temp, Humidity, Humidity_imp) %>% 
  marginplot(delimiter = "imp", main = "k = 15")


tao_imp <- kNN(tao, k = 5, variable = "Humidity")

tao_imp %>% 
  select(Sea.Surface.Temp, Humidity, Humidity_imp) %>% 
  marginplot(delimiter = "imp", main = "k = 5")
