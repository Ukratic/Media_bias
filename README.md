# Media Bias

## Structure
1. News scraper
2. Topic modeling (work in progress)
3. Clustering & Classification (pending)
4. Prediction & Analysis (pending)
5. Dashboard (pending)


## 1.News scraper
Webscrape using Rvest to gather titles daily from 15 french news sites.<br>
Mostly cleaned with regex, some spaces and slashes may remain.<br>
**WARNING** News sites often make changes to their architecture (news cycle, big headline, overhaul...). Check HTML tags.
<br>
```r
# Function to remove html tags, unruly spaces and returns
clean_title = function(htmlString) {
  return(str_squish(gsub("<.*?>", "", htmlString)))
}

# Titles (articles) + title (main title) for Le Monde
titles_lm = le_monde %>% html_elements(".article__title") %>% clean_title
num_articles_lm = length(titles_lm)
title_lm = le_monde %>% html_elements(".article__title-label") %>% clean_title
```

<br>

**OUTPUT :** 
- 1 headers file (all dates)
- 1 big file with every title (all dates)

<br>

_Selected journals :_
- [Le Monde](https://www.lemonde.fr/)
- [Le Figaro](https://www.lefigaro.fr/)
- [C News](https://www.cnews.fr/)
- [20 Minutes](https://www.20minutes.fr/)
- [Les Echos](https://www.lesechos.fr/)
- [France Infos](https://www.francetvinfo.fr/)
- [Nouvel Obs](https://www.nouvelobs.com/)
- [La Croix](https://www.la-croix.fr/)
- [Marianne](https://www.marianne.net/)
- [BFM TV](https://www.bfmtv.com/)
- [L'Express](https://www.lexpress.fr/)
- [Le Point](https://www.lepoint.fr/)
- [Valeurs Actuelles](https://www.valeursactuelles.com/)
- [Libération](https://www.liberation.fr/)
- [L'Humanité](https://www.humanite.fr/)
<br><br>
Political compass :
- Liberal center : **BFM TV**, L'Express, Le Point, Les Echos, **20 minutes**
- Conservative center : La Croix, Marianne
- Left : **Le Monde**, Nouvel Obs, Libération
- Center Left : **France Info**
- Right : **Le Figaro**, **C News**
- Hard Right : Valeurs Actuelles
- Hard Left : L'Humanité

<br>
In bold: main media

## 2.Topic modeling
Determine topic distribution using spacy (stopwords, lemmatize), Latent Dirichlet Allocation and BERTopic (exploring topics).<br>

TO DO : Check hierarchical and guided topic modeling, then choose best approach