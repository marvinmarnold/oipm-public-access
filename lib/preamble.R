readRenviron(".Renviron")
WORK_DIR <- Sys.getenv("WORK_DIR")
DATA_DIR <- Sys.getenv("DATA_DIR")

TIMESTAMP <- format(Sys.Date(), "%Y%m%d")
CSV_SEP <- ","

library(dplyr)

source('lib/utils.R')

