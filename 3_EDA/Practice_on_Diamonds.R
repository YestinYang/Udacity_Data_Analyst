## Single Variable EDA

dm = diamonds

summary(dm)

qplot(x = price, data = dm, binwidth=100, geom = 'freqpoly') + 
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,100))

summary(dm$price >= 15000)

qplot(x = price, data = dm, binwidth=100, geom = 'freqpoly') +
  facet_wrap(~cut, scales = 'free_y')

by(dm$price, dm$cut, summary)


qplot(x = price/carat, data = dm) +
  facet_wrap(~cut) + 
  scale_x_log10()

p1 = qplot(x = clarity, y = price, data = dm, geom = 'boxplot')
p2 = qplot(x = color, y = price, data = dm, geom = 'boxplot')
p3 = qplot(x = cut, y = price, data = dm, geom = 'boxplot')
grid.arrange(p1,p2,p3, ncol = 1)

by(dm$price, dm$color, summary)

qplot(x = color, y = price/carat, data = dm, geom = 'boxplot')

qplot(x = carat, data = dm, geom = 'freqpoly', binwidth =0.1) + 
  scale_x_continuous(breaks = seq(0,5,0.1)) + 
  scale_y_continuous(breaks = seq(0,2500,500)) + 
  coord_cartesian(ylim = c(0,2500))


## Bivariable EDA

ggplot(aes(x = x, y = price), data = dm) + 
  geom_point()

qplot(x = z,data = dm)

with(dm, cor.test(z, price, method = 'pearson'))

ggplot(aes(x = depth, y = price), data = dm) + 
  geom_point(alpha = 1/100) +
  scale_x_continuous(breaks = seq(50,70,2))

with(dm, cor.test(depth, price))  

ggplot(aes(x = carat, y = price), data = dm) + 
  geom_point() + 
  xlim(0, quantile(dm$carat, 0.99)) + 
  ylim(0, quantile(dm$price, 0.99))

dm$volume = dm$x * dm$y *dm$z

ggplot(aes(x = volume, y = price), data = dm) + 
  geom_point() + 
  xlim(0,750)

with(dm[(dm$volume > 0) & (dm$volume < 800),], cor.test(x = volume, y = price))

ggplot(aes(x = volume, y = price), data = dm[(dm$volume > 0) & (dm$volume < 800),]) + 
  geom_point(alpha = 1/100) + 
  geom_smooth(method = 'lm')

diamondsByClarity = dm %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price),
            median_price = median(price),
            min_price = min(price),
            max_price = max(price),
            n = n())

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

p1 = ggplot(aes(x = color, y = mean_price), data = diamonds_mp_by_color) + 
  geom_bar(stat = 'identity')
p2 = ggplot(aes(x = clarity, y = mean_price), data = diamonds_mp_by_clarity) + 
  geom_bar(stat = 'identity')
grid.arrange(p1,p2)