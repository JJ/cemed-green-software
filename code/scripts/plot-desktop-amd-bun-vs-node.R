library(ggplot2)

bun_sacrypt <- read.csv("../data/sacrypt-js-bun-26-Mar-20-06-42.csv",sep=";")
node_sacrypt <- read.csv("../data/sacrypt-node-26-Mar-19-32-16.csv",sep=";")

node_vs_bun <- rbind(bun_sacrypt, node_sacrypt)
ggplot(node_vs_bun, aes(x=File,y=PKG,color=Platform))+geom_boxplot()+geom_smooth(method="lm")+labs(title="Node vs. Bun",x="File",y="PKG (Joules)")
ggsave("../../img/node_vs_bun_pkg.png",width=9, height=5)
