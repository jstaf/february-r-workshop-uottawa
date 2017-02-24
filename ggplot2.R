library(ggplot2)
library(gapminder)

gap <- gapminder

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(data = gap, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + scale_x_log10()

ggplot(gap, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() + scale_x_log10()

ggplot(gap, aes(x = gdpPercap, y = lifeExp, size = pop)) +
  geom_point(alpha = 0.3, color = "firebrick1") + scale_x_log10()


ggplot(gap) + geom_point(aes(x = gdpPercap, y = lifeExp))
ggplot() + geom_point(aes(x = gap$gdpPercap, y = gap$lifeExp))

ggplot() + 
  geom_point(aes(x = log10(gap$gdpPercap), y = gap$lifeExp)) +
  ylab("Life Expectancy (years)") + xlab("GDP per capita") +
  ggtitle("Our wonderful title")

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + scale_x_log10() +
  geom_point() + geom_smooth(method = "lm")

ggplot(gap, aes(x = year, y = lifeExp)) + geom_point()

ggplot(gap, aes(x = as.factor(year), y = lifeExp)) + 
  geom_boxplot()

ggplot(gap, aes(x = as.factor(year), y = lifeExp, color = as.factor(year))) + 
  geom_boxplot()

ggplot(gap, aes(x = as.factor(year), y = lifeExp, fill = as.factor(year))) + 
  geom_boxplot()

ggplot(gap, aes(x = as.factor(year), y = lifeExp, fill = year)) + 
  geom_boxplot() + 
  scale_fill_gradient(low = "red", high = "yellow")

# wrong way
ggplot(gap, aes(x = continent)) + geom_bar()

# right way
library(dplyr)
plotData <- gap %>% 
  group_by(continent) %>% 
  summarize(life = mean(lifeExp))
plotData
ggplot(plotData, aes(x = continent, y = life)) + 
  geom_bar(stat = "identity")

ggplot(gap, aes(x = lifeExp, fill = continent)) + geom_density(alpha = 0.3)

d <- ggplot(diamonds, aes(carat, log10(price)))
d + geom_hex()

ggplot(gap, aes(x = as.factor(year), y = lifeExp, fill = year)) + 
  geom_boxplot() + 
  scale_fill_gradient(low = "red", high = "yellow") + 
  theme_bw()

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + geom_point() +
  facet_wrap(~continent, ncol = 3)
ggsave("continents.png")

# Make a scatterplot of gdpPercap as a function of population.
ggplot(gap, aes(x = pop, y = gdpPercap)) + geom_point()

# Make a box plot of gdpPercap by year 
# (you'll need to turn year into a factor first!).
ggplot(gap, aes(x = as.factor(year), gdpPercap)) + geom_boxplot() + 
  ylim(c(0, 45000))

# Make a density plot of gdpPercap. 
# Facet and color it by continent for good measure. You can 
# change limits with xlim(c(lower, higher))

ggplot(gap, aes(x = gdpPercap, color = continent)) + 
  facet_wrap(~ continent) + geom_density() + xlim(c(0, 35000))

ggplot(gap, aes(x = gdpPercap, fill = continent)) + 
  facet_wrap(~ continent) + geom_histogram() + xlim(c(0, 35000))


# Bonus points for setting labels on all of these plots.



