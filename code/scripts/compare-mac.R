library(ggplot2)
library(jsonlite)

amd_desktop_base <- read.csv("../data/test-23-Mar-09-04-38.csv")
amd_desktop_base$avg_watts_per_sec <- amd_desktop_base$PKG / amd_desktop_base$seconds
amd_desktop_base$avg_watts_per_100_msec <- amd_desktop_base$PKG / (amd_desktop_base$seconds * 10)
# Trim whitespace from the File column
amd_desktop_base$File <- gsub("^\\s+|\\s+$", "", amd_desktop_base$File)

manzoni_mac <- fromJSON("../data/sacrypt-manzoni-watts.json")
manzoni_seconds <- 10 * length(manzoni_mac$cpu_w)
malavoglia_mac <- fromJSON("../data/sacrypt-malavoglia-watts.json")
romanzi_mac <- fromJSON("../data/sacrypt-3romanzi-watts.json")

watts_mac_amd <- data.frame(watts_per_100_msec=amd_desktop_base$avg_watts_per_100_msec, Platform="AMD", File=amd_desktop_base$File)

watts_mac_amd <- rbind(watts_mac_amd,
                       data.frame(watts_per_100_msec=manzoni_mac$cpu_w, Platform="Mac", File="manzoni_i_promessi_sposi_1840"))

watts_mac_amd <- rbind(watts_mac_amd,
                       data.frame(watts_per_100_msec=malavoglia_mac$cpu_w, Platform="Mac", File="malavoglia"))

watts_mac_amd <- rbind(watts_mac_amd,
                       data.frame(watts_per_100_msec=romanzi_mac$cpu_w, Platform="Mac", File="3romanzi"))

ggplot(watts_mac_amd, aes(x=File,y=watts_per_100_msec,color=Platform))+geom_boxplot()+labs(title="AMD vs Mac",x="File",y="Watts per 100 msec")
