# install.packages("openintro")
library(ggplot2)
library(openintro)
library(dplyr)

ggplot(ncbirths, aes(x = weeks, y = weight)) +
  geom_point() +
  labs(x = "Weeks of gestation", y = "Birth weight of baby (in lbs)")

ggplot(ncbirths, aes(x = cut(weeks, breaks=5), y = weight)) +
  geom_boxplot() +
  labs(x = "Weeks of gestation", y = "Birth weight of baby (in lbs)")


sample(mammals)
sample(ncbirths)


ggplot(mammals, aes(x = body_wt, y = brain_wt)) +
  geom_point()+
  coord_trans(x="log10", y="log10")

ggplot(mammals, aes(x = body_wt, y = brain_wt)) +
  geom_point()+
  scale_x_log10()+
  scale_y_log10()


ncbirths %>% 
  summarise(N=n(), r = cor(x=weight, y=mage))


ncbirths %>% 
    summarise(N=n(), r = cor(x=weight, y=weeks, use="pairwise.complete.obs"))


ggplot(data=bdims, aes(x=hgt, y=wgt))+
  geom_point()+
  geom_smooth(method="lm", se=FALSE)


slope = 0.7173011 * (13.34576 / 9.407205)
slope
intercept = 69.14753 - slope * 171.1438
intercept
mod = lm(wgt ~ hgt, data = bdims)
coefs = coef(mod)
coefs
summary(mod)
mean(residuals(mod))


sqrt(sum(residuals(mod)^2/df.residual(mod)))


df.residual(mod)