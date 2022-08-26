data<-read.csv("practical_data.csv")
head(data)

model_1<-lm(data$Qualifications~data$Unemployed)
plot(data$Unemployed, data$Qualifications, xlab="%unemployed",
     ylab="%with a qualification") +abline(model_1)
summary(model_1)
install.packages("rgdal")
install.packages("rgeos")
library(rgdal)
library (rgeos)
output<- readOGR(".", "Camden_oa11")
output<- readOGR(".", "Camden_oa11")

census<- merge(output, data, by.x="OA11CD", by.y="QA")
proj4string(census)<-CRS("+init=EPSG:27700")
install.packages("tmap")
install.packages("leaflet")
library(tmap)
library(leaflet)
qtm(census, fill="Qualifications")

library(RColorBrewer)
display.brewer.all()
tm_shape(census)+ tm_fill("Qualifications",palette="-Greens")

names(census)
tm_shape(census)+tm_fill("Qualifications")