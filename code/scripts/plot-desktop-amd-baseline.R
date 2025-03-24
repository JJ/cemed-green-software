library(ggplot2)

amd_desktop_base <- read.csv("../data/test-23-Mar-09-04-38.csv")

ggplot(amd_desktop_base, aes(x=PKG,y=seconds,shape=File))+geom_point()+geom_smooth(method="lm")+theme_minimal()+labs(title="Desktop AMD Baseline",x="PKG (Joules)",y="Time (seconds)")
