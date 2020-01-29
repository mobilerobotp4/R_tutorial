#Reverse a given number

digit<-512 
rev_num<-0 
while(digit>0){   
    rev_num=rev_num*10 + digit %% 10 
    digit=as.integer(digit / 10) 
} 
print(paste(rev_num))