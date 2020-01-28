# Find out a year is Leap Year or Not
year <- 1990

if((year %% 4) == 0) {
  if((year %% 100) == 0) {
    if((year %% 400) == 0) {
      print(paste(year,"is a leap year"))
    } else {
      print(paste(year,"is not a leap year"))
    }
  } else {
     print(paste(year,"is a leap year"))
  }
} else {
  print(paste(year,"is not a leap year"))
}

#Output: 1990 is not a Leap Year
