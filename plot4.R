source('get_data.R')

gen_plot4 <- function(df){
  df <- load_data()
  
  png('plot4.png')
  layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))
  
  ### frist plot
  with(df, plot(Global_active_power , type = 'l', xaxt = 'n',
                xlab = '', ylab = 'Global Active Power (Kilo Watts)'))
  axis(1,at = c(1, nrow(df)/2, nrow(df)), labels = c('thu', 'fri', 'sat'))
  
  ### second plot
  with(df, plot(Voltage, type = 'l', xaxt = 'n',
                xlab = 'Date Time', ylab = 'Voltage'))
  axis(1,at = c(1, nrow(df)/2, nrow(df)), labels = c('thu', 'fri', 'sat'))
  
  ### third plot
  with(df, plot(Sub_metering_1, type = 'l', xaxt = 'n' ,
                xlab = '', ylab = 'Energy Sub Metering'))
  with(df, lines(Sub_metering_2, col = 'red'))
  with(df, lines(Sub_metering_3, col = 'blue'))
  axis(1,at = c(1, nrow(df)/2, nrow(df)), labels = c('thu', 'fri', 'sat'))
  legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         col = c('black', 'red', 'blue'), lty=1, cex=0.8)
  
  ### fourth plot
  with(df, plot(Global_reactive_power , type = 'l', xaxt = 'n',
                xlab = 'Date Time', ylab = 'Global Reactive Power '))
  axis(1,at = c(1, nrow(df)/2, nrow(df)), labels = c('thu', 'fri', 'sat'))
  
  dev.off()
}