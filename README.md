# Distribution by Klout Score
Based on a very small population of 900+ followers, most users have a score of around 40ish.

```{r}
# Make a plot
library(ggplot2)

ggplot(FLR_PROFILE, aes(Klout_Score)) +
  geom_histogram(binwidth = 2)
```

![Image 1](https://github.com/wsamuelw/R-Code/blob/master/Images/Distribution_by_Klout_Score.png)

# Title goes here
This image is only for testing purpose.

![Image 2](https://github.com/wsamuelw/R-Code/blob/master/Images/Distribution_by_Klout_Score.png)
