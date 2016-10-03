fqvvpuah.fdi.arima
pred1 <- forecast(fqvvpuah.arima, h=3, level = c(95))
pred2 <- forecast(fqvvpuah.arima, h=5, level = c(95))
pred3 <- forecast(fqvvpuah.arima, h=10, level = c(95))
pred1
pred2
pred3
plot(pred1)
plot(pred2)
plot(pred3)