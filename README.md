# PolygonPlotMarkers
Polygon-based plot markers for Wolfram Mathematica

The package includes a rich set of carefully implemented shapes intended for flexible creation of publication quality plots.

The description of the package is here: http://mathematica.stackexchange.com/a/85094/280


# Description



 - The basic usage syntax is `PolygonMarker[shape, size]` where `shape` is a name of built-in `shape` or a list of 2D coordinates describing a non-selfintersecting polygon. The `size` can be given as a number or in `Scaled` or `Offset` form.
 - `PolygonMarker[All]` and `PolygonMarker[]` return the list of names of built-in shapes.
 - `PolygonMarker[shape, size]` returns `Polygon` graphics primitive which can be used in `Graphics`.
 - With `Offset` `size` specification the plot marker has fixed size specified in printer's points independent of the size of the plot.
 - `PolygonMarkers` with identical `size` specifications have equal areas (not counting the area taken by the edge of generated `Polygon`).  `PolygonMarker[shape, size]` returns shape with area `size^2` in the internal coordinate system of `Graphics`. `PolygonMarker[shape, Offset[size]]`` returns shape with area `size^2` square printer's points.
 - The centroid of polygon returned by `PolygonMarker[shape, size]` is always placed at `{0, 0}` in the internal coordinate system of `Graphics`.
 - `PolygonMarker[shape, size, positions]` where `positions` is a list of 2D coordinates evaluates to `Translate[PolygonMarker[shape, size], positions]`.  It represents a collection of multiple identical copies of the shape with centroids placed at `positions`.

For basic example uses, see Examples.wl.
