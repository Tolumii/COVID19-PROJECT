# Load necessary libraries
library(tidyverse)
library(janitor)

# Load the COVID-19 dataset
covid_data <- read_csv("C:/Users/drtol/Downloads/owid-covid-data.csv")

# Clean column names for easier use
covid_data <- covid_data %>%
  clean_names()

# Preview the structure and summary of the data
glimpse(covid_data)
summary(covid_data)

# Filter data for Nigeria
nigeria <- covid_data %>%
  filter(location == "Nigeria")

# Plot daily new COVID-19 cases in Nigeria
ggplot(nigeria, aes(x = date, y = new_cases)) +
  geom_line(color = "blue") +
  labs(title = "Daily New COVID-19 Cases in Nigeria",
       x = "Date",
       y = "New Cases")

# Plot total COVID-19 deaths in Nigeria over time
ggplot(nigeria, aes(x = date, y = total_deaths)) +
  geom_line(color = "red") +
  labs(title = "Total COVID-19 Deaths in Nigeria Over Time",
       x = "Date",
       y = "Total Deaths")

# Find the day with the highest number of new deaths in Nigeria
nigeria %>%
  filter(new_deaths == max(new_deaths, na.rm = TRUE)) %>%
  select(date, new_deaths)

