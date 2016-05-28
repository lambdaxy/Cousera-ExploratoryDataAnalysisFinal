# Question 2

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

library(data.table)

# Load Data
NEI = readRDS("Data/summarySCC_PM25.rds")
SCC = readRDS("Data/Source_Classification_Code.rds")

# Getting total missions by year for Baltimore City
dtNEI = data.table(NEI[NEI$fips == "24510",])
emissionsByYear = dtNEI[,sum(Emissions), by=year]

# Plot
plot(x = emissionsByYear$year, 
     y = emissionsByYear$V1, 
     type = "b", 
     xlab = "Year", 
     ylab = "Emissions of PM 2.5",
     main = "Total Emissions of PM2.5 by Year in Baltimore City")
dev.copy(png,'Question2Plot.png')
dev.off()