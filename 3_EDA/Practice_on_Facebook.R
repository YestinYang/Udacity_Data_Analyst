pf = read.csv('./lesson3/pseudo_facebook.tsv', sep = '\t')

pf$prop_initiated = pf$friendships_initiated / pf$friend_count

pf$year_joined.bucket = cut(pf$year_joined,
                            c(2004,2009,2011,2012,2014))

ggplot(data = pf, aes(x = tenure, y = prop_initiated)) + 
  geom_line(stat = 'summary', fun.y = median)

