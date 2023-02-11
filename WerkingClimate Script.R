ant_ice_loss = read.table("data/antarctica_mass_200204_202209.txt", skip = 31, sep = "", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))
grn_ice_loss = read.table("data/greenland_mass_200204_202209.txt", skip=31, sep="", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))  
typeof(ant_ice_loss)
dim(grn_ice_loss)
data.frame(grn_ice_loss)
head(ant_ice_loss)
tail(grn_ice_loss)
summary(ant_ice_loss)

# Plot this Ice Jazz

# Add Data Break Between Missions
data_break = data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)
data_break

ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break) # Merge ant_ice_loss data frame with our NA point
tail(ant_ice_loss_with_NA)
head(ant_ice_loss)

order(ant_ice_loss_with_NA$decimal_date)
ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date),]
#Repeat with Greenland data.frame
grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break) # Merge grn_ice_loss data frame with our NA point
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

#Now make the plot look nice:
plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", xlab = "Year", type='l', ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE)) +
  lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, lty="dashed")+
  lines((mass_Gt - 2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, lty="dashed")
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type='l', col='green') 
  lines((mass_Gt + 2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, lty="dashed", col = "green")+
    lines((mass_Gt - 2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, lty="dashed", col = "green")

# Bar Plot!
min(ant_ice_loss$mass_Gt)
max(ant_ice_loss$mass_Gt)
tot_ice_loss_ant = min(ant_ice_loss$mass_Gt) - max(ant_ice_loss$mass_Gt)
tot_ice_loss_grn = min(grn_ice_loss$mass_Gt) - max(grn_ice_loss$mass_Gt)

barplot(height=c(min(ant_ice_loss$mass_Gt), min(grn_ice_loss$mass_Gt)))




#Januaryt 26, 2023 - Now for Some Boolean logic!
vec=c(1,5,2,1)
vec[c(T,F,T,F)]
x = 3
x == 3
x != 3
x<=3
x<3
2%in%vec
c(1,0,2,1) == vec
c(1,2,3) >= c(2,2,2)
c(3,1,5,7) %in% vec

world_oceans = data.frame(oceans = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
world_oceans$avg_depth_m > 4000
deep_oceans = world_oceans[world_oceans$avg_depth_m > 4000,]
deep_oceans
sum(world_oceans$avg_depth_m > 4000)

# imprecise numerics - so you know!
1+2 == 3
0.1 + 0.2 == 0.3
my_error = 0.00001
abs(0.3 - (0.2 + 0.1)) > my_error

# Boolean!
x = 5
x > 3 & x < 14
x > 3 | x > 15
x < 10 & x %in% vec

# let's make a subset!
world_oceans$oceans[world_oceans$avg_depth_m > 4000 | world_oceans$area_km2<50E6]

z=c(T,F,F)
any(z)
all(z)
NA == NA
vec = c(1,2,NA,4)
is.na(vec)
any(is.na(vec))
!(is.na(vec))

#########
# If Else!
#########

if (any(is.na(vec))) {
  print("oh no")
  y = "yipeee"}
y
num=-2
if (num<0){num=num*-1}
num

temp = 99.9
if(temp > 98.6 & temp < 100){
    print("You have a bit of a fever")}

  high_temp = temp - 98.6
  print(high_temp)
  print ("higher than it should be")
  
  

  grade=59
  if( grade >= 60){print("You Pass!")} else{print("Try Harder Next Time")}

  a=20
  b=30
  if(a>b){
  print("You Win")} else{print("Better Luck Next Time, you Lost By:")}
  abs(b-a)
  
  doughnuts = 3
  ifelse(doughnuts>12, print("Enough FOr Everone!"),print("Go Get More"))


