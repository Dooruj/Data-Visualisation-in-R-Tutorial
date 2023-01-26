## This script provides an answer to tutorial 1 (Go at your own space)


rm(list=ls())
install.packages("dslabs")
library("dslabs")
library(tidyverse)
library(ggthemes())

data("gapminder")
### If you want to call it data, you can do the following:
## data = gapminder 
data = gapminder
## for this exercise choose any three countries
data1 = as.data.frame(filter(data, country %in% c("China", "United States", "India")))
summary(data1)

# (1)	Plot a bar chart for the GDP (y-axis) of all the countries across the years (x-axis). 
# Make sure that you include a title for your plot. 

ggplot(data1, aes(year,gdp))+
  geom_bar(stat="identity")
  labs(title="Life expectancy over the years") 

  ## But if you want to differentiate between the countries in your plot :
  

  ggplot(data = data1, aes(x = year, 
                           y = gdp,
                           group = country,
                           fill = country)) +
    geom_bar(position="dodge", stat="identity") +
    scale_y_continuous(labels=scales::comma) +
    labs(title = "Figure 1. GDP of 3 countries") + 
    # personal preference - leave figure title in essay/report with captions
    theme_stata() +
    theme(legend.position="bottom", 
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  

  ## (2)	Plot a bar chart of the GDP for each country in a new plot. The basic
##answer is the following  
  

ggplot(data = data1, aes(x = year, 
                           y = gdp,
                           fill = country)) +
    geom_bar(position="dodge", stat="identity") +
    labs(title = "Figure 2. GDP of 3 countries") + 
    
    
## A nice plot could also be the following  
  
ggplot(data = data1, aes(x = year, 
                           y = gdp,
                           group = country,
                           fill = country)) +
    geom_bar(position="dodge", stat="identity") +
    scale_y_continuous(labels=scales::comma) +
    labs(title = "Figure 1. GDP of 3 countries") + 
    # personal preference - leave figure title in essay/report with captions
    theme_stata() +
    theme(legend.position="bottom", 
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  

## An even nicer answer would be the following:
  
  ggplot(data = data1, aes(x = year, 
                           y = gdp,
                           group = country,
                           fill = country)) +
  geom_bar(position="dodge", stat="identity") +
  scale_y_continuous(labels=scales::comma) +
  facet_wrap(~country) + # make separate countries in one plot
  labs(title = "Figure 2. GDP of 3 countries") + 
  theme_stata() +
  theme(legend.position="bottom", 
        legend.title = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_text(angle = 0),
        plot.title = element_text(hjust = 0.5))

  
###(3)	As you can see it is not very easy to pick trends in your barchart. Add the line depicting 
  ##the trends using the geom_smooth(method = lm) function.   
  
  ggplot(data = data, aes(x = year, 
                          y = gdp,
                          group = country,
                          fill = country)) +
    geom_bar(position="dodge", stat="identity") +
    geom_smooth(method = lm, colour = "black", size = 0.25) +
    scale_y_continuous(labels=scales::comma) +
    labs(title = "Figure 3. GDP of 3 countries") + 
    theme_stata() +
    theme(legend.position="bottom", 
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  
  # Figure 4 ---- 
## Here is a simple answer 
  fig <- ggplot(data1, aes(year,gdp, fill=country))+ 
    geom_bar(stat="identity") + 
    geom_smooth(method = lm ) +
    theme_economist()
  theme(axis.text.x = element_text(angle=90)) + 
    labs(title="Figure 4; Histogram with Economist Theme") 
  fig
  
  
  
  ggplot(data = data1, aes(x = year, 
                           y = gdp,
                           fill = country)) +
    geom_bar(position="dodge", stat="identity") +
    geom_smooth(method = lm, colour = "black", size = 0.25) +
    scale_y_continuous(labels=scales::comma) +
    labs(title = "Figure 4. GDP per capita of 3 countries") + 
    theme_economist() +
    theme(legend.position="bottom", 
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  

  
  
    
  # Figure 5 ---- 
  ggplot(data = data1, aes(x = year, 
                          y = gdp,
                          group = country,
                          fill = country)) +
    geom_bar(position="dodge", stat="identity") +
    geom_smooth(colour = "black", size = 0.25) +
    scale_y_continuous(labels=scales::comma) +
    labs(title = "Figure 5. GDP of 3 countries") + 
    theme_stata() +
    theme(legend.position="bottom", 
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  # Figure 6 ---- 

## Simple Answer
    
  fig = ggplot(data1, aes(x=gdp, y=fertility))+
    geom_point()+
    labs(title = "Figure 6. Relationship of 2 variables")
  fig
  
  
## More involved Answer  
  ggplot(data = data1, aes(x = gdp, 
                           y = fertility)) +
    geom_point() +
    scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 6. Relationship of 2 variables") + 
    theme_stata() +
    theme(legend.position="bottom", 
          legend.title = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  # Figure 7 ---- 
  
## Simple Answer  
  fig = ggplot(data1, aes(x=gdp, y=fertility))+
    geom_point(aes(color= country))
  fig
  
  
## Involved Answer  
  
  
  
  
  ggplot(data = data1, aes(x = gdp, 
                           y = fertility,
                           color = country)) +
    geom_point() +
    geom_smooth(colour = "black", size = 0.25) +
    scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 7. Relationship of 2 variables") + 
    theme_stata() +
    theme(legend.position="bottom",  
           legend.title = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  # Figure 8 ---- 
  
  fig <- ggplot(data1, aes(x = fertility, y = infant_mortality)) + 
    geom_point()+
    aes(color=country)+
    geom_smooth()
  fig
  
  
  
  
  ggplot(data = data1, aes(x = infant_mortality, 
                           y = fertility,
                           color = continent)) +
    geom_point() +
    geom_smooth(colour = "black", size = 0.25) +
    scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 8. Relationship between fertility and infant_mortality") + 
    theme_stata() +
    theme(legend.position="bottom",  
          # should remove legend because of too many countries in full sample
          legend.title = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  # Figure 9 ---- 
  data1$lgdppop = log(data1$gdp/data1$population)

  
  p <- ggplot(data1, aes(x = fertility, y = infant_mortality)) + 
    geom_point(aes(size=lgdppop))+
    aes(color=country)+
    geom_smooth()
  p
  
  ggplot(data = data1, aes(x = infant_mortality, 
                           y = fertility,
                           color = country,
                           size = lgdppop)) +
    geom_point() +
    geom_smooth(colour = "black", size = 0.25) +
    scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 9. Relationship between infant mortality and fertility") + 
    theme_stata() +
    theme(legend.position="right",  
          legend.title = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  # Figure 10 ---- 
## Simple Answer
  
  
  fig = ggplot(data1, aes(country, infant_mortality))+
    geom_boxplot()
  fig
  
## More involved answers  
  
  
    ggplot(data = data3, aes(x = infant_mortality, 
                           y = country,
                           color = continent)) +
    geom_boxplot() +
    #scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 10. Outliers of infant mortality") + 
    theme_stata() +
    theme(legend.position="bottom",
          # should remove legend because of too many countries in full sample
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0, hjust = 0.5, size = 2),
          plot.title = element_text(hjust = 0.5))
  
  # Export figure with a higher resolution in ggasve for maximizing to see countries' names? 
  # The text need to be very small to avoid overlapping 
  
  
  # Figure 11 ---- 
    data_1 = filter(data1, country =="China")
    data_2 = filter(data1, country == "India")
    data_3 = filter(data1, country == "United States")
    
    summary(data_1$life_expectancy)
    summary(data_2$life_expectancy)
    summary(data_3$life_expectancy)
    
    ### The next set of functions is once we get familiar with data wrangling functions
    ###
    
    dstat <- as.data.frame(gapminder) %>% 
      group_by(country) %>% 
      summarise(avg_lifeExp = mean(life_expectancy),
                med_lifeExp = median(life_expectancy),
                sd_lifeExp = sd(life_expectancy)) %>% 
      filter(country %in% c("China","United Kingdom","United States"))
    dstat
    
  
  ggplot(data = data, aes(x = life_expectancy, 
                          fill = country,
                          color = country)) +
    geom_density(alpha = 0.5) +
    #scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 11. Distribution of life expectancy") + 
    theme_stata() +
    theme(legend.position="bottom",
          # should remove legend because of too many countries in full sample
          legend.title = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))
  
  
  # Figure 12 (extra/final ?) ----
  
  
  fig <- ggplot(data1, aes(x = log(population), y = lgdppop)) + 
    geom_point()+
    aes(color=country, colour = "black", size = 0.05)+
    geom_smooth(method = "lm", )
  fig
  
  
  ggplot(data = data3, aes(x = population, 
                           y = lgdppop,
                           color = country)) +
    geom_point() +
    geom_smooth(colour = "black", size = 0.25) +
    scale_x_continuous(labels=scales::comma) +
    labs(title = "Figure 12. Relationship of 2 variables") + 
    theme_stata() +
    theme(legend.position="right",  
          legend.title = element_blank(),
          axis.text.y = element_text(angle = 0),
          plot.title = element_text(hjust = 0.5))