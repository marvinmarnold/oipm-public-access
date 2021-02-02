##############################################################################################
################################## Allegations Scrubber ######################################
# This scrubber takes the raw data set and redacts certain fields according to office policy.

# Source: NOPD (Dante Bidwell)
# Dates: 2005 - 2/20/19
# Fields scrubbed: Citizen narrative & Citizen.dob

print(">> Scrubbing allegations")
raw.data.filename <- "01_Raw/IAPro/allegations_nopd_20190220.csv"
scrubbed.data.filename <- "02_Scrubbed/IAPro/allegations_nopd_20190220.csv"

# Load data
data.path <- paste0(DATA_DIR, "/", raw.data.filename)
data.all <- read.csv(data.path, stringsAsFactors = FALSE)
##############################################################################################
# Scrub

data.scrubbed <- data.all %>% 
  select(
    -c(Citizen.dob, Citizen.narrative)
  )

##############################################################################################
# Write output
output.path <- paste0(DATA_DIR, "/", scrubbed.data.filename)
write.table(data.scrubbed, output.path, sep = CSV_SEP, row.names=FALSE)

# Cleanup: leave scrubbed data frame in memory
rm(raw.data.filename, data.path, data.all,
   scrubbed.data.filename, output.path)