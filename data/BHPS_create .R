#Creating data frame BHPS for data-analysis 

if (!require("pacman")) install.packages("pacman")
pacman::p_load(haven, ggplot2,knitr, pander,descr,foreign,dplyr,Hmisc,psych,GPArotation,plyr, dplyr, rmarkdown)
library(tidyverse)
jindresp <- read_sav("/Applications/IODS-final/data/jindresp.sav")
jhhresp <- read_sav("/Applications/IODS-final/data/jhhresp.sav")

BHPS2000 <- merge(jindresp, jhhresp, by="JHID")

# Keeping only the variables that are needed

keep_columns <- c("JLKMOVE","JHSPRBQ", "JHSCANB", "JHSCNTB", "JHSCAND", "JHSCNTD","JHSCANF", "JLFSATO")

BHPS <- dplyr::select(BHPS2000, one_of(keep_columns))
dim(BHPS)
describe(BHPS)


# Removing NAs
complete.cases(BHPS)
data.frame(BHPS, comp = complete.cases(BHPS))
BHPS2 <- filter(BHPS, TRUE, complete.cases(BHPS))

dim(BHPS2)
describe(BHPS2)
summary(BHPS2)

write.csv(BHPS2, file = "/Applications/IODS-final/data/BHPS2.csv")
BHPS2 <- read.csv(file = "/Applications/IODS-final/data/BHPS2.csv", sep=",")
BHPS2


