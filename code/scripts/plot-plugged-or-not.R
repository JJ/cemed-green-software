library(ggplot2)

plugged <- read.csv("../data/plugged-intel-23-Mar-12-49-37.csv")
unplugged <- read.csv("../data/unplugged-intel-23-Mar-12-53-27.csv")

plugged_data <- rbind( plugged, unplugged)
ggplot(plugged_data, aes(x=PKG,y=seconds,color=Platform))+geom_point()+geom_smooth(method="lm")+theme_minimal()+labs(title="Battery/Current performance",x="PKG (Joules)",y="Time (seconds)")

plugged_data$size <- as.factor(plugged_data$size)
ggplot(plugged_data, aes(x=size,y=PKG,color=Platform))+geom_boxplot()+theme_minimal()+labs(title="Battery/Current performance",x="File size",y="PKG (Joules)")

ggsave("../../img/plugged-vs-unplugged-intel.png",width=6, height=4)
