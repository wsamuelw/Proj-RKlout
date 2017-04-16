# Twitter Followers + Klout Score
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

To make it easy to compare the distributions, use density.

```{r}
# Make a plot
ggplot(FLR_PROFILE, aes(Klout_Score, ..density.., colour = verified)) +
  geom_freqpoly(binwidth = 2)
```
