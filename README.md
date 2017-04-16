# Twitter Followers + Klout Score

What is Klout Score?

The [Klout Score](https://klout.com/corp/score) is a number between 1-100 that represents your influence. The more influential you are, the higher your Klout Score. The average Klout Score is 40. Users with a score of 63 are in the top 5% of all users.

Based on a very small population of 900+ followers, below is a distribution of Klout score.

```{r}
# Make a plot
library(ggplot2)

ggplot(FLR_PROFILE, aes(Klout_Score)) +
  geom_histogram(binwidth = 5, alpha = .8) +
  geom_vline(aes(xintercept=40), color="red", alpha = .9, linetype="dashed", size=.5) + 
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)) +
  labs(x="Klout Score", y="Count") 
```

![Image 1](https://github.com/wsamuelw/R-Code/blob/master/IMG/Distribution_by_Klout_Score.png)

Hypothesis = Verified Twitter users could have a relatively high Klout score. Maybe?

```{r}
# Make a plot
ggplot(FLR_PROFILE, aes(Klout_Score, fill = verified)) +
  geom_histogram(binwidth = 2, alpha = .8) +
  geom_vline(aes(xintercept=40), color="black", alpha = .9, linetype="dashed", size=.5) + 
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)) +
  labs(x="Klout Score", y="Count") 
```

![Image 2](https://github.com/wsamuelw/R-Code/blob/master/IMG/Distribution_by_Klout_Score_Verified.png)

To make it easy to compare the distributions, use density. Hmm... it looks like verified users tend to have a higher score.

```{r}
# Make a plot
ggplot(FLR_PROFILE, aes(Klout_Score, ..density.., fill = verified)) +
  geom_histogram(binwidth = 2, alpha = .8) +
  geom_vline(aes(xintercept=40), color="black", alpha = .9, linetype="dashed", size=.5) + 
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)) +
  labs(x="Klout Score", y="Count") 
```

![Image 3](https://github.com/wsamuelw/R-Code/blob/master/IMG/Distribution_by_Klout_Score_Density.png)

