"COMMANDS for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

;"In command names, - (dash) becomes space with capitalized next word,
  ' (quote) is kept as is, and + (plus) means capitalize next word
  withOUT a space (only used in stupid, fucking AppleII abbreviations...)"

<DEFINE JSTR (CNM)
   <MAPR ,STRING
      <FUNCTION (STR "AUX" (CHR <1 .STR>))
	 <COND (<=? .STR "NUL">
		<MAPLEAVE " ">)
	       (<=? .STR "CANCEL">
		<MAPLEAVE "[cancel]">)
	       (<=? .STR "GONE">
		<MAPLEAVE "[gone]">)
	       (<=? .STR "BUSY">
		<MAPLEAVE "[busy]">)
	       (<=? .STR "ILL">
		<MAPLEAVE "[wounded]">)
	       (<OR .SPF <==? .STR .CNM>>
		<SET SPF <>>
		.CHR)
	       (<==? .CHR !\->
		<SET SPF T>
		<ASCII 32>)
	       (<==? .CHR !\'>
		.CHR)
	       (<==? .CHR !\+>
		<SET SPF T>
		<MAPRET>)
	       (T
		<ASCII <+ <ASCII .CHR>
			  32>>)>>
      .CNM>>

<DEFINE COMMAND (NAM "ARGS" LST "AUX" OBJ ACT CSPN SPN (SPF <>) (ANM <>))
	<COND (<TYPE? .NAM LIST>
	       <SET CSPN <SPNAME <1 .NAM>>>
	       <SET ANM <2 .NAM>>
	       <SET NAM <1 .NAM>>)
	      (T
	       <SET CSPN <SPNAME .NAM>>)>
	<SET SPN <SPNAME .NAM>> 
	<COND (<EMPTY? .LST>
	       <SET OBJ 0>
	       <SET ACT V-NUL>)
	      (T
	       <SET OBJ <EVAL <1 .LST>>>
	       <COND (<EMPTY? <SET LST <REST .LST>>>
		      <SET ACT V-NUL>)
		     (<TYPE? <1 .LST> ATOM>
		      <SET ACT <1 .LST>>)
		     (T
		      <EVAL <FORM ROUTINE
				  <SET ACT <PARSE <STRING "V-" .CSPN>>>
				  !.LST>>)>)>
	<EVAL <FORM CONSTANT
		    <PARSE <STRING .CSPN "-COMMAND">>
		    <PTABLE <JSTR .SPN>
			    <MAPR ,STRING
				  <FUNCTION (STR "AUX" (CHR <1 .STR>))
				       <COND (<=? .STR "NUL">
					      <MAPLEAVE " ">)
					     (<==? .CHR !\->
					      <ASCII 32>)
					     (<==? .CHR !\'>
					      .CHR)
					     (<==? .CHR !\+>
					      <MAPRET>)
					     (T
					      <ASCII <+ <ASCII .CHR> 32>>)>>
				  .SPN>
			    .ACT
			    .OBJ
			    <COND (<=? .SPN "CANCEL">
				   8)
				  (<MEMBER .SPN ["NUL" "GONE" "BUSY" "ILL"]>
				   ;"Added 3/15"
				   2)
				  (T
				   <1 .SPN> ;"For KBD input")>
			    <COND (<=? .SPN "ILL">
				   ;"Damned special case for abbreviation..."
				   "[hurt]")
				  (.ANM
				   <JSTR <SPNAME .ANM>>)
				  (T <>)>
			    >>>>

<SETG TEMP-COMMAND ,COMMAND>

<CONSTANT COMMAND-FULL 0>
<CONSTANT COMMAND-STR 1>
<CONSTANT COMMAND-ACTION 2>
<CONSTANT COMMAND-OBJECT 3>
<CONSTANT COMMAND-CHR 4>
<CONSTANT COMMAND-ASTR 5>

<COMMAND (BERGON-ROUTE BERGON-RT)>
<COMMAND (PRAXIX-ROUTE PRAXIX-RT)>
<COMMAND TAG-ROUTE>
<COMMAND ELF-HOME>

<COMMAND FIGHT>

