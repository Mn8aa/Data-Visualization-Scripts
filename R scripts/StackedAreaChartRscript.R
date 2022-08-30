library(ggplot2)
library(dplyr)
library(reshape2)

df_fuel_engine_type = read.csv('C:/Users/shevd/Downloads/Training files/stacked_area_chart_data.csv',
                               header = TRUE,
                               sep = ',')
# select all the columns expect one column cuz we didn't need it 
temp <- df_fuel_engine_type %>%
  select(c('Year','Gas', 'Petrol', 'Diesel'))

# merge all the categories in one value to add it to the chart
new_engine_type <- melt(temp, id.vars = "Year")

# create the stacked area chart 
area_chart <- ggplot (new_engine_type,
                      aes(x = Year,
                          y = value,
                          fill = variable)) +
                        geom_area() + 
                        scale_fill_manual( values = c('#ef2026',
                                                      '#7e2987',
                                                       '#011638')) + # change the colors of the chart 
                        theme_classic() + # set the theme to white
                        theme(legend.justification = c (0.1,1),
                              legend.position = c(0.1, 1)) + #change the legend place
                        labs(fill = "Engine Type") + # change the legend title
                        ylab("Number of Cars") + # change the title of the y axis 
                        theme(axis.text.x  = element_text( angle = 90,
                                                           vjust = 0.5 )) + # change the angle of x axis values
                        scale_x_continuous(breaks = new_engine_type$Year) + # make the x axis show all the values
                        ggtitle("Popularity of Engine Feul Type (1982 - 2016)")
  
area_chart
