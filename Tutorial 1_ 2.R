rm(list=ls())
library(tidyverse)
library(dslabs)

data= gapminder
## for this exercise choose any three countries
data1 = as.data.frame(filter(data, country %in% c("China", "United States", "India")))
## Plot the life expectancy for each of these countries
summary(data)

ggplot(data, aes(year,gdp))+
  geom_bar(stat="identity")

###
data1 = as.data.frame(filter(data, country %in% c("China", "United States", "India")))
## Plot the life expectancy for each of these countries

ggplot(data1, aes(year,gdp))+
  geom_bar(stat="identity")

#####
fig <- ggplot(data1, aes(year,gdp))+ 
  geom_bar(aes(fill=country),stat="identity") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig

######
fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig


######

fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity", position= "dodge") + 
  geom_smooth(method = lm)
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig





fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity") + 
  geom_smooth(method = lm )
theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig



fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity") + 
  geom_smooth(method = lm ) +
theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig


fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity") + 
  geom_smooth(method = lm, aes(linetype = country) ) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig




## Changing themes
library(ggthemes)
fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity") + 
  geom_smooth(method = lm ) +
  theme_economist()
theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig

## Scales look awful

fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity") + 
  geom_smooth(method = lm ) +
  theme_economist()
theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig


### Dodge

fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity", position="dodge") + 
  theme_economist()
theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig

fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
  geom_bar(stat="identity", position="dodge") + 
  geom_smooth()
  theme_economist()+
theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable") 
fig



## adding Scatterplots 
 
fig = ggplot(data1, aes(x=gdp, y=fertility))+
  geom_point()
fig


### 

fig = ggplot(data1, aes(x=gdp, y=fertility))+
  geom_point(aes(color= country))
fig


# In countries of low gdp, the fertility is higher 

fig <- fig + scale_x_log10()
fig


fig <- fig + geom_point(aes(size=population))
fig


#### 

rm(fig)

fig<- ggplot(data1, aes(x=gdp, y=fertility,  color=country)) +
  geom_point(aes(size=population))
fig


## Investigating infant mortality. The probability that a child born in a specific year will die before reaching the age of one, 
## if subject to current age-specific mortality rates. Expressed as a rate per 1,000 live births.

## we shall also construct another variable called gdp per capita

data1$lgdppop = log(data1$gdp/data1$population)


##
p <- ggplot(data1, aes(x = lgdppop, y = fertility)) + 
  geom_point()+
  aes(color=country)+
  geom_smooth()
p


# Explain the main trends


## Lets investigagte the relationshi between infant mortality and fertility



p <- ggplot(data1, aes(x = fertility, y = infant_mortality)) + 
  geom_point()+
  aes(color=country)+
  geom_smooth()
p



p <- ggplot(data1, aes(x = fertility, y = infant_mortality)) + 
  geom_point(aes(size=lgdppop))+
  aes(color=country)+
  geom_smooth()
p



### Use boxplots to identify outliers

fig = ggplot(data1, aes(country, infant_mortality))+
  geom_boxplot()
fig

## These points are outliers. 


fig = ggplot(data1, aes(country, infant_mortality))+
  geom_boxplot()
fig



## Draw up a table of statistics for the gdp per capita for each country ### Compare your findings. 




#Draw the distribution for the life expectancy ? Does this new visual plot contribute to a better understanding of life expectancy compared to the data you produced before?

ggplot(data1,aes(fill = country, x = life_expectancy)) +
  geom_density(alpha = 0.5) +
  labs(title = "probability Density Function")




# Back to scatterplots, would you agree that more populous countries (countries with higher population) have higher GDP per capita ? 
# First draw the correlation and then 


# visualization technique to investigate this problem ?



p <- ggplot(data1, aes(x = log(population), y = lgdppop)) + 
  geom_point()+
  aes(color=country, colour = "black", size = 0.05)+
  geom_smooth(method = "lm", )
p



data2 = na.omit(data1)
cor(data2$lgdppop,data2$gdp)