<COMMAND ACCEPT>
<COMMAND DECLINE>
<COMMAND (GET-ADVICE GET+ADVICE) <> ()
	 <TELL D ,LEADER
	       " asked the group for advice, but none was offered.">>

<COMMAND LEFT>
<COMMAND RIGHT>

<COMMAND BACK>

<COMMAND DIVE>
<COMMAND SURFACE>

<COMMAND HIDE>

<COMMAND HELP <> ()
	 <TELL
"Journey is an interactive story in which you guide a party of
characters through a dangerous quest. To learn about the background of
your quest, select BACKGROUND after reading this material." CR CR>
	 <TELL
"There are two types of commands that you can give; those which are
performed for the entire party (e.g. moving from place to place, retreating
after a losing battle) and those which are performed by an individual
character (e.g. examining an object, casting a spell, mingling in a
tavern.)  Party Commands are the leftmost column of commands on
the screen; the next column lists the characters in your party;
and the three following columns are for the Individual Commands." CR CR>
	 <TELL
"To select a command of either type, simply use the arrow-keys on your
keyboard to reposition the highlighted command on the screen (the \"cursor\")
until that cursor rests on the command you desire; then hit RETURN. Alternatively,
if you are using a mouse, move it such that the ">
	 <COND (<APPLE2?> <TELL "dot">)
	       (T <TELL "arrow">)>
	 <TELL " on the screen is pointing to
that command; then click your mouse button." CR CR>
	 <TELL
"If you are using the keyboard, use the spacebar as a shortcut
to move between the Party Commands and the Individual Commands. Also,
typing the first letter of a command or object name will select that
command or object." CR CR>
	 <TELL "Have fun!">
	 <NEW-DEFAULT 2 -1>>

<COMMAND (BACKGROUND BCKGRND)>

<COMMAND BUSY>

<COMMAND ILL>

<COMMAND GONE>

<COMMAND BUY O-TAKE ()
	 <TELL "We bought the " AO " and packed it away.">
	 <FSET ,ACTION-OBJECT ,DONT-EXAMINE>
	 <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>
	 <RTRUE>>

<COMMAND CAST O-CAST () <RFALSE>>

<ROUTINE O-CAST ()
	 <COND (<EQUAL? ,ACTOR ,TAG>
		<FIND-OBJECT ,TAG-POWDERS>
		<RTRUE>)>
	 <FIND-SPELL-OBJECTS ,ALWAYS-SPELLS>>

<ROUTINE FIND-SPELL-OBJECTS (OBJ "OPTIONAL" (BIT <>) "AUX" F CNT)
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<OR <NOT .F>
			    <EQUAL? .CNT 9>>
			<RETURN>)
		       (<CHECK-ESSENCES .F>
			<SET CNT <FIND-OBJECT .F>>)>
		 <SET F <NEXT? .F>>>>

<COMMAND (FEEL-AROUND FEEL-OUT)>

<COMMAND DROP O-DROP ()
	 <COND (<FSET? ,ACTION-OBJECT ,DONT-DROP>
		<REMOVE ,HYE-DROP>
		<FOOL-DROP>)
	       (T
		<UPDATE-MOVE ,ACTION-OBJECT ,HERE>
		<TELL
"Having no more need for the " AO ", we discarded it.">)>
	 <UPDATE-FSET ,HERE ,DONT-DROP>>

<ROUTINE O-DROP ()
	 <FIND-OBJECTS ,INVENTORY ,NEVER-DROP>>

