histogram <- function(d) {
  
  c_hist <- "gray60"
  c_den  <- "gray20"
  c_mean <- "red3"
  c_median <- "dodgerblue4"
  
  ggplot(NULL, aes(d)) +
    geom_histogram(aes(y = ..density..), fill = c_hist, color = "white") +
    geom_density(size = 1, linetype = 2, color = c_den) +
    ylim(0, 1) +
    geom_vline(xintercept = mean(d), size = 1.2, color = c_mean) +
    geom_vline(xintercept = median(d), size = 1.2, color = c_median) +
    geom_label(aes(x = mean(d), y = 0.9), label = "Mean", color = c_mean) +
    geom_label(aes(x = median(d), y = 0.8), label = "Median", color = c_median)
  
}