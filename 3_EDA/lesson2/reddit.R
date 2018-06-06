reddit <- read.csv('lesson2/reddit.csv')

reddit$age.range <- ordered(reddit$age.range, levels = c(
  "Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"
))

# Alternative
reddit$age.range <- factor(
  reddit$age.range,
  levels = c("Under 18", "18-24", "25-34", "35-44", "45-54",
             "55-64", "65 or Above"),
  ordered = T)

reddit$age.range

library(ggplot2)
qplot(data = reddit, x = age.range)
