##############################################################################################
################################ Actions Taken Scrubber ######################################

# This scrubber takes the raw data set and redacts certain fields according to office policy.

# Source: NOPD (Dante Bidwell)
# Dates: Start of IAPro - 2/20/19

print(">> Scrubbing actions taken")
filename <- "actions_taken_nopd_20190220"
# Data goes in DATA_DIR
raw.data.path <- paste0(DATA_DIR, "/01_Raw/IAPro/20190202 Dante/", filename, ".csv")
scrubbed.data.path <- paste0(DATA_DIR, "/02_Scrubbed/IAPro/20190202 Dante/", filename, ".csv")
# Schemas go in WORK_DIR
raw.schema.path <- paste0(WORK_DIR, "/schemas/raw/IAPro/", filename, SCHEMA_POSTFIX)
scrubbed.schema.path <- paste0(WORK_DIR, "/schemas/scrubbed/IAPro/", filename, SCHEMA_POSTFIX)

# Load data
data.all <- read.csv(raw.data.path, stringsAsFactors = FALSE)

# Write raw schema
write.table(colnames(data.all), raw.schema.path, sep = CSV_SEP, row.names=FALSE)
##############################################################################################
# Scrub

data.scrubbed <- data.all %>% 
  select(
    -c(
      Action.taken.summary
    )
  )

print(sort(colnames(data.scrubbed)))
##############################################################################################
# Write output
write.table(data.scrubbed, scrubbed.data.path, sep = CSV_SEP, row.names=FALSE)

# Write scrubbed schema
write.table(colnames(data.scrubbed), scrubbed.schema.path, sep = CSV_SEP, row.names=FALSE)

# Cleanup: leave scrubbed data frame in memory
rm(filename, raw.data.path, scrubbed.data.path,
   raw.schema.path, scrubbed.schema.path,
   data.all, data.scrubbed)
