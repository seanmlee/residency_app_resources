library(tidyverse)
library(MASS)


# load -------------------------------------------------------------------------
dat <- read.csv("data/dat_raw.csv")


# format -----------------------------------------------------------------------
dat <- gather(
  dat,
  key = "resource",
  value = "rank",
  aamc:doc_network
)

dat$rank <- as.factor(dat$rank)

dat$rank <- fct_rev(dat$rank)

dat$resource <- factor(
  dat$resource, 
  levels = c(
    "program_site", 
    "freida", 
    "aamc", 
    "google_sheet", 
    "reddit", 
    "doximity", 
    "nrmp", 
    "doc_network"
  )
)


# fit model --------------------------------------------------------------------
mod <- polr(
  rank ~ 
    resource,
  na.action = na.omit,
  method = "logistic",
  Hess = TRUE,
  data = dat
  )


# store table ------------------------------------------------------------------
ctable <- coef(summary(mod))


# calculate and store p-values -------------------------------------------------
p <- pnorm(
  abs(
    ctable[, "t value"]
    ), 
  lower.tail = FALSE
  ) * 2

# combine table ----------------------------------------------------------------
ctable <- cbind(
  ctable, 
  "p-value" = signif(p, 4)
  )

ctable[1:7, ]