<ROUTINE FOOL-DROP ()
	 <COND (<CHARACTER-HERE? ,PRAXIX>
		<TELL
"Trying to lighten my load, I started to drop the " AO " on the ground.
\"" TAG "!\" Praxix called out loudly, startling me. \"What on earth are you
doing with that " AO "? Dropping it here, of all places! How do you know we
won't be needing such things? Now make yourself useful before I ">
		<TELL <PICK-ONE ,PRAXIX-FOOL-TBL>>
		<TELL "!\" I hardly think Praxix was being serious, or even
that such a thing was possible, but he was almost certainly right about the " AO ".">)
	       (T
		<TELL
"I thought to lighten my load by dropping the " AO ", but felt that
it would serve no purpose save giving Praxix an excuse to fry me in
boiling oil when he found out.">)>>

<GLOBAL PRAXIX-FOOL-TBL
	<LTABLE 0
	       "turn you into a toad"
	       "fry you"
	       "cast you into the sky and make you dinner for vultures">>

<COMMAND ENTER>

<COMMAND EXAMINE O-EXAMINE ()
	 <COND (<GETPT ,ACTION-OBJECT ,P?EXBITS>
		<CLEAR-EXBIT ,ACTION-OBJECT ,ACTOR>)
	       (T
		<FSET ,ACTION-OBJECT ,DONT-EXAMINE>)>
	 <TELL ACT " examined the " AO ", but found nothing of interest.">>

<ROUTINE CLEAR-EXBIT ("OPTIONAL" (OBJ ,ACTION-OBJECT) (CHR ,ACTOR))
	 <SETG UPDATE-FLAG T>
	 <PUTP .OBJ
	       ,P?EXBITS
	       <BAND <GETP .OBJ ,P?EXBITS>
		     <BCOM <GETP .CHR ,P?CBIT>>>>>

<ROUTINE FIND-EXAMINE (OBJ "AUX" F CNT)
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<OR <NOT .F>
			    <EQUAL? .CNT 9>>
			<RETURN>)
		       (<AND <NOT <FSET? .F ,DONT-EXAMINE>>
			     <OR <NOT <GETPT .F ,P?EXBITS>>
				 <BTST <GETP .F ,P?EXBITS>
				       <GETP ,ACTOR ,P?CBIT>>>>
			<SET CNT <FIND-OBJECT .F>>)>
		 <SET F <NEXT? .F>>>>

<ROUTINE O-EXAMINE ()
	 <FIND-EXAMINE ,HERE>
	 <COND (<OR <NOT ,SUBGROUP-MODE>
		    <FSET? ,TAG ,SUBGROUP>>
		<FIND-EXAMINE ,INVENTORY>)
	       (<EQUAL? ,ACTOR ,PRAXIX>
		<FIND-OBJECT ,POUCH>)>
	 <RTRUE>>

<COMMAND EXIT>

<COMMAND (TELL-STORY TELL-TALE) O-TELL-LEGEND ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>

<COMMAND (TELL-LEGEND TELL-TALE) O-TELL-LEGEND ()
	 <TELL-TALE ,ACTION-OBJECT>
	 <RTRUE>>

<ROUTINE O-TELL-LEGEND ()
	 <COND (<OR <FSET? ,HERE ,DANGEROUS>
		    <FSET? ,SCENE-OBJECT ,DANGEROUS>>
		<RTRUE>)
	       (<EQUAL? ,ACTOR ,PRAXIX>
		<FIND-OBJECTS ,PRAXIX-TALES>)
	       (<EQUAL? ,ACTOR ,HURTH>
		<FIND-OBJECTS ,HURTH-STORIES>)
	       (<EQUAL? ,ACTOR ,UMBER>
		<FIND-OBJECTS ,UMBER-STORIES>)>>

<COMMAND TELL-TRUTH>
<COMMAND LIE>

<COMMAND (STREAM-PATH STREAM)>
<COMMAND APPROACH>
<COMMAND (STAY-HIDDEN STAY)>
<COMMAND FOLLOW>

<COMMAND SCENE-START>
<COMMAND SCENE-END>

<COMMAND (LOOK-AROUND LOOK-AR'D)>
<COMMAND GET-HELP>
<COMMAND RETURN>

<COMMAND IGNORE>

<COMMAND (INVENTORY INVENT) <> ("OPTIONAL" (UPD? T) "AUX" F)
	 <COND (<EQUAL? ,HERE ,ASTRIX-MAZE>
		<UPDATE-FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>)>
	 <TELL "I checked our provisions at that point and found,
in addition to the basic necessities of food and shelter, ">
	 <COND (<NOT <LIST-CONTENTS ,INVENTORY>>
		<TELL "nothing whatever">)>
	 <COND (.UPD? <UPDATE-FSET ,HERE ,INVENTORIED>)>
	 <TELL ".">>

<ROUTINE LIST-CONTENTS (OBJ "OPTIONAL" (AF T) "AUX" F N)
	 <COND (<EQUAL? .OBJ ,INVENTORY>
		<REMOVE ,POUCH>)>
	 <COND (<NOT <SET F <FIRST? .OBJ>>>
		<COND (<EQUAL? .OBJ ,INVENTORY>
		       <MOVE ,POUCH ,INVENTORY>)>
		<RFALSE>)>
	 <REPEAT ()
		 <COND (<NOT .F>
			<COND (<EQUAL? .OBJ ,INVENTORY>
			       <MOVE ,POUCH ,INVENTORY>)>
			<RETURN>)
		       (<EQUAL? .F ,POUCH>
			<SET F <NEXT? .F>>)
		       (T
			<COND (.AF <TELL "a ">)
			      (T <TELL "the ">)>
			<TELL D .F>
			<COND (<SET F <NEXT? .F>>
			       <TELL ", ">
			       <COND (<NOT <NEXT? .F>> <TELL "and ">)>)>)>>> 

<COMMAND NUL <> () <RFALSE>>

<COMMAND PARLEY>

<COMMAND PROCEED>

<COMMAND REPLY>

<COMMAND RETREAT <> ()
	 <END-COMBAT>
	 <TELL "We retreated out of range of attack.">>

<COMMAND SCOUT <> ()
	 <UPDATE-FSET ,HERE ,DONT-SCOUT>
	 <TELL ACT
" scouted out the area, but found nothing new of interest.">>

<COMMAND FLANK>

<COMMAND SELL O-SELL ()
	 <TELL
"[Not implemented.]">>

<ROUTINE O-SELL ()
	 <COND (<EQUAL? ,HERE ,LANDS-END-TAVERN> <RTRUE>)
	       (T
		<O-DROP>)>>

<COMMAND PICK-UP O-TAKE ()
	 <FSET ,ACTION-OBJECT ,DONT-EXAMINE>
	 <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>
	 <COND (<FSET? ,TAG ,SUBGROUP>
		<TELL
"I decided to take the " AO ", and">)
	       (T
		<TELL
"We decided to take the " AO ", so">)>
	 <TELL " I put it in my pack for safekeeping.">>

<ROUTINE O-TAKE ()
	 <FIND-OBJECTS ,HERE ,DONT-TAKE>>

<COMMAND SPLIT-UP>

<COMMAND (COMB-AREA COMB+AREA)>

<COMMAND START>

<COMMAND STAND>

<COMMAND UPSTREAM>
<COMMAND (DOWNSTREAM DOWN)>
<COMMAND SWIM>

<COMMAND BUILD-RAFT <> ()
	 <FSET ,RAFT ,SEEN>
	 <APPLY <GETP ,HERE ,P?ENTER>>
	 <TELL "There was ">
	 <COND (<FSET? ,RAFT ,TRAPPED>
		<TELL "still ">)>
	 <TELL
"no suitable way of crossing the river on foot, so we determined to
build a raft. After gathering some large branches, it was then a simple
matter to lash them together with some of the rope we had been carrying. We
then carved ourselves oars, and were soon ready to give the river crossing a">
	 <COND (<QSET? ,RAFT ,TRAPPED> <TELL "nother">)>
	 <TELL " try.">>
	 
<COMMAND (LAUNCH-RAFT LAUNCH) <> ()
	 <TELL
"\"This would seem as good a spot as any,\" ">
	 <COND (<IN-PARTY? ,BERGON> <TELL "Bergon">)
	       (T 
		<TELL "Praxix">)>
	 <TELL " said, indicating the spot where we would launch the raft." CR CR>
	 <TELL "This ">
	 <COND (<EQUAL? ,PARTY-MAX 2>
		<TELL "sounded good to me">)
	       (T
		<TELL "met with general approval">)>
	 <TELL ", and, having boarded the raft, we used our
crude oars to push ourselves out into the current.">
	 <PUTP ,IN-RIVER ,P?TEMP <GET-TEMP>>
	 <MOVE-TO ,IN-RIVER>>

<COMMAND CROSS>
<COMMAND CENTER>

;<ROUTINE APPLE-SCREEN-0-SHIT ("AUX" SV)
	 ;<CLEAR 0>
	 <SET SV ,CURRENT-SCREEN>
	 <SCREEN 0>
	 <GCURSET <- ,COMMAND-START-LINE 2> 1>
	 <SCREEN .SV>
	 <TURN-ON-CURSOR>>

<COMMAND SAVE <> ("OPTIONAL" (CAN? T) "AUX" SV)
	 ;"Added 5/12 to fix apple save/restore screen fuckup"
	 ;<COND (<APPLE2?>		
		<APPLE-SCREEN-0-SHIT>)>
	 <TURN-ON-CURSOR>
	 <COND (<==? ,INTERPRETER ,INT-PC>
		; "Otherwise interpreter asking for save file will end up
		   stuck to text."
		<TELL CR>)>
	 <SET SV <SAVE>>
	 <TURN-OFF-CURSOR>
	 <COND (<EQUAL? .SV 1>
	        <TURN-OFF-CURSOR>
		<TELL "[Saved.]">
		<REFRESH-CHECK>)
	       (<EQUAL? .SV 2 3>
		<TURN-OFF-CURSOR>
		<COND (<SCREEN-NEEDS-INIT>
		       <TELL CR "[Restored.]">)
		      (T
		       <TELL CLEAR "[Restored.]">)>
		<REMOVE ,I-CLEAR-SINGLE-MOVE-GRAPHIC>
		<COND (<EQUAL? ,HERE ,END-SESSION-ROOM>
		       <V-CANCEL>)>
		<COND (<BTST <LOWCORE FLAGS> 1>
		       ;"Interpreter was scripting..."
		       <SETG SCRIPTING-FLAG T>
		       <COND (<BTST <LOWCORE FLAGS> 512>
			      <SETG DONT-SCRIPT-INPUT T>)
			     (T
			      <SETG DONT-SCRIPT-INPUT <>>)>)
		      (T
		       <SETG SCRIPTING-FLAG <>>)>
		<REFRESH-CHECK T>)
	       (T
		<TURN-OFF-CURSOR>
		<TELL "[Failed.]">)>
	 <CRLF>
	 <COND (.CAN? <V-CANCEL T>)>
	 <RTRUE>>

<COMMAND RESTORE <> ("OPTIONAL" (CAN? T) "AUX" (FLG <LOWCORE FLAGS>))
	 ;"Added 5/12 to fix apple save/restore screen fuckup; changed 5/24"
	 ;<COND (<APPLE2?>
		<APPLE-SCREEN-0-SHIT>)>
	 ;"Before RESTOREing, save state of D-S-I in bit 9 of FLAGS word..."
	 <COND (,DONT-SCRIPT-INPUT
		<LOWCORE FLAGS <BOR .FLG 512>>)
	       (T
		;"Should be changed"
		<LOWCORE FLAGS <BAND .FLG 511>>)>
	 <TURN-ON-CURSOR>
         <COND (<RESTORE>
	        <TELL "[Ok.]">)
	       (T
		<TURN-OFF-CURSOR>
		<TELL "[Failed.]">)>
	 <REFRESH-CHECK>
	 <COND (.CAN? <V-CANCEL T>)>
	 <RTRUE>>

<GLOBAL SAVED-GAME-ROOM <>>

<GLOBAL GAME-MODE <>>

<GLOBAL SAVED-GAME-MODE <>>

<GLOBAL SAVED-PARTY-COMMANDS <LTABLE 0 0 0 0 0 0>>

<ROUTINE SAVE-PARTY-COMMANDS ()
	 <COPYT ,PARTY-COMMANDS ,SAVED-PARTY-COMMANDS 12>>

<ROUTINE RESTORE-PARTY-COMMANDS ()
	 <COPYT ,SAVED-PARTY-COMMANDS ,PARTY-COMMANDS 12>
	 <PRINT-COLUMNS T>
	 <SETG PUPDATE-FLAG <>>>

<GLOBAL PUPDATE-FLAG <>>
<GLOBAL SMART-DEFAULT-FLAG <>>

<COMMAND GAME <> ("OPTIONAL" (RM ,GAME-ROOM) "AUX" T)
	 <GO-TO-GAME-MODE>
	 <MOVE-TO .RM <> T <>>
	 <CLEAR-FIELDS>
	 <SETG UPDATE-FLAG <>>
	 <RNUL>>

<ROOM GAME-ROOM
      (TRAVEL-COMMANDS SAVE-COMMAND RESTORE-COMMAND
		       END-SESSION-COMMAND CONTROLS-COMMAND)>

<COMMAND RESTART <> ()
	 <RESTART>>

<COMMAND QUIT <> ()
	 <CLEAR -1>
	 <QUIT>>

<COMMAND (END-SESSION END-PLAY) <> ()
	 <MOVE-TO ,END-SESSION-ROOM <> T <>>
	 <RNUL>>

<ROOM END-SESSION-ROOM
      (TRAVEL-COMMANDS SAVE-COMMAND QUIT-COMMAND RESTART-COMMAND NUL-COMMAND)
      (ACTION
       <ACOND ()
	      (SAVE
	       <REMOVE-PARTY-COMMAND ,SAVE-COMMAND>
	       <V-SAVE <>>)>)>

<COMMAND CONTROLS <> ()
	 <COND (<AND ,SCRIPTING-FLAG <BTST <LOWCORE FLAGS> 1>>
		<CHANGE-TRAVEL-COMMAND ,CONTROLS-ROOM
				       ,SCRIPT-ON-COMMAND
				       ,SCRIPT-OFF-COMMAND>)
	       (T
		<SETG SCRIPTING-FLAG <>>
		<CHANGE-TRAVEL-COMMAND ,CONTROLS-ROOM
				       ,SCRIPT-OFF-COMMAND
				       ,SCRIPT-ON-COMMAND>)>
	 <MOVE-TO ,CONTROLS-ROOM <> T <>>
	 <RNUL>>

<COMMAND VERSION <> ()
	 <TELL CR
	  "JOURNEY: Part I of the Golden Age Trilogy." CR>
	 <TELL
	  "Created by Marc Blank" CR>
	 <TELL
	  "Illustrations by Donald Langosy" CR>
	 <TELL
	  "(c) Copyright 1988, 1989 by Infocom, Inc." CR>
	 <TELL
	  "All rights reserved." CR>
	 <TELL
	  "JOURNEY is a trademark of Infocom, Inc." CR>
	 <TELL-GAME-ID>
	 <V-CANCEL T>>

<COMMAND (CHECK-DISK CH\'K-DISK) <> ()
	 <TELL-GAME-ID>
	 <TELL CR "[Verifying.]" CR>
	 <COND (<VERIFY>
		<TELL "Ok.">)
	       (T
		<TELL "** Bad **">)>
	 <V-CANCEL T>>

<COMMAND (SCRIPT-OFF SCR\'T-OFF) <> ()
	 <SETG SCRIPTING-FLAG <>>
	 <DIROUT -2>
	 <V-CANCEL>>

<COMMAND (SCRIPT-ON SCR\'T-ON) <> ()
	 <MOVE-TO ,SCRIPT-ON-ROOM <> T <>>
	 <RNUL>>

<COMMAND COMMANDS <> ()
	 <SETG SCRIPTING-FLAG T>
	 <SETG DONT-SCRIPT-INPUT <>>
	 <DIROUT 2>
	 <REFRESH-CHECK>
	 <V-CANCEL>>

<COMMAND (NO-COMMANDS NO-CMDS) <> ()
	 <SETG SCRIPTING-FLAG T>
	 <SETG DONT-SCRIPT-INPUT T>
	 <DIROUT 2>
	 <REFRESH-CHECK>
	 <V-CANCEL>>

<ROOM SCRIPT-ON-ROOM
      (TRAVEL-COMMANDS COMMANDS-COMMAND NO-COMMANDS-COMMAND NUL-COMMAND)>

<COMMAND REFRESH <> ()
	 <REFRESH-SCREEN T>
	 <V-CANCEL>>

<ROOM CONTROLS-ROOM
      (TRAVEL-COMMANDS SCRIPT-ON-COMMAND REFRESH-COMMAND
		       VERSION-COMMAND CHECK-DISK-COMMAND)>
	 
<COMMAND CANCEL <> ("OPTIONAL" (RT? <>))
	 <MOVE-TO ,SAVED-GAME-ROOM <> <> <>>
	 <MODE ,SAVED-GAME-MODE <> T>
	 <RESTORE-PARTY-COMMANDS>
	 <SETG SMART-DEFAULT-FLAG T>
	 <SETG GAME-MODE <>>
	 <SETG UPDATE-FLAG <>>
	 <PRINT-CHARACTER-COMMANDS>
	 <PRINT-COLUMNS T>
	 <COND (.RT? <RTRUE>)
	       (T <RNUL>)>>

<ROUTINE RNUL ()
	 <SETG ACTION ,NUL-COMMAND>
	 <RTRUE>>

<GLOBAL PARTY-COMMANDS
	<LTABLE
START-COMMAND BACKGROUND-COMMAND HELP-COMMAND NUL-COMMAND GAME-COMMAND>> 

<GLOBAL NAME-TBL <TABLE 0 0 0 0 0 0>>
<GLOBAL TAG-NAME <TABLE 0 0 0 0>>
<GLOBAL TAG-NAME-LENGTH 0>

<CONSTANT ILLEGAL-NAMES
	  <LTABLE <TABLE (STRING LENGTH) "Bergon">
		  <TABLE (STRING LENGTH) "Praxix">
		  <TABLE (STRING LENGTH) "Esher">
		  <TABLE (STRING LENGTH) "Minar">
		  <TABLE (STRING LENGTH) "Hurth">
		  <TABLE (STRING LENGTH) "Umber">
		  <TABLE (STRING LENGTH) "Agrith">
		  <TABLE (STRING LENGTH) "Astrix">>>

<ROUTINE ILLEGAL-NAME? (LEN "AUX" MAX (CNT 0) CNT2 TBL TBL2)
	 <SET MAX <GET ,ILLEGAL-NAMES 0>>
	 <SET TBL <REST ,NAME-TBL 2>>
	 <REPEAT ()
	    <COND (<G? <SET CNT <+ .CNT 1>> .MAX>
		   ;"None matched..."
		   <RFALSE>)
		  (T
		   <SET TBL2 <GET ,ILLEGAL-NAMES .CNT>>
		   <COND (<EQUAL? <GETB .TBL2 0> .LEN>
			  ;"Only check if same length..."
			  <SET TBL2 <REST .TBL2>>
			  <SET CNT2 -1>
			  <REPEAT ()
			     <SET CNT2 <+ .CNT2 1>>
			     <COND (<EQUAL? .CNT2 .LEN>
				    ;"It is illegal..."
				    <RTRUE>)
				   (<NOT <EQUAL? <GETB .TBL2 .CNT2>
						 <GETB .TBL .CNT2>>>
				    ;"Unmatched..."
				    <RETURN>)>>)>)>>>

<COMMAND (CHANGE-NAME CHG-NAME) <>
	 ("AUX" (OFF 0) CHR LN (COL ,NAME-COLUMN) TBL (CNT 0) MAX KBD
	  FG BG)
	 <TURN-ON-CURSOR>	 
	 <COND (<L? ,SCREEN-WIDTH ,8-WIDTH>
		<SET MAX 5>)
	       (T
		<SET MAX 8>)>
	 <SELECT-SCREEN ,COMMAND-WINDOW>
	 <COND (<NOT ,FWC-FLAG>
		<SET FG <WINGET -3 11>>
		<SET BG <LSH .FG -8>>
		<SET FG <ANDB .FG *377*>>)
	       ;(<NOT ,FWC-FLAG>
		<SET KBD <FONT 4>>)>
	 <GCURSET <SET LN <- <+ ,COMMAND-START-LINE <PARTY-PCM ,TAG>> 1>>
		  .COL>
	 <COND (<NOT ,FWC-FLAG>
		<COLOR .BG .FG>
		<ERASE ,NAME-WIDTH-PIX>)
	       (T
		<COND (<NOT ,FONT3-FLAG> <HLIGHT ,H-INVERSE>)>
		<REPEAT ()
		   <COND (<G? <SET CNT <+ .CNT 1>> .MAX>
			  <RETURN>)
			 (T
			  <PRINTC !\_>)>>)>
	 <GCURSET .LN .COL>
	 <SET TBL <REST ,NAME-TBL 2>>
	 <REPEAT ()
		 <COND (<EQUAL? <SET CHR <INPUT 1>> 13>
			<TURN-OFF-CURSOR>
			<COND (<ZERO? .OFF>
			       <COND (<NOT ,FWC-FLAG>
				      <COLOR .FG .BG>)>
			       <SETG UPDATE-FLAG T>
			       <RETURN>)
			      (T
			       <COND (<ILLEGAL-NAME? .OFF>
				      <END-CHANGE-NAME>
				      <TELL
"[The name you have chosen is reserved. Please try again.]" CR>
				      <RTRUE>)>
			       ;"Do the change"
			       <REMOVE-TRAVEL-COMMAND>
			       <ZWSTR ,NAME-TBL .OFF 2 ,TAG-NAME>
			       <PUTP ,TAG-OBJECT ,P?KBD .KBD>
			       <SETG TAG-NAME-LENGTH .OFF>
			       <SETG UPDATE-FLAG T>
			       <COND (<NOT ,FWC-FLAG>
				      <COLOR .FG .BG>)>
			       <END-CHANGE-NAME>
			       <RTRUE>)>)
		       (<EQUAL? .CHR ,DELETE-KEY ,BACK-SPACE ,LEFT-ARROW>
			<COND (<ZERO? .OFF>
			       <SOUND 1>
			       <AGAIN>)
			      (<NOT ,FWC-FLAG>
			       <SET OFF <- .OFF 1>>
			       <COND (<0? .OFF>
				      <GCURSET .LN .COL>
				      <ERASE ,NAME-WIDTH-PIX>)
				     (T
				      <DIROUT 3 ,CENTER-TABLE>
				      <PRINTT .TBL .OFF>
				      <DIROUT -3>
				      <CURSET <GPOS .LN ,CHRV>
					      <+ <GPOS .COL ,CHRH> <LOWCORE TWID>>>
				      <ERASE <- ,NAME-WIDTH-PIX
						<LOWCORE TWID>>>)>)
			      (T
			       <GCURSET .LN .COL>
			       <PRINTC !\->
			       <SET COL <- .COL 1>>
			       <GCURSET .LN .COL>
			       <PRINTC !\->
			       <SET OFF <- .OFF 1>>
			       <GCURSET .LN .COL>)>)
		       (<OR <AND <NOT <L? .CHR !\A>> <NOT <G? .CHR !\Z>>>
			    <AND <NOT <L? .CHR !\a>> <NOT <G? .CHR !\z>>>>
			<COND (<EQUAL? .OFF .MAX>
			       <SOUND 1>
			       <AGAIN>)
			      (<ZERO? .OFF>
			       <COND (<AND <NOT <L? .CHR !\a>>
					   <NOT <G? .CHR !\z>>>
				      <SET CHR <- .CHR 32>>)>
			       <SET KBD .CHR>)
			      (<AND <G? .OFF 0>
				    <AND <NOT <L? .CHR !\A>>
					 <NOT <G? .CHR !\Z>>>>
			       <SET CHR <+ .CHR 32>>)>
			<PUTB .TBL .OFF .CHR>
			<SET OFF <+ .OFF 1>>
			<PRINTC .CHR>
			<COND (,FWC-FLAG
			       <SET COL <+ .COL 1>>
			       <GCURSET .LN .COL>)>)
		       (T <SOUND 1>)>>
	 <END-CHANGE-NAME>
	 <RNUL>>
	 
<ROUTINE END-CHANGE-NAME ("AUX" FOO)
	 <COND (<NOT <APPLE2?>>
		<COND (<NOT ,FONT3-FLAG> <HLIGHT ,H-NORMAL>)>
		<COND (<NOT ,FWC-FLAG>
		       <SET FOO <FONT 1>>)>)>
	 <SELECT-SCREEN ,TEXT-WINDOW>>
