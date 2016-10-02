t1 = (1: length(qvvpuah))
t1.2 = t^2
t1.3 = t^3
reg1 = lm(qvvpuah~t1 + t1.2 + t1.3)
summary(reg1)

t2 = (1: length(qvvpuah))
t2.2 = t^2
reg2 = lm(qvvpuah~t2 + t2.2)
summary(reg2)

trend1 = reg1$fitted.values
trend1 <- ts(trend1, start = 2001, frequency = 4)
trend2 = reg2$fitted.values
trend2 <- ts(trend2, start = 2001, frequency = 4)

# ts.plot(qvvpuah, trendy)

# qvvpuah.arima.trend <- Arima(qvvpuah, order=c(6,0,0), method = "ML", xreg=trendy) 

print("t1")
auto.arima(qvvpuah, xreg = trend1)

print("t2")
auto.arima(qvvpuah, xreg = trend2)

