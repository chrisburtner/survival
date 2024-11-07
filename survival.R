#For each analysis, a comma separated value file (.csv) must be created in excel. The header of the table contains three variables: age (this is the age at which a time-to-event was observed); status ('1' if observed; '0' if censored); and group (this is the name of the treatment group). 
#Before analysis, the package 'Survival' must be installed. Once this is done on your computer, you will not have to repeat this step.
#install.packages("survival")
#install.packages("survminer")
#install.packages("ggplot2")

#The libraries must be loaded into R
library(survival)
library(survminer)

#Enter the pathname of the .csv file between the single quotes. On Mac, right-click the file, hold down the 'Options' key, and select 'Copy as Pathname.' On Windows, hold down shift and right-click and select 'Copy as Path
' 
LS <- read.csv(file= '/Users/christopherburtner/Desktop/WLS 33.csv')

#This orders the data by the group variable. Choose which group(s) you wish to plot and enter it in desired order between each "" below (e.g., you may wish to have control plotted first, followed by treatment A and then treatment B). Note that the same order will be applied to palette = c("", "") and legend.labs = c("", "") below.  
LS$group <- factor(LS$group, levels = c("EV", "M05D62"))

#Enter groups again in "" below. This should be identical to the order above.  
fit <- survfit(Surv(age, status == 1) ~ group, data = subset(LS, group %in% c("EV","M05D62")))

#Run lines 20-30. You can change plot parameters including color ("palette"), line size, fonts, x- and y-axis scale, and legend labels. 
ggsurvplot(fit, data = LS, 

#Enter the title of your graph in quotes. Default is no title, so leave empty quotes.
	title = "",

#Line size specified here. 
	size = 2,

#Specify line color between quotes. For help, type "hex color picker" in search bar for a tool to choose colors or enter basic text (eg., "blue").
	palette = c("black", "orange"),

#X-axis format (xlim allows you to change the X axis values, the ggplot defaults tend to cut off the tail end of data)
	break.x.by = 2, xlab = "Age (Days)", font.x = c(16, "bold"), xlim = c(0,30),

#Y-axis format
	break.y.by = 0.2, ylab="Fraction Surviving", font.y = c(16, "bold"),

#Tick label format
	font.tickslab = c(14, "bold"),

#Adds log-rank pvalue if TRUE; median lines are added with h = horizontal and v = vertical
	pval = TRUE,
	surv.median.line = "hv",

#Specify the legend labels and label font
	legend.labs = c("EV (20)", "M05D62 (20)"), font.legendlabs = c(16, "bold"),

#Legend title. Default is no title, so leave empty quotes.
	legend.title = "",

#Specify plot theme. Do not modify by default.
	ggtheme = theme_classic () + theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 18)),
)

#To print the median life span of groups
print(fit)
 
