library(ggplot2)

sleep_baseline <- read.csv("../data/sleep-24-Mar-19-23-58.csv")

sleep_baseline$J_per_sec <- sleep_baseline$PKG / sleep_baseline$seconds

j_model <- lm(PKG ~ seconds, data=sleep_baseline)

summary(j_model)

ggplot(sleep_baseline, aes(x=seconds,y=PKG))+geom_point()+geom_smooth(method="lm")+labs(title="Sleep Baseline",x="Time (seconds)",y="PKG (Joules)")
ggsave("../../img/time-vs-pkg-sleep.png",width=9, height=5)
