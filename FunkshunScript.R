
x = c(1,2,3)
return(x)
x
mean(x)

avg = function(x, Arithmetic=TRUE){
  n = length(x)
  result = ifelse(Arithmetic, sum(x)/n, prod(x)^(1/n))
  return(result)

  }

avg(x, Arithmetic=F)


#Grade Excercise:

GradeLetter = function(Grade){
  ifelse(Grade>=90,
         return("A"),
         ifelse(Grade>=80, return("B"),
                ifelse(Grade>=70, return("C"),
                       ifelse(Grade>=60, return("D"),
                                return("You got an F, try harder next time!")))))
}
GradeLetter(65)


url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'

temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))

head(temp_anomaly)
class(temp_anomaly)
dim(temp_anomaly)
summary(temp_anomaly)
tail(temp_anomaly)

temp1998 = temp_anomaly$No_Smoothing[Year == 1998]
temp1998

plot(No_Smoothing ~ Year, data=temp_anomaly, type="b") + 
  lines(temp_anomaly$Lowess_5 ~ temp_anomaly$Year, col = "red", lwd = 2)+
  abline(v=1998, lty = "dashed") +
  abline(v=2012, lty = "dashed")+
  lines(c(temp1998,temp2012))

calc_rolling_avg = funcion(data, moving_window=5){
  result = rep(NA, length(data))
  for(i in seq(from=moving_window, to=lenth(data))){
    result[i] = mean(data[seq(from=i-moving_window+1, to=i)])}
  
  return(result)}

temp_anomaly$avg_5_yr = calc_rolling_avg(data = temp_anomaly$No_Smoothing, moving_window=5)

?plot()
