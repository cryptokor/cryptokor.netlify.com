몽액육즙=c("육","몽","액","즙")
Mong = apply(expand.grid(몽액육즙,몽액육즙,몽액육즙,몽액육즙), 1, paste, collapse = '') 
write.table(Mong, "Mong.txt", row.names = FALSE, col.names = FALSE, eol = " ")

조합 = c("잉","뽀","망","몽")
잉뽀망몽=expand.grid(조합,조합,조합,조합)
코=data.frame(잉뽀망몽$Var1, "월 ", 잉뽀망몽$Var2, "일 ", 잉뽀망몽$Var3, "시 ", 잉뽀망몽$Var4, "분은?") 
IngPpo = apply(코, 1, paste, collapse = '') 
write.table(IngPpo, "IngPpo.txt", row.names = FALSE, col.names = FALSE, eol = " ")


# 문자열을 permutation 한 뒤 구글의 검색수 높은 순으로 정렬

library(tidyverse)

google.counts <- function(search_term){
  search.nodes <- paste("http://www.google.com/search?q=",gsub(" ","+",search_term),sep="") %>% 
    RCurl::getURL() %>% 
    XML::htmlTreeParse(useInternalNodes = TRUE) %>% 
    XML::getNodeSet("//div[@id='resultStats']")
  strsplit(XML::xmlValue(search.nodes[[1]])," ",fixed=TRUE)[[1]][3] %>%
    gsub(pattern = ",|개", replacement = "") %>% 
    as.numeric()
}

#machine_learning <- combinat::permn(c('머', '신', '러', '닝')) %>% 
machine_learning <- combinat::permn(c('몽', '애', '긔')) %>% 
  purrr::map(~ paste(.x, collapse = '')) %>% 
  purrr::flatten_chr()

google_counts_ML <- tibble(term = machine_learning,
                           google = purrr::map(machine_learning, google.counts) %>% flatten_dbl()) %>% 
  arrange(desc(google))

google_counts_ML %>% 
  print(n=30)

