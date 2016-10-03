library(forecast)
d.arima <- auto.arima(qvvpuah)
d.forecast <- forecast(d.arima, level = c(95), h = 50)
plot(d.forecast)

# fit <- Arima(WWWusage,order=c(3,1,0))
# plot(fit$x,col="red")
# lines(fitted(fit),col="blue")

qvvpuah.arima <- Arima(qvvpuah, order=c(1,0,0))
