

rootmap <- "d:/Rvis/"
scriptmap <- paste(rootmap, "TablePlot/R/", sep="")
datamap <- paste("k:/cbs/rvis/data/", sep="")

setwd(scriptmap)
source("tableplot.R")
source(".plotTable.R")
source("num2fac.R") 
source("tableGUI.R")
require(gWidgets)
require(gWidgetsRGtk2)
#require(gWidgetstcltk)
require(plyr)
require(RColorBrewer)
require(classInt)

require(ff)

library(ggplot2)
data(diamonds)

diamonds$color[sample.int(50000, 5000)] <- NA


### test package #######

install.packages("./tabplot_0.9.zip")
library(tabplot)


irisNA <- iris
	# simulate missing data
	is.na(irisNA$Sepal.Width) <- sample(1:nrow(iris), 30)
	is.na(irisNA$Species) <- sample(1:nrow(iris), 15)

	tableplot(irisNA)

diamondsNA <- diamonds
# simulate missing data
is.na(diamondsNA$price) <- diamondsNA$cut == "Ideal"
tableplot(diamondsNA)

data(movies)
tableplot(movies[,c(3:5,17:24)], sortCol="rating", decreasing=FALSE, scales="lin", nBins=100)
	

########################


setwd(datamap)
load("ps0607.Rdata")
load("ps07pop.Rdata")

ps07pop_ffdf <- as.ffdf(ps07pop)


tableplot(diamonds)


# test manually
dat <- diamonds
colNames <- names(dat)[c(1,3,4)]
sortCol <- colNames[c(1,2)]
decreasing <- c(FALSE, TRUE)
scales <- "auto"
nBins <- 100
from <- 25
to <- 50



