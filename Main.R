library(data.table)

# Load Data
NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

# Question 1
dtNEI <- data.table(NEI)
emissionsByYear = dtNEI[,sum(Emissions), by=year]
plot(x = emissionsByYear$year, 
     y = emissionsByYear$V1, 
     type = "b", 
     xlab = "Year", 
     ylab = "Emissions of PM 2.5",
     main = "Total Emissions of PM2.5 by Year")
dev.copy(png,'plot1.png')
dev.off()

# Question 2
