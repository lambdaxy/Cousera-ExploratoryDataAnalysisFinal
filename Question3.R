# Question 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to 
#make a plot answer this question.

library(data.table)
library(ggplot2)

# Load Data
NEI = readRDS("Data/summarySCC_PM25.rds")
SCC = readRDS("Data/Source_Classification_Code.rds")

# Getting Baltimore Data by year and type
NEIBaltimore = NEI[NEI$fips == "24510",]
dtNEIBaltimore <- data.table(NEIBaltimore)
emissionsByYear = dtNEIBaltimore[,sum(Emissions), by=list(year,type)]

# Plot
qplot(x = year, 
      y = V1, 
      data = emissionsByYear,
      geom = c("point", "path"),
      facets = .~type,
      ylab = "Total PM 2.5 Emissions",
      main = "Total PM 2.5 Emissions by type over the years in Baltimore")
ggsave("Question3Plot.png")