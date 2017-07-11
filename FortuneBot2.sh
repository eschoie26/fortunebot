#!/usr/bin/Rscript

# Activate packages

library(magrittr)
library(rvest)
library(twitteR)

# Authenticate

api_key <- "ug9y8oQ7Z0Fu4gTO5DK574nOV"
api_secret <- "ILrykBgytUqApvqySuI1TXoktnWtxLUM1SjNWAEHbAuLjNIrUe"
access_token <- "204639343-oJUU0j3nWFSBuySq1eijZyaPoshmL4H09Oloy3z2"
access_token_secret <- "kkxtPu2nsRa58S0GOJ5PAIaqSnrsq1qrfpl2wJgZW1vN8"

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)


## Generate random number to change output each time

numb <- sample(1:152, 1)

## Scrape fortune cookie website

cookie <- read_html(sprintf("http://www.myfortunecookie.co.uk/fortunes/%d/", numb))%>%html_node("#main-cell > h1 > div")%>% html_text()

# Function

fortune <- function(numb){
  numb <- sample(1:152, 1)
  cookie <- read_html(sprintf("http://www.myfortunecookie.co.uk/fortunes/%d/", numb)) %>%
    html_node("#main-cell > h1 > div") %>%
    html_text()
  return(cookie)
}

# Tweet

tweet(fortune())
