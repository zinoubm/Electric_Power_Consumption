source('get_data.R')

gen_plot2 <- function(df){
  df <- load_data()
  png('plot2.png')
  
  with(df, plot(Global_active_power , type = 'l', xaxt = 'n',
                xlab = '', ylab = 'Global Active Power (Kilo Watts)'))
  axis(1,at = c(1, nrow(df)/2, nrow(df)), labels = c('thu', 'fri', 'sat'))
  dev.off()
}