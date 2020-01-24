# Conditional Statement - The if Statement
#if (TRUE) print ("Message")
#Example

x <- 5
if(x > 0){
print("Positive number")
}

#Output : "Positive number"

# if - else statement
# typing else on the same line where closing  if }


x <- -5
if(x > 0){
print("Positive number")
}else {
    print("Negative number")
}

#Output : "Negative number"

# The above conditional can also be written in a single line as follows:

x <- -5
if(x > 0) print("Non-negative number") else print("Negative number")

#Output: "Negative number"
#another example of if-else demonstartion

quantity <- 25
if (quantity>20){
  print('You sold a lot')
}else{
  print('Not Enough for today')
}
