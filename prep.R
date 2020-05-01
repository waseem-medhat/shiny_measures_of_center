set.seed(15)
theme_set(theme_minimal(base_size = 16))

source("dotplot.R")

dplot1 <- reactive({ histogram(rnorm(100)) })
dplot2 <- reactive({ histogram(rchisq(100, 2)) })
dplot3 <- reactive({ histogram(-rchisq(100, 2)) })
dplot4 <- reactive({ histogram(c(rnorm(100), rnorm(100, 5))) })
