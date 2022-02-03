library(dplyr)
library(lubridate)

load_data <- function(){
  
  ### loading and cleaning the data
  data <- read.csv(file='household_power_consumption.txt', sep = ';')
  colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage',
                      'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
  
  ### replacing the ? char by na
  data[data == '?'] <- NA
  
  data <-  data %>%
              mutate(Date = dmy(Date), Time = hms(Time),
                     Global_active_power = as.numeric(Global_active_power),
                     Global_reactive_power = as.numeric(Global_reactive_power),
                     Voltage = as.numeric(Voltage),
                     Global_intensity = as.numeric(Global_intensity),
                     Sub_metering_1 = as.numeric(Sub_metering_1),
                     Sub_metering_2 = as.numeric(Sub_metering_2),
                     Sub_metering_3 = as.numeric(Sub_metering_3),
                     date_time = minutes(Date) + minutes(Time))

  data %>% filter(Date %in% c(ymd('2007-02-01'), ymd('2007-02-02')))
}