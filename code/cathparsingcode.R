
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



# Anish's version of entering hte data {{{ ====

# Add in libraries
source("../code/1_libraries.R")

# Read in sample RHC
rhc <- read_xlsx("../data/sample_RHC.xlsx")

# Preview the data
head(rhc)

# }}}


# Anish's version of starting the data extraction {{{ ====

rhc$first_round <- str_extract(rhc$RHC, "^RHC[\\s\\S]*(?=LHC.*)")
rhc$second_round <- str_extract(rhc$RHC, "RHC:[\\s\\S]*(?=LHC)")

### "Correct" way
# if ".$RHC" contains regex expression, then extract it, if not skip
# If empty/NA, then try different regex expression, if does not contain it, then skip
# Repeat throughall regex combinations

### "Best" way
# For loop to go through all combinations
# For all RHC rows, do ....
# 	Attempt str_extract with regex1, regex2, regexN, ...
# 	If str_extract is successful, then ...
# 		Process data further # we don't yet have the code to parse
# 	If unsuccessful, try different regex
# 		If works, process more

var <- c("regex1", "regex2", "regex3")
rightheart <- c(1:20)

for(i in 1:length(rightheart)) {
	for(j in 1:length(var)) {
		paste("Try", var[j], sep = "_") %>% print()
	}
}


### "Sketchy" way
rhc$first_round[is.na(rhc$first_round)] <- rhc$second_round[is.na(rhc$first_round)]


# }}}
