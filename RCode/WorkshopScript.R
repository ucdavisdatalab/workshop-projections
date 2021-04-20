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

# plot the data
plot(ws.polygons$geometry)
plot(ws.streams.3310$geometry, add=TRUE, col="dark blue")
plot(ws.points$geometry, add=TRUE, pch=19, col="orange")


# Raster Data CRS ---------------------------------------------------------

# identify the existing CRS

# define a CRS when it is missing

# tranform/reproject vector data

# plot the data



