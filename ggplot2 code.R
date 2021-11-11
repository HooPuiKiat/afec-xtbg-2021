library(tidyverse)
mpg
?mpg
view(mpg) #use view() to open the dataset as a tab
summary(mpg)
dim(mpg)
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point()
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_point()
par(mfrow=c(2,2))

#ggplot2 does not allow par(mfrow=c(2,2)) to view multiple plots
#install package "cowplot" to do that
install.packages("cowplot")
library(cowplot)
?cowplot
p1 <- ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point()
p2 <- ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_point()
#use plot_grid() to view multiple plots
plot_grid(p1, p2, labels = c("A", "B"), label_size = 12)

#add aes to the scatterplot
ggplot(mpg, aes(x = displ, y = hwy, colour = class)) + 
  geom_point() #each class will have its own colour now
ggplot(mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(colour = "blue") #follow this to mannually choose colour for all points. The command must be added in geom_point()
ggplot(mpg, aes(x = displ, y = hwy, size = class)) + 
  geom_point() #bad idea
#> Warning: Using size for a discrete variable is not advised.

ggplot(mpg, aes(x = displ, y = hwy, alpha = class)) + 
  geom_point() #alpha is gradient of transparency
ggplot(mpg, aes(x = displ, y = hwy, shape = class)) + 
  geom_point() #there can only be 6 maximum types of shape, here we have 7, so one get unplotted

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(shape = 21, colour = "black", fill = "white", size = 4, stroke = 2) #fill and stroke are only available for shape 21-25

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_wrap(vars(cty), nrow = 2) #this will add one variable and breakdown your data into your chosen variable(here is class).

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_grid(drv ~ cyl) #this will add two variable and breakdown your data into two variables (drv at y axis, cyl in x axis)
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  facet_grid(.~ cyl) #adding . will let you choose x or y axis the cyl will be


  