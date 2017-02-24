library(plyr)
library(gapminder)

gap <- gapminder

adder <- function(arg1, arg2 = 10) {
  return(arg1 + arg2)
}
adder(5, 4)
result <- adder(3, 4)
adder(5, arg2 = 39)

# Write a function that converts from fahrenheit to kelvin.
f2k <- function(fahr) {
  return((fahr - 32) * 5 / 9 + 273.15)
}
f2k(32)

# Write another function to convert back.
k2f <- function(kelvin) {
  return((kelvin - 273.15) / 5 * 9 + 32)
}
k2f(f2k(32))

# (fahr - 32) * 5 / 9 + 273.15 = kelvin

temps <- list(3, 5, 99, 58, -32)
#f2k(c(3, 5, 99, 58, -32))
llply(.data = temps, .fun = f2k)  # list to list
laply(.data = temps, .fun = f2k)  # list to vector/array
res <- ldply(.data = temps, .fun = f2k)  # list to dataframe
colnames(res) <- "kelvin"
res

str(gap)
res <- ddply(.data = gap, .variables = c("continent", "year"),
      .fun = function(chunk) {
        return(mean(chunk$pop))
      })

library(doParallel)
library(microbenchmark)

cores = detectCores()
registerDoParallel(cores)

sleep <- function(x) {
  Sys.sleep(0.1)
  return(x)
}
microbenchmark(llply(1:100, .fun = sleep), 
               llply(1:100, .fun = sleep, .parallel = TRUE),
               times = 1
)
stopImplicitCluster()
