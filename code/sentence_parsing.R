# Setup
library(tidyverse)

# From findings
txt <- "Small caliber RCA with 50% proximal and 70% mid stenoses."

coronary_anatomy <- function(x) {
	
	# Check if sentence
	if(!is.character(x)) {stop("Requires character string", call. = FALSE)}
	
	# Establish variables
	epicardial <- c("LM", "LAD", "LCX", "RCA")
	mods <- c("proximal", "mid", "distal", "ostial")
	
	sentence <-
		tibble(line = 1, sentence = x) %>%
		tidytext::unnest_tokens(input = sentence, output = word, to_lower = FALSE) %>%
		pull(word)
		
	# Identify number/locations of disease
	artery <- y[which(y %in% epicardial)]
	locs <- grep("\\d+", sentence) 
	mlocs <- which(sentence %in% mods)
	
	# Find the nearest neighbors to identify which modifier goes with which location
	space <- combn(mlocs, length(locs))
	dist <- apply(space, 2, function(x) {sum(abs(locs - x))})
	matched <- space[, which.min(dist)]
	
	tbl <- 
		tibble(
			anatomy = paste(sentence[matched], artery),
			stenosis = as.numeric(sentence[locs])
		)
	
	# Return
	return(tbl)
}

# Test it out
coronary_anatomy(txt)
