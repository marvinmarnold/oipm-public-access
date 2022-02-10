##############################################################################################
##################################### Charges Scrubber #######################################
# This scrubber takes the raw data set and redacts certain fields according to office policy.

print(">> Setting up environment")
source("lib/preamble.R")
OPSO_RELATIVE_DIR <- Sys.getenv("OPSO_RELATIVE_DIR")
CHARGES_FILENAME <- Sys.getenv("CHARGES_FILENAME")
charges_relative_path <- paste0(OPSO_RELATIVE_DIR, "/", CHARGES_FILENAME)

print(">> Reading data")
# Data goes in DATA_DIR
raw_data_path <- paste0(DATA_DIR, "/01_Raw/", charges_relative_path)

scrubbed_data_main_dir <- paste0(DATA_DIR, "/02_Scrubbed/")
scrubbed_data_path <- paste0(scrubbed_data_main_dir, charges_relative_path)

# Schemas go in WORK_DIR
raw_schema_main_dir <- paste0(WORK_DIR, "/03_output_schemas/raw/")
raw_schema_path <- paste0(raw_schema_main_dir, charges_relative_path)

scrubbed_schema_main_dir <- paste0(WORK_DIR, "/03_output_schemas/scrubbed/")
scrubbed_schema_path <- paste0(scrubbed_schema_main_dir, charges_relative_path)

# Load data
data_all <- read.csv(raw_data_path, stringsAsFactors = FALSE)

# Write raw schema
print(">> Writing raw schema")
dir.create(file.path(raw_schema_main_dir, OPSO_RELATIVE_DIR), showWarnings=FALSE)
write.table(colnames(data_all), raw_schema_path, sep = CSV_SEP, row.names=FALSE)
##############################################################################################
# Scrub
data_scrubbed <- data_all %>%
  select(
    -c(
      Details,
      FBI.Cd,
      Good.Time.Date,
      Flat.Time.Date,
      Early.Release.Date,
      Expired.Date
    )
  )

print(sort(colnames(data_scrubbed)))
##############################################################################################
# Write output
print(">> Writing data")
print(">> Writing scrubbed schema")
dir.create(file.path(scrubbed_schema_main_dir, OPSO_RELATIVE_DIR), showWarnings=FALSE)
write.table(colnames(data_scrubbed), scrubbed_schema_path, sep = CSV_SEP, row.names=FALSE)

print(">> Writing scrubbed data")
dir.create(file.path(scrubbed_data_main_dir, OPSO_RELATIVE_DIR), showWarnings=FALSE)
write.table(data_scrubbed, scrubbed_data_path, sep = CSV_SEP, row.names=FALSE)