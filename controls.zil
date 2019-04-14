"CONTROLS for
		      		JOURNEY
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<CONSTANT SERIAL 0>

<ROUTINE TELL-GAME-ID ("AUX" (CNT 17))
	 <PICINF 0 ,PICINF-TBL>
	 <TELL "Release " N <BAND <GET 0 1> *3777*>
	       " / Graphics " N <ZGET ,PICINF-TBL 1>
	       " / Serial number ">
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> 23>
			<RETURN>)
		       (T
			<TELL C <GETB 0 .CNT>>)>>
	 <TELL " / ">
	 <TELL <GET ,MACHINES <LOWCORE INTID>> " Interpreter version "
	       N <LOWCORE (ZVERSION 0)> "." N <LOWCORE INTVR>>>

<CONSTANT INT-2E 2>
<CONSTANT INT-MAC 3>
<CONSTANT INT-AMIGA 4>
<CONSTANT INT-PC 6>
<CONSTANT INT-2C 9>
<CONSTANT INT-2GS 10>

<ROUTINE APPLE2? ()
	 <EQUAL? ,INTERPRETER ,INT-2E ,INT-2C ,INT-2GS>>

<CONSTANT MACHINES
	  <LTABLE "Debugging"
		  "Apple IIe"
		  "Macintosh"
		  "Amiga"
		  "Atari ST"
		  "IBM"
		  "Commodore 128"
		  "Commodore 64"
		  "Apple IIc"
		  "Apple IIgs">>

<GLOBAL DONT-SCRIPT-INPUT <>>

<GLOBAL GRAPHICS-FLAG T>
<GLOBAL SCRIPTING-FLAG <>>
<GLOBAL DEBUG <>>



 