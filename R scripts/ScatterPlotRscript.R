library(ggplot2)
library(wesanderson)
#load the dataset 
df_real_estate <- read.csv("C:/Users/shevd/Downloads/Training files/Histogram_data.csv",
                           header = TRUE,
                           sep = "," )
# create the Scatter plot 
scatter <- ggplot(df_real_estate,
               aes(x = Area..ft..,
                   y = Price)) + 
               geom_point( aes(color = factor(Building.Type)), #color the plots depending on another variable
                           size = 2, # increase the plots size 
                           alpha = 0.4) + # add transparency to the plots
               guides(size = FALSE) + # remove the size form the figure
               labs(color = "Building Type" ) + # change the legend name
               scale_color_manual(values = wes_palette(name = "Darjeeling1",
                                                        n = 5)) + # add a color palette to the chart from the wesanderson package
               theme_classic() + # make the background white 
               theme(legend.justification = c(0.1, 1), #alter the legend position
                     legend.position = c(0.1, 1))
scatter
