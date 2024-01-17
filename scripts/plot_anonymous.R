library(tidyverse)
library(HH)

# load -------------------------------------------------------------------------
likert_anonymous <- read.csv("data/likert_anonymous.csv")


# plot -------------------------------------------------------------------------
plot_anonymous <-
  
  likert(
    
    Item~.,
         
    as.percent = TRUE,
    
    main = list(
      "Helpfulness of Anonymous Comments", 
      cex = 1.5
      ),
    
    xlab = list(
      "Proportion of student responses", 
      cex = 1.15
      ),
    
    ylab = list(
      "Feature", 
      cex = 1.15
      ),
    
    ylab.right = list(
      "Number of student respondents", 
      cex = 1.15
      ),
    
    scales = list(
      
      x = list(
        cex = 1.15
        ),
      
      y = list(
        cex = 1.15
        )
      
    ),
    
    auto.key = list(
      
      text = c(
        "Not helpful", 
         "", 
         "", 
         "",
         "Helpful"
        ),
    
      cex = 1.5
      
    ),
    
    data = likert_anonymous
    
    )

plot_anonymous