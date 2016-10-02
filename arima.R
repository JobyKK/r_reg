# library(forecast)
# d.arima <- auto.arima(AirPassengers)
# d.forecast <- forecast(d.arima, level = c(95), h = 50)
# autoplot(d.forecast)

# fit <- Arima(WWWusage,order=c(3,1,0))
# plot(fit$x,col="red")
# lines(fitted(fit),col="blue")

qvvpuah.arima <- Arima(qvvpuah, order=c(1,0,0))
