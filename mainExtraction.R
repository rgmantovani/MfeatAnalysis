# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

mainExtraction = function(datafile, option) {

  devtools::load_all()

  # Checking input params
  sub.data = gsub(x = list.files(path = "data/"), pattern = ".arff", replacement = "")
  assertChoice(x = datafile, choices = c("all"))
  assertChoice(x = option, choices = c("mfe", "cnet", "comp", "pca", "all"))

  cat(paste0(" - Datafile: \t", datafile, "\n"))
  cat(paste0(" - Features: \t", option, "\n"))

  runExtraction(datafile = datafile, option = option)

  cat("Finished!")
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# parsing main call
options(echo = TRUE) 
args = commandArgs(trailingOnly = TRUE)

# Parse arguments (we expect the form --arg=value)
parseArgs = function(x) strsplit(sub("^--", "", x), "=")
argsDF = as.data.frame(do.call("rbind", parseArgs(args)))
argsL = as.list(as.character(argsDF$V2))

# Calling execution with the arguments
mainExtraction(datafile = argsL[[1]], option = argsL[[2]])

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------