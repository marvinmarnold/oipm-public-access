##############################################################################################
#################################### OIPM Data Pipeline ######################################

# Steps
#   1. Scrub: Raw -> Scrubbed
#   2. Standardize: Scrubbed -> Standardized

# Reset environment
print(">> Initializing")
rm(list = ls())
readRenviron(".Renviron")
setwd(Sys.getenv("WORK_DIR"))
print(paste("Working directory set to:", getwd()))

##############################################################################################
######################################## LOAD DEPENDENCIES ###################################
print(">> Loading dependencies")

# Load libraries
#library(dplyr)
#library(plotly)
#library(stringr)
#library(tidyr)

# Local helpers
source("lib/utils.R")

###############################################################################################
######################################## SCRUBBERS ############################################
print(">> Scrubbing all data")

load.subdirectory("scrubbers")