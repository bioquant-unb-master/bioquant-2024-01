####################################################### 
#### Created by Rolf Lohaus, EEB Dept., Rice University
####
#### Part of the code modified and extended from 
####    Robert I. Kabacoff's Quick-R website 
####    (http://www.statmethods.net)
#######################################################

###############  HIGH-LEVEL PLOTTING FUNCTIONS  ###############


# load some data (dataset of types of cars and their specs used earlier in our meetings)
data(mtcars)

# create a basic scatterplot (e.g weight vs. miles per gallon)
plot(mtcars$wt, mtcars$mpg)

# specify better axis labels and add a title (note plot always creates a new plot erasing the current one)
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")



#####  SAVING GRAPHS  #####

# save the graph either by using 'Export' in the 'Plots' tab in RStudio or using the following functions
pdf("weight_mpg.pdf")       # create PDF in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                   # "save" the PDF 

# pdf("C:/Graphs/weight_mpg.pdf")         # create PDF in some other directory
# plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
# dev.off()                               # "save" the PDF 

# change the size of the PDF (in inches)
pdf("weight_mpg.pdf", width=6, height=5)        # create PDF in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                                       # "save" the PDF 

# change the font family of the text in the PDF (default is sans-serif "Helvetica")
pdf("weight_mpg.pdf", width=6, height=5, family="Times")        # create PDF in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                                                       # "save" the PDF 


png("weight_mpg.png")       # create PNG in current working directory
plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
dev.off()                   # "save" the PNG

# jpeg("weight_mpg.jpg")      # create JPEG in current working directory
# plot(mtcars$wt, mtcars$mpg, xlab="Weight", ylab="Miles per gallon", main="Weight vs. Miles per Gallon")
# dev.off()                   # "save" the JPEG 



#####  HISTOGRAMS  #####

# create a basic histogram
hist(mtcars$mpg)
hist(mtcars$mpg, xlab="Miles per gallon", main="Histogram of Miles per Gallon")

# control number of bins with parameter 'breaks'
hist(mtcars$mpg, breaks=12)
hist(mtcars$mpg, breaks=seq(10,34))

# get information about histogram
hInfo <- hist(mtcars$mpg, breaks=seq(10,34))
hInfo

# plot probability density instead of frequencies
hist(mtcars$mpg, breaks=seq(10,34), freq=F)


# create a kernel density plot
plot(density(mtcars$mpg))



#####  BAR PLOTS  #####

# create a basic barplot
gearCounts <- table(mtcars$gear)
gearCounts
barplot(gearCounts)
barplot(gearCounts, xlab="Number of gears")
# label the bars individually with parameter 'names.arg'
barplot(gearCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"))

# horizontal bar plot
barplot(gearCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), horiz=TRUE)

# stacked bar plot
gearTransmissionCounts <- table(mtcars$am, mtcars$gear)
gearTransmissionCounts
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"))
# add a legend with automatic labels with parameter 'legend.text'
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=T)
# add a legend with custom labels
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=c("automatic", "manual"))

# grouped bar plot with parameter 'beside=TRUE'
barplot(gearTransmissionCounts, names.arg=c("3 Gears", "4 Gears", "5 Gears"), legend.text=c("automatic", "manual"), beside=TRUE)



#####  BOX PLOTS  #####

# create a boxplot for an individual variable (e.g. miles per gallon)
boxplot(mtcars$mpg, ylab="Miles per gallon")

# create a boxplot for a variable by group (e.g. miles per gallon by cylinders)
boxplot(mpg ~ cyl, data=mtcars, xlab="Number of cylinders", ylab="Miles per gallon")
# do not draw outliers
boxplot(mpg ~ cyl, data=mtcars, xlab="Number of cylinders", ylab="Miles per gallon", outline=FALSE)



#####  LINE PLOTS  #####

# load some time data (dataset of growth of five orange trees over time)
data(Orange)
Orange

# extract data for 1st tree
tree1 <- subset(Orange, Orange$Tree==1)

