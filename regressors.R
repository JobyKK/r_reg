r.fdi.usd <- read.csv("fdi.csv")[3]
r.fdi.usd <- ts(r.fdi.usd, start = 2001, frequency = 4)

exchange <- read.csv("USD_UAH.csv")
exchange <- ts(exchange, start = 2001, frequency = 4)

r.fdi.usd <- ts(r.fdi.usd, start = 2001, frequency = 4)
r.fdi.uah <- r.fdi.usd * exchange