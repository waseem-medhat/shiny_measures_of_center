dotplot <- function(d, dmean, dmedian) {
  
  c_hist <- 'gray60'
  c_den  <- 'gray20'
  c_mean <- 'tomato3'
  c_median <- 'dodgerblue4'
  
  ggplot(NULL, aes(d)) +
    geom_dotplot(fill = c_hist, color = 'white') +
    geom_density(size = 1, linetype = 2, color = c_den) +
    ylim(0, 1) +
    geom_vline(xintercept = dmean, size = 1.2, color = c_mean) +
    geom_vline(xintercept = dmedian, size = 1.2, color = c_median) +
    geom_label(aes(x = dmean, y = .9), label = 'Mean', color = c_mean) +
    geom_label(aes(x = dmedian, y = .8), label = 'Median', color = c_median) +
    labs(x = 'Value', y = 'Count')
  
}