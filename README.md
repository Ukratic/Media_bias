# News_scraper
Webscrape using Rvest to gather titles daily from 14 french news sites.

Mostly cleaned with regex, some spaces and slashes may remain.

**WARNING** News sites often make changes to their architecture (news cycle, big headline, overhaul...). Check HTML tags.
<br><br>
**OUTPUT :** 
- 1 headers file (all dates)
- 1 big file with every title (all dates)

Also, for alternative use and storage of data (in case of unnoticed change in one of the websites for instance) :
- 14 files for each journal (all dates)
- 1 file per day for all journals
<br><br>
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
