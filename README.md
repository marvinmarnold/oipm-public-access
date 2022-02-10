## Overview

These scripts are used to take OIPM's raw data and process it for public release.
The current pipeline moves data through three states:

1. Raw: Untouched files, as received from the source. These files may be renamed and converted (eg .xls to .csv).
2. Scrubbed: Unprocessed data with some fields redacted acording to office policy.
3. Standardized: Processed scrubbed data structured for easiest consumption.

## Quickstart

```bash
cp .Renviron.example .Renviron # then update values
Rscript annual_report_2020.R
```

## Setup

You must have access to raw OIPM data in order to run these scripts.
This information is not generally available. 
In most cases, this code should be used for reference and auditing.

- R (Linux installation: https://cran.r-project.org/bin/linux/ubuntu/)
- If `Rscript` can't be found, try: `sudo apt-get install littler`
- Copy `.Renviron.example` to `.Renviron` (`cp .Renviron.example .Renviron`).
- Set `WORK_DIR` to the top level of the directory. Set `DATA_DIR` to location of data.
- Install dependencies:
  ```
    R
    install.packages('dplyr')
  ```

## Additional info
Checkout the READMEs in the subdirectories for additional information.
