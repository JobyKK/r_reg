qvvpuah <- fqvvpuah
t1 = (1: length(qvvpuah))
t1.2 = t1^2
t1.3 = t1^3
reg1 = lm(qvvpuah~t1 + t1.2 + t1.3)
summary(reg1)
ts.plot(fqvvpuah, reg1$fitted.values)

t2 = (1: length(qvvpuah))
t2.2 = t2^2
reg2 = lm(qvvpuah~t2 + t2.2)
summary(reg2)
ts.plot(fqvvpuah, reg2$fitted.values)

print("t1")
trend1 <- ts(reg1$fitted.values, start = 2001, frequency = 4)
fqvvpuah.trend1.arima = auto.arima(fqvvpuah, xreg = trend1)
fqvvpuah.trend1.arima
fqvvpuah.trend1.arima.f = forecast(fqvvpuah.arima, h=1, level = c(95))
accuracy(fqvvpuah.trend1.arima.f$mean, tqvvpuah)
theil(fqvvpuah.trend1.arima.f$mean, tqvvpuah)
dw(fqvvpuah.trend1.arima)

print("t2")
trend2 <- ts(reg2$fitted.values, start = 2001, frequency = 4)
fqvvpuah.trend2.arima = auto.arima(fqvvpuah, xreg = trend2)
fqvvpuah.trend2.arima
fqvvpuah.trend2.arima.f = forecast(fqvvpuah.arima, h=1, level = c(95))
accuracy(fqvvpuah.trend2.arima.f$mean, tqvvpuah)
theil(fqvvpuah.trend2.arima.f$mean, tqvvpuah)
dw(fqvvpuah.trend2.arima)
