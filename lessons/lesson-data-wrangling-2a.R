library(tidyverse)
library(lubridate)

deaths_df <- read.csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"),check.names = FALSE)

last_column <- colnames(deaths_df)[ncol(deaths_df)]

# Remove redundant columns, rename the others, filter out for counties and states

deaths_df %>%
  as_tibble() %>%
  select(-UID,-iso2,-iso3,-code3,-FIPS,-Country_Region,-Lat,-Long_,-Combined_Key) %>%
  rename(county=Admin2,state=Province_State,population=Population) %>%
  filter(!(county=="") & !(county=="Unassigned") & !grepl("Out of",county)) %>%
  mutate(population=as.numeric(population)) ->
deaths_tibble

# pivot the dates into a column, convert dates to 2020-04-01 format, add a column with deaths_per_million

deaths_tibble %>%
  pivot_longer(c(`1/22/20`:all_of(last_column)),names_to="date",values_to="deaths") %>%
  mutate(date=mdy(date)) %>%
  mutate(deaths_per_million = round(as.numeric(deaths)/population*1000000)) ->
deaths

# compute the population of each state and of the US

deaths_tibble %>%
  group_by(state) %>%
  summarise(state_pop = sum(population)) ->
state_populations

state_populations %>%
  summarise(us_pop = sum(state_pop)) ->
us_population

# Plot for all states deaths_per_million vs time 

deaths %>% 
  subset(date > as.Date("2020-03-15")) %>%
  group_by(state,date) %>%
  summarise_at(vars(deaths),sum) %>%
  inner_join(state_populations, by = c("state" = "state")) %>%
  mutate(deaths_per_million = round(deaths/state_pop*1000000)) ->
state_deaths_per_million

state_deaths_per_million %>%
  ggplot() + geom_line(mapping = aes(x = date, y = deaths_per_million,color = state))

