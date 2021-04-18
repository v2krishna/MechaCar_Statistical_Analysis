library(dplyr)
library(tidyverse)

#Deliverable 1 
mechacar_data <- read.csv('MechaCar_mpg.csv',check.names = F, stringsAsFactors = F)

# Perform Linear Regression
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,mechacar_data) # multiple linear regression


# Summary for the Linear regression model
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,mechacar_data))  #generate summary of the multiple linear regression


#Deliverable 2 
suspension_coil_data <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)  # read the file

total_summary  <- suspension_coil_data %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep') # summarize of statistics

#Create lot summary
lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep') # group by using  manufacturing lot





#Deliverable 3

# t test for all the lots
t.test(suspension_coil_data$PSI,mu=mean(suspension_coil_data$PSI))  # comparing PSI with all lots

# t test for lot 1
t.test(subset(suspension_coil_data$PSI,suspension_coil_data$Manufacturing_Lot == "Lot1"),mu=mean(suspension_coil_data$PSI))

# t test for lot 2
t.test(subset(suspension_coil_data$PSI,suspension_coil_data$Manufacturing_Lot == "Lot2"),mu=mean(suspension_coil_data$PSI))

# t test for lot 3
t.test(subset(suspension_coil_data$PSI,suspension_coil_data$Manufacturing_Lot == "Lot3"),mu=mean(suspension_coil_data$PSI))

