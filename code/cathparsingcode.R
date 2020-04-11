
#this is just code to get the excel data onto R so that I can extract it using str_extract.
setwd("/Users/sunnygupta/cath_parsing/data")
analysis_data <- read.csv("sample_RHC.csv")

#These are different sets of code that will extract RHC data from the excel sheet.. Then I extracted the results into a temporary file to check them. All these different codes work well to extract just the RHC data with minimal fluff. I made sure that one code doesn't mess up something in another row. The next step will be proofreading this code for minor errors and then figur out how to run them all one after the other and then put the results in one clean table. 

library(tidyverse)

extract1<- str_extract(analysis_data$RHC,"^RHC[\\s\\S]*(?=LHC.*)")

extract1<-as.data.frame(extract1)

extract2<- str_extract(analysis_data$RHC,"RHC:[\\s\\S]*(?=LHC)")

extract2<-as.data.frame(extract2)

extract3<- str_extract(analysis_data$RHC,"RHC:[\\s\\S]*(?=Plan:)")

extract3<-as.data.frame(extract3)

extract4<- str_extract(analysis_data$RHC,"RHC.showed[\\s\\S]*")

extract4<-as.data.frame(extract4)

extract5<- str_extract(analysis_data$RHC,"Right.heart.cath[\\s\\S]*(?=Left.heart.cath)")

extract5<-as.data.frame(extract5)

extract6<- str_extract(analysis_data$RHC,"(?i)Right.Heart.Cath.Findings[\\s\\S]*(?=(?i)Impression)")

extract6<-as.data.frame(extract6)

extract7<- str_extract(analysis_data$RHC,"RHC[\\s\\S]*(?=(?i)Left.heart.catheterization)")

extract7<-as.data.frame(extract7)

extract8<- str_extract(analysis_data$RHC,"RHC:[\\s\\S]*(?=(?i)\\splan)")

extract8<-as.data.frame(extract8)

extract9<- str_extract(analysis_data$RHC,"RHC:[\\s\\S]*(?=(?i)\\sPlan.*)")

extract9<-as.data.frame(extract9)

#data sets 18-28 don't really have any values to extract. 
extract10<- str_extract(analysis_data$RHC,"RHC/LHC[\\s\\S]*")

extract10<-as.data.frame(extract10)

extract11<- str_extract(analysis_data$RHC,"Hemodynamics[\\s\\S]*(?=(?i)\\sPlan)")

extract11<-as.data.frame(extract11)

extract12<- str_extract(analysis_data$RHC,"Hemodynamics[\\s\\S]*(?=(?i)RHC.Conclusion)")

extract12<-as.data.frame(extract12)

recordID<- select(analysis_data, recordID)

Date<- select(analysis_data,Date)

df<- bind_cols(recordID,Date,extract1,extract2,extract3,extract4,extract5,extract6,extract7,extract8,extract9,extract10,extract11,extract12)

write.csv(extract(), "insertfilenamehere ")



regexloop<- c("^RHC[\\s\\S]*(?=LHC.*)","RHC:[\\s\\S]*(?=LHC)","RHC:[\\s\\S]*(?=Plan:)","RHC.showed[\\s\\S]*","Right.heart.cath[\\s\\S]*(?=Left.heart.cath)","(?i)Right.Heart.Cath.Findings[\\s\\S]*(?=(?i)Impression)","RHC[\\s\\S]*(?=(?i)Left.heart.catheterization)","RHC:[\\s\\S]*(?=(?i)\\splan)","RHC:[\\s\\S]*(?=(?i)\\sPlan.*)","RHC/LHC[\\s\\S]*","Hemodynamics[\\s\\S]*(?=(?i)\\sPlan)","Hemodynamics[\\s\\S]*(?=(?i)RHC.Conclusion)")

view(regexloop)
