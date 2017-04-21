install.packages('ggplot2')
library(ggplot2)
#First one is y axis and 2nd one is x axis
plot(adult_head_body_len_mm ~ adult_body_mass_g, data = mammals)

#AWESOME GRAPH
ggplot(data=mammals, aes(x = adult_body_mass_g, y=adult_head_body_len_mm)) + geom_point(size= .5, aes(color=order))+
 scale_x_log10() +scale_y_log10()


tails_n_whales <- filter(mammals, order == "Rodentia" | order == "Cetacea")


ggplot(data=tails_n_whales, aes(x = adult_body_mass_g, y=adult_head_body_len_mm)) + geom_point(size= .5, aes(color=order))+
  scale_x_log10() +scale_y_log10()

ggplot(data=tails_n_whales, aes(x= order, y = adult_body_mass_g)) + geom_boxplot(size=1, aes(color=order))+
  scale_y_log10()


ggplot(data = tails_n_whales, aes(x=adult_head_body_len_mm)) + 
  geom_histogram()

ggplot(data=mammals, aes(x=adult_body_mass_g, y= adult_head_body_len_mm))+
  geom_point()+scale_x_log10()+scale_y_log10()+
  facet_wrap(~order)

mammals$RangeCategory[mammals$home_range_km2 <= 0.01] <- "micro_machines"
mammals$RangeCategory[mammals$home_range_km2 > 0.01 & mammals$home_range_km2 <= 1] <- "homebodies"
mammals$RangeCategory[mammals$home_range_km2 > 0.1 & mammals$home_range_km2 <= 10] <- "strollers"
mammals$RangeCategory[mammals$home_range_km2 > 10 & mammals$home_range_km2 <= 100] <- "roamers"
mammals$RangeCategory[mammals$home_range_km2 > 100 & mammals$home_range_km2 <= 1000] <- "free_agents"
mammals$RangeCategory[mammals$home_range_km2 > 1000] <- "transcendentalists"

OrderSubset<-filter(mammals, order == "Rodentia" | order == "Cetacea" | order=="Primates" | order=="Carnivora") 


myplot + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    panel.background = element_rect(fill = "darkgoldenrod1")) <- ggplot(data=OrderSubset, aes(x=adult_body_mass_g))+
  geom_histogram(aes(fill=order))+
  scale_x_log10()+
  facet_grid(RangeCategory~order, scales="free")

install.packages('ggThemeAssist')

  theme(legend.position = 'bottom', 
        axis.title=element_text(angle=0, size=18, face = 'bold'))


ggsave('myplot.jpeg', width = 8, height = 10, units="in", dpi = 300)


a = ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm))


a+  geom_point()+
  scale_x_log10()+scale_y_log10()+ geom_smooth(method=lm)

