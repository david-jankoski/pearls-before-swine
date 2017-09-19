# show a random Pearls Before Swine comic
pearls_before_swine <- function() {
  
  # stop if some pkgs are missing
  stopifnot(
    all(
      sapply(c("httr","rvest","magick"), require, character.only = T)
      )
    )
  
  # url for a random Pearls Before Swince comic  
  prls <- "http://www.gocomics.com/random/pearlsbeforeswine"
  # html wrangle 
  prls %>% 
    httr::GET() %>% 
    httr::content() %>% 
    rvest::html_node(".comic__image") %>% 
    rvest::html_node("picture") %>% 
    rvest::html_node("img") %>% 
    rvest::html_attr("src") %>% 
    httr::GET() %>% 
    httr::content() %>% 
    # raw image display
    magick::image_read()
}
