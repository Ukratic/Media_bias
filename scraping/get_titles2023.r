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

# Function to remove html tags, unruly spaces and returns
clean_title = function(htmlString) {
  return(str_squish(gsub("<.*?>", "", htmlString)))
}

# Titles (articles) + title (main title) for Le Monde
titles_lm = le_monde %>% html_elements(".old__article-related-default-item a , .article__title, .article__title-label") %>% clean_title
num_articles_lm = length(titles_lm)
title_lm = le_monde %>% html_elements(".article__title-label") %>% clean_title

# Titles (articles) + title (main title) for Le Figaro
titles_fig = le_figaro %>% html_elements("h2 , .fig-ranking-profile-link, .fig-ensemble__title--photo") %>% clean_title
num_articles_fig = length(titles_fig)
title_fig = le_figaro %>% html_elements(".fig-ranking-profile-headline-highlight") %>% clean_title

#Titles (articles) + title (main title) for CNews
titles_cn = c_news %>% html_elements(".dm-blocks-item h2") %>% clean_title
num_articles_cn = length(titles_cn)
title_cn = c_news %>% html_elements(".dm-blocks-news-half .dm-news-title") %>% clean_title

# Titles (articles) + title (main title) for 20 Minutes
titles_20min = vingt_minutes %>% html_elements(".teaser-title") %>% clean_title
num_articles_20min = length(titles_20min)
title_20min = vingt_minutes %>% html_elements(".skin-community .teaser-title") %>% clean_title

# Titles (articles) + title (main title) for Les Echos
titles_le = les_echos %>% html_elements(".sc-4cuy4z-0") %>% clean_title
num_articles_le = length(titles_le)
title_le = les_echos %>% html_elements(".fhtRrN") %>% clean_title

# Titles (articles) + title (main title) for France Info
titles_fi = france_info %>% html_elements(".most-read__item-title , .card-article-l__title, .card-article-m__title, .card-article-related__title, .card-article-majeure__title") %>% clean_title
num_articles_fi = length(titles_fi)
title_fi = france_info %>% html_elements(".card-article-majeure__title") %>% clean_title

# Titles (articles) + title (main title) for Nouvel Obs
titles_no = nouvel_obs %>% html_elements(".article-box-content__title , .icon-abo, .article-box-title") %>% clean_title
num_articles_no = length(titles_no)
title_no = nouvel_obs %>% html_elements(".article-box-title") %>% clean_title

# Titles (articles) + title (main title) for La Croix
titles_lc = la_croix %>% html_elements(".block-item__title--medium , h3, .tag-subscriber, .block-item__title h2") %>% clean_title
num_articles_lc = length(titles_lc)
title_lc = la_croix %>% html_elements(".block-item__title--border .tag-subscriber") %>% clean_title

# Titles (articles) + title (main title) for Marianne
titles_ma = marianne %>% html_elements(".agora-article__title a , .focus-block__item-link, .most-read__link, .read-more__link, .thumbnail__link") %>% clean_title
num_articles_ma = length(titles_ma)
title_ma = marianne %>% html_elements(".thumbnail__content--overlayed .thumbnail__link") %>% clean_title

# Titles (articles) + title (main title) for BFM
titles_bfm = bfmtv %>% html_elements(".content_item_title , .title_une_item") %>% clean_title
num_articles_bfm = length(titles_bfm)
title_bfm = bfmtv %>% html_elements(".title_une_item") %>% clean_title

# Titles (articles) + title (main title) for L'Express
titles_lex = l_express %>% html_elements(".content__element a , .content__article--premium__icon, .resp-condensed, .icon__premium, .icon__chevron--left") %>% clean_title
num_articles_lex = length(titles_lex)
title_lex = l_express %>% html_elements(".laUneBlock__tablet_1 .headline--lg") %>% clean_title

# Titles (articles) + title (main title) for Le Point
titles_lp = le_point %>% html_elements(".art-acc-li a , h2") %>% clean_title
num_articles_lp = length(titles_lp)
title_lp = le_point %>% html_elements(".art-full h2") %>% clean_title

# Titles (articles) + title (main title) for Valeurs Actuelles
titles_va = valeurs_actuelles %>% html_elements(".card-post--featured .h3 a") %>% clean_title
num_articles_va = length(titles_va)
title_va = valeurs_actuelles %>% html_elements(".h2 , .card-post__body__list a, .h3 a") %>% clean_title

# Titles (articles) + title (main title) for Liberation
titles_lib = liberation %>% html_elements(".decoration_none .font_normal") %>% clean_title
num_articles_lib = length(titles_lib)
title_lib = liberation %>% html_elements(".OGnAR") %>% clean_title

# Titles (articles) + title (main title) for L'Humanite
titles_hum = humanite %>% html_elements(".article_title_h3 a , .field-content a, .grid_media a, .view-mode-type_title_desc a, .field-name-field-news-text a, .view-mode-media_med_type_title_desc_light .field-name-title a, .view-mode-media_big_type_title_desc_tall .field-name-title a") %>% clean_title
num_articles_hum = length(titles_hum)
title_hum = humanite %>% html_elements(".view-mode-media_big_type_title_desc_tall .field-name-title a") %>% clean_title

#Writing main titles to csv
headers = c(title_lm[1], title_fig, title_cn[1], title_20min, title_le, title_fi, title_no, title_lex, title_bfm, title_ma, title_lc, title_lp[1], title_va[1], title_lib, title_hum[1])
name = c("Le Monde", "Le Figaro", "C News", "20 minutes", "Les Echos", "France Info", "Nouvel Obs", "L'Express", "BFM TV", "Marianne", "La Croix", "Le Point", "Valeurs Actuelles", "Libération", "L'Humanité")
num_articles_head = length(headers)
date_headers <- rep(today, num_articles_head)
write.table(cbind(date_headers,name,headers), file="headers.csv", sep=";", dec=",", row.names=F,append=TRUE, col.names=F)


#Writing all titles to full csv
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
