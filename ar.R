theil <- function(fy, y) {sqrt(sum((fy - y)^2)/sum(y^2))}
dw <- function(model){sum((model$residuals - lag(model$residuals))^2, na.rm = TRUE) /
    sum(model$residuals^2, na.rm = TRUE)}

vvpuah <- read.csv("data.csv")[4]
qvvpuah <- ts(vvpuah, start = 2001, frequency = 4)

fqvvpuah <- qvvpuah[1:56]
tqvvpuah <- qvvpuah[57:60]

fqvvpuah <- ts(qvvpuah[1:56], start = 2001, frequency = 4)
tqvvpuah <- ts(qvvpuah[57:57], start = 2015, frequency = 4)

fqvvpuah.arima = auto.arima(fqvvpuah)
fqvvpuah.arima.f = forecast(fqvvpuah.arima, h=1, level = c(95))
accuracy(fqvvpuah.arima.f$mean, tqvvpuah)

theil(fqvvpuah.arima.f$mean, tqvvpuah)
dw(fqvvpuah.arima)

acf(fqvvpuah.arima$residuals)
plot(forecast(fqvvpuah.arima, h=3, level = c(95)))

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

d = dw(qvvpuah.arima)

predicted <- forecast(qvvpuah.arima, h=3)
predicted
plot(predicted)