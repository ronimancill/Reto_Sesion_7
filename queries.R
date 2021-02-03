install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")

library(DBI)
library(RMySQL)
library(dplyr)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

# Ahora si se quieren desplegar los campos o variables que contiene la tabla 
# City se harÃ¡ lo siguiente

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

class(DataDB)
head(DataDB)

habla_espa <-  DataDB %>% filter(Language == "Spanish")
head(habla_espa)



