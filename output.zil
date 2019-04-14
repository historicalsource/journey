"OUTPUT for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<SETG ANONF-COUNT 0>

<DEFINE ACOND ("ARGS" LST "AUX" ATM)
	<SET ATM <PARSE <STRING "ANONF-"
				<UNPARSE <SETG ANONF-COUNT
					       <+ ,ANONF-COUNT 1>>>>>>
	<COND (<TYPE? <1 .LST> ATOM>
	       <SET ATM <1 .LST>>
	       <SET LST <REST .LST>>)>
	<MAPF <>
	      <FUNCTION (X "AUX" (XX <1 .X>))
		   <COND (<==? .XX T> T)
			 (<TYPE? .XX ATOM>
			  <PUT .X 1 <FORM ACTION? .XX>>)
			 (<TYPE? .XX ADECL>
			  <PUT .X 1 <FORM ACTION? <1 .XX>>>
			  <COND (<==? <2 .XX> CLEAR>
				 <PUTREST .X
					  ('<UPDATE-FSET ,ACTION-OBJECT
							 ,DONT-EXAMINE>
					   !<REST .X>)>)
				(<==? <2 .XX> REMOVE>
				 <COND (<==? <1 .XX> EXAMINE>
					<PUTREST .X
						 ('<UPDATE-MOVE>
						  !<REST .X>)>)
				       (<==? <1 .XX> GET-ADVICE>
					<PUTREST .X
						 ('<UPDATE-FCLEAR ,HERE
								  ,ADVISE>
						  !<REST .X>)>)
				       (<OR <==? <1 .XX> SCOUT>
					    <==? <1 .XX> LOOK-AROUND>>
					<PUTREST .X
						 ('<UPDATE-FSET ,HERE
								,DONT-SCOUT>
						  '<FSET ,HERE ,SCOUTED>
						  !<REST .X>)>)
				       (T
					<PUTREST .X
					  ('<REMOVE-TRAVEL-COMMAND>
					   !<REST .X>)>)>)
				(T
				 <ERROR BAD-ACOND!-ERRORS>)>)>>
	      <REST .LST>>
	<EVAL <FORM ROUTINE .ATM <1 .LST>
		    <FORM COND !<REST .LST>>>>
	.ATM>

