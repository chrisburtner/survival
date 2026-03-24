survival is an R script used to graph and evaluate the significance of life tables. 
The script is dependent on the R packages survival, survminer, and ggplot2.

survival will require a .csv file with three headers: age, status, and group 

The 'age' argument contains the value (day) at which an organism's mortality was observed.
The 'status' argument will be either '1' or '0.' 1 indicates that animals day of death was recorded. 0 indicates the animal is still alive or censored from the life table.
The 'group' argument will indicate to which experimental population the individual belonged. 

1. LS <- read.csv : Copy the pathname of the .csv file into line 12 of the scrpit. The code will use this data to create a mortality curve and evaluate the populations using the log rank test. 

2. LS$group <- factor : c("strain1","strain2") These arguments indicate the experimental arms or groups. Make sure that the group names listed here match exactly the names provided in the "group" column in your .csv file. The code is case-sensitive.

3. fit <- survfit : c("strain1","strain2") Enter the same "group" names (in the same order as #2 above)

4. palette = c("color1","color2") Enter a color for each group. Note that if the order of the colors will follow the order of the "groups" entered in #1 and #2 above.

5. break.x.by : xlim = c(0,30) These arguments define the range of the X axis (default is 0 and 30). If your strains are short or long lived, the high limit can be changed.

6. legend.labs = c("strain1","strain2") : Enter the names of the groups as they will appear in the figure legend. You do not need to use the exact same names as #2 and #3 above, you can supply more verbose names if desired. However, the order will follow the order of the "groups" entered in #1 and #2. I typically like to add the number of animals per group in the figure legend, e.g., "Wild-type (n=30)"