# plot age vs circumference
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)")
# use lines with parameter 'type="l"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="l")
# use both points and lines with parameter 'type="b"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="b")
# use both points and lines overlayed with parameter 'type="o"'
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="o")



#####  PLOTS OF THREE VARIABLES / 3D PLOTS  #####

# image(x, y, z, ...)
# contour(x, y, z, ...)
# persp(x, y, z, ...)



###############  LOW-LEVEL PLOTTING FUNCTIONS & GRAPHICAL PARAMETERS  ###############


#####  plot lines and points separately  #####

# set up a plot without any points and lines
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="n")
# draw lines
lines(tree1$age, tree1$circumference)
# draw points
points(tree1$age, tree1$circumference)


# draw points with black border and white fill color
plot(tree1$age, tree1$circumference, xlab="Age (days)", ylab="Circumference (mm)", type="n")
lines(tree1$age, tree1$circumference)
points(tree1$age, tree1$circumference, pch=21, bg="white")      # specify point type and background fill color



#####  plot mutiple data in one graph (data for all trees) and add a legend #####

# get the range for x and y axes
xRange <- range(Orange$age)
xRange
yRange <- range(Orange$circumference)
yRange

# set up plot using data
plot(xRange, yRange, xlab="Age (days)", ylab="Circumference (mm)", type="n")
# set up plot using x and y axis limits
plot(0, xlab="Age (days)", ylab="Circumference (mm)", type="n", xlim=xRange, ylim=yRange)

# draw points and lines for all trees
for (t in 1:5) {
    tree <- subset(Orange, Orange$Tree==t)
    lines(tree$age, tree$circumference)
    points(tree$age, tree$circumference, pch=21, bg="white")
}

# plot data for all trees using different line types
plot(0, xlab="Age (days)", ylab="Circumference (mm)", type="n", xlim=xRange, ylim=yRange)
# create a vector with 5 elements specifying the line type to be used for each tree
lineTypes <- c(2, 1, 4, 5, 3)
for (t in 1:5) {
    tree <- subset(Orange, Orange$Tree==t)
    lines(tree$age, tree$circumference, lty=lineTypes[t])      # specify line type
    points(tree$age, tree$circumference, pch=21, bg="white")
}

# add a legend
legend("topleft", legend=1:5, lty=lineTypes, title="Tree")


# plot data for all trees using different line types, point types and colors
plot(0, xlab="Age (days)", ylab="Circumference (mm)", type="n", xlim=xRange, ylim=yRange)
# create a vector with 5 elements specifying the point type to be used for each tree
pointTypes <- seq(21,25)
# create a vector with 5 elements specifying the color to be used for each tree
colors <- rainbow(5)
for (t in 1:5) {
    tree <- subset(Orange, Orange$Tree==t)
    lines(tree$age, tree$circumference, lty=lineTypes[t], col=colors[t])
    points(tree$age, tree$circumference, pch=pointTypes[t], bg="white", col=colors[t])
}

# add the corresponding legend but this time omit the legend box and title, 
# and place it in the bottom right corner
legend("bottomright", legend=c("Tree 1", "Tree 2", "Tree 3", "Tree 4", "Tree 5"), lty=lineTypes, pch=pointTypes, col=colors, pt.bg="white", bty="n")


#####  COLORS  #####

# list all color names
colors()

# create color(s) by specifying red, green, blue intensities
yellowColor = rgb(red=1, green=1, blue=0)
yellowColor = rgb(red=255, green=255, blue=0, maxColorValue=255)
transparentGrayColor = rgb(0.3, 0.3, 0.3, alpha=0.5)



#####  calculate and plot mean circumference of trees with error bars  ######

# calculate means at each age
meanCircumferences <- tapply(Orange$circumference, Orange$age, mean)
meanCircumferences

# calculate standard deviation at each age
sdCircumferences <- tapply(Orange$circumference, Orange$age, sd)
sdCircumferences

# get vector of ages
ages <- as.numeric(names(sdCircumferences))
ages

