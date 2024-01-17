library(tidyverse)
library(HH)

# load -------------------------------------------------------------------------
likert_resources <- read.csv("data/likert_resources.csv")


# format -----------------------------------------------------------------------
likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "program_site", 
    "Resident Program Website"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "freida", 
    "FREIDA"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "aamc", 
    "AAMC"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "google_sheet", 
    "Specialty-Specific Google Sheet"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "reddit", 
    "REDDIT"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "doximity", 
    "Doximity"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "nrmp", 
    "NRMP"
    )

likert_resources$Rankings <-
  str_replace(
    likert_resources$Rankings, 
    "doc_network", 
    "Student Doctor Network"
    )

likert_resources$Rankings <- 
  factor(
    likert_resources$Rankings, 
    levels = c(
      "Resident Program Website", 
       "FREIDA", 
       "AAMC", 
       "Specialty-Specific Google Sheet", 
       "Reddit", 
       "Doximity", 
       "NRMP", 
       "Student Doctor Network"
      )
    )


# plot -------------------------------------------------------------------------
plot_rankings <-
  
  likert(
    
    Rankings~., 
    
    as.percent = TRUE,
         
    main = list(
      "Resource Rankings", 
      cex = 2
      ),
    
    xlab = list(
      "Proportion of student responses", 
      cex = 1.5
      ),
    
    ylab = list(
      "Resource", 
      cex = 1.5
      ),
    
    ylab.right = list(
      "Number of student respondents", 
      cex = 1.5
      ),
    
    scales = list(
      
      x = list(
        cex = 1.25
        ),
      
      y = list(
        cex = 1.25
      )
      
    ),
    
    auto.key = list(
      
      text = c(
        "9th", 
        "", 
        "", 
        "", 
        "",
        "",
        "",
        "",
        "1st"
        ),
      
      cex = 1.5
      
    ),
    
    data = likert_resources
    
    )

plot_rankings