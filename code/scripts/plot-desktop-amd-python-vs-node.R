library(ggplot2)

python_sacrypt <- read.csv("../data/test-23-Mar-09-04-38.csv")
python_sacrypt$Platform <- "Python"
node_sacrypt <- read.csv("../data/sacrypt-node-26-Mar-19-32-16.csv",sep=";")
node_sacrypt$size <- python_sacrypt$size

node_vs_python <- rbind(python_sacrypt, node_sacrypt)
ggplot(node_vs_python, aes(x=PKG,y=seconds,shape=File,color=Platform))+geom_point()+geom_smooth(method="lm")+labs(title="Node vs. Python",x="PKG (Joules)",y="Time (seconds)")
ggsave("../../img/node_vs_python_pkg_seconds.png",width=9, height=5)
