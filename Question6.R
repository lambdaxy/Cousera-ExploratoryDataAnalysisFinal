#Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from 
#motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

library(data.table)
library(ggplot2)

# Load Data
NEI = readRDS("Data/summarySCC_PM25.rds")
SCC = readRDS("Data/Source_Classification_Code.rds")

# Getting on-road data for both counties by year and county
NEIBaltimoreLA = NEI[NEI$fips == "24510" | NEI$fips == "06037",]
NEIBaltimoreLAOnRoad = NEIBaltimoreLA[NEIBaltimoreLA$type == "ON-ROAD",]
dtNEIBaltimoreLAOnRoad <- data.table(NEIBaltimoreLAOnRoad)
emissionsByYear = dtNEIBaltimoreLAOnRoad[,sum(Emissions), by=list(year,fips)]
emissionsByYear$fips[emissionsByYear$fips == "06037"] = "Los Angeles"
emissionsByYear$fips[emissionsByYear$fips == "24510"] = "Baltimore"

# Plot
qplot(x = year,
      y = V1,
      data = emissionsByYear,
      geom = c("point", "path"),
      facets = . ~fips,
      ylab = "Motor Vehicles PM 2.5 Emissions",
      main = "Motor Vehicles PM 2.5 Emissions over the years for Baltimore and Los Angeles")
ggsave("Question6Plot.png")
