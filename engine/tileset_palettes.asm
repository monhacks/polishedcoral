LoadBlindingFlashPalette:: ; 49409
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, BlindingFlashPalette
	ld bc, 1 palettes
	jp FarCopyWRAM
; 49418

LoadRegularSignPalette::
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, RegularSignPalette
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
	
LoadRegularTextboxPalette::
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, RegularTextboxPalette
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

BlindingFlashPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc
; 49420

RegularSignPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 16
	RGB 31, 31, 16
	RGB 14, 09, 00
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc

RegularTextboxPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc

LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]
	cp TILESET_STARGLOW_CAVERN
	jr z, .starglow_cavern
	cp TILESET_GROVE
	jp z, .grove
	cp TILESET_MOUNTAIN
	jp z, .mountain
	cp TILESET_JUNGLE
	jp z, .jungle
	cp TILESET_SNOW
	jp z, .checktent
	cp TILESET_RANCH
	jp z, .ranch
	cp TILESET_HAUNTED
	jp z, .spookhouse
	cp TILESET_HAUNTED_TV
	jp z, .spookhousetv
	cp TILESET_TRAIN
	jp z, .train
	cp TILESET_LUSTER
	jp z, .luster
	jp .do_nothing
	
.checktent
	ld a, [wMapNumber]
	cp MAP_ROUTE_10_EAST
	jp z, .snowtent
	jp .snow
	
.starglow_cavern
	ld hl, StarglowCavernPalette
	jp LoadEightBGPalettes
	
.grove
	ld hl, OutsideGrovePalette
	jp LoadEightTimeOfDayBGPalettes
	
.mountain
	ld hl, OutsideMountainPalette
	jp LoadEightTimeOfDayBGPalettes
	
.jungle
	ld hl, OutsideJunglePalette
	jp LoadEightTimeOfDayBGPalettes
	
.snow
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .snowstorm
	ld hl, OutsideSnowPalette
	jp LoadEightTimeOfDayBGPalettes

.snowstorm
	ld hl, OutsideSnowStormPalette
	jp LoadEightTimeOfDayBGPalettes
	
.snowtent
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .snowstormtent
	ld hl, OutsideSnowTentPalette
	jp LoadEightTimeOfDayBGPalettes
	
.snowstormtent
	ld hl, OutsideSnowStormTentPalette
	jp LoadEightTimeOfDayBGPalettes
	
.ranch
	ld hl, OutsideRanchPalette
	jp LoadEightTimeOfDayBGPalettes

.spookhouse
	ld hl, SpookhousePalette
	jp LoadEightBGPalettes
	
.spookhousetv
	ld hl, SpookhouseTVPalette
	jp LoadEightBGPalettes
	
.train
	ld hl, TrainPalette
	jp LoadEightBGPalettes
	
.luster
	ld a, [wMapNumber]
	cp MAP_LUSTER_CITY_BUSINESS
	jp z, .lusterbusiness
	ld hl, OutsideLusterPalette
	jp LoadEightTimeOfDayBGPalettes
	
.lusterbusiness
	ld hl, OutsideLusterBusinessPalette
	jp LoadEightTimeOfDayBGPalettes
	
.do_nothing
	and a
	ret
	
LoadEightBGPalettes: ; 494f2
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
	
LoadEightTimeOfDayBGPalettes:
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
	
MartBluePalette:
if !DEF(MONOCHROME)
	RGB 20, 27, 28
	RGB 06, 22, 25
	RGB 04, 17, 19
	RGB 07, 07, 07
else
	MONOCHROME_RGB_FOUR
endc

LinkTrade_Layout_FillBox: ; 49336
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 49346

InitLinkTradePalMap: ; 49856
	hlcoord 0, 0, wAttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, wAttrMap
	ldcoord_a 0, 14, wAttrMap
	hlcoord 2, 0, wAttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTrade_Layout_FillBox
	hlcoord 2, 8, wAttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTrade_Layout_FillBox
	hlcoord 0, 16, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, wAttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LoadLinkTradePalette: ; 49811
	ret


LoadSpecialMapOBPalette:
	ret

CavePalette:
INCLUDE "maps/palettes/bgpals/cave.pal"

StarglowCavernPalette:
INCLUDE "maps/palettes/bgpals/starglow_cavern.pal"

SpookhousePalette:
INCLUDE "maps/palettes/bgpals/spookhouse.pal"

SpookhouseTVPalette:
INCLUDE "maps/palettes/bgpals/spookhousetv.pal"

TrainPalette:
INCLUDE "maps/palettes/bgpals/train.pal"

OutsideGrovePalette:
INCLUDE "maps/palettes/bgpals/bggrove.pal"

OutsideMountainPalette:
INCLUDE "maps/palettes/bgpals/bgmountain.pal"

OutsideJunglePalette:
INCLUDE "maps/palettes/bgpals/bgjungle.pal"

OutsideSnowPalette:
INCLUDE "maps/palettes/bgpals/bgsnow.pal"

OutsideSnowTentPalette:
INCLUDE "maps/palettes/bgpals/bgsnowtent.pal"

OutsideSnowStormTentPalette:
OutsideSnowStormPalette:
INCLUDE "maps/palettes/bgpals/bgsnowstorm.pal"

OutsideRanchPalette:
INCLUDE "maps/palettes/bgpals/bgranch.pal"

OutsideLusterPalette:
INCLUDE "maps/palettes/bgpals/bgluster.pal"

OutsideLusterBusinessPalette:
INCLUDE "maps/palettes/bgpals/bglusterbusiness.pal"
