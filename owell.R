library(dplyr)

# I am providing an auxiliary file 'wells-location.txt' where I manually placed the 23 wells based on latitude, longitude, and altitude.
# You will need to append this data to your two "dataframes".
owell.chemistry <- owell.chemistry %>%
  left_join(wells.location, by='well')

owell.metals <- owell.metals %>%
  left_join(wells.location, by='well')

# You will need to manually append a new column to each data 
# frame called "fault" (see Fig 1, pg4 of PDF [770]) and 
# estimate in "meters" a value for each well as a nearest 
# distance to a fault.
owell.chemistry <- owell.chemistry %>%
  left_join(fault, by='well')

owell.metals <- owell.metals %>%
  left_join(fault, by='well')
# You will need to manually append a new column to each data 
# frame called "geology" (see Fig 1, pg4 of PDF [770]) and 
# assign a comma-separated string of the first word of 
# relevant rock formations near the wells.  For example, 
# Well-23 has a pink and salmon color, so its geology value 
# would be:  "Alkaline,Granite"
owell.chemistry <- owell.chemistry %>%
  left_join(geology, by='well')

owell.metals <- owell.metals %>%
  left_join(geology, by='well')
# Create a list with these two dataframes:  
# "wells$saudi$chemistry" and "wells$saudi$metals" ... 
# save this list as RDS named "wells.rds"

wells <- list()
wells$Saudi = list(owell.chemistry, owell.metals)
names(wells$Saudi) <- c('chemistry', 'metals')
saveRDS(wells,file='well.rds')
# Create a notebook documenting and describing the datasets, 
# calling it 'oWell-1.Rmd' ...

