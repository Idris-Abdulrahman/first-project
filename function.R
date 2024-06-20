data <- c(1,2,1,5,6,7)
MEAN <- function(x){
  if(!is.numeric(x)){
    stop("input must be numeric")
  }
  sum_x <- sum(x)
  n <- length(x)
  mean_x <- sum_x / n
  return(mean_x)
}
MEAN(data2)
mean(data2)
ls()
rm(data2)

SD <- function(dev){
  if(!is.numeric(dev)){
    stop("input must be numeric")
  }
  mean_dev <- mean(dev)
  diff_dev <- dev - mean_dev
  diff_square <- diff_dev^2
  sum_diff_square <- sum(diff_square)
  n <- length(dev)
  result <- sqrt(sum_diff_square/(n-1))
  return(result)
}

SD(rbinom(10,10,0.6))
sd(c(1,2,3,4,5))

add <- function(x){
  if(!is.numeric(x)){
    stop("a numeric data is needed")
  }
  tsum <- 0
  for(n in x){
    tsum <- tsum + n
  }
return(tsum)
}
add(c(1,5,7,8,66))

#differences in numbers ####
numbers <- c(15,7,22,7,8,11,17,5,9,6)
differences <- numeric(length(numbers)-1)
for(i in 1:length(numbers)-1){
  differences[i] <- numbers[i + 1] - numbers[i]
}
differences


set.seed(123)
d <- rbinom(n = 15,size = 10,prob = 0.6)
m_ean <- MEAN(d)
result <- d - m_ean
result
results <- numeric(length(d))
for(num in 1:length(d)){
  results[num] <- d[num] - m_ean
}
print(results)

number <- c(1:10)
m_num <- 5.5
m_num1 <- number - m_num
m_num1
values <- numeric(length(number))
for(i in 1:length(number)){
  values[i] <- number[i] - m_num
}
print(values)

num_vector <- c(1:15)
vec_mean <- 8
for(vec in num_vector){
  num_vector[vec] <- vec - vec_mean
}
print(num_vector)

#customed Length########
L <- function(x){
total_l <- 0
for(i in x){
  total_l <- total_l + 1
}
return(total_l)
}
L(c(2,3,4,5,8,9,9,9))
#more functions#######
fac_ <- function(x){
  for(num in x){
    if(num == 0){
      return(1)
    }
  for (num in x) {
    return(num*fac_(num - 1))
  }
    }
}
fac_(6)

fac_ <- function(y){
  while(y == 0){return(1)}
  while(y != 0){return(y * fac_(y-1))}
}
fac_(6)

set <- c(1:50)
sum_even <- 0
sum_odd <- 0
for(num in set){
if(num%%2 == 0){
  sum_even <- sum_even + num
  print(paste("even number", num))
}else{
  sum_odd <- sum_odd + num
  print(paste("odd number", num))
}
 dif1 <-  sum(sum_even)
 dif2 <- dif1 - 1
 dif2
  sum(sum_odd)
}

data <- c("titi", 9, 10, "eleven", "dele", 100, 25)
for (i in data) {
  print(paste(i))
  if(i == 100){
    print(paste("i have found number", i, sep = "-"))
  }else{
    print("number not found")
  }
  }
  
recurssion <- function(n)
  if(n == 0){
    return(1)
  }else{
    return(n * recurssion(n-1))
  }
recurssion(7)
#sorting#####################
customed_sort <- function(x){
  container <- c()
  while((length(x)>0)){
    container <- c(container, min(x))
    x <- x[-which.min(x)]
  }
  return(container)
}

customed_sort(c(1))

cust_sort <- function(x){
       container <- c()
       while(length(x)>0){
             container <- c(container, min(x))
            x <- x[x != min(x) | duplicated(x)]
       }
       return(container)
   }
 cust_sort(c(3,2,7,5,9,6,5,1))

a <- FALSE
b <- FALSE
 check <-  a    
 check2 <-  b
 if(check || check2){
   print("number is not equal")
 } else{
   print("number is equal")
 } 
 
 #####
 d <- c(4,4,4,4,4,4)
min(d)

 cus_min <- function(x){
   n <- c()
     for (num in x) {
       if(num >= 0){
         n <- c(n, num)
       }
     }
   return(n)
 }
cus_min(d)   
#mininum value#########
cus_min <- function(x){
 if(length(x) == 0){
   stop()
 }
  min_val <- x[1]
for (num in x){
  if(num < min_val){
    min_val <- num
  }
}
  return(min_val)
}
cus_min(d)



cus_diff <- function(x){
  if(length(x) == 0){
    stop("cannot perform this operation on a single value")
  }
  container <- numeric(length(x)-1)
    for(num in 1:(length(x)-1)){
    container[num] <- x[num + 1] - x[num]
    }
  return(container)
}
cus_diff(c())

##########################
cus_duplicated <- function(x){
  n <- logical(length(x))
  for(i in 1:length(x)){
    n[i] <- any(x[i] == x[-i])
  }
    return(n)
}
de <- c(3,2,5,2,3,4)
cus_duplicated(de)
seq

custom_duplicate <- function(x){
  result <- logical(length(x))
  seen <- list()
  for(num in 1:length(x)){
    if(x[num] %in% seen ){
      result[num] <- TRUE
    } else{
      seen <- c(seen, x[num])
    }
  }
  return(result)
}
custom_duplicate(de)


sort <- function(y){
  seen <- c()
  for (num in 1:length(y)){
    seen <- c(seen, min(y))
    y <- y[-which.min(y)]
  }
  return(seen)
}
sort(de)

########################### usarrest,  usjudge
data()
state_data <- state.x77
names(state_data)
us_data <- data.frame(state_data)
us_data$states <- rownames(us_data)
names(us_data)
ggplot(us_data, aes(x= reorder(states, -Population), y=Population))+
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

hist(us_data, xlab = states, ylab = Population)
plot(us_data, x=states, y=population)

id <- c(1:10)
names <- c("Yahaya", "Titi", "Gbemi", "kiki", "idayat", "Tolu", "Ridwan",
           "Thomas", "Amos", "Tola")
gender <- factor(c("male","female","female", "female", "female", "male",
                   "male", "male", "male", "female"))
table_data <- data.frame(id, names, gender)
table_data
