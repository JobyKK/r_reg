fcast(fqvvpuah, method = "GMDH", f.number = 5) -> tgmdh
tgmdh.v <- c(329494.8, 407508.8, 469737.5, 463795.3, 333415.7)
pred2
ts.plot(pred2$mean, tgmdh.v, col = c("black", "red"))
legend("topleft",legend = c("arima", "gmdh"), col = c("black", "red"), lty = 1)