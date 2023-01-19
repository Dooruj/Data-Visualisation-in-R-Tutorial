rm(list=ls())
library(readr)
#Load the datasets
data <- read_csv("C:/Users/DRambaccussing/OneDrive - University of Dundee/TEACHING/Data Visualisation/premier league.csv") 
mean(data$goals)
sd(data$goals)
# (2)	Do teams that score more goals tend to have more wins ? Draw a scatterplot to investigate this ? 
library(tidyverse)
ggplot(data, aes(wins,goals))+ 
  geom_point()+
  geom_smooth()
cor(data$goals,data$wins)

# (3)	"Attack is the best form of defence" has been a philosophy of many teams such as the Dutch national team who believe 
# the number of attacks make it harder for the opposing team to have fewer chances to score goals. 
#Let us test this hypothesis now. Let us plot the number of goals scored against goal_conceded or goals conceded  against total_scoring_att.


data %>%
  ggplot(aes(goals_conceded, goals))+
  geom_point()+
  geom_smooth()
cor(data$goals_conceded, data$goals)

data %>%
  ggplot(aes(goals_conceded, total_scoring_att))+
  geom_point()+
  geom_smooth()
cor(data$goals_conceded, data$total_scoring_att)

# As a data scientist you may want to be careful here! The smoothed line has different "slopes" after a certain threshold say 55 goals
data_above50 = data %>% filter(goals_conceded>50)
data_below50 = data %>% filter(goals_conceded<50)
cor(data_above50$goals_conceded,data_above50$total_scoring_att)
cor(data_below50$goals_conceded,data_below50$total_scoring_att)


# Now create a new dataset with the teams of Manchester United, Liverpool, Arsenal, Tottenham, Chelsea, and Manchester City. Call the dataset data1.

data1 = data %>%
 filter(team %in% c("Manchester United","Liverpool","Arsenal","Tottenham Hotspur","Chelsea","Manchester City")) %>%
 select(team, season, wins,goals,ontarget_scoring_att, att_pen_goal, total_scoring_att, total_red_card, total_pass)
# table(data1$team) should give you 12 for each. 

#(4)	Arsenal, Chelsea and Tottenham Hotspur are the three London teams. Draw a time series plot for the number of goals and comment. 

X =  c("Arsenal", "Chelsea", "Tottenham Hotspur")   
data1 %>%
  filter(team %in% X) %>%
 ggplot(aes(season,goals, col = team))+
  geom_line()

## axes look a little off

X =  c("Arsenal", "Chelsea", "Tottenham Hotspur")   
library(ggthemes)
data1 %>%
  filter(team %in% X) %>%
  ggplot(aes(season,goals, col = team))+
  geom_line(lwd =2) +
  theme_stata ()+
  scale_x_continuous(breaks = 2008:2018) # this line ensures that that the latter is a rounded number
 
# It seems that Chelsea had a good year in 2009 where they scored more than 100 goals but Tottenham appears to be the team which seems to be mostly improving over
#

# (5) Among all the teams under consideration, which team seems to be more consistent in goal scoring. Draw a visualisation to find this out.  

data1 %>%
  ggplot(aes(goals) )+
  geom_density(aes(fill= team, alpha = 0.1))+
  theme_bw()

# According to the visualization, Arsenal seems to be the mnost consistant as they have the spread in the distribution. However Manchester city seems to have the 
# bigger spread. You can also use sd to convince yourself. 

##(6)	Create a new variable called "goal_difference"  and "league points".  
## Goal_difference = goals - goals_conceded.
## League_points = (wins*3) + (38 - wins-losses)

data2=data1 %>%
  mutate(Goal_difference = goals - goals_conceded, 
         League_points = (wins*3) + (38 - wins-losses))
data2 %>%
  ggplot(aes(Goal_difference, League_points))+
  geom_point(aes(color=team))+
  geom_smooth()



## (7) Plot an ordered Box Plot for the total number of passses. 



data1 %>%
  ggplot(aes(x = reorder(team, total_pass), y =total_pass)) +
  geom_boxplot(aes(color= team)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("")

# Arsenal seems to be more entertaining. 


## (8) On separate plots for each team, draw a scatter plot of goals scored against goal conceded. 


z = ggplot(data1, aes(ontarget_scoring_att,total_scoring_att)) + 
  geom_point(aes(colour= team)) + 
  facet_grid(team~.)


## (9)	Draw time series plots for the logarithm total number of red cards 
## and  total number of yellow cards for each season. 
##(We use logarithm here because it is very likely that the 
## total number of yellow cards will exceed the total number of red cards 
##by much for each season which will make the scales uneven). 


Y = 
data %>% 
  group_by(season) %>%
  summarise (RC = log(sum(total_red_card)), YC =log(sum(total_yel_card)))


data_long <- Y %>%
  pivot_longer(cols=c('RC':'YC'),
               names_to='Card',
               values_to='Log_sum')
ggplot(data_long,                            # Draw ggplot2 time series plot
       aes(x = season,
           y = Log_sum,
           col = Card)) +
  geom_line(lwd=2)+
  scale_color_manual(values = c("Red", "Yellow"), labels = c("Red card", "Yellow Card"))+
  scale_x_continuous(breaks = 2007:2018)






