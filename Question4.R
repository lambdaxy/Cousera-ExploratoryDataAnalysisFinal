# Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(data.table)
library(ggplot2)

# Load Data
NEI = readRDS("Data/summarySCC_PM25.rds")
SCC = readRDS("Data/Source_Classification_Code.rds")

# Getting Coal combustion related data
combustion.coal.sources = SCC[grepl("Fuel Comb.*Coal", SCC$EI.Sector),]$SCC
emissions = NEI[(NEI$SCC %in% combustion.coal.sources), ]
dtEmissions = data.table(emissions)
emissionsByYear = dtEmissions[,sum(Emissions), by=list(year)]

# Plot
qplot(x = year,
      y = V1,
      data = emissionsByYear,
      geom = c("point", "path"),
      ylab = "Coal Combustion PM 2.5 Emissions",
      main = "Coal Combustion PM 2.5 Emissions over the years")
ggsave("Question4Plot.png")
