
number <- 1000
if (number > 0) {
  print("number was greater than 0")
} else {
  print("number was not greater than 0")
}

if (number >= 10) {
  print("the number is greater than or equal to 10")
} 

for (element in c("first", "second", "third")) {
  print(element)
}

library(gapminder)
gap <- gapminder

for (continent in unique(gap$continent)) {
  data <- gap[gap$continent == continent, ]
  print(continent)
  print(mean(data$pop))
}

# Make a for loop that calculates the mean gdpPercap for each country. 
# If it is greater than 2000, print "it's over 2000!".

for (country in unique(gap$country)) {
  print(country)
  countryData <- gap[gap$country == country, ]
  gdp <- mean(countryData$gdpPercap)
  print(gdp)
  if (gdp > 2000) {
    print("it's over 2000!")
  }
}



