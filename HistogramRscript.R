library(ggplot2)

#load the dataset 
df_real_estate <- read.csv("C:/Users/shevd/Downloads/Training files/Histogram_data.csv",
                              header = TRUE,
                              sep = "," )
# create the histogram
hist <- ggplot(df_real_estate,
               aes(x = Price)) + 
               geom_histogram( bins = 8, #change the number of bins in the figure
                               fill = "#108A99", #change the color of bins
                               color = "white") + # add white border to bins
               theme_classic() + # change the theme and make it with white background
               ggtitle("Distribution of Real Estate Prices") + # add title
               theme(plot.title = element_text(size = 16,
                                  face = "bold")) + # make the title bigger and bold
               xlab("Prices in (000'$)") + # add x axis title
               ylab("Number of Properities") # add y axis title
               
hist