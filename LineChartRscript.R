library(ggplot2)
library(reshape2)
library(plyr)

df_GSP_FTSE_00_10 <- read.csv("C:/Users/shevd/Downloads/Training files/line_chart_data.csv",
                              header = TRUE,
                              sep = "," )
# cast the date and format it 
df_GSP_FTSE_00_10$Date <- as.Date(df_GSP_FTSE_00_10$Date,
                                  format = "%m/%d/%Y")
# merge all the categories in one value to add it to the chart
df_GSP_FTSE_00_10_melt <- melt(df_GSP_FTSE_00_10,
                              id.vars = "Date") 
# rename the columns 
df_GSP_FTSE_00_10_melt <- rename(df_GSP_FTSE_00_10_melt,
                                 c("value" = "Returns",
                                   "variable" = "Index"))


# create the line chart 
line_chart <- ggplot(df_GSP_FTSE_00_10_melt, 
                     aes(x = Date,
                         y = Returns,
                         color = Index)) + 
                     geom_line(aes(color = Index),
                               size = 1) +
                     scale_color_manual(values = c("navyblue", "red4")) +
                     theme_minimal() +
                     ggtitle("S&P VS FTSE Returens (2000 - 2010) ")
line_chart

# create a line chart for the last two quarters of 2008
min <- as.Date("2008-07-01") # create the min date
max <- as.Date("2008-12-31") # create the max date
line_chart08 <- ggplot(df_GSP_FTSE_00_10_melt, 
                     aes(x = Date,
                         y = Returns,
                         color = Index)) + 
                     geom_line(aes(color = Index),
                               size = 1) +
                     scale_color_manual(values = c("navyblue", "red4")) +
                     theme_minimal() +
                     ggtitle("S&P VS FTSE Returens (H2 2008) ") + 
                     scale_x_date(limits = c(min,max)) + # add the limited date
                     theme(legend.justification = c(0.01 ,1),
                           legend.position = c(0.01, 1))
                    
line_chart08

