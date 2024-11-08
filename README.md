survival is an R script used to grpah and evaluate the significance of life tables. 
The script is dependent on the R packages survival, survminer, and ggplot2. Be sure these are installed prior to  

survival will require a .csv file with three headers: age, status, and group. 

The 'age' argument contains the value (day) at which an organism's mortality was observed.
The 'status' argument will be either '1' or '0.' 1 indicates that animals day of death was recorded. 0 indicates the animal is still alive or censored from the life table.
The 'group' argument will indicate to which experimental population the individual belonged. 

Copy the pathname of the .csv file into line 12 of the scrpit. This will specif

The LS$group arguments  
