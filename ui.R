country_list <- c('Afghanistan' = 'Afghanistan', 'Albania' = 'Albania',
                  'Algeria' = 'Algeria', 'Angola' = 'Angola',
                  'Argentina' = 'Argentina', 'Armenia' = 'Armenia',
                  'Australia' = 'Australia', 'Austria' = 'Austria',
                  'Azerbaijan' = 'Azerbaijan', 'Bahrain' = 'Bahrain',
                  'Bangladesh' = 'Bangladesh', 'Belarus' = 'Belarus', 
                  'Belgium' = 'Belgium', 'Benin' = 'Benin', 'Bhutan' = 'Bhutan',
                  'Bolivia' = 'Bolivia',
                  'Bosnia and Herzegovina' = 'Bosnia and Herzegovina',
                  'Botswana' = 'Botswana', 'Brazil' = 'Brazil',
                  'Bulgaria' = 'Bulgaria', 'Burkina Faso' = 'Burkina Faso',
                  'Burundi' = 'Burundi', 'Cambodia' = 'Cambodia',
                  'Cameroon' = 'Cameroon', 'Canada' = 'Canada',
                  'Central African Republic' = 'Central African Republic',
                  'Chad' = 'Chad', 'Chile' = 'Chile', 'China' = 'China',
                  'Colombia' = 'Colombia', 'Comoros' = 'Comoros',
                  'Congo (Brazzaville)' = 'Congo (Brazzaville)',
                  'Congo (Kinshasa)' = 'Congo (Kinshasa)', 'Costa Rica' = 'Costa Rica',
                  'Croatia' = 'Croatia', 'Cyprus' = 'Cyprus',
                  'Czech Republic' = 'Czech Republic', 'Denmark' = 'Denmark', 'Djibouti' = 'Djibouti', 'Dominican Republic' = 'Dominican Republic', 'Ecuador' = 'Ecuador', 'Egypt' = 'Egypt', 'El Salvador' = 'El Salvador', 'Estonia' = 'Estonia', 'Ethiopia' = 'Ethiopia', 'Finland' = 'Finland', 'France' = 'France', 'Gabon' = 'Gabon', 'Georgia' = 'Georgia', 'Germany' = 'Germany', 'Ghana' = 'Ghana', 'Greece' = 'Greece', 'Guatemala' = 'Guatemala', 'Guinea' = 'Guinea', 'Haiti' = 'Haiti', 'Honduras' = 'Honduras', 'Hong Kong' = 'Hong Kong', 'Hungary' = 'Hungary', 'Iceland' = 'Iceland', 'India' = 'India', 'Indonesia' = 'Indonesia', 'Iran' = 'Iran', 'Iraq' = 'Iraq', 'Ireland' = 'Ireland', 'Israel' = 'Israel', 'Italy' = 'Italy', 'Ivory Coast' = 'Ivory Coast', 'Jamaica' = 'Jamaica', 'Japan' = 'Japan', 'Jordan' = 'Jordan', 'Kazakhstan' = 'Kazakhstan', 'Kenya' = 'Kenya', 'Kosovo' = 'Kosovo', 'Kuwait' = 'Kuwait', 'Kyrgyzstan' = 'Kyrgyzstan', 'Laos' = 'Laos', 'Latvia' = 'Latvia', 'Lebanon' = 'Lebanon', 'Lesotho' = 'Lesotho', 'Liberia' = 'Liberia', 'Libya' = 'Libya', 'Lithuania' = 'Lithuania', 'Luxembourg' = 'Luxembourg', 'Macedonia' = 'Macedonia', 'Madagascar' = 'Madagascar', 'Malawi' = 'Malawi', 'Malaysia' = 'Malaysia', 'Mali' = 'Mali', 'Malta' = 'Malta', 'Mauritania' = 'Mauritania', 'Mauritius' = 'Mauritius', 'Mexico' = 'Mexico', 'Moldova' = 'Moldova', 'Mongolia' = 'Mongolia', 'Montenegro' = 'Montenegro', 'Morocco' = 'Morocco', 'Mozambique' = 'Mozambique', 'Myanmar' = 'Myanmar', 'Nepal' = 'Nepal', 'Netherlands' = 'Netherlands', 'New Zealand' = 'New Zealand', 'Nicaragua' = 'Nicaragua', 'Niger' = 'Niger', 'Nigeria' = 'Nigeria', 'North Cyprus' = 'North Cyprus', 'Norway' = 'Norway', 'Oman' = 'Oman', 'Pakistan' = 'Pakistan', 'Palestinian Territories' = 'Palestinian Territories', 'Panama' = 'Panama', 'Paraguay' = 'Paraguay', 'Peru' = 'Peru', 'Philippines' = 'Philippines', 'Poland' = 'Poland', 'Portugal' = 'Portugal', 'Qatar' = 'Qatar', 'Romania' = 'Romania', 'Russia' = 'Russia', 'Rwanda' = 'Rwanda', 'Saudi Arabia' = 'Saudi Arabia', 'Senegal' = 'Senegal', 'Serbia' = 'Serbia', 'Sierra Leone' = 'Sierra Leone', 'Singapore' = 'Singapore', 'Slovakia' = 'Slovakia', 'Slovenia' = 'Slovenia', 'Somaliland region' = 'Somaliland region', 'South Africa' = 'South Africa', 'South Korea' = 'South Korea', 'Spain' = 'Spain', 'Sri Lanka' = 'Sri Lanka', 'Sudan' = 'Sudan', 'Suriname' = 'Suriname', 'Swaziland' = 'Swaziland', 'Sweden' = 'Sweden', 'Switzerland' = 'Switzerland', 'Syria' = 'Syria', 'Taiwan' = 'Taiwan', 'Tajikistan' = 'Tajikistan', 'Tanzania' = 'Tanzania', 'Thailand' = 'Thailand', 'Togo' = 'Togo', 'Trinidad and Tobago' = 'Trinidad and Tobago', 'Tunisia' = 'Tunisia', 'Turkey' = 'Turkey', 'Turkmenistan' = 'Turkmenistan', 'Uganda' = 'Uganda', 'Ukraine' = 'Ukraine', 'United Arab Emirates' = 'United Arab Emirates', 'United Kingdom' = 'United Kingdom', 'United States' = 'United States', 'Uruguay' = 'Uruguay', 'Uzbekistan' = 'Uzbekistan', 'Venezuela' = 'Venezuela', 'Vietnam' = 'Vietnam', 'Yemen' = 'Yemen', 'Zambia' = 'Zambia', 'Zimbabwe' = 'Zimbabwe')
