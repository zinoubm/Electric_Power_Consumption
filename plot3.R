source('get_data.R')

gen_plot3 <- function(df){
  df <- load_data()
  png('plot3.png')
  with(df, plot(Sub_metering_1, type = 'l', xaxt = 'n' ,
                xlab = '', ylab = 'Energy Sub Metering'))
  with(df, lines(Sub_metering_2, col = 'red'))
  with(df, lines(Sub_metering_3, col = 'blue'))
  axis(1,at = c(1, nrow(df)/2, nrow(df)), labels = c('thu', 'fri', 'sat'))
  legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         col = c('black', 'red', 'blue'), lty=1, cex=0.8)
  dev.off()
}