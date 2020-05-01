set.seed(15)
theme_set(theme_minimal(base_size = 16))

source("dotplot.R")

dplot1 <- reactive({ dotplot(rnorm(50)) })
dplot2 <- reactive({ dotplot(c(rnorm(50), rnorm(50, 5))) })
dplot3 <- reactive({ dotplot(rchisq(50, 1)) })
dplot4 <- reactive({ dotplot(-rchisq(50, 1)) })
