
#This is a way I figured out to extract all the RHC data and put it into one table without a bunch of extra steps. I couldn't figure out how to do it with loops unfortunately but this actually works well. I used the "or" function in the loop and it looks like after it finds it once, it doesn't mess with it again.  

setwd("../code/")

library(tidyverse)


#this is just code to get the excel data onto R so that I can extract it using str_extract.

library(openxlsx)

analysis_data <- read.xlsx("../data/sample_RHC.xlsx")

regexloop<- c("^RHC[\\s\\S]*(?=LHC.*)|RHC:[\\s\\S]*(?=LHC)|RHC:[\\s\\S]*(?=Plan:)|RHC.showed[\\s\\S]*|Right.heart.cath[\\s\\S]*(?=Left.heart.cath)|(?i)Right.Heart.Cath.Findings[\\s\\S]*(?=(?i)Impression)|RHC[\\s\\S]*(?=(?i)Left.heart.catheterization)|RHC:[\\s\\S]*(?=(?i)\\splan)|RHC:[\\s\\S]*(?=(?i)\\sPlan.*)|RHC/LHC[\\s\\S]*|Hemodynamics[\\s\\S]*(?=(?i)\\sPlan)|Hemodynamics[\\s\\S]*(?=(?i)RHC.Conclusion)|(?i)findings[\\s\\S]*(?=(?i)\\sprocedure)|RHC\\s[\\s\\S]*(?=exam)")

#This extracts the data using the expressions and puts it into a new column in the original data
analysis_data$RHC_extracted<- str_extract(analysis_data$RHC,regexloop)

#THis new column extracts all the RA data in a similar fashion, looping through the regular expressions until it finds one that works 

RA_loop<- c("(?<=\\sRA:|RA=|RA|RA\\s).*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

analysis_data$RA<- str_extract(analysis_data$RHC_extracted, RA_loop)

#PA loop
PA_loop<- c("(?<=\\sPA:|PA=|PA|PA\\s).*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

analysis_data$PA<- str_extract(analysis_data$RHC_extracted, PA_loop)

#PCWP loop

PCWP_loop<- c("(?<=\\sPCWP:|PCWP=|PCWP).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

analysis_data$PCWP<- str_extract(analysis_data$RHC_extracted, PCWP_loop)

#RV loop 
RV_loop<- c(
  "(?<=\\sRV:|RV=|RV|RV\\s).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

analysis_data$RV<- str_extract(analysis_data$RHC_extracted, RV_loop)

#CI loop 
CI_loop<- c(
  "(?<=\\sCI:|CI=|CI).\\s*[a-z]*\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

#CO loop 
CO_loop<- c(
  "(?<=\\sCO:|CO=|CO).\\S*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

analysis_data$CO<- str_extract(analysis_data$RHC_extracted, CO_loop)

#SVR loop 
SVR_loop<- c(
  "(?<=\\sSVR:|SVR=|SVR).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

analysis_data$SVR<- str_extract(analysis_data$RHC_extracted, SVR_loop)

#PVR loop 
PVR_loop<- c(
  "(?<=\\sPVR:|PVR=|PVR).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

analysis_data$PVR<- str_extract(analysis_data$RHC_extracted, PVR_loop)

