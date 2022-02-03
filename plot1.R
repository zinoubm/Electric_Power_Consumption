source('get_data.R')

gen_plot1 <- function(df){
  df <- load_data()
  png('plot1.png')
  with(df, hist(Global_active_power, col = 'red', main = 'Global active power',
                xlab = 'Global active power(kilowats)'))
  dev.off()
}