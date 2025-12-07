# import data frame
fpath <- dir(recursive = T, pattern = "morske_trave.tsv")
d <- read.delim(fpath, header = T, sep = "\t")

# disable wrapping of data frames when printing
options(width = 200)

# extract sequences from certain families based on Lineage column
# it prints subsets of df by default. use return_data=TRUE to make
# it return the data frame as well.
get_hits <- function(pattern, df, return_data = F) {
  hits <- df[, "Lineage"] |> grep(pattern = pattern)
  no_lin <- names(df)[1:length(names(df)) - 1]
  d_hits <- df[hits, no_lin]

  cat("\n", pattern, "\n\n")
  print(d_hits)

  if (return_data) {
    return(d_hits)
  }
}

get_hits("Hydrocharitaceae", d)
get_hits("Cymodoceaceae", d)
get_hits("Posidoniaceae", d)
get_hits("Zosteraceae", d)
get_hits("Potamogetonaceae", d)
