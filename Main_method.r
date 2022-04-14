library(rvest)
library(stringr)

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
humanite = read_html("https://www.humanite.fr/")


#Today's Date
theday = Sys.Date()
today = toString(theday)

# Function to remove html tags and unruly spaces and returns
clean_title = function(htmlString) {
  return(str_squish(gsub("<.*?>", "", htmlString)))
}

# Titles for Le Monde
titles_lm = le_monde %>% html_elements(".article__title") %>% clean_title
num_articles_lm = length(titles_lm)
date_lm = rep(today, num_articles_lm)
write.table(cbind(date_lm,titles_lm), file="le_monde.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Le Figaro
titles_fig = le_figaro %>% html_elements(".fig-grid4__title , .fig-premium-mark, .fig-ensemble__link, .fig-profile__headline, .fig-ensemble__title--photo, .flive-loop__title") %>% clean_title
num_articles_fig = length(titles_fig)
date_fig = rep(today, num_articles_fig)
write.table(cbind(date_fig,titles_fig), file="le_figaro.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for CNews
titles_cn = c_news %>% html_elements(".dm-ledirect-title , .dm-news-title, .dm-tag-title") %>% clean_title
num_articles_cn = length(titles_cn)
date_cn = rep(today, num_articles_cn)
write.table(cbind(date_cn,titles_cn), file="c_news.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for 20 Minutes
titles_20min = vingt_minutes %>% html_elements(".teaser-title") %>% clean_title
num_articles_20min = length(titles_20min)
date_20min = rep(today, num_articles_20min)
write.table(cbind(date_20min,titles_20min), file="20_minutes.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Les Echos
titles_le = les_echos %>% html_elements(".sc-4cuy4z-0") %>% clean_title
num_articles_le = length(titles_le)
date_le = rep(today, num_articles_le)
write.table(cbind(date_le,titles_le), file="les_echos.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for France Info
titles_fi = france_info %>% html_elements(".topic a , .col a, .col-right a, .col-2 li a, a.title") %>% clean_title
num_articles_fi = length(titles_fi)
date_fi = rep(today, num_articles_fi)
write.table(cbind(date_fi,titles_fi), file="france_info.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Titles for Nouvel Obs
titles_no = nouvel_obs %>% html_elements(".article-box-content__title, .article-box-title") %>% clean_title
num_articles_no = length(titles_no)
date_no = rep(today, num_articles_no)
write.table(cbind(date_no,titles_no), file="nouvel_obs.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for La Croix
titles_lc = la_croix %>% html_elements("h3") %>% clean_title
num_articles_lc = length(titles_lc)
date_lc = rep(today, num_articles_lc)
write.table(cbind(date_lc,titles_lc), file="la_croix.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Marianne
titles_ma = marianne %>% html_elements(".agora-article__title a , .thumbnail__link, .thumbnail__link, .thumbnail__link, .focus-block__item-link") %>% clean_title
num_articles_ma = length(titles_ma)
date_ma = rep(today, num_articles_ma)
write.table(cbind(date_ma,titles_ma), file="marianne.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for BFM
titles_bfm = bfmtv %>% html_elements(".title_une_item , .content_item_title") %>% clean_title
num_articles_bfm = length(titles_bfm)
date_bfm = rep(today, num_articles_bfm)
write.table(cbind(date_bfm,titles_bfm), file="bfm_tv.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for L'Express
titles_lex = l_express %>% html_elements(".thumbnail__title") %>% clean_title
num_articles_lex = length(titles_lex)
date_lex = rep(today, num_articles_lex)
write.table(cbind(date_lex,titles_lex), file="l_express.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Le Point
titles_lp = le_point %>% html_elements(".list-view h2") %>% clean_title
num_articles_lp = length(titles_lp)
date_lp = rep(today, num_articles_lp)
write.table(cbind(date_lp,titles_lp), file="le_point.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Titles for Valeurs Actuelles
titles_va = valeurs_actuelles %>% html_elements(".h3 a") %>% clean_title
num_articles_va = length(titles_va)
date_va = rep(today, num_articles_va)
write.table(cbind(date_va,titles_va), file="valeurs_actuelles.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Titles for Liberation
titles_lib = liberation %>% html_elements(".decoration_none .font_normal") %>% clean_title
num_articles_lib = length(titles_lib)
date_lib = rep(today, num_articles_lib)
write.table(cbind(date_lib,titles_lib), file="liberation.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Titles for L'Humanite
titles_hum = humanite %>% html_elements(".view-mode-title a , .rubrique-monde .field-group-div .field-name-title a, .view-mode-media_small_title .field-group-div a, .view-mode-type_title_desc .field-name-title a, .view-mode-media_med_type_title_desc_light .field-name-title a, .view-mode-media_big_type_title_desc_tall .field-name-title a, .field-content a") %>% clean_title
num_articles_hum = length(titles_hum)
date_hum = rep(today, num_articles_hum)
write.table(cbind(date_hum,titles_hum), file="humanite.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

# Processing main titles 
title_lm = le_monde %>% html_elements(".article--main .article__title-label") %>% clean_title
title_fig = le_figaro %>% html_elements(".fig-premium-mark") %>% clean_title
title_cn = c_news %>% html_elements(".dm-hp-full-alert-title") %>% clean_title
title_20min = vingt_minutes %>% html_elements(".preview-cover .teaser-title") %>% clean_title
title_le = les_echos %>% html_elements(".kXSjxr") %>% clean_title
title_fi = france_info %>% html_elements(".h1") %>% clean_title
title_no = nouvel_obs %>% html_elements(".article-box-title") %>% clean_title
title_lc = la_croix %>% html_elements("h1") %>% clean_title
title_ma = marianne %>% html_elements(".thumbnail__content--overlayed .thumbnail__link") %>% clean_title
title_bfm = bfmtv %>% html_elements(".title_une_item") %>% clean_title
title_lex = l_express %>% html_elements(".thumbnail--une .headline--lg") %>% clean_title
title_lp = le_point %>% html_elements(".art-full h2") %>% clean_title
title_va = valeurs_actuelles %>% html_elements(".card-post--featured .h3 a") %>% clean_title
title_lib = liberation %>% html_elements(".font_normal") %>% clean_title
title_hum = humanite %>% html_elements(".view-mode-media_big_type_title_desc_tall .field-name-title a") %>% clean_title

#Writing main titles to csv
headers = c(title_lm, titles_fig[1], title_cn, title_20min, title_le, title_fi, title_no, title_lex, title_bfm, title_ma, title_lc, title_lp[1], title_va[1], title_lib[3], title_hum[1])
name = c("Le Monde", "Le Figaro", "C News", "20 minutes", "Les Echos", "France Info", "Nouvel Obs", "L'Express", "BFM TV", "Marianne", "La Croix", "Le Point", "Valeurs Actuelles", "Libération", "L'Humanité")
num_articles_head = length(headers)
date_headers <- rep(today, num_articles_head)
write.table(cbind(date_headers,name,headers), file="headers.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)


#One-day file
name_lm = rep("Le Monde", num_articles_lm)
name_fig = rep("Le Figaro", num_articles_fig)
name_cn = rep("C News", num_articles_cn)
name_20min = rep("20 minutes", num_articles_20min)
name_le = rep("Les Echos", num_articles_le)
name_fi = rep("France Info", num_articles_fi)
name_no = rep("Nouvel Obs", num_articles_no)
name_lc = rep("La Croix", num_articles_lc)
name_ma = rep("Marianne", num_articles_ma)
name_bfm = rep("BFM TV", num_articles_bfm)
name_lex = rep("L'Express", num_articles_lex)
name_lp = rep("Le Point", num_articles_lp)
name_va = rep("Valeurs Actuelles", num_articles_va)
name_lib = rep("Libération", num_articles_lib)
name_hum = rep("L'Humanité", num_articles_hum)
write.table(cbind(name_lm,titles_lm), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=c("Journal", today))
write.table(cbind(name_fig,titles_fig), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_cn,titles_cn), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_20min,titles_20min), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_le,titles_le), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_fi,titles_fi), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_no,titles_no), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_lc,titles_lc), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_ma,titles_ma), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_bfm,titles_bfm), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_lex,titles_lex), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_lp,titles_lp), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_va,titles_va), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_lib,titles_lib), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(name_hum,titles_hum), file=paste ("all_titles_", today, ".csv", sep=""), sep=";", dec=",", row.names=F,append=TRUE, col.names=F)


#Big file, all journals all dates
write.table(cbind(today,name_lm,titles_lm), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_fig,titles_fig), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_cn,titles_cn), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_20min,titles_20min), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_le,titles_le), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_fi,titles_fi), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_no,titles_no), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_lc,titles_lc), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_ma,titles_ma), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_bfm,titles_bfm), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_lex,titles_lex), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_lp,titles_lp), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_va,titles_va), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_lib,titles_lib), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)
write.table(cbind(today,name_hum,titles_hum), file="full.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)

#Check consistency
