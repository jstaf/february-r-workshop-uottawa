library(dplyr)
library(gapminder)
library(magrittr)

gap <- gapminder

select(gap, country, year, pop)
gap %>% 
  select(country, year, pop) %>% 
  filter(country == "Canada")

europe <- gap %>% 
  filter(continent == "Europe") %>% 
  filter(country != "United Kingdom")

eurasia <- gap %>% 
  filter(continent %in% c("Europe", "Asia")) %>% 
  group_by(continent, year) %>% 
  summarize(mean_pop = mean(pop), 
            sd_pop = sd(pop))

#gap$gdp <- gap$pop * gap$gdpPercap / 1e9
gap %>% 
  mutate(gdp = pop * gdpPercap / 1e9) %>% 
  arrange(desc(year))

# Calculate the mean and standard error of the mean (SEM) of gdp 
# for each continent for each year. Sort by continent name in descending order. 
# We want to exclude the United Kingdom from this analysis.
# Only for the years after 1973.

# SEM = sd(some_vector) / sqrt(length(some_vector))

results <- gap %>% 
  filter(country != "United Kingdom") %>% 
  filter(year > 1973) %>% 
  mutate(gdp = pop * gdpPercap / 1e9) %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdp = mean(gdp),
            sem_gdp = sd(gdp) / sqrt(length(gdp))) %>% 
  arrange(desc(continent))


# select                # get columns
# filter                # get rows where X is true
# arrange               # sort rows
# mutate                # add a column
# group_by & summarize  # perform an operation by a set of categories
# %>%                   # send results to first argument of next function

