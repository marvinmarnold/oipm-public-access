##############################################################################################
#################################### OIPM Data Pipeline ######################################

# Steps
#   1. Scrub: Raw -> Scrubbed
#   2. Standardize: Scrubbed -> Standardized

# Reset environment
print(">> Initializing")
rm(list = ls())
readRenviron(".Renviron")
WORK_DIR <- Sys.getenv("WORK_DIR")
DATA_DIR <- Sys.getenv("DATA_DIR")

setwd(WORK_DIR)
print(paste("Working directory set to:", getwd()))

CSV_SEP <- ","

##############################################################################################
######################################## LOAD DEPENDENCIES ###################################
print(">> Loading dependencies")

# Load libraries
library(dplyr)
#library(plotly)
#library(stringr)
#library(tidyr)

# Local helpers
source("lib/utils.R")

###############################################################################################
######################################## SCRUBBERS ############################################
print(">> Scrubbing all data")

load.subdirectory("scrubbers")