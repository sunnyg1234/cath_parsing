#This is the first set of code that extracts data from the excel sheet. I had to save the sample_RHC data as a csv to make it work. Then I extracted the results into a temp file. This file can be saved but I am wondering how to best compile the rows that are NA once I have other reg ex expressions that work. 

setwd("/Users/sunnygupta/cath_parsing/data")
analysis_data <- read.csv("sample_RHC.csv")

temp<- str_extract(analysis_data$RHC,"^RHC[\\s\\S]*(?=LHC.*)")
temp<-as.data.frame(temp)
write.csv(temp, " ")