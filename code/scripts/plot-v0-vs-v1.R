library(ggplot2)

amd_desktop_base <- read.csv("../data/test-23-Mar-09-04-38.csv")
amd_desktop_base$delta_PKG <- amd_desktop_base$PKG - 21.3536*amd_desktop_base$seconds
amd_desktop_base$Platform <- "v0"

amd_desktop_v1 <- read.csv("../data/python-v1-28-Mar-07-23-59.csv")
amd_desktop_v1$delta_PKG <- amd_desktop_v1$PKG - 21.3536*amd_desktop_v1$seconds

v0_vs_v1 <- rbind(amd_desktop_base, amd_desktop_v1)

ggplot( v0_vs_v1, aes(x=File,y=delta_PKG,color=Platform))+geom_boxplot()+labs(title="v0 vs v1",x="Time (seconds)",y="PKG (Joules)")+theme_minimal()+ theme(axis.text.x = element_text(size = 14, color="green"), axis.title.x = element_text(size = 16, color="green"),
                                                                                                                                           axis.text.y = element_text(size = 14, color="green"), axis.title.y = element_text(size = 16),
                                                                                                                                           plot.title = element_text(size = 20, face = "bold", color = "darkgreen"),
                                                                                                                                           legend.title=element_text(size=14, color="green"), legend.text=element_text(size=14, color="green"))
ggsave("../../img/v0_vs_v1_pkg.png",width=9, height=5)