<DEFINE EXECUTE ("ARGS" LST "AUX" ATM)
	<SET ATM <PARSE <STRING "ANONF-"
				<UNPARSE <SETG ANONF-COUNT
					       <+ ,ANONF-COUNT 1>>>>>>
	<COND (<TYPE? <1 .LST> FORM>
	       <SET LST ('() !.LST)>)>
	<EVAL <FORM ROUTINE .ATM !.LST>>
	.ATM>

;"Constants various"

<CONSTANT GRAPHICS-WINDOW 3>
<CONSTANT COMMAND-WINDOW 1>
<CONSTANT TEXT-WINDOW 0>

<CONSTANT S-TEXT 0>
<CONSTANT S-WINDOW 1>

<CONSTANT S-BEEP 1>
<CONSTANT S-BOOP 2>

<CONSTANT H-NORMAL 0>
<CONSTANT H-INVERSE 1>

;"These may not be implemented on a target machine."
<GLOBAL H-BOLD 2>

<CONSTANT D-TABLE-ON 3>
<CONSTANT D-TABLE-OFF -3>

<GLOBAL CHRH 0>
<GLOBAL CHRV 0>

<ROUTINE CHANGE-FONT (F)
	 <COND (<EQUAL? .F 3>
		<COND (,FONT3-FLAG <FONT 3>)
		      (T <FONT 1>)>)
	       (<EQUAL? .F 4>
		<COND (,FWC-FLAG <FONT 4>)
		      (T <FONT 1>)>)>>

<ROUTINE GPOS (C F)
	 <COND (<EQUAL? .F 1> .C)
	       (T
		<+ <* <- .C 1> .F> 1>)>>

<ROUTINE MAKE-WINDOW (N YL XL YS XS "OPTIONAL" (B 15))
	 <WINPOS .N
		 <GPOS .YL ,CHRV>
		 <GPOS .XL ,CHRH>>
	 <WINSIZE .N
		  <* .YS ,CHRV>
		  <* .XS ,CHRH>>
	 <WINATTR .N .B>
	 .N>

<ROUTINE GCURSET (YL XL)
	 <COND (<ZERO? ,CURRENT-SCREEN>
		<SELECT-SCREEN ,COMMAND-WINDOW>)>
	 <CURSET <GPOS .YL ,CHRV> <GPOS .XL ,CHRH>>>

;"tell macro and friends"

<TELL-TOKENS (CRLF CR)		<CRLF>
	     (NUM N) *		<PRINTN .X>
	     C *		<PRINTC .X>
	     S *:STRING		<PRINT .X>
	     D *		<WPRINTD .X>
	     TAG		<WPRINTTAG>
	     CHR *		<WPRINTCHR .X>
	     AO			<WPRINTD ,ACTION-OBJECT>
	     ACT		<WPRINTD ,ACTOR>
	     AOP		<WPRINTD-OBJECT-PERIOD>
	     MORE		<INPUT 1>
	     CLEAR		<CLEAR ,TEXT-WINDOW>>

<ROUTINE WPRINTCHR (CHR)
	 <COND (<IN-PARTY? .CHR> <WPRINTD .CHR>)
	       (T
		<TELL "[Error: ">
		<WPRINTD .CHR>
		<TELL "]">)>>

;"macros"

<ROUTINE PICK-ONE (TBL "AUX" LENGTH CNT RND MSG RFROB)
	 <SET LENGTH <GET .TBL 0>>
	 <SET CNT <GET .TBL 1>>
	 <SET LENGTH <- .LENGTH 1>>
	 <SET TBL <REST .TBL 2>>
	 <SET RFROB <REST .TBL <* .CNT 2>>>
	 <SET RND <RANDOM <- .LENGTH .CNT>>>
	 <SET MSG <GET .RFROB .RND>>
	 <PUT .RFROB .RND <GET .RFROB 1>>
	 <PUT .RFROB 1 .MSG>
	 <SET CNT <+ .CNT 1>>
	 <COND (<==? .CNT .LENGTH> 
		<SET CNT 0>)>
	 <PUT .TBL 0 .CNT>
	 .MSG>

<CONSTANT INF 32000>

<OBJECT WINDOWS-UNUSED
	(DESC "arc")
	(FLAGS BUSY SEEN LIT ENCHANTED SCOUTED SUBGROUP SINGLE-CAST
	       EXAMINED TRAPPED INCAPACITATED DEAD SOLVED DONT-TAKE TRIED
	       DONT-CAST DONT-SCOUT DONT-EXAMINE BLUE-MIX GRAY-MIX TRUTHFUL
	       INVENTORIED BLACK-MIX NEVER-DROP USED-UP SHADOW)
	(CAST-LIMIT INF)>

<GLOBAL TEXT-WINDOW-LEFT 0>

<GLOBAL BASE-PICTURE-HEIGHT 0>
<GLOBAL BASE-PICTURE-WIDTH 0>

<GLOBAL PICINF-TBL <TABLE 0 0>>

<ROUTINE SETUP-WINDOWS ("AUX" (PW ,BASE-PICTURE-WIDTH)
			(PH ,BASE-PICTURE-HEIGHT) (OFF 6) (GOOD? <>))
	 <COND (<OR <NOT <APPLE2?>>
		    <0? ,BASE-PICTURE-HEIGHT>>
		<COND (<SET GOOD? <PICINF 2 ,PICINF-TBL>>
		       <SET PH <GET ,PICINF-TBL 0>>
		       <SET PW <GET ,PICINF-TBL 1>>
		       <SETG BASE-PICTURE-WIDTH .PW>
		       <SETG BASE-PICTURE-HEIGHT .PH>)>)
	       (T
		<SET GOOD? T>)>
	 <COND (.GOOD?
		; "Don't do the PICINF on the apple II if we already have.
		   This will, we hope, prevent unnecessary disk flipping on
		   refresh/restore.  The theory is that all apple II screens
		   are the same size, so it isn't necessary."
		<COND (<OR <APPLE2?> <EQUAL? ,INTERPRETER ,INT-PC>>
		       ;"Shrink margin for max. text space..."
		       <SET OFF 3>)
		      (<NOT ,BORDER-FLAG>
		       <SET OFF 5>)> ;"Added 4/26"
		<SETG TEXT-WINDOW-LEFT <+ .OFF </ <+ .PW ,CHRH> ,CHRH>>>)
	       (T
		<SETG TEXT-WINDOW-LEFT ,INIT-TEXT-LEFT>)>
	 ;"Center top left of graphic window"
	 <MAKE-WINDOW ,TEXT-WINDOW
		      ,TOP-SCREEN-LINE
		      ,TEXT-WINDOW-LEFT
		      <- ,COMMAND-START-LINE ,TOP-SCREEN-LINE 1>
		      <- ,SCREEN-WIDTH ,TEXT-WINDOW-LEFT>>
	 <COND (<EQUAL? ,INTERPRETER ,INT-PC>
		;"For PC, add a left margin to text window..."
		<MARGIN 4 0 ,TEXT-WINDOW>)
	       ;(<APPLE2?>
		<MAKE-WINDOW 0
			     ,TOP-SCREEN-LINE
			     ,TEXT-WINDOW-LEFT
			     <- ,COMMAND-START-LINE ,TOP-SCREEN-LINE 1>
			     <- ,SCREEN-WIDTH ,TEXT-WINDOW-LEFT>>)>
	 ; "Changed as follows per TAA:
	    Window is top left of screen, and fills the area to the
	    borders drawn around other things.  Pictures will be centered
	    in this by GRAPHIC.  This allows us to ensure that pictures
	    will really, seriously, be cleared when needed."
	   <COND (,BORDER-FLAG
		  <SETG GRAPHIC-WINDOW-Y
			<* <- ,COMMAND-START-LINE 3> ,CHRV>>
		  <SETG GRAPHIC-WINDOW-X
			<* <- ,TEXT-WINDOW-LEFT 3> ,CHRH>>)
		 (T
		  <SETG GRAPHIC-WINDOW-Y
			<* <- ,COMMAND-START-LINE 2> ,CHRV>>
		  <SETG GRAPHIC-WINDOW-X
			<* <- ,TEXT-WINDOW-LEFT 2> ,CHRH>>)>
	   <COND (,BORDER-FLAG
		  <MAKE-WINDOW ,GRAPHICS-WINDOW
			       ,TOP-SCREEN-LINE
			       ,TOP-SCREEN-LINE
			       <- ,COMMAND-START-LINE 3>
			       <- ,TEXT-WINDOW-LEFT 3>
			       11>)
		 (T
		  <MAKE-WINDOW ,GRAPHICS-WINDOW
			       ,TOP-SCREEN-LINE
			       ,TOP-SCREEN-LINE
			       <- ,COMMAND-START-LINE 2>
			       <- ,TEXT-WINDOW-LEFT 2>
			       11>)>
	 ; "Set background color to black for this window"
	   <COND (,BLACK-PICTURE-BORDER
		  <SCREEN ,GRAPHICS-WINDOW>
		  <COLOR 9 2>
		  <CLEAR ,GRAPHICS-WINDOW>)>>

<ROUTINE WPRINTTAG ()
	 <COND (<G? ,TAG-NAME-LENGTH 0>
		<PRINTT <REST ,NAME-TBL 2> ,TAG-NAME-LENGTH>)
	       (T
		<PRINT-DESC ,TAG>)>>

<ROUTINE WPRINTD (OBJ "OPTIONAL" A) <PRINT-DESC .OBJ>>

<GLOBAL WPRINT-EBUF <TABLE (BYTE)
32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32
32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32
32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32
32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32
>>

<CONSTANT CENTER-TABLE <ITABLE 20>>
<ROUTINE WCENTER (STR "AUX" WID SWID)
	 <SET WID <TEXT-WIDTH .STR>>
	 <SET SWID <* <- ,SCREEN-WIDTH ,TEXT-WINDOW-LEFT> ,CHRH>>
	 <COND (<L? .WID .SWID>
		<SET SWID <+ 1 </ <- .SWID .WID> 2>>>)
	       (T
		<SET SWID 1>)>
	 <CURGET ,CURGET-TABLE>
	 <CURSET <ZGET ,CURGET-TABLE 0> .SWID>
	 <PRINTT <REST ,CENTER-TABLE 2> <GET ,CENTER-TABLE 0>>>

<GLOBAL CURRENT-GRAPHIC <>>

<ROUTINE GRAPHIC-STAMP (PIC WHERE "OPTIONAL" V H "AUX" CURH CURW TOP LEFT
			NEWH NEWW)
	 <SET CURH <GET ,PICINF-TBL 0>>
	 <SET CURW <GET ,PICINF-TBL 1>>
	 <SET TOP <+ </ <- ,GRAPHIC-WINDOW-Y .CURH> 2> 1>>
	 <SET LEFT <+ </ <- ,GRAPHIC-WINDOW-X .CURW> 2> 1>>
	 <COND (<AND <ZERO? .WHERE>
		     <ASSIGNED? V>
		     <ASSIGNED? H>>
		<SET TOP <+ .TOP .V>>
		<SET LEFT <+ .LEFT .H>>)
	       (<G? .WHERE 0>
		;"WHERE is a funny picture, specifying the location
		   of the stamp relative to the corner of the background
		   graphic."
		<PICINF .WHERE ,PICINF-TBL>
		<SET LEFT <+ <GET ,PICINF-TBL 1> .LEFT>>
		<SET TOP <+ <GET ,PICINF-TBL 0> .TOP>>)
	       (T
		<PICINF .PIC ,PICINF-TBL>
		<SET NEWH <GET ,PICINF-TBL 0>>
		<SET NEWW <GET ,PICINF-TBL 1>>
		<COND (<NOT <0? <ANDB .WHERE ,STAMP-RIGHT>>>
		       <SET LEFT <+ .LEFT <- .CURW .NEWW>>>)>
		<COND (<NOT <0? <ANDB .WHERE ,STAMP-BOTTOM>>>
		       <SET TOP <+ .TOP <- .CURH .NEWH>>>)>)>
	 ;<COND (,GTRACE-FLAG
		<TELL "[STAMP - PIC: " N .PIC
		      ", TOP: " N .TOP
		      ", LEFT: " N .LEFT
		      "]" CR>)>
	 <DISPLAY .PIC .TOP .LEFT>>

<GLOBAL CURRENT-STAMP <>>
<GLOBAL CURRENT-STAMP-LOC <>>

<ROUTINE GRAPHIC ("OPTIONAL" (STR <>) (STAMP <>) (WHERE <>))
	 ;<COND (,GTRACE-FLAG
		<TELL "[GRAPHIC - STR: " N .STR
		      ", STAMP: " N .STAMP
		      ", WHERE: " N .WHERE
		      "]" CR>)>
	 <COND (<OR <NOT ,GRAPHICS-FLAG>
		    <EQUAL? .STR ,CURRENT-GRAPHIC>>
		<RTRUE>)>
	 <COND (<AND <NOT .STR> <NOT .STAMP>>
		<SET STR ,CURRENT-GRAPHIC>
		<COND (<EQUAL? .STR -1>
		       <CAVERN-GRAPHIC>)
		      (T
		       <SET STAMP ,CURRENT-STAMP>
		       <SET WHERE ,CURRENT-STAMP-LOC>)>)
	       (.STR
		<SETG CURRENT-GRAPHIC .STR>)>
	 <SCREEN ,GRAPHICS-WINDOW>
	 <COND (.STR <CLEAR ,GRAPHICS-WINDOW>)>
	 <COND (<OR <ZERO? .STR> <EQUAL? .STR -1>> T)
	       (<AND <G? .STR 0> <L? .STR 255>>
		<COND (<PICINF .STR ,PICINF-TBL>
		       ;<COND (,GTRACE-FLAG
			      <TELL "[DISPLAY - STR: " N .STR "]" CR>)>
		       <DISPLAY .STR
			 <+ </ <- ,GRAPHIC-WINDOW-Y <GET ,PICINF-TBL 0>> 2> 1>
			 <+ </ <- ,GRAPHIC-WINDOW-X <GET ,PICINF-TBL 1>> 2> 1>>)>)
	       (T
		<PRINT .STR>)>
	 <COND (.STAMP
		<SETG CURRENT-STAMP .STAMP>
		<SETG CURRENT-STAMP-LOC .WHERE>
		<COND (<G? .STAMP 255> <PRINT .STAMP>)
		      (T
		       <COND (<PICINF ,CURRENT-GRAPHIC ,PICINF-TBL>
			      <GRAPHIC-STAMP .STAMP .WHERE>)>)>)
	       (T
		<SETG CURRENT-STAMP <>>)>
	 <SCREEN ,TEXT-WINDOW>>
		    
<GLOBAL CURRENT-SCREEN 0>

<ROUTINE SELECT-SCREEN (N)
	 <SCREEN .N>
	 <SETG CURRENT-SCREEN .N>>

<ROUTINE I/WE ("OPTIONAL" (N 1) (CAPS? <>))
	 <COND (<G? ,PARTY-MAX .N>
		<COND (.CAPS? "We") (T "we")>)
	       (T "I")>>

<ROUTINE I-WAS/WE-WERE ("OPTIONAL" (N 1))
	 <COND (<G? ,PARTY-MAX .N> "we were")
	       (T "I was")>>

<ROUTINE I/EACH ("OPTIONAL" (N 1))
	 <COND (<G? ,PARTY-MAX .N> "each of us")
	       (T "I")>>

<ROUTINE MY/OUR ("OPTIONAL" (N 1))
	 <COND (<G? ,PARTY-MAX .N> "our")
	       (T "my")>>

<ROUTINE ME/US ("OPTIONAL" (N 1))
	 <COND (<G? ,PARTY-MAX .N> "us")
	       (T "me")>>

<ROUTINE PRINT-DESC (OBJ "OPTIONAL" (CMD? <>))
	 <COND (<AND <EQUAL? .OBJ ,TAG-OBJECT ,TAG ;"Added 3/14">
		     <NOT <ZERO? ,TAG-NAME-LENGTH>>>
		<PRINTT <REST ,NAME-TBL 2>
			,TAG-NAME-LENGTH>)
	       (<NOT .CMD?>
		;"Always print full name if not in command area..."
		<PRINT <GETP .OBJ ,P?SDESC>>)
	       (T
		<PRINT <GET-DESC .OBJ>>)>>

<ROUTINE GET-DESC (OBJ "AUX" STR)
	 <COND (<AND <L? ,SCREEN-WIDTH ,8-WIDTH>
		     <SET STR <GETP .OBJ ,P?8DESC>>>
		.STR)
	       (<AND <L? ,SCREEN-WIDTH ,12-WIDTH>
		     <SET STR <GETP .OBJ ,P?12DESC>>>
		.STR)
	       (T
		<GETP .OBJ ,P?SDESC>)>>

<ROUTINE PRINT-COMMAND (CMD)
	 <PRINT <GET-COMMAND .CMD>>>

<ROUTINE GET-COMMAND (CMD "AUX" STR)
	 <COND (<AND <L? ,COMMAND-WIDTH 12>
		     <SET STR <GET .CMD ,COMMAND-ASTR>>>
		.STR)
	       (T
		<GET .CMD ,COMMAND-FULL>)>>

;"Pix that come up for one move only; can't have a stamp"

<ROUTINE SINGLE-MOVE-GRAPHIC (G)
	 <SETG SAVED-GRAPHIC ,CURRENT-GRAPHIC>
	 <SETG SAVED-GRAPHIC-ROOM ,HERE>
	 <GRAPHIC .G>
	 <QUEUE I-CLEAR-SINGLE-MOVE-GRAPHIC 1>>

<GLOBAL SAVED-GRAPHIC 0>
<GLOBAL SAVED-GRAPHIC-ROOM 0>

<OBJECT I-CLEAR-SINGLE-MOVE-GRAPHIC
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<EQUAL? ,HERE ,SAVED-GRAPHIC-ROOM>
			 <GRAPHIC ,SAVED-GRAPHIC>)>>)>

