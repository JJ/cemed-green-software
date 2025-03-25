library(ggplot2)

amd_desktop_base <- read.csv("../data/test-23-Mar-09-04-38.csv")

ggplot(amd_desktop_base, aes(x=PKG,y=seconds,shape=File))+geom_point()+geom_smooth(method="lm")+labs(title="Desktop AMD Baseline",x="PKG (Joules)",y="Time (seconds)")
ggsave("../../img/time-vs-pkg-amd-libri.png",width=9, height=5)

amd_desktop_base$mb_per_J <- amd_desktop_base$size/ (1024*1024 * amd_desktop_base$PKG )

ggplot(amd_desktop_base, aes(x=File,y=mb_per_J))+geom_boxplot(notch=T)+labs(title="Desktop AMD Baseline",x="File",y="MB per Joule")
ggsave("../../img/mb-per-joule-amd-libri.png",width=9, height=5)

amd_desktop_base$delta_PKG <- amd_desktop_base$PKG - 21.3536*amd_desktop_base$seconds
ggplot(amd_desktop_base, aes(x=delta_PKG,y=seconds,shape=File))+geom_point()+geom_smooth(method="lm")+labs(title="Desktop AMD Energy",x="Delta PKG (Joules)",y="Time (seconds)")

ggplot(amd_desktop_base, aes(y=delta_PKG,x=File))+geom_violin()+labs(title="Energy per file",x="File",y="PKG -Joules")

ggsave("../../img/boxplot-delta-pkg-amd-libri.png",width=9, height=5)
