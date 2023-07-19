setwd("/Users/machikara/Desktop/Application_2017fall/UALR_Courses/IFSC\ 5399/R_Projects/USCS_1999_2015_ASCII/")
data_raw_age <- read.table('BYAGE.TXT', header=T, sep='|') #import data_byage
levels_age <- c("<1","1-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50-54",
                "55-59","60-64","65-69","70-74","75-79","80-84","85+")
data_raw_age$AGE <- factor(data_raw_age$AGE, levels = levels_age)
data_raw_age$RATE <- as.numeric(as.character(data_raw_age$RATE))
data_raw_age$COUNT <- as.numeric(as.character(data_raw_age$COUNT))
data_allage_f_mortality_allsites_years <- subset(data_raw_age, EVENT_TYPE == "Mortality" & SEX == "Female" & SITE == "All Cancer Sites Combined" & RACE =="All Races")
data_allage_f_mortality_allsites_years <- data_allage_f_mortality_allsites_years[-which(data_allage_f_mortality_allsites_years$YEAR == "2011-2015"),]
#data_allage_mortality_allsites_ordered <- data_allage_mortality_allsites[order(data_age$AGE),]
#data_allage_mortality_allsites$RATE[which(data_allage_mortality_allsites$AGE == "75-79")]
###The Overall View of Cancer Mortality Rate of Female###
library(ggplot2)
#plot the rate by age
g1 <- ggplot(data_allage_f_mortality_allsites_years,aes(x=AGE, y=RATE,col=YEAR)) + geom_point(aes(size=COUNT)) + 
 labs(title = "Female Cancer Mortality Rate of All Sites", y = "Rate per 100,000 People 1999-2015", x = "Age Range") 
