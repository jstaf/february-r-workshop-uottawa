library(gapminder)

gap <- gapminder
gap
str(gap)
summary(gap)

gap$gdp <- gap$pop * gap$gdpPercap
str(gap)
gap$gdp <- gap$gdp / 1e9
head(gap)

test <- c(3, 5, 6, 10, 55)
test[test < 10]
test[!(test == 10)]
test[test != 10]
(5 + 3) * 2
test2 <- c("a", "b", "b", "cheesecake")
test2[test2 == "b"]
nas <- c(2, 4, NA, NA, 5, NA)
mean(nas)
nas == NA
nas * 4

nas[!is.na(nas)]
na.omit(nas)
mean(nas, na.rm = TRUE)

canada <- gap[gap$country == "Canada", ]
mean(canada$gdp)

# get mean population of asia
asia <- gap[gap$continent == "Asia", ]
mean(asia$pop)
mean(gap$pop[gap$continent == "Asia"])
mean(gap[gap$continent == "Asia", ]$pop)

# then, get mean population of asia in 1987
asia <- gap[gap$continent == "Asia", ]
asia1987 <- asia[asia$year == 1987, ]
mean(asia1987$pop)

# "&" means AND (let's you do two comparisons at once). Using this,
# can you get the second question in one step? ("|" means OR, just for
# future reference)
asia <- gap[(gap$continent == "Asia") & (gap$year == 1987), ]
unique(asia$year)
unique(asia$continent)
mean(asia$pop)

canada
View(cbind(canada, canada))

canada[, "pop"]

multiple <- gap[gap$country %in% c("Canada", "Cambodia", "China"), ]

vec1 <- c("a", "c", "b", "d", "a")
vec2 <- c("a", "b")
vec3 <- c("a", "b", "a", "b", "a")
vec1 == vec2
vec1 == vec3

vec1[vec1 %in% vec2]

nrow(gap)
ncol(gap)
dim(gap)
colnames(gap)[2] <- "landmass"
head(gap)
colnames(gap) <- NULL
head(gap)

