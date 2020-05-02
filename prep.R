theme_set(theme_minimal(base_size = 16))

source('dotplot.R')

d1 <- rnorm(50)
d2 <- c(rnorm(50), rnorm(50, 5))
d3 <- rchisq(50, 1)
d4 <- -rchisq(50, 1)

dplot1 <- reactive({ dotplot(d1, mean(d1), median(d1)) })
dplot2 <- reactive({ dotplot(d2, mean(d2), median(d2)) })
dplot3 <- reactive({ dotplot(d3, mean(d3), median(d3)) })
dplot4 <- reactive({ dotplot(d4, mean(d4), median(d4)) })

normal_points  <- sample(1:5, 100, TRUE)
extreme_points <- sample(10:12, 100, TRUE)