vvpuah <- read.csv("data.csv")[4]
qvvpuah <- ts(vvpuah, start = 2001, frequency = 4)

fqvvpuah <- qvvpuah[1:52]
tqvvpuah <- qvvpuah[53:61]
fqvvpuah.arima = auto.arima(fqvvpuah)
fqvvpuah.arima.f = forecast(fqvvpuah.arima, h=8, level = c(95))
accuracy(fqvvpuah.arima.f$mean, tqvvpuah)

vvpusd <- read.csv("data.csv")[3]
ts(vvpusd, start = 2001, frequency = 4) -> qvvpusd

# qvvpuah.ar <- ar(qvvpuah)
# predict(qvvpuah.ar, n.ahead = 4)

library(cat)
library(lmtest)
qvvpuah.arima <- Arima(qvvpuah, order=c(6,0,0), method="ML")
qvvpuah.arima.auto <- auto.arima(qvvpuah)

d = sum((qvvpuah.arima$residuals - lag(qvvpuah.arima$residuals))^2, na.rm = TRUE) /
  sum(qvvpuah.arima$residuals^2, na.rm = TRUE)

dw <- function(model){sum((model$residuals - lag(model$residuals))^2, na.rm = TRUE) /
    sum(model$residuals^2, na.rm = TRUE)}
d = dw(qvvpuah.arima)

predicted <- forecast(qvvpuah.arima, h=3)
predicted
plot(predicted)