shinyUI(fluidPage(
  titlePanel("Happiness Evaluation"),
  sidebarPanel(
    width = 12,
    p('This application asks you to evaluate the level of satisfaction with your life and
      allows you to compare it to the average scores from across the world.
      The app is based on the 2015 World Happiness Report
      (see http://worldhappiness.report/).'),
    p('Please evaluate your level of life satisfaction,
      or simply level of happiness, based on 10-point scale.'),
    numericInput(inputId="your_happiness", value = 5,
                 min = 0, max = 10, step = 1, label = "Level of life satisfaction:"),
    p('And choose your country from the list below.'),
    selectInput(inputId="your_country", 
                choices = country_list,
                label = "Country:",
                selected = NULL),
    actionButton(inputId = "goButton", label = "Submit")
    ),
  mainPanel(
    width = 12,
    p('You estimated your level of happiness to be'),
    textOutput('your_happiness'),
    p('The average happines value for your country is'),
    textOutput('country_average'),
    h3("Distribution of happiness across the world."),
    p('Here is the diagram of the average happiness levels across the countries.
      Use the sidebar to navigate through it.'),
    sliderInput(inputId = "your_rank", label = "Rank of a country in the happines distribution
                diagram:", value = 1, min = 1, max = 158, step = 1),
    plotOutput('happiness_diagram')
    )
  )
)