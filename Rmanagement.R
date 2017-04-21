
#Clear global environment
rm(list=ls())
#load the dataset
mammals= read.csv('~/Desktop/workshop/sqldf/mammal_stats.csv')
#Check our working directory
getwd()
#If in the wrong working directory change it to the working one
setwd("~/Desktop/workshop")
#Install dplyr
install.packages('dplyr')
#Load dplyr
library(dplyr)

head(mammals)
glimpse(mammals)
#Isolating specific columns from a dataset
select(mammals, order, species)
?select
#Only the select function from the dplyr package
dplyr::select()
#select from the dataset mammals
#Show only the top few rows that starts with adult
head(select(mammals, starts_with('adult')))
#Show the first few rows from a dataset, but remove the order column
head(select(mammals, -order))
#Filters out only when order equals a specific string
head(filter(mammals, order=="Carnivora"))
# & is and
2==3 & 1==1
# | is or
2==3 | 1==1
#Not equal
2!=3
2!=2


filter(mammals, order=="Carnivora")
filter(mammals, order!="Carnivora")
head(filter(mammals, order=="Carnivora" & adult_body_mass_g <5000))


#sort by a specific column
head(arrange(mammals, adult_body_mass_g))
#Sort by a specific column in descending order
head(arrange(mammals, desc(adult_body_mass_g)))
#Sort alphabetically by order and then by mass
head(arrange(mammals, order, adult_body_mass_g))

mammals_group <- group_by(mammals, order)
head(mammals_group)
#Give mean body sizes for each of the orders by removing all the NA aka na.rm is a default
#Also the standard deviation
#Renamed each of the mean and sd
mammals_summary <- summarize(mammals_group, mean_mass=mean(adult_body_mass_g, na.rm=TRUE),
          sd_mass=sd(adult_body_mass_g, na.rm= TRUE))

head(mammals_summary)

mammals_mutate <- mutate(mammals_group, mean_mass=mean(adult_body_mass_g, na.rm=TRUE),
                             sd_mass=sd(adult_body_mass_g, na.rm= TRUE))
View(mammals_mutate)

mammals_mutate$normalized_mass <- mammals_mutate$adult_body_mass_g/mammals_mutate$mean_mass
glimpse(mammals_mutate)

head(arrange(mammals_mutate, desc(normalized_mass)))
#pipelining
capybara = mammals %>%
  group_by('order')%>%
  mutate(mean_mass=mean(adult_body_mass_g, na.rm=TRUE),
         normalized_mass= adult_body_mass_g/mean_mass) %>%
  arrange(desc(normalized_mass))%>%
  select(species, normalized_mass, adult_body_mass_g)


e = mammals %>%
  filter( order=='Carnivora', adult_body_mass_g)%>%
  arrange(desc(adult_body_mass_g))%>%
  select(species, max(adult_body_mass_g))
  #filter(species & adult_body_mass_g >1200000)
  
b <- filter(mammals, order == 'Primates')
#Look at the dimensions of a dataset
dim(b)
#look at the number of rows
nrow(b)



#Which order has most species

order_species <- mammals %>%
  group_by(order) %>%
           summarize(num_species = length(species))%>%
            arrange(desc(num_species))
head(order_species)

range_mass <- mammals %>%
  group_by (order)%>%
  summarize(range_size = max(adult_body_mass_g, na.rm=TRUE)- min(adult_body_mass_g, na.rm=TRUE))%>%
  arrange(desc(range_size))
head(range_mass)



