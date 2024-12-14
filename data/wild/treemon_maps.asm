treemon_map: macro
	map_id \1
	db  \2 ; treemon set
endm

TreeMonMaps:
	treemon_map SUNSET_BAY, TREEMONS_GLINT
	treemon_map SUNSET_CAPE, TREEMONS_GLINT
	treemon_map ROUTE_1, TREEMONS_GLINT
	treemon_map DAYBREAK_VILLAGE, TREEMONS_GLINT
	treemon_map ROUTE_2, TREEMONS_GLINT
	treemon_map GLINT_CITY, TREEMONS_GLINT
	treemon_map GLINT_GROVE_ENTRANCE, TREEMONS_GROVE
	treemon_map GLINT_GROVE, TREEMONS_GROVE
	treemon_map GLINT_GROVE_EAST, TREEMONS_GROVE
	treemon_map ROUTE_3, TREEMONS_GLINT
	treemon_map ROUTE_3_EAST, TREEMONS_STARGLOW
	treemon_map STARGLOW_VALLEY, TREEMONS_STARGLOW
	treemon_map ROUTE_4, TREEMONS_STARGLOW
	treemon_map HUNTERS_THICKET, TREEMONS_STARGLOW
	treemon_map ROUTE_5, TREEMONS_STARGLOW
	treemon_map ROUTE_5_DEEP, TREEMONS_STARGLOW
	treemon_map ROUTE_6, TREEMONS_STARGLOW
	treemon_map ROUTE_7, TREEMONS_STARGLOW
	treemon_map LAKE_ONWA, TREEMONS_STARGLOW
	treemon_map MT_ONWA_CLIFF, TREEMONS_MOUNTAINTOP
	treemon_map MT_ONWA_LOWER_CLIFF, TREEMONS_MOUNTAINTOP
	treemon_map SUNBEAM_ISLAND, TREEMONS_SUNBEAM
	treemon_map SUNBEAM_BEACH, TREEMONS_SUNBEAM
	treemon_map SUNBEAM_RESERVE, TREEMONS_SUNBEAM
	treemon_map SUNBEAM_JUNGLE, TREEMONS_SUNBEAM
	treemon_map SUNBEAM_JUNGLE_DEEP, TREEMONS_SUNBEAM
	treemon_map ROUTE_8, TREEMONS_STARGLOW
	treemon_map EVENTIDE_FOREST, TREEMONS_EVENTIDE
	treemon_map EVENTIDE_VILLAGE, TREEMONS_EVENTIDE
	treemon_map ROUTE_9, TREEMONS_EVENTIDE
	treemon_map ROUTE_11, TREEMONS_EVENTIDE
	treemon_map FLICKER_STATION, TREEMONS_EVENTIDE
	treemon_map ROUTE_10, TREEMONS_TWINKLE
	treemon_map ROUTE_10_EAST, TREEMONS_TWINKLE
	treemon_map TWINKLE_TOWN, TREEMONS_TWINKLE
	treemon_map TWINKLE_GYM_RED_ROOM, TREEMONS_TWINKLE
	treemon_map LUSTER_CITY_RESIDENTIAL, TREEMONS_LUSTER
	treemon_map ROUTE_12, TREEMONS_LUSTER
	treemon_map ONWA_INTL_AIRPORT, TREEMONS_LUSTER
	treemon_map ROUTE_15, TREEMONS_SUNBEAM
	treemon_map ROUTE_6_SOUTH, TREEMONS_SUNBEAM
	treemon_map SHIMMER_CITY, TREEMONS_SHIMMER
	treemon_map ROUTE_19, TREEMONS_SHIMMER
	treemon_map ROUTE_20, TREEMONS_SHIMMER
	treemon_map ROUTE_21, TREEMONS_SHIMMER
	treemon_map DUSK_TURNPIKE, TREEMONS_SHIMMER
	treemon_map RADIANT_TOWNSHIP, TREEMONS_RADIANT
	treemon_map RADIANT_FIELD, TREEMONS_RADIANT
	treemon_map CROSSROADS, TREEMONS_SHIMMER
	treemon_map ROUTE_23, TREEMONS_KOMORE
	treemon_map ROUTE_24_NORTH, TREEMONS_KOMORE
	treemon_map ROUTE_24_SOUTH, TREEMONS_KOMORE
	treemon_map ROUTE_25, TREEMONS_KOMORE
	treemon_map ROUTE_26, TREEMONS_KOMORE
	treemon_map ROUTE_27, TREEMONS_BRIGHT
	treemon_map BRIGHTBURG, TREEMONS_BRIGHT
	db -1

RockMonMaps:
	treemon_map SUNSET_BAY, TREEMONS_ROCK
	db -1
	
PetalMonMaps:
	treemon_map GLINT_GROVE, TREEMONS_PETAL
	db -1
