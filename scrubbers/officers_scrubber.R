##############################################################################################
################################ Actions Taken Scrubber ######################################

# This scrubber takes the raw data set and redacts certain fields according to office policy.

# Source: NOPD (Dante Bidwell)
# Dates: Start of IAPro - 2/20/19

print(">> Scrubbing usages of force")
raw.data.filename <- "01_Raw/IAPro/officers_nopd_20190220.csv"
scrubbed.data.filename <- "02_Scrubbed/IAPro/officers_nopd_20190220.csv"

# Load data
data.path <- paste0(DATA_DIR, "/", raw.data.filename)
data.all <- read.csv(data.path, stringsAsFactors = FALSE)
##############################################################################################
# Scrub

data.scrubbed <- data.all %>% 
  select(
    -c(
      User.number
    )
  )

print(sort(colnames(data.scrubbed)))
##############################################################################################
# Write output
output.path <- paste0(DATA_DIR, "/", scrubbed.data.filename)
write.table(data.scrubbed, output.path, sep = CSV_SEP, row.names=FALSE)
write.table(sort(colnames(data.scrubbed)), paste0(output.path,".columns"), sep = CSV_SEP, row.names=FALSE)

# Cleanup: leave scrubbed data frame in memory
rm(raw.data.filename, data.path, data.all,
   scrubbed.data.filename, output.path)