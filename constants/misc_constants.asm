; Boolean checks
FALSE EQU 0
TRUE  EQU 1

; flag manipulation
RESET_FLAG EQU 0
SET_FLAG   EQU 1
CHECK_FLAG EQU 2

SAVE_CHECK_VALUE_1 EQU 99
SAVE_CHECK_VALUE_2 EQU 127

HMENURETURN_SCRIPT EQU %10000000
HMENURETURN_ASM    EQU %11111111

MORN_HOUR EQU 5
DAY_HOUR EQU 10
DUSK_HOUR EQU 19
NITE_HOUR EQU 20

if DEF(NO_RTC)
NO_RTC_SPEEDUP EQU 6
endc

; mail
MAIL_STRUCT_LENGTH EQU $2f
MAILBOX_CAPACITY   EQU 10
MAIL_MSG_LENGTH    EQU $20

SHINY_NUMERATOR         EQU 16 ; 16/65536 = 1/4096
CHARMED_SHINY_NUMERATOR EQU 48 ; 48/65536 = 3/4096

; playergender values
CORY   EQU 0
CORA   EQU 1
PIPPI  EQU 2
RED    EQU 3
LEAF   EQU 4
GOLD   EQU 5
KRIS   EQU 6

MINA_MON_ROUTE_6 			EQU 101
MINA_MON_ROUTE_11 			EQU 102
MINA_MON_RADIANT_FIELD		EQU 103
MINA_MON_ROUTE_29 			EQU 104
MINA_MON_ROUTE_10 			EQU 105


NUM_LOST_GIRLS EQU 7
	
	const_def 1
	const SKATEPARK_RAIL_1
	const SKATEPARK_RAIL_2
	const SKATEPARK_RAIL_3
	const SKATEPARK_RAIL_4
	const SKATEPARK_RAIL_5
	const SKATEPARK_FLOWERBED_1
	const SKATEPARK_FLOWERBED_2
	const SKATEPARK_FLOWERBED_3
	const SKATEPARK_FLOWERBED_4
	const SKATEPARK_FLOWERBED_5
	const SKATEPARK_FLOWERBED_6
	const SKATEPARK_FLOWERBED_7
	const SKATEPARK_FOUNTAIN

; movement
	const_def
	const STEP_SLOW
	const STEP_WALK
	const STEP_BIKE
	const STEP_RUN
	const STEP_LEDGE
	const STEP_ICE
	const STEP_TURN
	const STEP_BACK_LEDGE
	const STEP_WALK_IN_PLACE
	const STEP_SPIN
	const STEP_FAST ; same as STEP_RUN but without doubling animation speed
	const STEP_SURF
	const STEP_SLIDE
	const STEP_SKATEBOARD
	const STEP_SKATEBOARD_PUSH
	const STEP_SLOW_SLIDE

	const_def
	const STEP_TYPE_SLOW
	const STEP_TYPE_NORMAL
	const STEP_TYPE_SUPER_FAST
	const STEP_TYPE_FAST
	const STEP_TYPE_MEDIUM
	const STEP_TYPE_NONE

const_value = 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_YOUNGCUT1         ; 09
	const HAPPINESS_YOUNGCUT2         ; 0a
	const HAPPINESS_YOUNGCUT3         ; 0b
	const HAPPINESS_OLDERCUT1         ; 0c
	const HAPPINESS_OLDERCUT2         ; 0d
	const HAPPINESS_OLDERCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_MASSAGE           ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13
	const HAPPINESS_PHOTOGRAPH        ; 14
	const HAPPINESS_BLESSING          ; 15
