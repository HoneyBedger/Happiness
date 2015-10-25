## Data for the "Developing Data Productrs" project - 
## World Happiness Report 2015
## Read and subset the table
#furl <- "http://worldhappiness.report/wp-content/uploads/sites/2/2015/04/Chapter2OnlineData_Expanded-with-Trust-and-Governance.xlsx"
#if(!file.exists("Happiness_Report.xls")){
#  download.file(furl, destfile = "Happiness_Report.xls")
#}
happiness <- read.csv("Happiness_Report.csv", header = T, skip = 3, stringsAsFactors = F)
happiness_short <- happiness[,c(2,4)]
## Create character vars to use in the app:
## list of countries alphabetically
happiness_alphabet <- sort(happiness_short$country)
country_list <- paste0("'", happiness_alphabet[1], "' = ", "'", happiness_alphabet[1], "'")
for(i in 2:length(happiness_alphabet)){
  country_list <- paste0(country_list, ", '", happiness_alphabet[i], "' = ",
                         "'", happiness_alphabet[i], "'")
}

## countries by happiness level
countries_by_value <- happiness_short$country
country_list2 <- paste0("'", countries_by_value[1], "'")
for(i in 2:length(countries_by_value)){
  country_list2 <- paste0(country_list2, ", '", countries_by_value[i], "'")
}

## values for happiness
happiness_value <- happiness_short$Ladder.score
value_list <- happiness_value[1]
for(i in 2:length(happiness_value)){
  value_list <- paste0(value_list, ", ", happiness_value[i])
}
