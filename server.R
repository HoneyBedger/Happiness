library(shiny)
library(ggplot2)
happiness <- data.frame(
  Country = c('Switzerland', 'Iceland', 'Denmark', 'Norway','Canada', 'Finland',
              'Netherlands', 'Sweden', 'New Zealand', 'Australia', 'Israel',
              'Costa Rica', 'Austria', 'Mexico', 'United States', 'Brazil',
              'Luxembourg', 'Ireland', 'Belgium', 'United Arab Emirates',
              'United Kingdom', 'Oman', 'Venezuela', 'Singapore', 'Panama',
              'Germany', 'Chile', 'Qatar', 'France', 'Argentina', 'Czech Republic',
              'Uruguay', 'Colombia', 'Thailand', 'Saudi Arabia', 'Spain', 'Malta',
              'Taiwan', 'Kuwait', 'Suriname', 'Trinidad and Tobago', 'El Salvador',
              'Guatemala', 'Uzbekistan', 'Slovakia', 'Japan', 'South Korea', 'Ecuador',
              'Bahrain', 'Italy', 'Bolivia', 'Moldova', 'Paraguay', 'Kazakhstan',
              'Slovenia', 'Lithuania', 'Nicaragua', 'Peru', 'Belarus', 'Poland',
              'Malaysia', 'Croatia', 'Libya', 'Russia', 'Jamaica', 'North Cyprus',
              'Cyprus', 'Algeria', 'Kosovo', 'Turkmenistan', 'Mauritius', 'Hong Kong',
              'Estonia', 'Indonesia', 'Vietnam', 'Turkey', 'Kyrgyzstan', 'Nigeria',
              'Bhutan', 'Azerbaijan', 'Pakistan', 'Jordan', 'Montenegro', 'China',
              'Zambia', 'Romania', 'Serbia', 'Portugal', 'Latvia', 'Philippines',
              'Somaliland region', 'Morocco', 'Macedonia', 'Mozambique', 'Albania',
              'Bosnia and Herzegovina', 'Lesotho', 'Dominican Republic', 'Laos',
              'Mongolia', 'Swaziland', 'Greece', 'Lebanon', 'Hungary', 'Honduras',
              'Tajikistan', 'Tunisia', 'Palestinian Territories', 'Bangladesh', 'Iran',
              'Ukraine', 'Iraq', 'South Africa', 'Ghana', 'Zimbabwe', 'Liberia', 'India',
              'Sudan', 'Haiti', 'Congo (Kinshasa)', 'Nepal', 'Ethiopia', 'Sierra Leone',
              'Mauritania', 'Kenya', 'Djibouti', 'Armenia', 'Botswana', 'Myanmar',
              'Georgia', 'Malawi', 'Sri Lanka', 'Cameroon', 'Bulgaria', 'Egypt',
              'Yemen', 'Angola', 'Mali', 'Congo (Brazzaville)', 'Comoros', 'Uganda',
              'Senegal', 'Gabon', 'Niger', 'Cambodia', 'Tanzania', 'Madagascar',
              'Central African Republic', 'Chad', 'Guinea', 'Ivory Coast',
              'Burkina Faso', 'Afghanistan', 'Rwanda', 'Benin', 'Syria',
              'Burundi', 'Togo'),
  Happiness_Level = c(7.5869998932, 7.5609998703, 7.5269999504, 7.521999836, 7.4270000458,
                      7.4060001373, 7.3779997826, 7.3639998436, 7.2859997749, 7.2839999199,
                      7.2779998779, 7.2259998322, 7.1999998093, 7.1869997978, 7.118999958,
                      6.9829998016, 6.9460000992, 6.9400000572, 6.9369997978, 6.9010000229,
                      6.867000103, 6.853000164, 6.8099999428, 6.7979998589, 6.7859997749,
                      6.75, 6.6700000763, 6.611000061, 6.5749998093, 6.5739998817,
                      6.5050001144, 6.4850001335, 6.4770002365, 6.4549999237, 6.4109997749,
                      6.3289999962, 6.3020000458, 6.2979998589, 6.2950000763, 6.2690000534,
                      6.1680002213, 6.1300001144, 6.123000145, 6.0029997826, 5.9949998856,
                      5.9869999886, 5.984000206, 5.9749999046, 5.9600000381, 5.9479999542,
                      5.8899998665, 5.888999939, 5.8779997826, 5.8550000191, 5.8480000496,
                      5.8330001831, 5.8280000687, 5.8239998817, 5.8130002022, 5.7909998894,
                      5.7699999809, 5.7589998245, 5.7540001869, 5.7160000801, 5.7090001106,
                      5.6950001717, 5.6890001297, 5.6050000191, 5.5890002251, 5.5479998589,
                      5.4770002365, 5.4739999771, 5.4289999008, 5.3990001678, 5.3600001335,
                      5.3319997787, 5.2859997749, 5.2680001259, 5.2529997826, 5.2119998932,
                      5.1939997673, 5.1919999123, 5.1919999123, 5.1399998665, 5.1290001869,
                      5.1240000725, 5.123000145, 5.1020002365, 5.0980000496, 5.0729999542,
                      5.0570001602, 5.0130000114, 5.0069999695, 4.9710001945, 4.9590001106,
                      4.9489998817, 4.8979997635, 4.8850002289, 4.8759999275, 4.8740000725,
                      4.867000103, 4.8569998741, 4.8390002251, 4.8000001907, 4.7880001068,
                      4.7859997749, 4.7389998436, 4.7150001526, 4.6939997673, 4.6859998703,
                      4.6810002327, 4.6770000458, 4.6420001984, 4.632999897, 4.6100001335,
                      4.5710000992, 4.5650000572, 4.5500001907, 4.5180001259, 4.5170001984,
                      4.513999939, 4.5120000839, 4.5069999695, 4.4359998703, 4.4190001488,
                      4.368999958, 4.3499999046, 4.3319997787, 4.3070001602, 4.2969999313,
                      4.2919998169, 4.2709999084, 4.251999855, 4.2179999352, 4.1939997673,
                      4.0770001411, 4.0329999924, 3.9949998856, 3.989000082, 3.9560000896,
                      3.9309999943, 3.9040000439, 3.8959999084, 3.8450000286, 3.8190000057,
                      3.7809998989, 3.6809999943, 3.6779999733, 3.6670000553, 3.6559998989,
                      3.6549999714, 3.5869998932, 3.5750000477, 3.4649999142, 3.3399999142,
                      3.006000042, 2.9049999714, 2.8389999866))
