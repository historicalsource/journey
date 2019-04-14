"INTRO for
		      		JOURNEY
	(c) Copyright 1988, 1989 by Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT LAVOS>

<GLOBAL XVWRD 0>
<GLOBAL XHWRD 0>
<GLOBAL XFWRD 0>

<ROUTINE CHECK-RESTORE ()
	 <REPEAT ()
	    <TELL "Do you want to restore a saved game? ">
	    <COND (<EQUAL? <INPUT 1> !\Y !\y>
		   <CRLF>
		   <WINATTR ,TEXT-WINDOW *13*>
		   ;"Disable scripting in 0 for a moment, to fool
		     SCREEN-NEEDS-INIT"
		   <RESTORE>
		   <TELL CR "Restore failed." CR>)
		  (T <RETURN>)>>>

<ROUTINE GO () ;"NOTE: this routine CANNOT have any local variables" 
	 <CHECK-RESTORE>
	 <SETG XFWRD <LOWCORE FWRD>>
	 <SETG XVWRD <LOWCORE VWRD>>
	 <SETG XHWRD <LOWCORE HWRD>>
	 <SETG INTERPRETER <LOWCORE INTID>>
	 <COND (<NOT <BTST <LOWCORE ZVERSION> 4>>
		;"For now..."
		<SETG H-BOLD ,H-INVERSE>)>
	 <SETG HERE ,START-LOC>
	 <SETG LEADER <GET ,PARTY 1>>
	 <SETG SUBGROUP-MODE T> ;"No character commands initially"
	 <TURN-OFF-CURSOR>
	 <INIT-SCREEN>
	 <NEXT-DAY>
	 <INTRO>
	 <SETG SCENE-OBJECT ,DEFAULT-SCENE>
	 <SCENE ,DEFAULT-SCENE>
	 <MODE ,TRAVEL-MODE T>
	 <PRINT-CHARACTER-COMMANDS>
	 <NEW-DEFAULT 1 -1>
	 <SETG ACTION ,BUSY-COMMAND>
	 <COND (<BAND <LOWCORE FLAGS> 1>
		<SETG SCRIPTING-FLAG T>)>
	 <QUEUE ,I-INIT-RANDOM-STUFF 0>
	 <PARTY-INPUT>	 
	 <AGAIN>>

<OBJECT I-INIT-RANDOM-STUFF
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <QSET? ,ESSENCES ,TRIED>>
			 <INIT-SPELLS>
			 <INIT-RUNES>)>>)>

<ROUTINE INIT-SPELLS ("AUX" (TPC 7) FP F NUM OFF)
	 <PUTP ,SALT ,P?COLOR ,TAG-WHITE-POWDER>
	 <PUTP ,TAG-WHITE-POWDER ,P?ESSENCE ,SALT>
	 <SET FP <FIRST? ,TAG-POWDERS>>
	 <REPEAT ()
		 <COND (<NOT .FP> <RETURN>)
		       (T
			<SET NUM <RANDOM .TPC>>
			<SET F <FIRST? ,ESSENCES>>
			<SET OFF 1>
			<REPEAT ()
				<COND (<EQUAL? .OFF .NUM>
                                       <PUTP .FP ,P?ESSENCE .F>
				       <PUTP .F ,P?COLOR .FP>
				       <REMOVE .F>
				       <RETURN>)
				      (T
				       <SET OFF <+ .OFF 1>>
				       <SET F <NEXT? .F>>)>>
			<SET TPC <- .TPC 1>>
			<SET FP <NEXT? .FP>>)>>
	 <MOVE ,ESSENCE-EARTH ,ESSENCES>
	 <MOVE ,ESSENCE-AIR ,ESSENCES>
	 <MOVE ,TAG-WHITE-POWDER ,TAG-POWDERS>>

<GLOBAL INTRO-PICS <LTABLE 0 G-FORK G-CANYON>>
<ROUTINE I-RTRUE () <RTRUE>>

<ROUTINE INTRO  ("AUX" CHR F)
	 ;"Get randomness going..."
	 <SET CHR <INPUT 1 1 ,I-RTRUE>>
	 <GRAPHIC <PICK-ONE ,INTRO-PICS>>
	 ;<TELL "Font width: " N ,CHRH CR
	       "Command width: " N ,COMMAND-WIDTH CR
	       "  in pix: " N ,COMMAND-WIDTH-PIX CR
	       "Name width: " N ,NAME-WIDTH CR
	       "  in pix: " N ,NAME-WIDTH-PIX CR
	       "Party commands: " N , PARTY-COMMAND-COLUMN CR
	       "Name column: " N ,NAME-COLUMN CR
	       "Chr commands: " N ,CHR-COMMAND-COLUMN CR
	       "Command objects: " N ,COMMAND-OBJECT-COLUMN CR>
	 ;<DIROUT 3 ,CENTER-TABLE>
	 ;<TELL "Chg Name">
	 ;<DIROUT -3>
	 ;<TELL "Chg Name: " N <LOWCORE TWID>>
	 ;<INPUT 1>
	 ;<COND (<EQUAL? ,INTERPRETER ,INT-2C ,INT-2E>
		<GRAPHIC ,G-FOREST>
		;"Something in segment 0")
	       (T
		<GRAPHIC <PICK-ONE ,INTRO-PICS>>)>
	 <COND (,FONT3-FLAG <SET F <CHANGE-FONT 4>>)>
	 <TELL CR ;CR>
	 <COND (<NOT <EQUAL? ,H-BOLD ,H-INVERSE>>
		<HLIGHT ,H-BOLD>)>
	 <WCENTER "JOURNEY">
	 <HLIGHT ,H-NORMAL>
	 <TELL CR>
	 <WCENTER "Part One of">
	 <TELL CR>
	 <WCENTER "The Golden Age Trilogy">
	 <TELL CR CR>
	 <WCENTER "Created by Marc Blank">
	 <COND (<APPLE2?>
		;"Added 5/24 for fencepost on initial screen..."
		<TELL CR>)
	       (T
		<TELL CR CR>)>
	 <COND (<APPLE2?>
		<WCENTER "Illustrations by">
		<TELL CR>
		<WCENTER "Donald Langosy">
		<TELL CR CR>
		<WCENTER "Copyright (c) 1988, 1989">
		<TELL CR>
		<WCENTER "Infocom, Inc.">)
	       (T
		<WCENTER "Illustrations by Donald Langosy">
		<TELL CR CR>
		<WCENTER "Copyright (c) 1988, 1989 Infocom, Inc.">)>
	 <TELL CR>
	 <WCENTER "All rights reserved.">
	 <TELL CR CR>
	 <WCENTER "[Press any key to begin]">
	 <TELL MORE>
	 <COND (,FONT3-FLAG <CHANGE-FONT .F>)>
	 <TELL CLEAR>
	 <COND (<EQUAL? .CHR !\0>
		<RTRUE>)>
	 <TELL
"It was a Golden Age, or so it now seems; and there are but a few who can
recall those years, and fewer still who would not tremble to speak of what
followed." CR CR>
	 <TELL
"But we were younger then, and less wise. It seems strange now to think
that we had never set foot outside our village when we were called upon to
take part in a great adventure - that fateful Journey which changed our
world forever...." CR CR>
	 <COND (,FONT3-FLAG <SET F <CHANGE-FONT 4>>)>
	 <WCENTER "[Press any key to begin]">
	 <TELL MORE>
	 <COND (,FONT3-FLAG <CHANGE-FONT .F>)>
	 <TELL CLEAR>>

<CONSTANT BAD-GUY "Dread Lord">