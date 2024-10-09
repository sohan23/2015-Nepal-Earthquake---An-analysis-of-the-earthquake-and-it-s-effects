#!/usr/bin/csh

gmt gmtset PS_MEDIA = letter
gmt gmtset PS_PAGE_ORIENTATION = portrait
gmt gmtset PROJ_LENGTH_UNIT = inch

# Eastings
gmt psbasemap -JX6/1.5 -R2011/2021/-0.4/-0.35 -Ba2:years:/a0.05:meters::."SNDL eastings":WeSn -X1.25 -Y8 -K >! plot_SNDL.ps

gmt psxy SNDL.te -Sc0.01 -Gblue -J -R -O -K >> plot_SNDL.ps

# Northings
gmt psbasemap -JX6/1.5 -R2011/2021/0.6/0.9 -Ba2:years:/a0.05:meters::."SNDL northings":WeSn -X0 -Y-3 -O -K >> plot_SNDL.ps

gmt psxy SNDL.tn -Sc0.01 -Gblue -J -R -O -K >> plot_SNDL.ps

# Verticals
gmt psbasemap -JX6/1.5  -R2011/2021/0.60/0.9 -Ba2:years:/a0.05:meters::."SNDL verticals":WeSn -X0 -Y-0 -O -K >> plot_ENV.ps

gmt psxy SNDL.tv -Sc0.01 -Gblue -J -R -O -K >> plot_ENV.ps

echo 0 0 | gmt psxy -J -R -O >> plot_SNDL.ps
gv plot_SNDL.ps &