# set up plot
plot(0, xlab="Age (days)", ylab="Mean circumference (mm)", type="n", xlim=xRange, ylim=yRange)
# draw lines for means
lines(ages, meanCircumferences)
# draw error bars as simple lines
segments(ages, meanCircumferences-sdCircumferences, ages, meanCircumferences+sdCircumferences)
# draw points for means
points(ages, meanCircumferences, pch=21, bg="white")

# draw error bars with cross bars instead
plot(0, xlab="Age (days)", ylab="Mean circumference (mm)", type="n", xlim=xRange, ylim=yRange)
lines(ages, meanCircumferences)
# draw error bars using 'arrows' function
arrows(ages, meanCircumferences-sdCircumferences, ages, meanCircumferences+sdCircumferences, angle=90, code=3, length=0.05)
points(ages, meanCircumferences, pch=21, bg="white")



#####  AXES  #####

# set up plot without box around with parameter 'bty="n'
plot(0, xlab="Age (days)", ylab="Mean circumference (mm)", type="n", xlim=xRange, ylim=yRange, bty="n")

# use math and/or symbols in axis labels
# (for more details see 'help(plotmath)', 'example(plotmath)' and 'demo(plotmath)')
yLabel = expression(paste("Mean circumference ", bar(italic(C)), " (mm)"))
plot(0, xlab="Age (days)", ylab=yLabel, type="n", xlim=xRange, ylim=yRange, bty="n")

