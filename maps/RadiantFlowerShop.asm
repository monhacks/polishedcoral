RadiantFlowerShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 1, RADIANT_TOWNSHIP
	warp_def  7,  3, 1, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 14 ; bg events
	signpost  2,  3, SIGNPOST_JUMPTEXT, RadiantFlowerShopFlowerText
	signpost  2,  6, SIGNPOST_JUMPTEXT, RadiantFlowerShopFlowerText
	signpost  3,  4, SIGNPOST_JUMPTEXT, RadiantFlowerShopFlowerText
	signpost  3,  5, SIGNPOST_JUMPTEXT, RadiantFlowerShopFlowerText
	signpost  6,  0, SIGNPOST_JUMPTEXT, RadiantFlowerShopFlowerText
	signpost  5,  9, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  6,  6, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  6,  7, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  6,  9, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  7,  6, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  7,  7, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  7,  9, SIGNPOST_JUMPTEXT, RadiantFlowerShopSundriesText
	signpost  2,  1, SIGNPOST_JUMPTEXT, RadiantFlowerShopRadioText
	bg_event  1,  2, SIGNPOST_ITEM + TAPE_PLAYER, EVENT_MUSIC_ERIKA

	db 3 ; object events
	person_event SPRITE_DAISY,  3,  0, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantFlowerShopClerk, -1
	person_event SPRITE_POKEFAN_F,  5,  6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantFlowerShopNPC, -1
	hiddentape_event  1,  2, MUSIC_ERIKA, 1, EVENT_MUSIC_ERIKA


RadiantFlowerShopRadioText:
	text "Pop music is"
	line "quietly playing."
	done

RadiantFlowerShopSundriesText:
	text "Bottles of honey,"
	line "teabags, various"
	cont "other sundries."
	done

RadiantFlowerShopFlowerText:
	text "Some flowers."
	
	para "They remind you"
	line "of home…"
	done

RadiantFlowerShopNPC:
	jumptextfaceplayer RadiantFlowerShopNPCText
	
RadiantFlowerShopNPCText:
	text "This little shop"
	line "doesn't take money."
	
	para "They take pollen!"
	
	para "How fun!"
	done

RadiantFlowerShopClerk:
	faceplayer
	opentext
	checkitem POLLEN_POUCH
	iffalse .try_give_pouch
	writetext RadiantFlowerShopClerkPouchFullText1
	yesorno
	iffalse .said_no
	callasm RadiantFlowerShopClerkAsm
.got_pollen_reward_once
	writetext RadiantFlowerShopClerkPouchFullText2
	waitbutton
	closetext
	setevent EVENT_GOT_POLLEN_REWARD
	end
.said_no
	writetext RadiantFlowerShopClerkNoText
	waitbutton
	closetext
	end
.try_give_pouch
	callasm CheckIfPlayerIsCoveredInPollen
	iftrue .give_pouch
	writetext RadiantFlowerShopClerkNotCoveredInPollenText
	waitbutton
	closetext
	end
.give_pouch
	writetext RadiantFlowerShopClerkGivePouchText1
	waitbutton
	verbosegiveitem POLLEN_POUCH
	callasm RadiantFlowerShopClerkClearPollenAsm
	writetext RadiantFlowerShopClerkGivePouchText2
	waitbutton
	closetext
	end
	
RadiantFlowerShopClerkAsm:
	ld a, MARTTYPE_POLLEN
	ld c, a
	ld a, MART_POLLEN
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farjp OpenMartDialog
	
CheckIfPlayerIsCoveredInPollen:
	ld a, [wPollenSteps]
	cp 1
	jr nc, .yes
	ld a, [wPollenSteps + 1]
	cp 25
	jr nc, .yes
	ld a, FALSE
	ld [wScriptVar], a
	ret
.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret
	
RadiantFlowerShopClerkClearPollenAsm:
	xor a
	ld [wPollenSteps], a
	ld [wPollenSteps + 1], a
	ret
	
RadiantFlowerShopClerkNotCoveredInPollenText:
	text "Your clothes are"
	line "so clean…"
	
	para "I thought you"
	line "might be another"
	cont "flower fan, but"
	cont "you aren't covered"
	cont "in pollen…"
	
	para "Come back when you"
	line "learn to love the"
	cont "flowers!"
	done
	
RadiantFlowerShopClerkGivePouchText1:
	text "Wow! <WAIT_S>Your clothes"
	line "are covered in"
	cont "pollen!"
	
	para "You've been walking"
	line "through the"
	cont "flowers, right?"
	
	para "You shouldn't let"
	line "all that pollen"
	cont "go to waste!"
	
	para "Here, <WAIT_S>take this."
	done
	
RadiantFlowerShopClerkGivePouchText2:
	text "That POLLEN POUCH"
	line "will collect the"
	cont "POLLEN PUFFs you"
	cont "kick up while"
	cont "walking through"
	cont "the flowers."
	
	para "It can hold 1000"
	line "POLLEN PUFFs!"
	
	para "Come see me if"
	line "you want to trade"
	cont "your PUFFs for"
	cont "something!"
	done
	
RadiantFlowerShopClerkPouchFullText1:
	text "Have you collected"
	line "some POLLEN PUFFs?"
	
	para "Do you wanna"
	line "trade?"
	done
	
RadiantFlowerShopClerkPouchFullText2:
	text "Come see me if"
	line "you collect more"
	cont "POLLEN PUFFs."
	
	para "We can trade some"
	line "more!"
	done
	
RadiantFlowerShopClerkPouchFullText3:
	text "Which do you"
	line "want?"
	done
	
RadiantFlowerShopClerkNoText:
	text "Maybe next time…"
	done
	
RadiantFlowerShopHandedOverPollenText:
	text "<PLAYER> emptied"
	line "the POLLEN POUCH."
	done