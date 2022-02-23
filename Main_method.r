library(rvest)

# Variables for the main page of each journal
le_monde = read_html("https://www.lemonde.fr/")
le_figaro = read_html("https://www.lefigaro.fr/")
c_news = read_html("https://www.cnews.fr/")
vingt_minutes = read_html("https://www.20minutes.fr/")
les_echos = read_html("https://www.lesechos.fr/")
france_info = read_html("https://www.francetvinfo.fr/")
nouvel_obs = read_html("https://www.nouvelobs.com/")
la_croix = read_html("https://www.la-croix.fr/")
marianne = read_html("https://www.marianne.net/")
bfmtv = read_html("https://www.bfmtv.com/")
l_express = read_html("https://www.lexpress.fr/")
le_point = read_html("https://www.lepoint.fr/")
valeurs_actuelles = read_html("https://www.valeursactuelles.com/")
liberation = read_html("https://www.liberation.fr/")

#Today's Date
theday = Sys.Date()
today = toString(theday)

# Function to remove html tags
clean_title = function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

# Titles for Le Monde
titles_lm = le_monde %>% html_elements(".article__title") %>% clean_title
num_articles_lm = length(titles_lm)
date_lm <- rep(today, num_articles_lm)
write.table(cbind(date_lm,titles_lm), file="le_monde.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Le Figaro
titles_fig = le_figaro %>% html_elements(".fig-grid4__title , .fig-premium-mark, .fig-ensemble__link, .fig-profile__headline, .fig-ensemble__title--photo, .flive-loop__title") %>% clean_title
num_articles_fig = length(titles_fig)
date_fig <- rep(today, num_articles_fig)
write.table(cbind(date_fig,titles_fig), file="le_figaro.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for CNews
titles_cn = c_news %>% html_elements(".dm-ledirect-title , .dm-news-title, .dm-tag-title") %>% clean_title
num_articles_cn = length(titles_cn)
date_cn <- rep(today, num_articles_cn)
write.table(cbind(date_cn,titles_cn), file="c_news.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for 20 Minutes
titles_20min = vingt_minutes %>% html_elements(".teaser-title") %>% clean_title
num_articles_20min = length(titles_20min)
date_20min <- rep(today, num_articles_20min)
write.table(cbind(date_20min,titles_20min), file="20_minutes.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Les Echos
titles_le = les_echos %>% html_elements(".sc-4cuy4z-0") %>% clean_title
num_articles_le = length(titles_le)
date_le <- rep(today, num_articles_le)
write.table(cbind(date_le,titles_le), file="les_echos.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for France Info
titles_fi = france_info %>% html_elements(".topic a , .col a, .col-right a, .col-2 li a, a.title") %>% clean_title
num_articles_fi = length(titles_fi)
date_fi <- rep(today, num_articles_fi)
write.table(cbind(date_fi,titles_fi), file="france_info.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Titles for Nouvel Obs
titles_no = nouvel_obs %>% html_elements(".article-box-content__title, .article-box-title") %>% clean_title
num_articles_no = length(titles_no)
date_no <- rep(today, num_articles_no)
write.table(cbind(date_no,titles_no), file="nouvel_obs.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for La Croix
titles_lc = la_croix %>% html_elements("h3") %>% clean_title
num_articles_lc = length(titles_lc)
date_lc <- rep(today, num_articles_lc)
write.table(cbind(date_lc,titles_lc), file="la_croix.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Marianne
titles_ma = marianne %>% html_elements(".agora-article__title a , .thumbnail__link, .thumbnail__link, .thumbnail__link, .focus-block__item-link") %>% clean_title
num_articles_ma = length(titles_ma)
date_ma <- rep(today, num_articles_ma)
write.table(cbind(date_ma,titles_ma), file="marianne.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for BFM
titles_bfm = bfmtv %>% html_elements(".title_une_item , .content_item_title") %>% clean_title
num_articles_bfm = length(titles_bfm)
date_bfm <- rep(today, num_articles_bfm)
write.table(cbind(date_bfm,titles_bfm), file="bfm_tv.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for L'Express
titles_lex = l_express %>% html_elements(".thumbnail__title") %>% clean_title
num_articles_lex = length(titles_lex)
date_lex <- rep(today, num_articles_lex)
write.table(cbind(date_lex,titles_lex), file="l_express.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Le Point
titles_lp = le_point %>% html_elements(".list-view h2") %>% clean_title
num_articles_lp = length(titles_lp)
date_lp <- rep(today, num_articles_lp)
write.table(cbind(date_lp,titles_lp), file="le_point.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Valeurs Actuelles
titles_va = valeurs_actuelles %>% html_elements(".h3 a") %>% clean_title
num_articles_va = length(titles_va)
date_va <- rep(today, num_articles_va)
write.table(cbind(date_va,titles_va), file="valeurs_actuelles.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Titles for Liberation
titles_lib = liberation %>% html_elements(".decoration_none .font_normal") %>% clean_title
num_articles_lib = length(titles_lib)
date_lib <- rep(today, num_articles_lib)
write.table(cbind(date_lib,titles_lib), file="liberation.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Processing main titles 
title_lm = le_monde %>% html_elements(".article--main .article__title-label") %>% clean_title
title_fig = le_figaro %>% html_elements(".fig-profile--first .fig-premium-mark") %>% clean_title
title_cn = c_news %>% html_elements(".dm-blocks-news-hero.associated-video .dm-news-title") %>% clean_title
title_20min = vingt_minutes %>% html_elements(".preview-cover .teaser-title") %>% clean_title
title_le = les_echos %>% html_elements(".kXSjxr") %>% clean_title
title_fi = france_info %>% html_elements(".h1") %>% clean_title
title_no = nouvel_obs %>% html_elements(".article-box-title") %>% clean_title
title_lc = la_croix %>% html_elements(".block-item__title--border .tag-subscriber") %>% clean_title
title_ma = marianne %>% html_elements(".thumbnail__content--overlayed .thumbnail__link") %>% clean_title
title_bfm = bfmtv %>% html_elements(".title_une_item") %>% clean_title
title_lex = l_express %>% html_elements(".thumbnail--une .headline--lg") %>% clean_title
title_lp = le_point %>% html_elements(".art-full h2") %>% clean_title
title_va = valeurs_actuelles %>% html_elements(".card-post--featured .h3 a") %>% clean_title
title_lib = liberation %>% html_elements(".font_normal") %>% clean_title

#Writing main titles to csv
headers = c(title_lm, title_fig, title_cn, title_20min, title_le, title_fi, title_no, title_lex, title_bfm, title_ma, title_lc, title_lp[1], title_va[1], title_lib[3])
name = c("Le_Monde", "Le_Figaro", "C_News", "20_minutes", "Les_Echos", "France_Info", "Le_Nouvel_Obs", "L_Express", "BFM_TV", "Marianne", "La_Croix", "Le_Point", "Valeurs_Actuelles", "Liberation")
num_articles_head = length(headers)
date_headers <- rep(today, num_articles_head)
write.table(cbind(date_headers,name,headers), file="headers.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Check consistency
