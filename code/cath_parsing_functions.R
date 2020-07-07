#Read in analysis data

library(openxlsx)

analysis_data <- read.xlsx("../data/sample_RHC.xlsx")

analysis_data <- read.csv()

analysis_data <- read.csv("../Desktop/procedures.csv")

#Function to extract all RA data. Will be similar for all the columns, just different regex expressions

get_RA_data <- function(x) {
	
	RA_loop<- c("(?<=\\bRA\\W)\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[)]")
	
	
	#matches first regex expression
	stringi::stri_match_first_regex(x, RA_loop) 
	
}

#Function to extract all PA data.

get_PA_data<- function(x) {
	
	PA_loop<- c("(?<=\\bPA\\W)\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[)]")
	
	
	#matches first regex expression
	stringi::stri_match_first_regex(x, PA_loop) 
	
}

#Function to extract all PCWP data. Will be similar for all the columns, just different regex expressions

get_PCWP_data<- function(x) {
	
	PCWP_loop<- c("(?<=\\bPCWP\\W)\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[)]|(?<=\\bPCW\\W)\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[)]")
	
	
	#matches first regex expression
	stringi::stri_match_first_regex(x, PCWP_loop) 
	
}

#Function to extract all RV data. Will be similar for all the columns, just different regex expressions

get_RV_data<- function(x) {
	
	RV_loop<- c("(?<=\\bRV\\W)\\s*[0-9]*[[:punct:]]*[0-9]*[\\W]*[0-9]*[)]")
	
	#matches first regex expression
	stringi::stri_match_first_regex(x, RV_loop) 
	
}

#All functions. Just need to put vector into x to extract 

get_RA_data(x)

get_PA_data(x)

get_PCWP_data(x)

get_RV_data(x)


#Extract right heart cath data with functions 

analysis_data$RA<- get_RA_data(analysis_data$Powernote.Text.Result)

analysis_data$PA<- get_PA_data(analysis_data$Powernote.Text.Result)

analysis_data$PCWP<- get_PCWP_data(analysis_data$Powernote.Text.Result)

analysis_data$RV<- get_RV_data(analysis_data$Powernote.Text.Result)
