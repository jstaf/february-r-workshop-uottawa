cats <- read.csv("cats.csv", as.is = TRUE)

# lets analyze our cats
class(cats)

cats$weight * 20
cats$likes_string
cats$coat

class(cats$weight)
class(cats$likes_string)
class(cats$coat)
class("some text")

str(cats)
cats$coat
#as.numeric(cats$coat)

#cats$coat <- as.character(cats$coat)
str(cats)

1:10
vec <- c(1, 3, 5, 6, "8")
vec * 4
class(vec)

vec <- c(4, 6, 7,8)
vec[5] <- 555
vec
vec[1:3]
vec[c(4, 6, 1)]
vec[-1]
vec[length(vec)]

theMatrix <- matrix(1:20, nrow = 4, ncol = 5)
2 ^ theMatrix
theMatrix[1,]
theMatrix[,1]
theMatrix[2,2]
theMatrix[1:3, 3:5]

c(1, "a", TRUE, NA, NaN, Inf)
class(TRUE)
a_list <- list(1, "a", TRUE, NA, NaN, c(1, 3, 4), Inf)
a_list
a_list[[5]]
a_list[[6]][2] ^ 2

length(theMatrix)
theMatrix

matrix(1:50, ncol = 5, nrow = 10, byrow = TRUE)
types <- list(
  data_types = c("logical", "numeric", "integer", "character", "factor"),
  data_structures = c("vector", "matrix", "array", "data.frame", "list")
)
types
types$data_types

typeof(cats)
