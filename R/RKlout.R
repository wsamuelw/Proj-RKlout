# Library X3
library(rtweet)
library(stringr)
library(RKlout)

# Get followers assuming the key + secret for Twitter have all been set up
HD <- 'Twitter handle here'
FLR <- get_followers(user = HD, n = 75000); nrow(FLR);

# Create a new variable - Last Digit
# The purpose of this is to avoid hitting the rate limit set by Twitter
# It only makes sense to do so when someone has a large following e.g. over 18000 I think
FLR$FLR_Last_Digit <- str_sub(FLR$user_id, -1)

# QC
# Just to get a feel of the distribution
table(FLR$FLR_Last_Digit)

0    1    2    3    4    5    6    7    8    9 
2386 1340 2698 1346 2432 1264 2429 1299 2364 1316 

# Split by odd and even numbers
FLR_EVEN <- subset(FLR, as.numeric(FLR$FLR_Last_Digit) %% 2 == 0); nrow(FLR_EVEN);
FLR_ODD <- subset(FLR, as.numeric(FLR$FLR_Last_Digit) %% 2 != 0); nrow(FLR_ODD);

# The exciting stuff here
# Get user profile
# Will require a different approach when querying with a super large dataset
# This nrow(PROFILE_EVEN) will always be smaller than this nrow(FLR_EVEN) 
PROFILE_EVEN <- lookup_users(FLR_EVEN); nrow(PROFILE_EVEN);
PROFILE_ODD <- lookup_users(FLR_ODD); nrow(PROFILE_ODD);

# Of course, will need to append the datasets
PROFILE <- rbind(PROFILE_EVEN, PROFILE_ODD); nrow(PROFILE) #932

# I simply like to view the dataset at this point
View(PROFILE)

# Get Klout score with a loop
# Get your key here >> http://developer.klout.com/apps/mykeys
KLOUT_API_KEY <- 'API Key here'

# Would suggest to do a mini test for a small pool of screen_name e.g. 100
for(i in 1:nrow(PROFILE)){
  PROFILE$Klout_Score[i] <- RKlout(KLOUT_API_KEY, PROFILE$screen_name[i])
  print(i)
}

# For some strange reason, I just like to view the dataset again
View(PROFILE)

# QC to validate the score by maybe picking one or a few handles
RKlout(KLOUT_API_KEY, 'Twitter handle here')

# Don't like the idea to override an existing variable when testing out
# Create a new variable just to validate
PROFILE$Klout_Score_T <- gsub("Please provide valid API key and Twitter Username/handle", 0, PROFILE$Klout_Score)
PROFILE$Klout_Score_T <- round(as.numeric(PROFILE$Klout_Score_T), 2)
