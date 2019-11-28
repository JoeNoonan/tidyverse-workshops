install.packages('ggthemes', 'gapminder', dependencies = TRUE)
library(gapminder)
library(tidyverse)
library(ggthemes)

### ggplot2 introduction  
### A quick overview of the process
### There are hundreds of little details you can learn but this is mostly focusing on the overall process


gapminder_df <- gapminder

### Knows the data, but not the mapping 

ggplot(data = gapminder_df)

### Given data and mapping, but no geom

ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))

### Given data, mapping and geonom

base_plot <- ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point() #Tells the computer which type of chart to make

### What happens when you change the geonom? 

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_line() # Tells the computer to make a line chart, this doesn't make sense.


### Adding layer by layer
### Changing scale

base_plot

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(alpha = 0.3) + #change the alpha to make the dots more transparent 
  scale_x_log10(labels = scales::dollar) #Compresses outliers using a logarithmic scale, add dollar sign

#### Adding labels 

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(alpha = 0.3) +
  scale_x_log10(labels = scales::dollar) + #Compresses outsiders 
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")


### How to group and color code variables?

final_plot <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent, # Color the outside of the points by contintnent
                          fill = continent))+ # Total fill by color
  geom_point() +
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")

### Right now all of the country--years are being shown.
### If you were only interested in 2018, how would you make a chart only showing 2018? 
### (Do together)

### How would we make a line chart to show how average life expetancy by continent has changed 
### from 1980 to 2000?


###
### Excercise 1
### 

### Reading in GSODI data  from URL 
gsodi_wide <- read_csv("gsodi_wide_w_region_names.csv") %>% 
  filter(!is.na(ID_region))# filter out all cases that don't have regional code

### Create a scatterplot for Fundemental Rights (C_A2) and Impartial Administration (C_A4)

### Now create the same scatterplot but just for Africa (ID_region_name)
### Store this plot as an object

### Now Create the same scatterplot but just for Africa (ID_region_name) in 2018 (ID_year)



### Themes! 
### Examples of themes below
### Black and white theme

final_plot +
  theme_bw()

### Theme minimal 

gapminder_minimal <- final_plot +
  theme_light()

### Additional themes from ggthemes

### "Five Thirty Eight"" Theme"
final_plot +
  theme_fivethirtyeight()

### How to save plots

### Save as a png
ggsave(gapminder_minimal, filename = "figures/gapminder_minimal.png")

### Save as a pdf

ggsave(gapminder_minimal, filename = "figures/gapminder_minimal.pdf")

### Change size

ggsave(gapminder_minimal, filename = "figures/gapminder_minimal_large.png", 
       height = 8, width = 10, units = "in", scale = .7) ## Height and width canbe changed as well as units (inches, cm, pixels)



### Now lets look at gsodi data 

### Goal - Make a chart showing 
### Checks on Government in Venezuela from 
### 1998 to 2018 

### read GSOD

gsodi_long_w_regions <- read_csv("gsodi_rank_ci_long_with_regions_v5_2019.csv")


venezuela_df <- filter(gsodi_long_w_regions, ID_country_name == "Venezuela", 
                       ID_variable_name == "Checks on Government",
                       ID_year %in% seq(1990, 2018, by = 1))

### Basic Plot

ggplot(data = venezuela_df, aes(x = ID_year, y = value)) +
  geom_line() +
  theme_minimal()


### Adding axis scales  and changing the scale 
ggplot(data = venezuela_df, aes(x = ID_year, y = value)) +
  geom_line() +
  theme_minimal() +
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2018), limits = c(1990, 2018))+ 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10),limits=c(0, 1))
  

### That looks a bit better but lets add some labels.
ggplot(data = venezuela_df, aes(x = ID_year, y = value)) +
  geom_line() +
  theme_minimal() + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2018), limits = c(1990, 2018))+ 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10),limits=c(0, 1))+
  labs(x = "Year", y = "Checks on Government Score", # Adding labels 
       title = "Venezuela's declining accountability",
       subtitle = "Data points are country-years",
       caption = "Source: Global State of Democracy Indices (2018)") 

### Lets make the line a bit thicker

ggplot(data = venezuela_df, aes(x = ID_year, y = value)) +
  geom_line(size = 1) + # Changed line thickness 
  theme_minimal() + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2018), limits = c(1990, 2018))+ 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10),limits=c(0, 1))+
  labs(x = "Year", y = "Checks on Government Score",
       title = "Venezuela's declining accountability",
       subtitle = "Data points are country-years",
       caption = "Source: Global State of Democracy Indices (2018)") 

### What about confidence intervals? Can you guess how we would add those in? 
### (do together)


### Activity 2 
### Make a chart comparing trends in Venezuela, Boliva and Ecuador from 1990 to 2018 

### Make a barchart looking at the scores for just 2018! (challenging )
### Hints use   geom_bar(stat = "identity")
### Think about x and y axis...




