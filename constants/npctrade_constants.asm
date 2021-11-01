; see data/events/npc_trades.asm:NPCTrades
	const_def
	const TRADE_WITH_JAKE_FOR_HERACROSS  ; 0
	const TRADE_WITH_PAUL_FOR_EXEGGCUTE  ; 1
	const TRADE_WITH_ALICE_FOR_GLIGAR 	 ; 2
	const TRADE_WITH_EMY_FOR_SCRAGGY     ; 3
	const TRADE_WITH_TABBY_FOR_HOUNDOUR  ; 4
	const TRADE_WITH_KIM_FOR_NUMEL     	 ; 5
	const TRADE_WITH_JACQUES_FOR_GRIMER  ; 6
	const TRADE_WITH_HARI_FOR_DODUO      ; 7

; Trade struct
TRADE_DIALOG      EQU 0
TRADE_GIVEMON     EQU 1
TRADE_GETMON      EQU 2
TRADE_NICK        EQU 3
TRADE_DVS         EQU 14
TRADE_PERSONALITY EQU 17
TRADE_BALL        EQU 19
TRADE_ITEM        EQU 20
TRADE_OT_ID       EQU 22
TRADE_OT_NAME     EQU 23

; Trade dialogs
TRADE_INTRO    EQU 0
TRADE_CANCEL   EQU 1
TRADE_WRONG    EQU 2
TRADE_COMPLETE EQU 3
TRADE_AFTER    EQU 4
