"COMMON for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<ROUTINE SKIP-BITE-FOREST ()
	 <TELL CR CR
"The warm afternoon air lifted our hearts, and we were soon marching
eastward again through the towering forest. Before long, we came upon
the shore of a great river." CR CR>
	 <TELL
"\"We are nearly there,\" Praxix said, gazing ahead at the Sunset
Mountain and the mysterious tower that stood precariously atop it.">
	 <MOVE-TO ,RIVER-2>>

<GLOBAL E-INBUF <ITABLE LEN 50>>
<GLOBAL E-LEXV <ITABLE LEN 100>>
<GLOBAL E-TEMP <ITABLE 50 0>>
<GLOBAL E-TEMP-LEN 0>

<ROUTINE MASSAGE-ELVISH (MAX "AUX" (TOFF 0) (IOFF 2) CHR)
	 <REPEAT ()
	    <COND (<L? <SET MAX <- .MAX 1>> 0>
		   <PUTB ,E-INBUF 1 <- .IOFF 2>>
		   <RTRUE>)
		  (T
		   <SET CHR <GETB ,E-TEMP .TOFF>>
		   <COND (<EQUAL? .CHR !\'> T)
			 (T
			  <COND (<AND <NOT <L? .CHR !\A>>
				      <NOT <G? .CHR !\Z>>>
				 <SET CHR <+ .CHR 32>>)
				(<EQUAL? .CHR !\- !\,>
				 <SET CHR 32>)>
			  ; "Lowercase for LEX"
			  <PUTB ,E-INBUF .IOFF .CHR>
			  <COND (<0? .TOFF>
				 ; "But uppercase first letter ONLY in E-TEMP,
				    for later display."
				 <COND (<AND <G=? .CHR !\a>
					     <L=? .CHR !\z>>
					<SET CHR <- .CHR 32>>)>)>
			  <PUTB ,E-TEMP .TOFF .CHR>
			  <SET IOFF <+ .IOFF 1>>)>
		   <SET TOFF <+ .TOFF 1>>)>>>
		   
<ROUTINE READ-ELVISH ("OPTIONAL" (ACT ,TAG)
		      "AUX" (OFF 0) CHR LN (COL ,COMMAND-OBJECT-COLUMN)
		            TBL (CNT 0) MAX FG BG POS OLD-X (MAX-X 1000)
			    CUR-X)
	 <TURN-ON-CURSOR>
	 <CLEAR-FIELDS>
	 <PUTB ,E-LEXV 0 20>
	 <PUTB ,E-INBUF 0 50>
	 <COND (<NOT ,FWC-FLAG>
		; "Don't let the loser type off the screen"
		<SET MAX-X <- <LOWCORE HWRD> <TEXT-WIDTH "W">>>)>
	 <SET MAX <- <- ,SCREEN-WIDTH ,COMMAND-OBJECT-COLUMN> 2>>
	 <SELECT-SCREEN ,COMMAND-WINDOW>
	 <SET LN <- <+ ,COMMAND-START-LINE <PARTY-PCM .ACT>> 1>>
	 <GCURSET .LN ,CHR-COMMAND-COLUMN>
	 <PRINTI "says...">
	 <COND (<NOT ,FWC-FLAG>
		<SET FG <WINGET -3 11>>
		<SET BG <LSH .FG -8>>
		<SET FG <ANDB .FG *377*>>)
	       ;(<NOT ,FWC-FLAG>
		<SET CHR <FONT 4>>)>
	 <GCURSET .LN .COL>	 
	 <COND (<NOT ,FWC-FLAG>
		<CURGET ,CURGET-TABLE>
		<SET POS <ZGET ,CURGET-TABLE 1>>
		<SET CUR-X .POS>
		<COLOR .BG .FG>
		<ERASE ,COMMAND-WIDTH-PIX>)
	       (T
		<REPEAT ()
		   <COND (<G? <SET CNT <+ .CNT 1>> .MAX>
			  <RETURN>)
			 (T
			  <PRINTC !\_>)>>
		<GCURSET .LN .COL>)>
	 <SET TBL ,E-TEMP>
	 <REPEAT ()
		 <COND (<EQUAL? <SET CHR <INPUT 1>> 13>
			<COND (<NOT ,FWC-FLAG>
			       <COLOR .FG .BG>
			       ; "Make sure we don't leave any crap in the
				  right-hand column"
			       <CURSET <GPOS .LN ,CHRV> ,RIGHT-COLUMN-LEFT-EDGE>
			       <ERASE ,RIGHT-COLUMN-WIDTH>)
			      ;(<NOT ,FWC-FLAG>
			       <SET CHR <FONT 1>>)>
			<REFRESH-CHARACTER-COMMAND-AREA <- ,COMMAND-START-LINE 1>>
			<TURN-OFF-CURSOR>
			<SETG UPDATE-FLAG T>
			<SELECT-SCREEN ,TEXT-WINDOW>
			<COND (<ZERO? .OFF>
			       <RFALSE>)
			      (T
			       ;"Do the change"
			       <MASSAGE-ELVISH .OFF>
			       <SETG E-TEMP-LEN .OFF>
			       <LEX ,E-INBUF ,E-LEXV>			
			       <COND (<ZERO? <GETB ,E-LEXV 1>>
				      <RFALSE>)
				     (<EQUAL? .ACT ,PRAXIX ,BERGON>
				      <RTRUE>)
				     (T
				      <PARSE-ELVISH>
				      <RTRUE>)>)>)
		       (<EQUAL? .CHR ,DELETE-KEY ,BACK-SPACE ,LEFT-ARROW>
			<COND (<ZERO? .OFF>
			       <SOUND 1>
			       <AGAIN>)
			      (<NOT ,FWC-FLAG>
			       <SET OFF <- .OFF 1>>
			       <COND (<0? .OFF>
				      <CURSET <GPOS .LN ,CHRV> .POS>
				      <SET CUR-X .POS>
				      <ERASE ,COMMAND-WIDTH-PIX>)
				     (T
				      <DIROUT 3 ,CENTER-TABLE>
				      <PRINTT .TBL .OFF>
				      <DIROUT -3>
				      ;"Get width of what's now in buffer"
				      <SET OLD-X <+ .POS <LOWCORE TWID>>>
				      ;"Hence OLD-X is new X position"
				      <CURSET <GPOS .LN ,CHRV> .OLD-X>
				      <COND (<L=? <- .CUR-X .OLD-X> 1>
					     <ERASE 2>)
					    (T
					     <ERASE <- .CUR-X .OLD-X>>)>
				      ;"Hence erase a few pixels"
				      <SET CUR-X .OLD-X>)>)
			      (T
			       <GCURSET .LN .COL>
			       <PRINTC !\_>
			       <SET COL <- .COL 1>>
			       <GCURSET .LN .COL>
			       <PRINTC !\_>
			       <SET OFF <- .OFF 1>>
			       <GCURSET .LN .COL>)>)
		       (T
			<COND (<OR <EQUAL? .OFF .MAX>
				   <BAD-ELVISH-CHARACTER? .CHR>
				   <AND <NOT ,FWC-FLAG>
					<G=? .CUR-X .MAX-X>>>
			       <SOUND 1>
			       <AGAIN>)>			
			<PRINTC .CHR>
			<PUTB .TBL .OFF .CHR>
			<SET OFF <+ .OFF 1>>
			<COND (,FWC-FLAG
			       <SET COL <+ .COL 1>>
			       <GCURSET .LN .COL>)
			      (T
			       <CURGET ,CURGET-TABLE>
			       <SET CUR-X <ZGET ,CURGET-TABLE 1>>)>)>>
	 ;<COND (<NOT ,FWC-FLAG>
		<SET CHR <FONT 1>>)>
	 <SELECT-SCREEN ,TEXT-WINDOW>
	 <RNUL>>

<ROUTINE BAD-ELVISH-CHARACTER? (CHR)
	 <COND (<AND <NOT <L? .CHR !\A>>
		     <NOT <G? .CHR !\Z>>>
		<RFALSE>)
	       (<AND <NOT <L? .CHR !\a>>
		     <NOT <G? .CHR !\z>>>
		<RFALSE>)
	       (<OR <EQUAL? .CHR 32 !\' !\->
		    <EQUAL? .CHR !\. !\, !\?>>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<GLOBAL SPOKE-ELVISH <>>

<ROUTINE MAKE-TAG-SUBGROUP ("OPTIONAL" (STO <>))
	 <MAKE-SUBGROUP ,TAG>
	 <COND (.STO <SAVE-TAG-OBJECTS>)>
	 <TRAVEL-COMMANDS ,TAG ,EXAMINE-COMMAND>>

<ROUTINE RESTORE-TAG-OBJECTS ()
	 <REMOVE-ALL ,SAVED-TAG-OBJECTS ,INVENTORY>
	 <COND (<LOC ,TORCH> <UPDATE-REMOVE ,TORCH>)>
	 <RTRUE>>

<ROUTINE SAVE-TAG-OBJECTS ()
	 <REMOVE-ALL ,INVENTORY ,SAVED-TAG-OBJECTS>>

<OBJECT SAVED-TAG-OBJECTS>

<ROUTINE RESTORE-TAG-COMMANDS ()
	 <TRAVEL-COMMANDS ,TAG
			  ,PICK-UP-COMMAND
			  ,DROP-COMMAND
			  ,INVENTORY-COMMAND>>

<ROUTINE N-DAY-TREK (NUM)
	 <NEXT-DAY .NUM>
	 <TELL
"The next morning, we started the long trek back to Astrix' Tower,
and I'm happy to report that we arrived there ">
	 <COND (<EQUAL? .NUM 1> <TELL "the next day">)
	       (T
		<TELL <GET ,INT-STR .NUM>>
		<TELL " days later">)>
	 <TELL " without serious incident." CR CR>
	 <RETURN-TO-ASTRIX-TOWER>>

<CONSTANT INT-STR
	  <LTABLE "one" "two" "three" "four" "five" "six" "seven" "eight" "nine">>

<ROUTINE RETURN-TO-ASTRIX-TOWER ("OPTIONAL" (FAIL <>)
				 "AUX" (CNT <+ ,PASS-1-STONES <STONE-COUNT>>))
	 <GRAPHIC ,G-ASTRIX>
	 <COND (.FAIL
		<TELL "Astrix now looked grave.">)
	       (<FSET? ,STAIR-BOTTOM ,SEEN>
		<TELL
"Astrix greeted us heartily when we returned. \"How has your journey
gone? What news have you found?\" he asked.">
		<COND (<G? .CNT ,PASS-1-STONES>
		       <TELL CR CR
			     "We told him of our doings, and showed him the stone">
		       <COND (<G? <- .CNT ,PASS-1-STONES> 1>
			      <TELL "s">)>
		       <TELL " we had obtained." CR CR>
		       <COND (<EQUAL? .CNT 3>
			      <ASTRIX-SHOWS-STONE>
			      <RTRUE>)
			     (T
			      <TELL
" \"This is good,\" he said, but he looked disappointed.">)>)
		      (T
		       <TELL CR CR
"We told Astrix of our adventures, but he was evidently disappointed.">)>)>
	 <TELL
" \"I am afraid we will need the three Stones,\" he said, \"if we are to
defeat the Enemy.\"" CR CR>
	 <TELL
"\"Three stones?\" I said, quizzically, \"You said there were four
Sisters?\"">
	 <TELL CR CR
"\"And so there are,\" Astrix said, holding out a fiery red stone. \"This is
the Wizard Stone! I had hoped it would be of use in our war against the "
	       ,BAD-GUY ".\"" CR CR> 
	 <PART-ONE-BAD-ENDING>>

<ROUTINE PART-ONE-BAD-ENDING ("OPTIONAL" (ONE? <>))
	 <TELL
"\"I fear we are now without hope.">
	 <COND (.ONE? <TELL " The Anvil is beyond our grasp!">)>
	 <TELL
" Get back to your lands that you may join your families before the Storm
arrives!\"" CR CR>
	 <TELL
"And then, from the north, came a mocking laugh carried on an icy wind.
We covered our ears, but Astrix ran to his high balcony and cursed the "
,BAD-GUY " in the languages of old. But the laugh was not stilled;
and Astrix, overcome by a great madness, leapt from his great tower and
plunged to his death....">
	 <GRAPHIC ,G-ASTRIX-LEAPS>
	 <BAD-ENDING>>

<CONSTANT I-SIT-ALONE
"I often sit alone and think of those days; and I long to know what has
become of my many friends who have long since fled across the southern
seas. I do not know for whom I write this chronicle, yet it seems
best that it be told, for soon there will be none who can remember,
none who can dream of what was, and someday yet will be.">

<ROUTINE ENDING ()
	 <TELL "[The End]" CR>
	 <CLEAR-SUBGROUP>
	 <UPDATE-FCLEAR ,TAG ,SHADOW>
	 <SETG SUBGROUP-MODE T>
	 <MOVE-TO ,ENDING-ROOM>>

<ROOM ENDING-ROOM
      (TRAVEL-COMMANDS QUIT-COMMAND RESTORE-COMMAND RESTART-COMMAND MUSINGS-COMMAND)
      (ENTER
       <EXECUTE ()
		<COND (<NOT ,GAME-WON?>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,GAME-COMMAND>)>
		<COND (<AND <NOT ,GAME-WON?> <NOT <FIRST? ,HINTS>>>
		       <REMOVE-TRAVEL-COMMAND ,HERE ,MUSINGS-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (RESTORE
	       ;"Don't go through V-CANCEL if fails..."
	       <V-RESTORE <>>)>)>

<GLOBAL KILLED-TBL <TABLE 0 0 0 0 0>>

<ROUTINE KILLED-OFF (CHR "AUX" TMP)
	 <PARTY-REMOVE .CHR>
	 <ADD-TO-LTABLE ,KILLED-TBL .CHR>>

<ROUTINE ASTRIX-SHOWS-STONE ()
	 <GRAPHIC <> ,G-FOUR-STONES ,BOTTOM-LEFT>
	 <UPDATE-FCLEAR ,WEBBA-MAP ,DONT-DROP>
	 <TELL
"As Astrix took the three stones, it seemed they were bathed in a warm red
light, as if from a glowing ember. \"I have some surprises of my own,\"
he said, and revealed to us the glowing Wizard Stone, which he had
long possessed. \"It is beautiful, is it not, " TAG "? Not since the day
it was cut from the living earth has such a sight been witnessed!\"" CR CR>
	 <COND (<AND <G? ,PARTY-MAX 3>
		     <IN-PARTY? ,BERGON>>
		<TELL
"Astrix turned silent and stared into the glowing Stones. When, at last,
the trance was broken, he spoke again. \"The Two are revealed to me; one
lies deep within the earth, the other in an Elvish place - very old, and
long forgotten. More than that, I cannot say.\"" CR CR> 
		<COND (<EQUAL? ,PARTY-MAX 5>
		       <PARTY-REMOVE ,MINAR>
		       <TELL
"Minar now spoke. \"I am grateful that you have allowed me to journey with
you to this place,\" he began, \"but I must return now to the plains, for
there is much to be done. At the least, I shall report to the people on your
safe arrival at the Sunrise Tower! Good luck to you all; perhaps our paths
shall cross again.\" And, though we tried to persuade him otherwise, Minar
turned and left Astrix' high tower and started on the lonely road toward
home." CR CR>)>
		<START-PART-TWO>)
	       (T
		<TELL
"\"Yes, you have all done well, but perhaps not well enough, for you have lost
enough of your party that the search for the remaining Stones is pointless. For
it is told in Legend that Five shall unite the Six Stones which shall lead them
to the Anvil.\"" CR CR>
		<PART-ONE-BAD-ENDING>)>>

<ROUTINE BAD-ENDING ()
	 <DIVIDER>
	 <TELL ,I-SIT-ALONE CR CR>
	 <ENDING>>

<ROUTINE PART-TWO-TOO-FEW ()
	 <TELL
"Only Praxix and I were left, and our only consolation was that the terrain
was familiar; we were only a few miles below the falls we had seen earlier on
our journey, not far from the Sunrise Mountain. And so we returned to Astrix;
his face was grim.">
	 <COND (<IN? ,SPIRIT-STONE ,INVENTORY>
		;"??"
		<TELL CR CR
"\"It is good that you have found the fifth Stone, but your party has been
devastated,\" he said. ">)>
	 <PART-ONE-BAD-ENDING>>

<ROUTINE PART-TWO-ENDING ()
	 <GRAPHIC ,G-ASTRIX>
	 <TELL CR CR
"Astrix, pleased at our return, sat impassively as we gave a detailed account
of our adventures. When we finished, he expressed his ">
	 <COND (<AND <IN? ,SPIRIT-STONE ,INVENTORY>
		     <IN? ,SIXTH-STONE ,INVENTORY>>
		<TELL
"delight that we had found the Two stones." CR CR>
		<COND (<L? ,PARTY-MAX 5>
		       <TELL
"\"But this is not enough,\" Astrix said. \"The last stone, the Anvil,
will be the most difficult to obtain, and the Legend says that the Five shall,
having united the Six Stones, be led to the Anvil. Alas that you have come so far
only to be defeated at the end!\"" CR CR>
		       <PART-ONE-BAD-ENDING T>)
		      (T
		       <TELL
"\"I believe, for the first time, that we may be able to end the Darkness
that comes from the north,\" Astrix said. \"The Sisters we have, and the
Two; one last task awaits you!\"" CR CR>
		       <MOVE-TO ,THREE-CONNECTOR>)>)
	       (T
		<TELL "disappointment that we had not fared better." CR CR>
		<COND (<OR <IN? ,SPIRIT-STONE ,INVENTORY>
			   <IN? ,SIXTH-STONE ,INVENTORY>>
		       <TELL
"\"You have done well to find even one of the Two, but I fear it is
not">)
		      (T
		       <TELL
"\"You have failed in bringing back the Two; even had you brought one of them,
I fear it would not be">)>
		<TELL " enough,\" Astrix said. ">
		<PART-ONE-BAD-ENDING>)>>

<ROUTINE TELL-WITH-COMMAS (TBL "AUX" (CNT <GET .TBL 0>) (OFF 1) OBJ)
	 <REPEAT ()
		 <TELL " ">
		 <SET OBJ <GET .TBL .OFF>>
		 <TELL D .OBJ>
		 <COND (<EQUAL? .CNT 1> <RETURN>)
		       (<EQUAL? .CNT 2>
			<TELL " and">)
		       (T
			<TELL ",">)>
		 <SET CNT <- .CNT 1>>
		 <SET OFF <+ .OFF 1>>>>