# R-Projections-Workshop
A workshop on understanding and using projections for spatial data in R



# Coordinate Reference System (CRS)

CRS = Datum + Projection + Additional Parameters

*A common analogy employed to teach projections is the orange peel analogy.  If you imagine that the earth is an orange, how you peel it and then flatten the peel is similar to how projections get made.   We will also use it here.*

## Datum

A **Datum** is a model of the shape of the earth.

It has angular units (i.e. degrees) and defines the starting point (i.e. where is (0,0)?) so the angles reference a meaningful spot on the earth.

Common global datums are WGS84 and NAD83.  Datums can also be local, fit to a particular area of the globe, but ill-fitting outside the area of intended use.

*Orange Peel Analogy: a datum is your choice of fruit to use in the orange peel analogy.  Is the earth an orange, a lemon, a lime, a grapefruit?*

![Citrus fruit on display at the market](https://farm3.staticflickr.com/2260/2508805118_500f5bba28_n.jpg)



## Projection

A **Projection** is a mathematical transformation of the angular measurements on a round earth to a flat surface (i.e. paper or a computer screen).

The units associated with a given projection can be linear (feet, meters, etc.) or angular (degrees).

*Orange Peel Analogy: a projeciton is how you peel your orange and then flatten the peel.*

![An orange peeled like a map projection](http://blogs.lincoln.ac.nz/gis/wp-content/uploads/sites/16/2017/03/laranjoide_1.jpg)

Image source: http://blogs.lincoln.ac.nz/gis/2017/03/29/where-on-earth-are-we/


## Additional Parameters

Additional parameters are often necessary to create the full coordinate reference system.  For example, one common additional parameter is a definition of the center of the map.  The number of required additional parameters depends on what is needed by each specific projection.

*Orange Peel Analogy: an additional parameter could include a definition of the location of the stem of the fruit.*


# Projections

Now that we've gotten a better idea of the whole system needed to visualiz geospatial data (CRS = Datum + Projection + Additional Parameters), let's focus a bit on the projection aspect of the equation.



---------------------------------------
# Hands-On Tutorial



---------------------------------------
# Resources Used to Compile this Tutorial:

1. [Rspatial.org](http://rspatial.org/spatial/rst/6-crs.html)
1. [Data Carpentry Intro to Geospatial Data with R](http://www.datacarpentry.org/R-spatial-raster-vector-lesson/)
1. [University of Colorado's Map Projections](https://www.colorado.edu/geography/gcraft/notes/mapproj/mapproj_f.html)
1. [International Institute for Geo-Information Science and Earth Observation (ITC)](http://kartoweb.itc.nl/geometrics/map%20projections/mappro.html)
1. [Carlos Furuti's Projections Page](http://www.progonos.com/furuti/MapProj/Normal/TOC/cartTOC.html)

Map Projection Fun:

1. [xkcd's Map Projections](https://xkcd.com/977/)
1. [Jason Davies' Map Projection Transitions](https://www.jasondavies.com/maps/transition/)
1. [Carlos Furuti's Printable Projections](http://www.progonos.com/furuti/MapProj/Normal/ProjPoly/Foldout/foldout.html) Global projections you can print and assemble


---------------------------------------

## Previous notes:

What is Latitude & Longitude?
= angular measurements from an arbitrary zero

What is a projection?
= making angular measurements on a sphere into a flat surface

WHY projections?
= minimizing distortions in the flattening process

Define Projection vs. Reproject


Let's break stuff! = the hands-on portion of the program

First, we'll look at projections visually.

Open QGIS

You'll need to turn off projection on the fly to see the difference between new layers.
 Options --> CRS tab --> Pick "Don't enable 'on the fly' reprojection' from the Default CRS for New Projects options.

Load a shapefile - suggestion: CA Counties

Reproject your shapefile
- right click --> save as --> pick a new name (put the EPSG code in the name) --> pick a new projection (start with CA Albers NAD 27)

Turn off projection on the fly... not much difference b/n CA Albers NAD 83 & NAD 27

Reproject the shapefile again with another... try UTM Zone 10 N (32610) and Australian Albers (3577)


Ideas:
 * Try making measurements like distance or area

