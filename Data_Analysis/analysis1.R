#Task1
#A. Load the AirPassengers data into your environment
#B. Look at it by typing the name of the dataset

data("AirPassengers")
AirPassengers

# Output:
#   > AirPassengers
#      Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
# 1949 112 118 132 129 121 135 148 148 136 119 104 118
# 1950 115 126 141 135 125 149 170 170 158 133 114 140
# 1951 145 150 178 163 172 178 199 199 184 162 146 166
# 1952 171 180 193 181 183 218 230 242 209 191 172 194
# 1953 196 196 236 235 229 243 264 272 237 211 180 201
# 1954 204 188 235 227 234 264 302 293 259 229 203 229
# 1955 242 233 267 269 270 315 364 347 312 274 237 278
# 1956 284 277 317 313 318 374 413 405 355 306 271 306
# 1957 315 301 356 348 355 422 465 467 404 347 305 336
# 1958 340 318 362 348 363 435 491 505 404 359 310 337
# 1959 360 342 406 396 420 472 548 559 463 407 362 405
# 1960 417 391 419 461 472 535 622 606 508 461 390 432

#Extra average of Airpassenger
mean(AirPassengers)

# output
# > mean(AirPassengers)
# [1] 280.2986

# make a summary of the dataset
summary(AirPassengers)

# Output:
#   summary(AirPassengers)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 104.0   180.0   265.5   280.3   360.5   622.0 

# Task2:
# A. Create 2 variables.  One containing the number of passengers for January 1950 and the other containing the passengers for January 1960.  
# B. Use the variables you just created to find out how many more people flew in 1960 than in 1950.  (remember that when a variable is used in a formula it is replaced with whatever is inside of it before calculations are done.)
# C. Remove both of the variables that you just created from the environment.
# D. Use the help function to learn about one of the other functions we have used so far.

#creating variable
#A
Jan1950 <- 115
Jan1960 <- 417

#B
Jan1960 - Jan1950
#output: 302

#C
rm(Jan1950)
rm(Jan1960)

#Alternately we can remove
Jan1950 <- 115
Jan1960 <- 417
rm(Jan1950, Jan1960)

#D
help(mean)


# Task3
# A. Create variables for the 1949 and 1950 AirPassengers data.
# B. Calculate the total number of passengers that flew in 1950
# C. Make a new variable called AirTotal that contains the total number of passengers that flew from the beginning of 1949 to the end of 1950

#A
Air49 <- AirPassengers[1:12]
Air50 <- AirPassengers[13:24]

#B
sum(Air50)
#output : 1676

#C
AirTotal <- sum(Air49) + Sum(Air50)
#Output: 280.2986

# Task4
# A. Load the mtcars data into your environment.
# B. Find which vehicle has the fastest ¼ Mile Time.
# C. Make a variable called “fastest” that contains just the row with the fastest cars data
# D. Write a .csv file that contains the information for the fastest car and name it “FastestCar.csv”
#A
data(mtcars)
mtcars

# output
#                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
# Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
# Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
# Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
# Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
# Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
# Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
# Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
# Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
# Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
# AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
# Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
# Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
# Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
# Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
# Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
# Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

#B
summary(mtcars[,7])
#output: 
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#14.50   16.89   17.71   17.85   18.90   22.90 
#Fastest car means smallest number of qsec. So we are looking for 14.50 which is
# Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4

#C
fastest <- mtcars[29,]
fastest
#output
# mpg cyl disp  hp drat   wt qsec vs am gear carb
# Ford Pantera L 15.8   8  351 264 4.22 3.17 14.5  0  1    5    4

#D
write.csv(fastest, file = "Fastestcar.csv")

#Bonus.  What is the difference in gross horsepower between the vehicle with the fastest time and the one with the slowest time?  If you do this question post “BONUS” in the chat if you are ok with sharing how you got the answer.
help(mtcars)

# So 4th column is our Gross horsepower
fastest_horsepower <- mtcars[29,4]
fastest_horsepower
#264
slowest_horsepower <- mtcars[9,4]
slowest_horsepower
#95

Diff <- fastest_horsepower - slowest_horsepower
Diff
#169