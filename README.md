# dados-abertos-corpo-de-bombeiros
Dados abertos sobre (estabelecimentos de) corpo de bombeiros no Brasil

## TL;DR
- https://overpass-turbo.eu/s/1MRO
- https://w.wiki/ANuD

## Fontes de dados

### Governo

> @TODO adicionar aqui

### Wikies

#### Wikidata

- https://w.wiki/ANuD

```
# https://www.wikidata.org/wiki/Wikidata%3AWikiProject_Civil_Defense%2FList_of_firefighting_organizations%2FBrazil

# instance_of=fire department (Q6498663); Brazil (Q155)
SELECT DISTINCT ?item ?itemLabel ?countryLabel ?jurisdictionLabel ?operating_areaLabel ?official_website WHERE {
  VALUES ?instances_of {
    wd:Q6498663
  }
  ?item (p:P31/ps:P31/(wdt:P279*)) ?instances_of;
    wdt:P17 ?country;
    p:P17 ?statement1.
  ?statement1 ps:P17 wd:Q155.  # Q155 = Brazil; Change here to select another country
  OPTIONAL { ?item wdt:P1001 ?jurisdiction. }
  OPTIONAL { ?item wdt:P2541 ?operating_area. }
  OPTIONAL { ?item wdt:P856 ?official_website. }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],pt,en,de,fr,ru,es,ja,zh,ar". }
}
ORDER BY (?countryLabel) (?jurisdictionLabel) (?operating_areaLabel)
LIMIT 5000
```

#### OpenStreetMap

- https://overpass-turbo.eu/s/1MRO

```c
[out:json][timeout:25];
{{geocodeArea:Brazil}}->.searchArea;
nwr["amenity"="fire_station"](area.searchArea);
out meta;
```


<!--
## Licenças

### License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, [Emerson Rocha](https://github.com/fititnt)
has waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).
-->