# Catheterization Data Parsing Project

This repository is code for taking CDW data and manipulating/processing strings to extract important catherization data.

# Right Heart Catherization

Will need to extract features. This folder currently has a sample/toy data set to start analysis that has no personal identifiers. Will start working on this.

__Milestones__

4/10 
- RHC data strings extracted

4/17
- RHC parsed into findings (RA, RV, PA, PCWP, Fick, etc)
- refine data string extraction for optional/"odd" cases (parenthesis, odd spacing, etc)

4/24
- parsing RHC are more flexible (can handle messier/alternative data types)
- refine code to be legible/flexible, well annotated
- test use cases out on larger data sets

5/1
- beta testing completed
- start looking at LHC data for similar approaches



## Parsing of RHC data

Each RHC data chunk is very disorganized, but follows an overall pattern. We will likely use __regex__ to extract the appropriate. This is a guide in R for using this system / working with strings.

_To help learn regular expressions_:

- [R-based Tutorial on Strings](https://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions)
- [Regular Expression Tutorial](https://regexone.com/)
- [Regex Online Tester](https://regex101.com/)

For one of the records, for example, we can get the RHC data using this expression...

`^RHC[\s\S]*?(?=LHC.*$)`

https://regex101.com/r/fNfnZJ/2



