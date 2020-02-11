INSTALL=$(shell wolframscript -code 'FileNameJoin[{$$UserBaseDirectory,"Applications","PolygonPlotMarkers.m"}]')
ORIGINAL=$(shell wolframscript -code 'FileNameJoin[{Directory[],"PolygonPlotMarkers.m"}]')

install:
	ln -s $(ORIGINAL) $(INSTALL)

uninstall:
	rm $(INSTALL)
