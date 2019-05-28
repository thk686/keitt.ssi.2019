#!/bin/sh

# run in NC data set location

g.region rast=aspect
r.out.arc in=aspect   out=aspect.grd dp=4 
g.region rast=basin_50K
r.out.arc in=basin_50K  out=basin_50K.grd  
g.region rast=cfactorbare_1m
r.out.arc in=cfactorbare_1m out=cfactorbare_1m.grd     dp=4
r.out.arc in=cfactorgrow_1m    out=cfactorgrow_1m.grd  dp=4
r.out.arc in=elev_lid792_1m   out=elev_lid792_1m.grd   dp=4
g.region rast=elev_ned_30m
r.out.arc in=elev_ned_30m out=elev_ned_30m.grd dp=4
r.out.arc in=elev_srtm_30m   out=elev_srtm_30m.grd dp=4
g.region rast=elevation
r.out.arc in=elevation      out=elevation.grd dp=4     
r.out.arc in=elevation_shade  out=elevation_shade.grd dp=4
g.region rast=el_D782_6m
r.out.arc in=el_D782_6m   out=elevlid_D782_6.grd  dp=4
g.region rast=el_D783_6m
r.out.arc in=el_D783_6m   out=elevlid_D783_6m.grd  dp=4
g.region rast=el_D792_6m
r.out.arc in=el_D792_6m   out=elevlid_D792_6m.grd  dp=4
g.region rast=el_D793_6m
r.out.arc in=el_D793_6m   out=elevlid_D793_6m.grd  dp=4
g.region rast=elev_state_500m
r.out.arc in=elev_state_500m  out=elev_state_500m.grd  dp=4
g.region rast=facility
r.out.arc in=facility          out=facility.grd  
g.region rast=geology_30m
r.out.arc in=geology_30m       out=geology_30m.grd  
g.region rast=lakes
r.out.arc in=lakes        out=lakes.grd 
g.region rast=landclass96
r.out.arc in=landclass96       out=landclass96.grd  
g.region rast=landcover_1m
r.out.arc in=landcover_1m      out=landcover_1m.grd  
g.region rast=landuse96_28m
r.out.arc in=landuse96_28m     out=landuse96_28m.grd   
g.region rast=lsat7_2002_10 
r.out.arc in=lsat7_2002_10 out=lsat7_2002_10.grd  
r.out.arc in=lsat7_2002_20   out=lsat7_2002_20.grd  
r.out.arc in=lsat7_2002_30   out=lsat7_2002_30.grd  
r.out.arc in=lsat7_2002_40   out=lsat7_2002_40.grd  
r.out.arc in=lsat7_2002_50     out=lsat7_2002_50.grd  
r.out.arc in=lsat7_2002_61    out=lsat7_2002_61.grd    
r.out.arc in=lsat7_2002_62   out=lsat7_2002_62.grd    
r.out.arc in=lsat7_2002_70    out=lsat7_2002_70.grd  
r.out.arc in=lsat7_2002_80     out=lsat7_2002_80.grd 
g.region rast=ortho_2001_t792_1m
r.out.arc in=ortho_2001_t792_1m  out=ortho_2001_t792_1m.grd 
g.region rast=roadsmajor
r.out.arc in=roadsmajor out=roadsmajor.grd 
g.region rast=slope
r.out.arc in=slope   out=slope.grd            dp=4
g.region rast=soilsID
r.out.arc in=soilsID  out=soilsID.grd dp=4
g.region rast=soils_Kfactor
r.out.arc in=soils_Kfactor  out=soils_Kfactor.grd     dp=4
g.region rast=streams_derived
r.out.arc in=streams_derived out=streams_derived.grd    
g.region rast=towns
r.out.arc in=towns out=towns.grd 
g.region rast=urban
r.out.arc in=urban out=urban.grd 
g.region rast=zipcodes
r.out.arc in=zipcodes out=zipcodes.grd  
r.out.arc in=zipcodes_dbl out=zipcodes_dbl.grd dp=4

for i in *.grd ; do g.proj -wf > `basename $i .grd`.prj ; done
for i in *.grd ; do  gdal_translate $i `basename $i .grd`.tif ; done
rm -f *.grd *.prj
