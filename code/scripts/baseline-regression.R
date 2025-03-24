library(ggplot2)

sleep_baseline <- read.csv("../data/sleep-24-Mar-19-23-58.csv")

sleep_baseline$J_per_sec <- sleep_baseline$PKG / sleep_baseline$seconds

j_model <- lm(PKG ~ seconds, data=sleep_baseline)

summary(j_model)
