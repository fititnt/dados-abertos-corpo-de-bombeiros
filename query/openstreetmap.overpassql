[out:json][timeout:25];
{{geocodeArea:Brazil}}->.searchArea;
nwr["amenity"="fire_station"](area.searchArea);
out meta;