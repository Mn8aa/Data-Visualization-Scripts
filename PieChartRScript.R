library('ggplot2')

df_fuel_engine_type = read.csv('C:/Users/shevd/Downloads/Training files/pie_chart_data.csv',
                               header = TRUE,
                               sep = ',')

#you can't create a pie chart in ggplot2 so firstly you need to create a stacked 
# bar chart and then convert it to pie chart 

pie_chart <- ggplot(df_fuel_engine_type,
                    aes( x = "",
                         y = Number.of.Cars,
                         fill = Engine.Fuel.Type)) + 
                    geom_bar( stat = "identity",
                              width = 1) + #create a staked par chart
                    coord_polar("y") #convert it to pie chart 
# create percentages value to put it in the pie chart as labels
percentages <- paste0(round(df_fuel_engine_type$Number.of.Cars
                /sum(df_fuel_engine_type$Number.of.Cars) * 100 , 1),"%")
pie_chart <- pie_chart + geom_text(aes(label = percentages),
                             position = position_stack(vjust = 0.5))
# remove the labels from the stacked bar chart 
pie_chart <- pie_chart + labs(x = NULL,
                              y = NULL,
                              fill = NULL,
                              title = "Cars by Engine Fule Type")
# create a color theme 
cbPlatte <- c( "#009e73","#999999", "#E69F00","#d55e00", "#cc79a7", "#0072b2", "#0072b2")
pie_chart <- pie_chart + scale_fill_manual(values = cbPlatte)
# remove the grid and the numbers around the pie chart 
pie_chart <- pie_chart + theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        plot.title = element_text(hjust = 0.5))

pie_chart 