# set up plot without axes with parameter 'axes=FALSE' 
# alternatively:
# - 'xaxt="n"' for no x axis
# - 'yaxt="n"' for no y axis
plot(0, xlab="Age (days)", ylab=yLabel, type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
# add custom x axis ('side=1' for bottom side of the graph)
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"))
# add custom x axis ('side=2' for left side of the graph)
axis(side=2, at=c(0, 50, 100, 150, 200, 250))
lines(ages, meanCircumferences)
segments(ages, meanCircumferences-sdCircumferences, ages, meanCircumferences+sdCircumferences)
points(ages, meanCircumferences, pch=21, bg="white")



#####  MULTI-PANEL PLOTS  #####

# split the graph area horizontally in 2 "screens"" (1 row and 2 columns)
split.screen(c(1,2))

# select the 1st screen for plotting
screen(1)

plot(0, xlab="Age (days)", ylab=expression(paste("Circumference ", italic(C), " (mm)")), type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"))
axis(side=2, at=c(0, 50, 100, 150, 200, 250))
for (t in 1:5) {
    tree <- subset(Orange, Orange$Tree==t)
    lines(tree$age, tree$circumference, lty=lineTypes[t])
    points(tree$age, tree$circumference, pch=pointTypes[t], bg="white")
}
legend("bottomright", legend=c("Tree 1", "Tree 2", "Tree 3", "Tree 4", "Tree 5"), lty=lineTypes, pch=pointTypes, pt.bg="white", bty="n")

# select the 2nd screen for plotting
screen(2)

plot(0, xlab="Age (days)", ylab=yLabel, type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"))
axis(side=2, at=c(0, 50, 100, 150, 200, 250))
lines(ages, meanCircumferences)
segments(ages, meanCircumferences-sdCircumferences, ages, meanCircumferences+sdCircumferences)
points(ages, meanCircumferences, pch=21, bg="white")

# exit the split-screen mode (close all screens)
close.screen(all = TRUE)


# add panel labels

split.screen(c(1,2))
screen(1)
plot(0, xlab="Age (days)", ylab=expression(paste("Circumference ", italic(C), " (mm)")), type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"))
axis(side=2, at=c(0, 50, 100, 150, 200, 250))
for (t in 1:5) {
    tree <- subset(Orange, Orange$Tree==t)
    lines(tree$age, tree$circumference, lty=lineTypes[t])
    points(tree$age, tree$circumference, pch=pointTypes[t], bg="white")
}
legend("bottomright", legend=c("Tree 1", "Tree 2", "Tree 3", "Tree 4", "Tree 5"), lty=lineTypes, pch=pointTypes, pt.bg="white", bty="n")

# add bold "A" on top left side of plot
mtext(expression(bold(A)), side=3, adj=0, cex=2, line=1)

screen(2)
plot(0, xlab="Age (days)", ylab=yLabel, type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"))
axis(side=2, at=c(0, 50, 100, 150, 200, 250))
lines(ages, meanCircumferences)
segments(ages, meanCircumferences-sdCircumferences, ages, meanCircumferences+sdCircumferences)
points(ages, meanCircumferences, pch=21, bg="white")

# add bold "B" on top left side of plot
mtext(expression(bold(B)), side=3, adj=0, cex=2, line=1)

close.screen(all = TRUE)



#####  GENERAL GRAPHICAL PARAMETERS: MARGINS, TEXT & SYMBOL SIZE, LINE WIDTH, ...  #####

# (for more details see 'help(par)')

pdf("orangetree_growth.pdf", width=11, height=5)
# specify margin sizes ('mar', in lines), increase text size of axis labels ('cex.lab') 
# and text size of axes annotation/tick labels ('cex.axis')
par(mar=c(4.5, 4.5, 2.5, 1.5), cex.lab=1.4, cex.axis=1.2)

split.screen(c(1,2))
screen(1)
plot(0, xlab="Age (days)", ylab=expression(paste("Circumference ", italic(C), " (mm)")), type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
# increase axes line width with 'lwd'
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"), lwd=1.2)
axis(side=2, at=c(0, 50, 100, 150, 200, 250), lwd=1.2)
for (t in 1:5) {
    tree <- subset(Orange, Orange$Tree==t)
    # increase line width with 'lwd'
    lines(tree$age, tree$circumference, lty=lineTypes[t], lwd=1.2)
    # increase point border line width with 'lwd' and point size with 'cex'
    points(tree$age, tree$circumference, pch=pointTypes[t], bg="white", lwd=1.2, cex=1.25)
}
legend("bottomright", legend=c("Tree 1", "Tree 2", "Tree 3", "Tree 4", "Tree 5"), lty=lineTypes, pch=pointTypes, pt.bg="white", bty="n", inset=0.016, lwd=1.2, pt.cex=1.25)
mtext(expression(bold(A)), side=3, adj=0, cex=2, line=1)

screen(2)
plot(0, xlab="Age (days)", ylab=yLabel, type="n", xlim=c(100, 1600), ylim=c(0, 250), axes=FALSE, bty="n")
# increase axes line width with 'lwd'
axis(side=1, at=c(100, 600, 1100, 1600), labels=c("100", "600", "1,100", "1,600"), lwd=1.2)
axis(side=2, at=c(0, 50, 100, 150, 200, 250), lwd=1.2)
# increase line width with 'lwd'
lines(ages, meanCircumferences, lwd=1.2)
# increase line width with 'lwd'
segments(ages, meanCircumferences-sdCircumferences, ages, meanCircumferences+sdCircumferences, lwd=1.2)
# increase point border line width with 'lwd' and point size with 'cex'
points(ages, meanCircumferences, pch=21, bg="white", lwd=1.2, cex=1.25)
mtext(expression(bold(B)), side=3, adj=0, cex=2, line=1)

close.screen(all = TRUE)
dev.off()





###############  ADDITIONAL RESOURCES  ###############

# Quick-R:              http://www.statmethods.net/index.html

# R Graph Gallery:      http://addictedtor.free.fr/graphiques/
# R Graphical Manual:   http://www.oga-lab.net/RGM2

# ggplot2 package:      http://had.co.nz/ggplot2/
# lattice package:      http://cran.r-project.org/web/packages/lattice/index.html
# grid package:         http://www.stat.auckland.ac.nz/~paul/grid/grid.html

# Edward Tufte:         http://www.edwardtufte.com/tufte/
# The Visual Display of Quantitative Information:  http://www.edwardtufte.com/tufte/books_vdqi