g1 + theme(plot.title = element_text(hjust = 0.5))    
#plot the satcked rate by race
data_allage_f_mortality_allsites_byrace <- subset(data_raw_age, EVENT_TYPE == "Mortality" & SEX == "Female" & SITE == "All Cancer Sites Combined")
data_allage_f_mortality_allsites_byrace <- data_allage_f_mortality_allsites_byrace[-which(data_allage_f_mortality_allsites_byrace$YEAR == "2011-2015"),]
data_allage_f_mortality_allsites_byrace <- data_allage_f_mortality_allsites_byrace[-which(data_allage_f_mortality_allsites_byrace$RACE == "All Races"),]
library(RColorBrewer)
#coul = brewer.pal(4, "BuPu")
#coul = colorRampPalette(coul)(25)
cus_blues = colorRampPalette(brewer.pal(9,"Blues"))(19)
g2 <- ggplot(data_allage_f_mortality_allsites_byrace,aes(x=RACE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Female Cancer Mortality Rate of All Sites based on Races", y = "Rate per 100,000 People", x = "Race") 
g2 + theme(plot.title = element_text(hjust = 0.5)) + scale_x_discrete(labels = c("American India/\nAlaska Native", "Asian/\nPacific Islander","Balck", "Hispanic", "White")) +
  scale_fill_manual(values = cus_blues) + coord_polar("x", start=0)
#plot the satcked rate by site
data_allage_f_mortality_allraces_bysite <- subset(data_raw_age, EVENT_TYPE == "Mortality" & SEX == "Female" & RACE =="All Races")
data_allage_f_mortality_allraces_bysite <- data_allage_f_mortality_allraces_bysite[-which(data_allage_f_mortality_allraces_bysite$YEAR == "2011-2015"),]
data_allage_f_mortality_allraces_bysite <- data_allage_f_mortality_allraces_bysite[-which(data_allage_f_mortality_allraces_bysite$SITE == "All Cancer Sites Combined"),]
cus_greens = colorRampPalette(brewer.pal(9,"BuGn"))(30)
g3 <- ggplot(data_allage_f_mortality_allraces_bysite,aes(x=SITE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Female Cancer Mortality Rate of All Sites based on Sites", y = "Rate per 100,000 people", x = "Site") 
g3 + theme(plot.title = element_text(hjust = 0.5)) + scale_fill_manual(values = cus_greens) +coord_flip() 
###overall mortality of male cancers###
data_allage_m_mortality_allsites_years <- subset(data_raw_age, EVENT_TYPE == "Mortality" & SEX == "Male" & SITE == "All Cancer Sites Combined" & RACE =="All Races")
data_allage_m_mortality_allsites_years <- data_allage_m_mortality_allsites_years[-which(data_allage_m_mortality_allsites_years$YEAR == "2011-2015"),]
#plot the rate by age
g1 <- ggplot(data_allage_m_mortality_allsites_years,aes(x=AGE, y=RATE,col=YEAR)) + geom_point(aes(size=COUNT)) + 
  labs(title = "Male Cancer Mortality Rate of All Sites", y = "Rate per 100,000 People 1999-2015", x = "Age Range") 
g1 + theme(plot.title = element_text(hjust = 0.5))    
#plot the satcked rate by race
data_allage_m_mortality_allsites_byrace <- subset(data_raw_age, EVENT_TYPE == "Mortality" & SEX == "Male" & SITE == "All Cancer Sites Combined")
data_allage_m_mortality_allsites_byrace <- data_allage_m_mortality_allsites_byrace[-which(data_allage_m_mortality_allsites_byrace$YEAR == "2011-2015"),]
data_allage_m_mortality_allsites_byrace <- data_allage_m_mortality_allsites_byrace[-which(data_allage_m_mortality_allsites_byrace$RACE == "All Races"),]
g2 <- ggplot(data_allage_m_mortality_allsites_byrace,aes(x=RACE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Male Cancer Mortality Rate of All Sites based on Races", y = "Rate per 100,000 People", x = "Race") 
g2 + theme(plot.title = element_text(hjust = 0.5)) + scale_x_discrete(labels = c("American India/\nAlaska Native", "Asian/\nPacific Islander","Balck", "Hispanic", "White")) +
  scale_fill_manual(values = cus_blues) + coord_polar("x", start=0)
data_allage_m_mortality_allraces_bysite <- subset(data_raw_age, EVENT_TYPE == "Mortality" & SEX == "Male" & RACE =="All Races")
data_allage_m_mortality_allraces_bysite <- data_allage_m_mortality_allraces_bysite[-which(data_allage_m_mortality_allraces_bysite$YEAR == "2011-2015"),]
data_allage_m_mortality_allraces_bysite <- data_allage_m_mortality_allraces_bysite[-which(data_allage_m_mortality_allraces_bysite$SITE == "All Cancer Sites Combined"),]
g3 <- ggplot(data_allage_m_mortality_allraces_bysite,aes(x=SITE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Male Cancer Mortality Rate of All Sites based on Sites", y = "Rate per 100,000 people", x = "Site") 
g3 + theme(plot.title = element_text(hjust = 0.5)) + scale_fill_manual(values = cus_greens) +coord_flip() 
#plot the rate by age
data_allage_f_incidence_allsites_years <- subset(data_raw_age, EVENT_TYPE == "Incidence" & SEX == "Female" & SITE == "All Cancer Sites Combined" & RACE =="All Races")
data_allage_f_incidence_allsites_years <- data_allage_f_incidence_allsites_years[-which(data_allage_f_incidence_allsites_years$YEAR == "2011-2015"),]
###The Overall View of Cancer Incidence Rate of Female###
g1 <- ggplot(data_allage_f_incidence_allsites_years,aes(x=AGE, y=RATE,col=YEAR)) + geom_point(aes(size=COUNT)) + 
  labs(title = "Female Cancer Incidence Rate of All Sites", y = "Rate per 100,000 People 1999-2015", x = "Age Range") 
g1 + theme(plot.title = element_text(hjust = 0.5)) 
#plot the satcked rate by race
data_allage_f_incidence_allsites_byrace <- subset(data_raw_age, EVENT_TYPE == "Incidence" & SEX == "Female" & SITE == "All Cancer Sites Combined")
data_allage_f_incidence_allsites_byrace <- data_allage_f_incidence_allsites_byrace[-which(data_allage_f_incidence_allsites_byrace$YEAR == "2011-2015"),]
data_allage_f_incidence_allsites_byrace <- data_allage_f_incidence_allsites_byrace[-which(data_allage_f_incidence_allsites_byrace$RACE == "All Races"),]
g2 <- ggplot(data_allage_f_incidence_allsites_byrace,aes(x=RACE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Female Cancer Incidence Rate of All Sites based on Races", y = "Rate per 100,000 People", x = "Race") 
g2 + theme(plot.title = element_text(hjust = 0.5)) + scale_x_discrete(labels = c("American India/\nAlaska Native", "Asian/\nPacific Islander","Balck", "Hispanic", "White")) +
  scale_fill_manual(values = cus_blues) + coord_polar("x", start=0)
#plot the satcked rate by site
data_allage_f_incidence_allraces_bysite <- subset(data_raw_age, EVENT_TYPE == "Incidence" & SEX == "Female" & RACE =="All Races")
data_allage_f_incidence_allraces_bysite <- data_allage_f_incidence_allraces_bysite[-which(data_allage_f_incidence_allraces_bysite$YEAR == "2011-2015"),]
data_allage_f_incidence_allraces_bysite <- data_allage_f_incidence_allraces_bysite[-which(data_allage_f_incidence_allraces_bysite$SITE == "All Cancer Sites Combined"),]
data_allage_f_incidence_allraces_bysite <- data_allage_f_incidence_allraces_bysite[-which(data_allage_f_incidence_allraces_bysite$SITE == "Female Breast, <i>in situ</i>"),]
g3 <- ggplot(data_allage_f_incidence_allraces_bysite,aes(x=SITE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Female Cancer Incidence Rate of All Sites based on Sites", y = "Rate per 100,000 people", x = "Site") 
g3 + theme(plot.title = element_text(hjust = 0.5)) + scale_fill_manual(values = cus_greens) +coord_flip() 

#plot the rate by age
data_allage_m_incidence_allsites_years <- subset(data_raw_age, EVENT_TYPE == "Incidence" & SEX == "Male" & SITE == "All Cancer Sites Combined" & RACE =="All Races")
data_allage_m_incidence_allsites_years <- data_allage_m_incidence_allsites_years[-which(data_allage_m_incidence_allsites_years$YEAR == "2011-2015"),]
###The Overall View of Cancer Incidence Rate of Male###
g1 <- ggplot(data_allage_m_incidence_allsites_years,aes(x=AGE, y=RATE,col=YEAR)) + geom_point(aes(size=COUNT)) + 
  labs(title = "Male Cancer Incidence Rate of All Sites", y = "Rate per 100,000 People 1999-2015", x = "Age Range") 
g1 + theme(plot.title = element_text(hjust = 0.5)) 
#plot the satcked rate by race
data_allage_m_incidence_allsites_byrace <- subset(data_raw_age, EVENT_TYPE == "Incidence" & SEX == "Male" & SITE == "All Cancer Sites Combined")
data_allage_m_incidence_allsites_byrace <- data_allage_m_incidence_allsites_byrace[-which(data_allage_m_incidence_allsites_byrace$YEAR == "2011-2015"),]
data_allage_m_incidence_allsites_byrace <- data_allage_m_incidence_allsites_byrace[-which(data_allage_m_incidence_allsites_byrace$RACE == "All Races"),]
g2 <- ggplot(data_allage_m_incidence_allsites_byrace,aes(x=RACE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Male Cancer Incidence Rate of All Sites based on Races", y = "Rate per 100,000 People", x = "Race") 
g2 + theme(plot.title = element_text(hjust = 0.5)) + scale_x_discrete(labels = c("American India/\nAlaska Native", "Asian/\nPacific Islander","Balck", "Hispanic", "White")) +
  scale_fill_manual(values = cus_blues) + coord_polar("x", start=0)
#plot the satcked rate by site
data_allage_m_incidence_allraces_bysite <- subset(data_raw_age, EVENT_TYPE == "Incidence" & SEX == "Male" & RACE =="All Races")
data_allage_m_incidence_allraces_bysite <- data_allage_m_incidence_allraces_bysite[-which(data_allage_m_incidence_allraces_bysite$YEAR == "2011-2015"),]
data_allage_m_incidence_allraces_bysite <- data_allage_m_incidence_allraces_bysite[-which(data_allage_m_incidence_allraces_bysite$SITE == "All Cancer Sites Combined"),]
g3 <- ggplot(data_allage_m_incidence_allraces_bysite,aes(x=SITE, y=RATE, fill=AGE)) + geom_bar(stat = "identity")  +
  labs(title = "Male Cancer Incidence Rate of All Sites based on Sites", y = "Rate per 100,000 people", x = "Site") 
g3 + theme(plot.title = element_text(hjust = 0.5)) + scale_fill_manual(values = cus_greens) +coord_flip() 
#predict the female mortality rate of age 85+ based on previous data
mod_f_mortality_85 <- subset(data_allage_f_mortality_allsites_years, AGE == "85+")
mod_f_mortality_85 <- subset(mod_f_mortality_85, select=c("YEAR", "RATE"))
plot(mod_f_mortality_85)
mod_f_mortality_85$YEAR <- as.numeric(as.character(mod_f_mortality_85$YEAR))
premod_f_mortality_85 <- lm(RATE ~ YEAR, data=mod_f_mortality_85)
summary(premod_f_mortality_85)
coeff=coefficients(premod_f_mortality_85)
eq = paste0("The Linear Regression Model for Female 85+ Mortality Rate\n","y = ", round(coeff[2],1), "*x + ", round(coeff[1],1))
new_year <- c(2019, 2020)
sl = coeff[2]
int = coeff[1]
equation = sl * new_year + int
equation
new_data <- data.frame(YEAR = new_year, RATE = equation)
p <- ggplot(mod_f_mortality_85, aes(x=YEAR, y=RATE)) + geom_point(shape=1) +    # Use hollow circles
  geom_abline(slope=coeff[2], intercept=coeff[1], col="blue") + labs(title = eq) +
  xlim(1999, 2020) + ylim(1250, 1450) 
p + geom_point(data=new_data, color="red") + theme(plot.title = element_text(hjust = 0.5))
#add new points to the exisiting dataset
g1 <- ggplot(data_allage_f_mortality_allsites_years,aes(x=AGE, y=RATE,col=YEAR)) + geom_point(aes(size=COUNT)) + 
  labs(title = "Female Cancer Mortality Rate of All Sites", y = "Rate per 100,000 People 1999-2015", x = "Age Range") 
g1 + theme(plot.title = element_text(hjust = 0.5)) + annotate("point", x="85+", y=equation, col = "black", shape =3)

