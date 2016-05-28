# Question 1

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

library(data.table)

# Load Data
NEI = readRDS("Data/summarySCC_PM25.rds")
SCC = readRDS("Data/Source_Classification_Code.rds")

# Getting total missions by year
dtNEI <- data.table(NEI)
emissionsByYear = dtNEI[,sum(Emissions), by=year]

# Plot
plot(x = emissionsByYear$year, 
     y = emissionsByYear$V1, 
     type = "b", 
     xlab = "Year", 
     ylab = "Emissions of PM 2.5",
     main = "Total Emissions of PM2.5 by Year")
dev.copy(png,'Question1Plot.png')
dev.off()