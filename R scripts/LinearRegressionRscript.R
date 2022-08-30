library(ggplot2)

df_ad_expenditure <- read.csv("C:/Users/shevd/Downloads/Training files/Scatter_plot_ii.csv",
                              header = TRUE,
                              sep = "," )


# create the linear regression
regression_scatter <- ggplot(df_ad_expenditure, #data
                     aes(x = Budget, # x axis
                         y = Sales) + # y axis
                     geom_point(size = 3, # increase the plots size
                               color = "gray12") + # change the plots color
                     geom_smooth(method = lm, # add a line to the figure
                                 color = "red", # change the color
                                 se = FALSE ) + # remove the fill from the line
                     theme_classic() + # make the background white
                     # add labels
                     xlab("Ad Expenditure in (000's $)") +
                     ylab("Budget in (000's Units") +
                     ggtitle("Effect of Ad Expenditure on Sales")
regression_scatter

