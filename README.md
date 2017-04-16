# Twitter Followers + Klout Score

What is Klout Score?

The [Klout Score](https://klout.com/corp/score) is a number between 1-100 that represents your influence. The more influential you are, the higher your Klout Score. The average Klout Score is 40. Users with a score of 63 are in the top 5% of all users.

Based on a very small population of 900+ followers, most users have a score of around 40ish. The 0s simply mean undefined.

```{r}
# Make a plot
library(ggplot2)

ggplot(FLR_PROFILE, aes(Klout_Score)) +
  geom_histogram(binwidth = 2)
```

![Image 1](https://github.com/wsamuelw/R-Code/blob/master/Images/Distribution_by_Klout_Score.png)

Hypothesis = Verified Twitter users could have a relatively high Klout score. Maybe?

```{r}
# Make a plot
ggplot(FLR_PROFILE, aes(Klout_Score, fill = verified)) +
  geom_histogram(binwidth = 2)
```

![Image 2](https://github.com/wsamuelw/R-Code/blob/master/Images/Distribution_by_Klout_Score_Verified.png)

To make it easy to compare the distributions, use density. Hmm... it looks like verified users tend to have a higher score.

```{r}
# Make a plot
ggplot(FLR_PROFILE, aes(Klout_Score, ..density.., colour = verified)) +
  geom_freqpoly(binwidth = 2)
```

![Image 3](https://github.com/wsamuelw/R-Code/blob/master/Images/Distribution_by_Klout_Score_Density.png)

