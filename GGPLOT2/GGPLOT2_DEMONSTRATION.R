library(gapminder)
library(tidyverse)

### 

### Knows the data, but not the mapping 

ggplot(data = gapminder)

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


#### Or layer multiple genoms? 

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_line() +
  geom_point()



### Adding layer by layer
### Changing scale

base_plot

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) +
  geom_point(alpha = 0.3) + #change the alphaa to make the dots more transparent 
  scale_x_log10(labels = scales::dollar) #Compresses outliers 

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


### But what do these dots represent? Which countries are they? 


ggplot(data = gapminder,
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


### Now lets look at gsodi data 


