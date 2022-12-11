# Media Bias

## Structure
1. News scraper
2. Preprocessing & Modeling
3. Dynamic distribution & Classification (work in progress)
4. Prediction & Analysis (work in progress)
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


## 2. Preprocessing & clustering
There are very clearly some outstanding themes and recurrent words in the data.
<img src="https://github.com/Ukratic/Media_bias/blob/main/images/wcloud.png" alt="Wcloud" width="800" height="400"/>


**Steps:**
- Cleaning articles and lemmatization using spacy (and removing stopwords)
- Vectorizing into n-grams and checking topic distribution with Latent Dirichlet Allocation
- Hierarchical and guided topic modeling with BERTopic

<a href="https://www.ina.fr/">INA</a>'s themes in french tv news are comprised of 14 topics.<br>
For understanding and coherence, one of the goals will be to explain topic distribution using the same framework.<br>
Short notebook for this plot in *ina_topics* folder.<br>
<img src="https://github.com/Ukratic/Media_bias/blob/main/images/ina_topics.png" alt="INA topics" width="800" height="400"/>

## 3. Classification
- Plot dynamic topic distribution
- Merge topics into something more readable & practical

*Work in progress*
