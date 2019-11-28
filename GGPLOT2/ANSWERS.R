### Gapminder summarize excercise

gapminder_df_continent <- gapminder_df %>% 
  group_by(year, continent) %>% 
  summarize(gdpPercap = mean(gdpPercap, na.rm = TRUE)) 

gdp_avg_df_1980_2000 <- filter(gapminder_df_continent, year %in% 1980:2000)

ggplot(gdp_avg_df_1980_2000, 
       aes(x = year,
           y = gdpPercap,
           color = continent)) +
  geom_line(size = 2)


### Venezuela, Ecuador and Bolivia 


ven_ecu_bol_df <- filter(gsodi_long_w_regions, ID_country_name %in% c("Ecuador","Venezuela", "Bolivia"),
                       ID_variable_name == "Checks on Government",
                       ID_year %in% seq(1990, 2018, by = 1))


ggplot(data = ven_ecu_bol_df, aes(x = ID_year, y = value, 
                                  fill = ID_country_name, color = ID_country_name)) +
  geom_line(size = 2) + # Changed line thickness 
  theme_minimal() + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2018), limits = c(1990, 2018))+ 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10),limits=c(0, 1))+
  labs(x = "Year", y = "Checks on Government Score",
       title = "Venezuela's declining accountability",
       subtitle = "Data points are country-years",
       caption = "Source: Global State of Democracy Indices (2018)",
       color = "Country") + 
  theme(text = element_text(size = 20))  

### Changing Text size

theme(text = element_text(size = 20)) 

### geom_bar


ven_ecu_bol_df <- filter(gsodi_long_w_regions, ID_country_name %in% c("Ecuador","Venezuela", "Bolivia"),
                         ID_variable_name == "Checks on Government",
                         ID_year == "2018")


ggplot(data = ven_ecu_bol_df, aes(x = ID_country_name,
                                  y = value, 
                                  fill = ID_country_name, color = ID_country_name)) +
  geom_bar(stat = "identity") +  
  theme_minimal() + 
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10),limits=c(0, 1))+
  labs(x = "Year", y = "Checks on Government Score",
       title = "Venezuela's declining accountability",
       subtitle = "Data points are country-years",
       caption = "Source: Global State of Democracy Indices (2018)",
       color = "Country") + 
  theme(text = element_text(size = 20))
