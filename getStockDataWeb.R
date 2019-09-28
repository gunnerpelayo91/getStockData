## get stock quotes

library(tseries)
library(xts)

library(BatchGetSymbols)

# set dates
first.date <- Sys.Date() - 1460
last.date <- Sys.Date()
freq.data <- 'daily'
# set tickers
tickers <- c('CRC')

l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
                         last.date = last.date, 
                         freq.data = freq.data,
                         cache.folder = file.path(tempdir(), 
                        'BGS_Cache') ) # cache in tempdir()

head(l.out)


## stock names:
stockname=c("CRC")



plot(l.out$df.tickers$volume[l.out$df.tickers$ticker == stockname[i]]/1.e5,type='l',
     ylab = 'volume (10000s)', xlab = 'day', main=stockname[i])
grid()




plot(l.out$df.tickers$price.close[l.out$df.tickers$ticker == stockname[i]],
     type='l', ylab = 'price $', xlab = 'day', main=stockname[i])
grid()


write.csv(l.out$df.tickers[l.out$df.tickers$ticker == 'CRC',],'CRC.csv')

plot(l.out$df.tickers$ref.date,l.out$df.tickers$price.close,type="p")
