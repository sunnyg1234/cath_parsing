# Right Heart Cath

rhc <- read_csv("data/sample_RHC.csv")

regexloop<- c("^RHC[\\s\\S]*(?=LHC.*)|RHC:[\\s\\S]*(?=LHC)|RHC:[\\s\\S]*(?=Plan:)|RHC.showed[\\s\\S]*|Right.heart.cath[\\s\\S]*(?=Left.heart.cath)|(?i)Right.Heart.Cath.Findings[\\s\\S]*(?=(?i)Impression)|RHC[\\s\\S]*(?=(?i)Left.heart.catheterization)|RHC:[\\s\\S]*(?=(?i)\\splan)|RHC:[\\s\\S]*(?=(?i)\\sPlan.*)|RHC/LHC[\\s\\S]*|Hemodynamics[\\s\\S]*(?=(?i)\\sPlan)|Hemodynamics[\\s\\S]*(?=(?i)RHC.Conclusion)|(?i)findings[\\s\\S]*(?=(?i)\\sprocedure)|RHC\\s[\\s\\S]*(?=exam)")

#This extracts the data using the expressions and puts it into a new column in the original data
rhc$RHC_extracted<- str_extract(rhc$RHC,regexloop)

#THis new column extracts all the RA data in a similar fashion, looping through the regular expressions until it finds one that works 

RA_loop<- c("(?<=\\sRA:|RA=|RA|RA\\s).*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

rhc$RA<- str_extract(rhc$RHC_extracted, RA_loop)

#PA loop
PA_loop<- c("(?<=\\sPA:|PA=|PA|PA\\s).*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

rhc$PA<- str_extract(rhc$RHC_extracted, PA_loop)

#PCWP loop

PCWP_loop<- c("(?<=\\sPCWP:|PCWP=|PCWP).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

rhc$PCWP<- str_extract(rhc$RHC_extracted, PCWP_loop)

#RV loop 
RV_loop<- c(
  "(?<=\\sRV:|RV=|RV|RV\\s).*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*")

rhc$RV<- str_extract(rhc$RHC_extracted, RV_loop)

#CI loop 
CI_loop<- c(
  "(?<=\\sCI:|CI=|CI).\\s*[a-z]*\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

#CO loop 
CO_loop<- c(
  "(?<=\\sCO:|CO=|CO).\\S*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

rhc$CO<- str_extract(rhc$RHC_extracted, CO_loop)

#SVR loop 
SVR_loop<- c(
  "(?<=\\sSVR:|SVR=|SVR).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

rhc$SVR<- str_extract(rhc$RHC_extracted, SVR_loop)

#PVR loop 
PVR_loop<- c(
  "(?<=\\sPVR:|PVR=|PVR).\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[[:punct:]]*[0-9]*")

rhc$PVR<- str_extract(rhc$RHC_extracted, PVR_loop)
