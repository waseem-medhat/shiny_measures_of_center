set.seed(15)
theme_set(theme_minimal(base_size = 16))

source("dotplot.R")

d1 <- rnorm(50)
d2 <- c(rnorm(50), rnorm(50, 5))
d3 <- rchisq(50, 1)
d4 <- -rchisq(50, 1)

dplot1 <- reactive({ dotplot(d1) })
dplot2 <- reactive({ dotplot(d2) })
dplot3 <- reactive({ dotplot(d3) })
dplot4 <- reactive({ dotplot(d4) })