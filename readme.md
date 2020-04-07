# Catheterization Data Parsing Project

This repository is code for taking CDW data and manipulating/processing strings to extract important catherization data.

# Right Heart Catherization

Will need to extract features. This folder currently has a sample/toy data set to start analysis that has no personal identifiers. Will start working on this.

## Parsing of RHC data

Each RHC data chunk is very disorganized, but follows an overall pattern. We will likely use __regex__ to extract the appropriate. This is a guide in R for using this system / working with strings.

https://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions

For one of hte records, for example, we can get the RHC data using this expression...

`^RHC[\s\S]*?(?=LHC.*$)`

https://regex101.com/r/fNfnZJ/2


