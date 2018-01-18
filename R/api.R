library(tidyverse)
RCurl::getURL("https://api.coinmarketcap.com/v1/ticker/?convert=USD") %>% 
  jsonlite::fromJSON() %>% 
  as.tibble() %>% 
  mutate_at(vars(-id, -name, -symbol), as.numeric) %>% 
  arrange(desc(percent_change_24h)) %>% 
  select(name, symbol, price_usd, percent_change_24h)
