vvpusd <- read.csv("data.csv")[3]
vvpuah <- read.csv("data.csv")[4]
timeline <- read.csv("data.csv")[1:2]
for(i in 1:dim(timeline)[1]) { s_time[i] <- paste(c(timeline[i,1], timeline[i,2]), collapse = "/")}
ts(vvpuah, start = 2001, frequency = 4) -> qvvpuah
qvvpuah.ar <- ar(qvvpuah)
predict(qvvpuah.ar, n.ahead = 4)