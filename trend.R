t = (1: length(qvvpuah))
t2 = t^2
reg = lm(y~t+t2)
reg = lm(qvvpuah~t+t2)
summary(reg)
trendy = 30191.36 + 4030.77 * t + 63.07 * t2
ts.plot(qvvpuah, trendy)
ar(qvvpuah + trendy)