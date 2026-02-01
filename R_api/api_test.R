"RTE r?cup?ration Data via l'API"

# chargement des packages pour communiquer avec une API via R
library(httr)
library(jsonlite)


###r?cup?ration jeton OAuth (POST)###

url_jeton<- "https://digital.iservices.rte-france.com/token/oauth/"
api_jeton<- httr::POST(url= url_jeton,
                       add_headers(c("Authorization"="Basic code"
                                     ,"Content-Type"="application/x-www-form-urlencoded")))

#v?rification bon d?roul? de la requ?te 
api_jeton$status_code
api_jeton$content
char_jeton<-base::rawToChar(api_jeton$content)
char_jeton
#conversion de JSON en objet R
json_jeton<-jsonlite::fromJSON(char_jeton,flatten = TRUE)
#r?cup?ration du jeton
jeton<-json_jeton$access_token  
