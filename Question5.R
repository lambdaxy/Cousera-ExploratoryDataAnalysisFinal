# Question 5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(data.table)
library(ggplot2)

# Load Data
NEI = readRDS("Data/summarySCC_PM25.rds")
SCC = readRDS("Data/Source_Classification_Code.rds")

# Getting motor vehicle data by year and type
NEIBaltimore = NEI[NEI$fips == "24510",]
NEIBaltimoreOnRoad = NEIBaltimore[NEIBaltimore$type == "ON-ROAD",]
dtNEIBaltimoreOnRoad <- data.table(NEIBaltimoreOnRoad)
emissionsByYear = dtNEIBaltimoreOnRoad[,sum(Emissions), by=list(year,type)]

# Plot
qplot(x = year,
      y = V1,
      data = emissionsByYear,
      geom = c("point", "path"),
      ylab = "Motor Vehicles PM 2.5 Emissions",
      main = "Motor Vehicles PM 2.5 Emissions over the years")
ggsave("Question5Plot.png")
