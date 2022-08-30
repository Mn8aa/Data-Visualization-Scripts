library(ggplot2)

df_KDnuggets = read.csv("C:/Users/shevd/Downloads/Training files/bar_line_chart_data.csv",
                                       header = TRUE)
# create bar line chart 
combo <- ggplot(df_KDnuggets, # data
                aes(x = Year, # x axis
                y = Participants, Pyhton.Users)) + # y axis
                geom_bar(aes(y = Participants), # create the bar chart
                         stat = "identity", # plot the number of participants
                         fill = "black") + # set the color
                geom_line(aes(y = Python.Users*max(Participants)), # create the line chart and rescale the line to match the bar chart 
                          stat = "identity", 
                          color = "red", 
                          size = 2) + # increase the size of the line
                scale_y_continuous(sec.axis = sec_axis(~./max(df_KDnuggets$Participants)*100, # add a secondary y axis title and rescale it by the max participants
                                   name = "Python Users in %")) +
                ggtitle("KD Nuggets Survay Python Users (2012 - 2019)")
combo