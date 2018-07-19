# MappingSymbology
Standardised mapping symbols for use with web mapping.

File names take on the  conventions
 * PNG files are saved only into the PNG directory
 * Vector files are only in SVG format
 * SVG files are saved only into the SVG directory
 * SVG naming convention is as follows:
   * [identifier]-[colourname].svg
 * PNG naming convention is as follows
   * [identifier]-[colourname]-[sizeinpixels].svg

![Automated External Defibrillator](https://raw.githubusercontent.com/MichaelLindsayCOGC/MappingSymbology/master/SVG/defibrillator-single.svg?sanitize=true)


# File creation notes
 * SVG created using one paticular corporate colour reflected in the filename (e.g. watermelon) prior to running the powershell script
 * Link to raw SVG file in MarkDown and ArcGIS Online must be ammended with "?sanitize=true" to return the correct MIMETYPE
 * PNG files may have to be in folders as there are many created. (1x design 4x SVG for colours 3x sizes (currently))

# TODO
 * Script MarkDown and HTML generation of files for gallery view (both within GitHub and internally)