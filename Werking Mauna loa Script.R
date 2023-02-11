# practice while loops


x=38
while(x>0){
  x=x-1
  print(x)
}

# Fishin game

TotalCatchLb = 0
n_fish = 0 
while(TotalCatchLb < 50){
  n_fish = n_fish+1
  NewFishWeight = rnorm(n=1, mean=2, sd=1)
  TotalCatchLb = TotalCatchLb + NewFishWeight
  
}

