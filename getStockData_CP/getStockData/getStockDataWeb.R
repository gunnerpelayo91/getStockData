## get stock quotes

library(tseries)
library(xts)

library(BatchGetSymbols)

# set dates
first.date <- Sys.Date() - 730
last.date <- Sys.Date()
freq.data <- 'daily'
# set tickers
tickers <- c('NFG','CRC',)

l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
                         last.date = last.date, 
                         freq.data = freq.data,
                         cache.folder = file.path(tempdir(), 
                        'BGS_Cache') ) # cache in tempdir()

head(l.out)


## stock names:
stockname=c("NFG","CRC")

for (i in 1:2){

plot(l.out$df.tickers$volume[l.out$df.tickers$ticker == stockname[i]]/1.e5,type='l',
     ylab = 'volume (10000s)', xlab = 'day', main=stockname[i])
grid()




plot(l.out$df.tickers$price.close[l.out$df.tickers$ticker == stockname[i]],
     type='l', ylab = 'price $', xlab = 'day', main=stockname[i])
grid()
}

write.csv(l.out$df.tickers[l.out$df.tickers$ticker == 'NFG',],'NFG.csv')

plot(l.out$df.tickers$ref.date,l.out$df.tickers$price.close,type="p")
