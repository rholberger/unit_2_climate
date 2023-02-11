#Arctic Sea Ice Data
library(lubridate)
url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url, skip=2, sep=",", header=FALSE, 
                        
                        col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))
tail(arctic_ice)
head(arctic_ice)

#Let's convert this to decimal date using lubridate!

arctic_ice$date = make_date(year=arctic_ice$Year,
                            month=arctic_ice$Month,
                            day=arctic_ice$Day)

head(arctic_ice)

plot(Extent~date, data=arctic_ice, type="l", ylab="Arctic Sea Ice Extent 10^6 Km^2", xlab="Year")

# Creating Annual Average

arctic_ice_average = data.frame(Year=seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1),
extent_annual_avg = NA,
extent_5yr_avg = NA)
#head(arctic_ice_average)
#mean(arctic_ice$Extent[arctic_ice$Year==1979])
#seq(dim(arctic_ice_average)[1])

#Here's Script for calculating annual averages:

for(i in seq(dim(arctic_ice_average)[1])){
  arctic_ice_average$extent_annual_avg[i] = 
    mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_average$Year[i]])
}
head(arctic_ice_average)
plot(arctic_ice_average$extent_annual_avg ~ arctic_ice_average$Year, type="l")
# Let's try for a 5 yr Average!
dim(arctic_ice_average)[1]-2
  
for(i in seq(from=3, to=dim(arctic_ice_average)[1]-2)){
  years = seq(from=arctic_ice_average$Year[i]-2, to=arctic_ice_average$Year[i]+2)
  arctic_ice_average$extent_5yr_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year %in% years])
}

tail(arctic_ice_average)
plot(arctic_ice_average$extent_annual_avg ~ arctic_ice_average$Year, type="l") + 
lines(x=arctic_ice_average$extent_5yr_avg, y=arctic_ice_average$Year, col="red")

arctic_ice_average$date = make_date(year=arctic_ice_average$Year)
head(arctic_ice_average)

  arctic_ice_average$extent_5yr_avg[i] = 
  
    
    mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_average$Year[i]])
}
years
