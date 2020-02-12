(* ::Package:: *)

Needs["PolygonPlotMarkers`"]


(* ::Section:: *)
(*Basic examples of use*)


(* ::Text:: *)
(*The complete list of built-in named shapes:*)


(* ::Input:: *)
(*allShapes=PolygonMarker[All]*)
(*Tooltip[Graphics[{FaceForm[Hue@Random[]],EdgeForm[{Black,Thickness[0.003],JoinForm["Miter"]}],PolygonMarker[#,1]},ImageSize->30,PlotRange->1.5,PlotRangePadding->0,ImagePadding->0],#]&/@allShapes*)


(* ::Text:: *)
(*When used in conjunction with such functions as ListPlot, ListLinePlot, ListLogPlot etc. it is highly recommended to include AlignmentPoint -> {0, 0} option for achieving exact positioning of markers on the plot (this option with default ImagePadding and ImageMargins doesn't affect Exporting to PDF, EPS or SVG but affects [ https://mathematica.stackexchange.com/q/137884/280 ] on-screen rendering and Exporting to raster formats):*)


(* ::Input:: *)
(*(*filled marker which picks up the PlotStyle automatically*)fm[name_,size_: 7]:=Graphics[{EdgeForm[],PolygonMarker[name,Offset[size]]},AlignmentPoint->{0,0}];*)
(**)
(*SeedRandom[25] (*for reproducibility*)*)
(*ListPlot[Table[Accumulate@RandomReal[1,10]+i,{i,6}],PlotMarkers->fm/@{"Triangle","LeftTriangle","Diamond","ThreePointedStar","UpTriangleTruncated","Square"},Joined->True,PlotStyle->ColorData[54,"ColorList"]]*)


(* ::Text:: *)
(*Automatic plot legends (Mathematica 10 or higher) often require larger value for LegendMarkerSize option in order to avoid cropping:*)


(* ::Input:: *)
(*(*empty marker which picks up the PlotStyle automatically,see https://mathematica.stackexchange.com/a/158221/280*)em[name_,size_: 7]:=Graphics[{Dynamic@EdgeForm@Directive[CurrentValue["Color"],JoinForm["Round"],AbsoluteThickness[2],Opacity[1]],FaceForm[White],PolygonMarker[name,Offset[size]]},AlignmentPoint->{0,0}]*)
(**)
(*SeedRandom[2]*)
(*ListPlot[Table[Accumulate@RandomReal[1,10]+i,{i,3}],PlotMarkers->em/@{"Triangle","Square","Diamond"},Joined->True,PlotLegends->PointLegend[Automatic,LegendMarkerSize->{40,25}]]*)


(* ::Section:: *)
(*Advanced usage*)


(* ::Text:: *)
(*The third argument of PolygonMarker can be used to specify the coordinate(s) where the shape should be placed:*)


(* ::Input:: *)
(*Graphics[{FaceForm[],EdgeForm[{Black,AbsoluteThickness[1],JoinForm["Miter"]}],PolygonMarker["Circle",Offset[7],RandomReal[{-1,1},{20,2}]],PolygonMarker["ThreePointedStar",Offset[7],RandomReal[{-1,1},{20,2}]],PolygonMarker["FourPointedStar",Offset[7],RandomReal[{-1,1},{20,2}]],PolygonMarker["FivePointedStar",Offset[7],RandomReal[{-1,1},{20,2}]]},AspectRatio->1/2]*)


(* ::Text:: *)
(*The package allows to use arbitrary polygon as a plot marker. Here is an auxiliary function which converts simple glyph into a set of points suitable for PolygonMarker:*)


(* ::Input:: *)
(*pts[l_String]:=First@Cases[ImportString[ExportString[Style[l,FontFamily->"Verdana",FontSize->20],"PDF"],"PDF"],c_FilledCurve:>c[[2,1]],Infinity];*)


(* ::Text:: *)
(*(This conversion is approximate. If precise conversion is needed one can apply one of the methods described in "How can I adaptively simplify a curved shape?" [ https://mathematica.stackexchange.com/q/137937/280 ])*)
(**)
(*An example of use:*)


(* ::Input:: *)
(*ListPlot[ConstantArray[Range[5],7]+Range[0,12,2],PlotStyle->Gray,Joined->True,PlotMarkers->{Graphics[{FaceForm[LightBlue],EdgeForm[Black],PolygonMarker[pts["U"],Scaled[0.05]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[LightBlue],EdgeForm[Black],PolygonMarker[pts["S"],Scaled[0.05]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Red],EdgeForm[Black],PolygonMarker["FivePointedStar",Scaled[0.05]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Yellow],EdgeForm[Black],PolygonMarker["FourPointedStar",Scaled[0.05]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Green],EdgeForm[Black],PolygonMarker["DownTriangle",Scaled[0.05]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Brown],EdgeForm[Black],PolygonMarker["DiagonalSquare",Scaled[0.05]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Blue],EdgeForm[Black],Disk[{0,0},Scaled[0.05/Sqrt[\[Pi]]]]},AlignmentPoint->{0,0}]},PlotRange->{{0,6},{0,18}}]*)


(* ::Text:: *)
(*Here is an example of a plot where plotting symbols significantly overlap, I use here some of the symbols recommended [ https://graphicdesign.stackexchange.com/q/36908/946 ] by William Cleveland [ http://www.stat.purdue.edu/~wsc/ ] in his early works:*)


(* ::Input:: *)
(*SeedRandom[11] (*for reproducibility*)*)
(*ListPlot[RandomReal[{-1,1},{6,20,2}],PlotMarkers->{Graphics[{FaceForm[None],EdgeForm[{Black,Thickness[.008]}],Disk[{0,0},Scaled[0.03/Sqrt[\[Pi]]]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[None],EdgeForm[{Black,Thickness[.008]}],PolygonMarker["UpTriangle",Scaled[0.03]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Black],EdgeForm[None],PolygonMarker["Cross",Scaled[0.03]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Black],EdgeForm[None],PolygonMarker[pts["U"],Scaled[0.03]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Black],EdgeForm[None],PolygonMarker["Sl",Scaled[0.03]]},AlignmentPoint->{0,0}],Graphics[{FaceForm[Black],EdgeForm[None],PolygonMarker[pts["W"],Scaled[0.03]]},AlignmentPoint->{0,0}]},Frame->True,Axes->False,PlotRangePadding->Scaled[.1]]*)


(* ::Section:: *)
(*Additional Examples*)


(* ::Text:: *)
(*\[Bullet] Plot markers where the boundary has the same hue as the body but is darker*)
(*	https://mathematica.stackexchange.com/a/158221/280*)
(*\[Bullet] Perfect vertical alignment of PointLegend markers and their labels*)
(*	https://mathematica.stackexchange.com/a/137758/280*)
(*\[Bullet] Making antisymmetric curvilinear marker "S"*)
(*	https://mathematica.stackexchange.com/a/138348/280*)
(*\[Bullet] How to specify PlotMarkers that scale when graphic is resized? *)
(*	https://mathematica.stackexchange.com/a/145891/280*)
