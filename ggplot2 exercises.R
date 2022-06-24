# Intro to ggplot2
# Rick Scavetta
# 24.06.2022
# DVwR-2206-IMPRS-LS-01

# packages
library(tidyverse)
library(RColorBrewer) # https://colorbrewer2.org/

# Looking at colours
display.brewer.all(type = "div")
display.brewer.pal(6, "Dark2")
brewer.pal(6, "Dark2")

# What is "#1B9E77"?
# This is a hexidecimal number (base-16)
# "#RRGGBB"
256 * 256 * 256 # ca 16.8 million colours

# base 10:
# 1-digit: 0-9 (10^1 = 10)
# 2-digits 00-99 (10^2 = 100)

# base 16:
# 1-digit: 0-9A-F (16^1 = 16)
# 2-digits 00-FF (16^2 = 256)

# "#RRGGBBAA" Alpha

myCol <- brewer.pal(6, "Dark2")
munsell::plot_hex(c("#439790", "#DCEEEC", 
                    "#439790FF")) # We can use the last two positions for transparency



munsell::plot_hex(c("#000000", "#FFFFFF"))

# Making colour gradients, e.g. in pheatmap::pheatmap():
rev(brewer.pal(5, "PuOr"))
display.brewer.pal(5, "PuOr")
class(mean)
myFun <- function(x) {
  x*2
}
myFun(2)

myPal <- colorRampPalette(c("#000000", "#FFFFFF"))
munsell::plot_hex(myPal(100))

myDiv <- colorRampPalette(rev(brewer.pal(5, "PuOr")))
myDiv(100)
munsell::plot_hex(myDiv(100))

# Plotting with ggplot2: Basic scatter plot
# Layer 1 - data
iris
# Layer 2 - Aesthetic mappings (x, y, color)
# Layer 3 - Geoms (?)

# What's the purpose of using a forward pipe operator (%>%)?
iris %>% 
  filter(Species != "virginica") %>% 
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth(se = FALSE)

# Without using the forward pipe operator?
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point()

# don't make an object unless you have a reason to do so
# e.g. if you want to resuse some layers over and over:
p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) 

p

p +
  geom_point(aes(color = Species))

p +
  geom_point(aes(shape = Species))

# If you specify aesthetics inside a geom function, 
# then they only apply to that layer
p +
  geom_point(aes(color = Species)) +
  geom_smooth(se = FALSE)


# Basic scatter plot w color
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point()

# Main problem with using points: OVER-PLOTTING!!
# Causes
## 1 - Low-precision data (here, measured to 1 decimal place)
## 2 - Integer data (x +/ y may be integers)
## 3 - High-density data (GOLD Graphics of Large Data)
## 4 - Categorical x (or y)

# Solutions
## 








