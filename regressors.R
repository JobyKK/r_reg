r.fdi.usd <- read.csv("fdi.csv")[3]
r.fdi.usd <- ts(r.fdi.usd, start = 2001, frequency = 4)

exchange <- read.csv("USD_UAH.csv")
exchange <- ts(exchange, start = 2001, frequency = 4)

r.fdi.usd <- ts(r.fdi.usd, start = 2001, frequency = 4)
r.fdi.uah <- r.fdi.usd * exchange
r.fdi.uah <- r.fdi.uah[1:56]
exchange <- exchange[1:56]
ts.plot(r.fdi.uah)

xreg <- matrix(c(trend1, r.fdi.uah, exchange), ncol = 3)
fqvvpuah.fdi.arima = auto.arima(fqvvpuah, xreg = xreg)
fqvvpuah.fdi.arima
fqvvpuah.fdi.arima.f = forecast(fqvvpuah.arima, h=1, level = c(95))
accuracy(fqvvpuah.fdi.arima.f$mean, tqvvpuah)
theil(fqvvpuah.fdi.arima.f$mean, tqvvpuah)
dw(fqvvpuah.fdi.arima)