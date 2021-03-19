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

# tranform/reproject vector data

# plot the data



# Raster Data CRS ---------------------------------------------------------

# identify the existing CRS

# define a CRS when it is missing

# tranform/reproject vector data

# plot the data