shinyServer(
  function(input, output) {
    output$your_happiness <- renderPrint({
      input$goButton
      isolate(input$your_happiness)})
    output$country_average <- renderPrint({
      input$goButton
      isolate(happiness[happiness$Country == as.character(input$your_country),2])})
    
    output$happiness_diagram <- renderPlot(({
      happiness <<- data.frame(
        Country = c('Switzerland', 'Iceland', 'Denmark', 'Norway','Canada', 'Finland',
                    'Netherlands', 'Sweden', 'New Zealand', 'Australia', 'Israel',
                    'Costa Rica', 'Austria', 'Mexico', 'United States', 'Brazil',
                    'Luxembourg', 'Ireland', 'Belgium', 'United Arab Emirates',
                    'United Kingdom', 'Oman', 'Venezuela', 'Singapore', 'Panama',
                    'Germany', 'Chile', 'Qatar', 'France', 'Argentina', 'Czech Republic',
                    'Uruguay', 'Colombia', 'Thailand', 'Saudi Arabia', 'Spain', 'Malta',
                    'Taiwan', 'Kuwait', 'Suriname', 'Trinidad and Tobago', 'El Salvador',
                    'Guatemala', 'Uzbekistan', 'Slovakia', 'Japan', 'South Korea', 'Ecuador',
                    'Bahrain', 'Italy', 'Bolivia', 'Moldova', 'Paraguay', 'Kazakhstan',
                    'Slovenia', 'Lithuania', 'Nicaragua', 'Peru', 'Belarus', 'Poland',
                    'Malaysia', 'Croatia', 'Libya', 'Russia', 'Jamaica', 'North Cyprus',
                    'Cyprus', 'Algeria', 'Kosovo', 'Turkmenistan', 'Mauritius', 'Hong Kong',
                    'Estonia', 'Indonesia', 'Vietnam', 'Turkey', 'Kyrgyzstan', 'Nigeria',
                    'Bhutan', 'Azerbaijan', 'Pakistan', 'Jordan', 'Montenegro', 'China',
                    'Zambia', 'Romania', 'Serbia', 'Portugal', 'Latvia', 'Philippines',
                    'Somaliland region', 'Morocco', 'Macedonia', 'Mozambique', 'Albania',
                    'Bosnia and Herzegovina', 'Lesotho', 'Dominican Republic', 'Laos',
                    'Mongolia', 'Swaziland', 'Greece', 'Lebanon', 'Hungary', 'Honduras',
                    'Tajikistan', 'Tunisia', 'Palestinian Territories', 'Bangladesh', 'Iran',
                    'Ukraine', 'Iraq', 'South Africa', 'Ghana', 'Zimbabwe', 'Liberia', 'India',
                    'Sudan', 'Haiti', 'Congo (Kinshasa)', 'Nepal', 'Ethiopia', 'Sierra Leone',
                    'Mauritania', 'Kenya', 'Djibouti', 'Armenia', 'Botswana', 'Myanmar',
                    'Georgia', 'Malawi', 'Sri Lanka', 'Cameroon', 'Bulgaria', 'Egypt',
                    'Yemen', 'Angola', 'Mali', 'Congo (Brazzaville)', 'Comoros', 'Uganda',
                    'Senegal', 'Gabon', 'Niger', 'Cambodia', 'Tanzania', 'Madagascar',
                    'Central African Republic', 'Chad', 'Guinea', 'Ivory Coast',
                    'Burkina Faso', 'Afghanistan', 'Rwanda', 'Benin', 'Syria',
                    'Burundi', 'Togo'),
        Happiness_Level = c(7.5869998932, 7.5609998703, 7.5269999504, 7.521999836, 7.4270000458,
                            7.4060001373, 7.3779997826, 7.3639998436, 7.2859997749, 7.2839999199,
                            7.2779998779, 7.2259998322, 7.1999998093, 7.1869997978, 7.118999958,
                            6.9829998016, 6.9460000992, 6.9400000572, 6.9369997978, 6.9010000229,
                            6.867000103, 6.853000164, 6.8099999428, 6.7979998589, 6.7859997749,
                            6.75, 6.6700000763, 6.611000061, 6.5749998093, 6.5739998817,
                            6.5050001144, 6.4850001335, 6.4770002365, 6.4549999237, 6.4109997749,
                            6.3289999962, 6.3020000458, 6.2979998589, 6.2950000763, 6.2690000534,
                            6.1680002213, 6.1300001144, 6.123000145, 6.0029997826, 5.9949998856,
                            5.9869999886, 5.984000206, 5.9749999046, 5.9600000381, 5.9479999542,
                            5.8899998665, 5.888999939, 5.8779997826, 5.8550000191, 5.8480000496,
                            5.8330001831, 5.8280000687, 5.8239998817, 5.8130002022, 5.7909998894,
                            5.7699999809, 5.7589998245, 5.7540001869, 5.7160000801, 5.7090001106,
                            5.6950001717, 5.6890001297, 5.6050000191, 5.5890002251, 5.5479998589,
                            5.4770002365, 5.4739999771, 5.4289999008, 5.3990001678, 5.3600001335,
                            5.3319997787, 5.2859997749, 5.2680001259, 5.2529997826, 5.2119998932,
                            5.1939997673, 5.1919999123, 5.1919999123, 5.1399998665, 5.1290001869,
                            5.1240000725, 5.123000145, 5.1020002365, 5.0980000496, 5.0729999542,
                            5.0570001602, 5.0130000114, 5.0069999695, 4.9710001945, 4.9590001106,
                            4.9489998817, 4.8979997635, 4.8850002289, 4.8759999275, 4.8740000725,
                            4.867000103, 4.8569998741, 4.8390002251, 4.8000001907, 4.7880001068,
                            4.7859997749, 4.7389998436, 4.7150001526, 4.6939997673, 4.6859998703,
                            4.6810002327, 4.6770000458, 4.6420001984, 4.632999897, 4.6100001335,
                            4.5710000992, 4.5650000572, 4.5500001907, 4.5180001259, 4.5170001984,
                            4.513999939, 4.5120000839, 4.5069999695, 4.4359998703, 4.4190001488,
                            4.368999958, 4.3499999046, 4.3319997787, 4.3070001602, 4.2969999313,
                            4.2919998169, 4.2709999084, 4.251999855, 4.2179999352, 4.1939997673,
                            4.0770001411, 4.0329999924, 3.9949998856, 3.989000082, 3.9560000896,
                            3.9309999943, 3.9040000439, 3.8959999084, 3.8450000286, 3.8190000057,
                            3.7809998989, 3.6809999943, 3.6779999733, 3.6670000553, 3.6559998989,
                            3.6549999714, 3.5869998932, 3.5750000477, 3.4649999142, 3.3399999142,
                            3.006000042, 2.9049999714, 2.8389999866))
      
      num <<- as.integer(input$your_rank)
      happiness$num <<- c(rep(num),nrow(happiness))
    plot <- ggplot(happiness,
             aes(reorder(Country, -Happiness_Level), Happiness_Level)) +
        geom_bar(stat="identity", fill = "red") +
        theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) +
        labs(x = "", y = "Average happiness level") +
        labs(title = "Average happiness level across countries, 2014") + 
        geom_vline(data = happiness,
                   mapping = aes(xintercept = num[1], colour="black")) +
        geom_text(data = happiness,
                   mapping = aes(x = (num[1] + 10), y = 6.5,
                                 label = Country[num[1]], "   ")) +
        geom_text(data = happiness,
                   mapping = aes(x = (num[1] + 10), y = 6.0,
                                 label = round(Happiness_Level[num[1]], 3), "    "))
     print(plot)
    }))
}
)