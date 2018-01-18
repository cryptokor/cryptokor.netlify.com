library(tidyverse)

# Top coins (`2018-01-18` - 100 coins)
top_coins <- RCurl::getURL("https://api.coinmarketcap.com/v1/ticker/") %>% 
  jsonlite::fromJSON() %>% 
  as.tibble() %>% 
  mutate_at(vars(-id, -name, -symbol), as.numeric) %>% 
  arrange(desc(percent_change_24h)) %>% 
  select(name, symbol, percent_change_24h, percent_change_1h, price_usd)

# All coins (`2018-01-18` - 1448 coins)
all_coins <- RCurl::getURL("https://api.coinmarketcap.com/v1/ticker/?limit=0") %>% 
  jsonlite::fromJSON() %>% 
  as.tibble() %>% 
  mutate_at(vars(-id, -name, -symbol), as.numeric) %>% 
  arrange(desc(percent_change_24h)) %>% 
  select(name, symbol, percent_change_24h, percent_change_1h, price_usd)

# ggplot(top_coins %>% 
#          filter(percent_change_24h > 0) %>% 
#          slice(1:10), 
#        aes(x="", y=percent_change_24h, fill=symbol))+
#   geom_bar(width = 1, stat = "identity") +
#   coord_polar("y", start=0)

# 24시간동안 다 오르는데 안오른 세개 : USDT, KIN, ARDR

ggplot(top_coins, 
       aes(percent_change_24h, percent_change_1h, label = symbol)) + 
  geom_point() + 
  geom_label()
