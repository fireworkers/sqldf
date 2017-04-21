#Set new working directory
setwd("~/Desktop/workshop/sqldf")
#Check our working directory
getwd()

#Install packages for sqldf
install.packages("sqldf", dependencies=TRUE)
#Load the installed packages
library("sqldf")

#Put the dataset
mammals <- read.csv("mammal_stats.csv", header=TRUE)
#Look at the top of the dataset
head(mammals)
#Lokk at the bottom of the dataset
tail(mammals)
#Number of columns in the datset
ncol(mammals)
#Open and look at the dataset
View(mammals)

#Use sqlite
#The syntax in the quotes is SQL language
sqldf("select * from mammals limit 10")

#Choosing specific rows
sqldf("select distinct `order` from mammals")
sqldf("select distinct `order`, species from mammals")

#Filtering for a specific order
sqldf("select * from mammals where `order` = 'Carnivora'")

sqldf("select 'order', species from mammals where `order`='Carnivora'")
#Only show 3 rows
sqldf("select * from mammals where `order`='Carnivora' limit 3")
#Show in descending order by a specific column and limit it to 10
sqldf("select * from mammals where `order`='Carnivora' order by adult_body_mass_g desc limit 10")
#Show any species that starts with Canis
sqldf("select * from mammals where species like 'Canis%'")
#Rename the column for order as taxonOrder
sqldf("select distinct `order` as taxonOrder from mammals")
#Show litter_size that are not NA and limit to 10
sqldf("select * from mammals where litter_size is not null limit 10")

sqldf("select * from mammals where litter_size is not null and less '1'")

#Making a new dataset with new column names
mammalsEdited <-sqldf("select `order` as taxonOrder, species, adult_body_mass_g as mass from mammals")

head(mammalsEdited)
#removing spaces and replacing with an underscore between names of two columns
sqldf("select taxonOrder || '_' ||species as name from mammalsEdited limit 10")
#removing the spaces and replacing with underscore within the same column name
taxonSTring <- sqldf("select species, taxonOrder || '_' || replace(species, ' ','_') as name from mammalsEdited limit 10")

head(taxonSTring)
#count the species and group them in descending order by taxonorder
numberSpecies <- sqldf("select count(species) as cnt, taxonOrder from mammalsEdited group by taxonOrder order by cnt desc")

head(numberSpecies)

#Max adult_body_mass_g and the species it is
sqldf("select species, max(adult_body_mass_g) from mammals")

#Make a database to connect to
db <- dbConnect(SQLite(), dbname="mammalsdb.sqlite")

#Create a database with a table
dbSendQuery(conn = db,
            "create table mammal(TaxonOrder Text, species TEXT, mass NUMERIC, length NUMERIC, range NUMERIC, litterSize NUMERIC)")
#Check that I have a table within my database
dbListTables(db)
#Check what fields, the different columns I named for the table, are in the table
dbListFields(db, "Mammal")

#Remove the table
dbRemoveTable(db, "Mammal")

dbWriteTable(conn=db, name = "Mammalcsv", value = mammals, row.names=TRUE)
#Has the column names
dbListFields(db, "Mammalcsv")
#Read the table
dbReadTable(db, "Mammalcsv")
#Not using RSql, but now we used SQLite
#Must end with ; for that phrase
results <- dbGetQuery(db, "Select species, avg(litter_size) from Mammalcsv group by species;")
head(results)


