library(rtweet)
library(RKlout)
library(lubridate)
library(ggplot2)

# Get followers assuming the key + secret for Twitter have all been set up
HD <- 'Twitter handle here'
FLR <- get_followers(user = HD, n = 75000); nrow(FLR);
FLR_PROFILE <- lookup_users(FLR); nrow(FLR_PROFILE);

# Get your key here >> http://developer.klout.com/apps/mykeys
KLOUT_API_KEY <- 'API Key here'

# Do a for loop to get the score
for(i in 1:nrow(FLR_PROFILE)){
  FLR_PROFILE$Klout_Score[i] <- RKlout(KLOUT_API_KEY, FLR_PROFILE$screen_name[i])
  print(i)
}

head(FLR_PROFILE$Klout_Score, 10)
[1] "41.1770869030701"                                         "55.903383588456"                                         
[3] "60.1172019521538"                                         "66.3836781938185"                                        
[5] "Please provide valid API key and Twitter Username/handle" "65.3273764384208"                                        
[7] "28.935975906568"                                          "52.5850053874679"                                        
[9] "45.1928225719721"                                         "44.9589873274294"    

# Format score
FLR_PROFILE$Klout_Score <- gsub("Please provide valid API key and Twitter Username/handle", 0, FLR_PROFILE$Klout_Score)
FLR_PROFILE$Klout_Score <- round(as.numeric(FLR_PROFILE$Klout_Score_T), 2)

head(FLR_PROFILE$Klout_Score, 10)
[1] 41.18 55.90 60.12 66.38  0.00 65.33 28.94 52.59 45.19 44.96

# Format date stamp and create year
FLR_PROFILE$created_at <- as.POSIXct(FLR_PROFILE$created_at, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
FLR_PROFILE$created_at <- with_tz(FLR_PROFILE$created_at, "Australia/Melbourne")
FLR_PROFILE$created_year_at <- strftime(FLR_PROFILE$created_at, "%Y")
