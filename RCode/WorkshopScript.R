#OBJECTIVE: demonstrate common tasks in R related to projections.
#Author: Michele Tobias, PhD

#workshop materials: https://github.com/MicheleTobias/R-Projections-Workshop



# Set Up ----------------------------------------------------------

# load libraries

#install.packages(c("sf"))

library("sf")

# set working directory
setwd("D:/WorkshopData/PREP_Projections")

# load data
ws.points<-st_read("data/WBDHU8_Points_SF.geojson")
ws.polygons<-st_read("data/WBDHU8_SF.geojson")
ws.streams<-st_read("data/flowlines.shp")


# Vector Data CRS ---------------------------------------------------------

#let's inspect one of the files we just loaded
ws.polygons

# identify the existing CRS
st_crs(ws.points)
st_crs(ws.polygons)
st_crs(ws.streams) #this file doesn't have a CRS defined, but it has a CRS

# define a CRS when it is missing

#   Set the CRS using an EPSG code
ws.streams.3309<-st_set_crs(ws.streams, value=3309) #3309 = California Albers, NAD 27


# tranform/reproject vector data
ws.streams.3310<-st_transform(ws.streams.3309, crs=3310)

#   another option: match the CRS of the polygons data
ws.streams.3310<-st_transform(ws.streams.3309, crs=st_crs(ws.polygons))

# check the CRS again:
st_crs(ws.points)
st_crs(ws.polygons)
st_crs(ws.streams.3310)

#Load up the CA Counties layer to use as reference in a map:

ca.counties<-st_read("data/CA_Counties.geojson")

# plot the data
plot(
  ca.counties$geometry, 
  col="#FFFDEA", 
  border="gray", 
  xlim=st_bbox(ws.polygons)[1:2], 
  ylim=st_bbox(ws.polygons)[3:4], 
  bg="#dff9fd",  
  main = "Perennial Streams",
  sub = "in the San Francisco Bay Watersheds"
  )
plot(ws.streams.3310$geometry, col="#3182bd", lwd=1.75, add=TRUE)
plot(ws.points$geometry, col="black", pch=20, cex=3, add=TRUE)
plot(ws.polygons$geometry, lwd=2, border="grey35", add=TRUE)


# Raster Data CRS ---------------------------------------------------------
install.packages("terra")
library(terra)

#load data
dem<-rast(x="data/DEM_SF.tif")

# identify the existing CRS
crs(dem)

# define a CRS when it is missing
crs(dem)<-"epsg:4269"

# transform/reproject vector data
dem.3310<-project(dem, "epsg:3310")

# plot the data
plot(dem.3310, col=terrain.colors(50), axes = FALSE, legend = FALSE)
plot(ws.streams.3310$geometry, col="#3182bd", lwd=3, add=TRUE)
plot(ws.polygons$geometry, lwd=1, border="grey35", add=TRUE)


