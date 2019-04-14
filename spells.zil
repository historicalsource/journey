"SPELLS for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<GLOBAL DONT-CAST-FLAG <>>

<OBJECT ALWAYS-SPELLS>

<ROUTINE PRAXIX-TOO-DANGEROUS-TO-CAST () 
	 <UNUSE-ESSENCES>
	 <TELL
"Praxix thought to cast the \"" AO "\" spell, but we agreed that the
situation was far too serious to use such a seemingly irrelevant spell.">
	 <CHECK-CAST-LIMIT>>

<GLOBAL DISSIPATION-WARNING <>>

<ROUTINE CHECK-CAST-LIMIT ("AUX" (CL <GETP ,HERE ,P?CAST-LIMIT>))
	 <FSET ,ACTION-OBJECT ,TRIED>
	 <COND (<OR <FSET? ,HERE ,SINGLE-CAST>
		    <EQUAL? .CL 1>>
		<UPDATE-FSET ,HERE ,DONT-CAST>
		<SETG DONT-CAST-FLAG T>)
	       (<G? .CL 1>
		<PUTP ,HERE ,P?CAST-LIMIT <- .CL 1>>)>
	 <RTRUE>>

<ROUTINE DISSIPATION-CHECK ()
	 <COND (<AND <NOT ,DISSIPATION-WARNING>
		     <NOT ,SUBGROUP-MODE>>
		<SETG DISSIPATION-WARNING T>
		<TELL CR CR
"\"Actually,\" Praxix revealed, \"I do not have magical essences in any vast
supply. These experiments may, one day, prove costly, but for now they seem
harmless enough.\"">)>>

<ROUTINE PRAXIX-NO-CAST ()
	 <UNUSE-ESSENCES>
	 <COND (<NOT ,SUBGROUP-MODE>
		<TELL
"Praxix suggested using the \"" AO "\" spell, but " <I/WE 2> " convinced him">)
	       (T
		<TELL
"Praxix' mind, working rapidly, thought of using the \"" AO "\" spell,
but he soon convinced himself">)>
	 <TELL " that it would be a waste of time under the circumstances.">
	 <CHECK-CAST-LIMIT>>

<GLOBAL RED-ROCK-COUNT 3>

<CONSTANT AIRBIT 1>
<CONSTANT FIREBIT 2>
<CONSTANT EARTHBIT 4>
<CONSTANT WATERBIT 8>
<CONSTANT BLUEBIT 16>
<CONSTANT GRAYBIT 32>
<CONSTANT BLACKBIT 64>

<CONSTANT AIROFF 1>
<CONSTANT FIREOFF 2>
<CONSTANT EARTHOFF 3>
<CONSTANT WATEROFF 4>
<CONSTANT BLUEOFF 5>
<CONSTANT GRAYOFF 6>
<CONSTANT BLACKOFF 7>
<CONSTANT EMAX 7>

<GLOBAL ESSENCE-OBJECT-TBL
	<LTABLE ESSENCE-AIR ESSENCE-FIRE ESSENCE-EARTH ESSENCE-WATER
	        REAGENT GRAY-REAGENT BLACK-REAGENT>>

<GLOBAL ESSENCE-CONT-TBL
	<LTABLE ESSENCES ESSENCES ESSENCES ESSENCES REAGENTS REAGENTS REAGENTS>>

<ROUTINE ADD-ESSENCE (OFF AMT)
	 <PUT ,ESSENCE-TBL .OFF <+ <GET ,ESSENCE-TBL .OFF> .AMT>>>

<ROUTINE FIND-ESSENCE (ESS AMT "AUX" (OFF <GETP .ESS ,P?EOFF>))
	 <UPDATE-MOVE .ESS ,ESSENCES>
	 <ADD-ESSENCE .OFF .AMT>
	 <SETG FOUND-ESSENCE T>
	 <QUEUE I-FOUND-ESSENCE 1>>

<GLOBAL FOUND-ESSENCE <>>

;"Reset flag after next move..."

<OBJECT I-FOUND-ESSENCE
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <SETG FOUND-ESSENCE <>>>)>

<GLOBAL ESSENCE-TBL <LTABLE 7 0 9 0 5 3 4>> ;"Start with only AIR and EARTH."

<ROUTINE CHECK-USED-UP-ESSENCES ("AUX" (OFF 1) (FST? <>) ESS)
	 <REPEAT ()
	    <COND (<G? .OFF ,EMAX>
		   <COND (.FST?
			  <TELL
". \"Let us hope we shall ">
			  <COND (<EQUAL? ,PARTY-MODE ,FIGHT-MODE>
				 <TELL "get some good use out of ">)
				(T <TELL "not be needing ">)>
			  <COND (<G? .FST? 1>
				 <TELL "them">)
				(T
				 <TELL "it">)>
			  <TELL ",\" he said, resignedly.">)>
		   <RTRUE>)
		  (<AND <SET ESS <GET ,ESSENCE-OBJECT-TBL .OFF>>
			<FSET? .ESS ,USED-UP>
			<OR <NOT ,SUBGROUP-MODE>
			    <FSET? ,PRAXIX ,SUBGROUP>>
			<NOT <FSET? ,PRAXIX ,BUSY>>>
		   <FCLEAR .ESS ,USED-UP>
		   <COND (<NOT .FST?>
			  <SET FST? 1>
			  <TELL CR CR
"Praxix now turned his thoughts to his magical powders, since his last spell
had used up all of his ">
			  <TELL D .ESS>)
			 (T
			  <SET FST? <+ .FST? 1>>
			  <TELL " and " D .ESS ".">
			  <RTRUE>)>)>
	    <SET OFF <+ .OFF 1>>>>		  
		  
<OBJECT POUCH
	(LOC INVENTORY)
	(SDESC "pouch")
	(FLAGS DONT-TAKE NEVER-DROP DONT-CAST)
	(KBD %<ASCII !\P>)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <COND (<NOT <QSET? ,POUCH ,EXAMINED>>
			<TELL
"The key to Praxix' wizardly powers lay within the badly worn, brown leather
pouch that he carried inside his cloak. This pouch contained his entire stock of
magical essences, with whose help it was possible to conjure up a variety of magical
spells. But these essences were in very limited supply, and one cannot be too harsh
on Praxix for the frequency with which he would assess the quantities of those
in his possession." CR CR>
			<TELL
"He did so now, taking out his pouch and finding">)
		       (T
			<TELL D ,PRAXIX ", ">
			<COND (,FOUND-ESSENCE
			       <TELL
"having just added to his stock of magical essences, took inventory">)
		              (T
			       <TELL
"ever concerned about his magical resources, took out his pouch">)>
			<TELL " and found">)>
		 <COND (<NOT <FIRST? ,ESSENCES>>
			<TELL " not a single speck of magical essence.">)
		       (T
			<TELL-AMOUNTS ,ESSENCES>)>
		 <COND (<FIRST? ,REAGENTS>
			<TELL " In addition, he found">
			<TELL-AMOUNTS ,REAGENTS>)>
		 <RTRUE>)>)>

<ROUTINE TELL-AMOUNTS (OBJ "AUX" (F <FIRST? .OBJ>) AMT)
	 <REPEAT ()
	    <COND (<NOT .F> <TELL "."> <RETURN>)
		  (T
		   <TELL " a ">
		   <TELL <GET ,ESSENCE-AMT-TBL
			      <SET AMT <GET ,ESSENCE-TBL
					    <GETP .F ,P?EOFF>>>>>
		   <TELL " amount of ">
		   <TELL D .F>
		   <COND (<AND <L? ,SCREEN-WIDTH ,12-WIDTH>
			       <NOT <EQUAL? .OBJ ,REAGENTS>>>
			  <TELL " essence">)>
		   <TELL " (enough for ">
		   <TELL <GET ,ESSENCE-AMT-TBL-X .AMT> " spell">
		   <COND (<NOT <EQUAL? .AMT 1>> <TELL "s">)>
		   <TELL ")">
		   <COND (<SET F <NEXT? .F>>
			  <COND (<NEXT? .F>
				 <TELL ",">)
				(T
				 <TELL ", and">)>)>)>>>

<CONSTANT ESSENCE-AMT-TBL
	  <LTABLE "very small" "small" "moderate" "moderate" "fairly large"
		  "fairly large" "large" "large" "very large" "very large" "very large"
		  "very large" "very large" "very large" "disgustingly large"
		  "horrendously large" "hideously large" "bugiferously large">>

<CONSTANT ESSENCE-AMT-TBL-X
	  <LTABLE "one"
		  "two"
		  "three or four"
		  "three or four"
		  "five or six"
		  "five or six"
		  "seven or eight"
		  "seven or eight"
		  "nearly ten"
		  "ten or more"
		  "ten or more"
		  "a dozen or more"
		  "a dozen or more"
		  "a dozen or more"
		  "a dozen or more"
		  "a dozen or more">>
		  
;"Return T if all essences are there. Optionally, can give amount for extra heavy
duty spells (i.e. 2x or 3x normal amount needed...)"

<ROUTINE CHECK-ESSENCES (SPL "OPTIONAL" (AMT 1)
			     "AUX" (OFF 1) (EBITS <GETP .SPL ,P?EBITS>))
	 <REPEAT ()
	    <COND (<EQUAL? .OFF ,EMAX>
		   <RTRUE>)
		  (<AND <BTST .EBITS 1>
			<L? <GET ,ESSENCE-TBL .OFF> .AMT>>
		   <RFALSE>)
		  (T
		   <SET OFF <+ .OFF 1>>
		   <SET EBITS <SHIFT .EBITS -1>>)>>>

"Decrement the amounts of each used essence..."

<ROUTINE UNUSE-ESSENCES ("OPTIONAL" (SPL ,ACTION-OBJECT))
	 <USE-ESSENCES .SPL <>>>

<ROUTINE USE-ESSENCE (ESS "OPTIONAL" (DEC? T) "AUX" (OFF <GETP .ESS ,P?EOFF>) TMP)
	 <SET TMP <GET ,ESSENCE-TBL .OFF>>
	 <COND (.DEC?
		<COND (<EQUAL? .TMP 1>
		       <FSET .ESS ,USED-UP>
		       <UPDATE-REMOVE .ESS>)>
		<PUT ,ESSENCE-TBL .OFF <- .TMP 1>>)
	       (T
		<COND (<ZERO? .TMP>
		       <FCLEAR .ESS ,USED-UP>
		       <UPDATE-MOVE .ESS <GET ,ESSENCE-CONT-TBL .OFF>>)>
		<PUT ,ESSENCE-TBL .OFF <+ .TMP 1>>)>>

<ROUTINE USE-ESSENCES (SPL "OPTIONAL" (DEC? T)
		           "AUX" (OFF 1) (EBITS <GETP .SPL ,P?EBITS>))
	 <REPEAT ()
	    <COND (<EQUAL? .OFF ,EMAX>
		   <RTRUE>)
		  (<BTST .EBITS 1>
		   <USE-ESSENCE <GET ,ESSENCE-OBJECT-TBL .OFF> .DEC?>)> 
	    <SET OFF <+ .OFF 1>>
	    <SET EBITS <SHIFT .EBITS -1>>>>	 

<OBJECT INVISIBLE-SPELL
	(SDESC "Invisibility")
	(8DESC "Invisible")
	(KBD %<ASCII !\I>)
	(TEMP 0) 
	(EBITS 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and took out the red invisibility
powder; there was enough left for at most ">
			 <TELL <GET ,INT-STR ,RED-ROCK-COUNT> " use">
			 <COND (<NOT <EQUAL? ,RED-ROCK-COUNT 1>>
				<TELL "s">)>
			 <TELL ", and this did not seem
like the best situation to waste the precious material.">
			 <CHECK-CAST-LIMIT>)>>)>

<ROUTINE CAST-INVISIBLE ("OPTIONAL" (ZT <>))
	 <SETG RED-ROCK-COUNT <- ,RED-ROCK-COUNT 1>>
	 <COND (<ZERO? ,RED-ROCK-COUNT>
		<UPDATE-REMOVE ,INVISIBLE-SPELL>
		<COND (.ZT
		       <TELL CR CR
"That was the last of the invisibility powder, and we were all sorry
to see it go.">)>)>
	 <RTRUE>> 

<OBJECT WIND-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Wind")
	(TEMP 0)
	(KBD %<ASCII !\W>)
	(EBITS AIRBIT)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and brought forth some air essence.
As he tossed it into the air, a great wind came up, almost knocking
us off our feet. When the wind subsided, " D ,LEADER
" quite reasonably asked, \"What was that for?\"" CR CR>
			 <TELL
"\"What, the wind?\" Praxix replied. \"Oh! Just testing, just
testing.\"">
			 <DISSIPATION-CHECK>
			 <CHECK-CAST-LIMIT>)>>)>

<ROUTINE UNDERGROUND-CHECK ()
	 <COND (<OR <FSET? ,HERE ,UNDERGROUND>
		    <FSET? ,HERE ,INDOORS>>
		<UNUSE-ESSENCES>
		<TELL
"Praxix mused about using his '" D ,ACTION-OBJECT "' spell, but, upon ">
		<COND (,SUBGROUP-MODE
		       <TELL "further consideration, he realized">)
		      (T
		       <TELL "careful questioning, he admitted">)>
		<TELL " that it could not possibly work ">
		<COND (<FSET? ,HERE ,UNDERGROUND>
		       <TELL "underground.">)
		      (T
		       <TELL "indoors.">)>)>>

<OBJECT RAIN-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Rain")
	(TEMP 0)
	(KBD %<ASCII !\R>)
	(EBITS WATERBIT)
	(ACTION
	 <EXECUTE ()
		  <COND (<UNDERGROUND-CHECK> T)
			(<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and brought forth a little bit of
water essence. He cast it into the air, and soon clouds gathered
and a light rain fell on us. It lasted only a minute, but it
was refreshing nonetheless.">
			 <DISSIPATION-CHECK>
			 <CHECK-CAST-LIMIT>)>>)>

<ROUTINE PRE-SPELL ()
	 <COND (<OR <FSET? ,HERE ,DANGEROUS>
		    <FSET? ,SCENE-OBJECT ,DANGEROUS>>
		<PRAXIX-TOO-DANGEROUS-TO-CAST>
		<RTRUE>)
	       (<OR ,SUBGROUP-MODE
		    <EQUAL? ,PRAXIX ,LEADER>
		    <FSET? ,ACTION-OBJECT ,TRIED>>
		<PRAXIX-NO-CAST>
		<RTRUE>)>>

<OBJECT TREMOR-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Tremor")
	(TEMP 0)
	(KBD %<ASCII !\T>)
	(EBITS EARTHBIT)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Praxix reached into his cloak and brought forth some earth essence. ">
			 <COND (<OR <FSET? ,HERE ,UNDERGROUND>
				    <FSET? ,HERE ,ENCLOSED>>
				<TELL
"But then, fearing for the safety of the party, he replaced it.">
				<UNUSE-ESSENCES>)
			       (T
				<TELL
"As he tossed it onto the ground, there was a violent
shaking from within the earth. Fortunately, nobody was hurt by this
display of magical heroics.">
				<DISSIPATION-CHECK>)>
			 <CHECK-CAST-LIMIT>)>>)> 

<OBJECT LEVITATE-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Elevation")
	(TEMP 0)
	(KBD %<ASCII !\E>)
	(EBITS <+ ,EARTHBIT ,AIRBIT>)
	(PRSI
	 <EXECUTE ("AUX" TMP)
		  <COND (<AND <EQUAL? ,HERE ,STAIR-CHASM>
			      <FSET? ,HERE ,BLUE-MIX>>
			 <FIND-OBJECT ,FLOATER>)
			(<AND ,SUBGROUP-MODE
			      <FSET? ,PRAXIX ,SUBGROUP>>
			 <FIND-OBJECT ,HIMSELF-OBJECT>)
			(<AND <EQUAL? ,HERE ,MINE-HOLE>
			      <SET TMP <GET-TEMP>>>
			 <FIND-OBJECT <GETP .TMP ,P?ROBJ>>)
			(<EQUAL? ,HERE ,STORMY-SEAS>
			 <FIND-OBJECT ,TAG-OBJECT>)
			(<EQUAL? ,HERE ,IN-RIVER>
			 <FIND-OBJECT ,RAFT>)
			(<EQUAL? ,HERE ,BOAT>
			 <FIND-OBJECT ,HIMSELF-OBJECT>)
			(T
			 <FIND-PARTY-OBJECTS>)>
		  <COND (<AND <EQUAL? ,HERE ,GOLD-STREAM>
			      <G? <GET-TEMP> 0>>
			 ;"He's not usually an option..."
			 <FIND-OBJECT ,TAG-OBJECT>)>
		  <PRSI-TBL "at">>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(T
			 <TELL
"Perhaps as a joke, Praxix took some air essence and earth essence out
of his cloak, mixed them in his hand, and flung them at " D ,ACTION-PRSI ".">
			 <TELL CR CR
"He scowled as he rose into the air, then (a long minute later) he slowly fell
back to earth, amid a chorus of laughter from the rest of the
party. \"Works like it should!\" Praxix said, proudly. \"Do not be cross!
We may have need for such things!\"">
			 <DISSIPATION-CHECK>
			 <CHECK-CAST-LIMIT>)>>)>

<OBJECT FOG-SPELL
	(SDESC "Fog")
	(TEMP 0)
	(KBD %<ASCII !\F>)
	(EBITS <+ ,WATERBIT ,AIRBIT>)
	(ACTION PRAXIX-DEFAULT-CAST)>

<OBJECT MUD-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Mud")	
	(TEMP 0)
	(KBD %<ASCII !\M>)
	(EBITS <+ ,WATERBIT ,EARTHBIT>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(<AND <NOT <FSET? ,HERE ,ENCLOSED>>
			      <NOT <QSET? ,MUD-SPELL ,EXAMINED>>>
			 <TELL
"Praxix then decided to cast his mud spell, though none of us could quite
fathom why. In any event, he took two powders from his pouch and cast them
at the ground, which soon became a morass of thick, brown sludge." CR CR>
			 <TELL
"\"A little used and much misunderstood spell,\" Praxix said, wiping the ">
			 <TELL-COLOR ,ESSENCE-WATER ,ESSENCE-EARTH>
			 <TELL
" residue from his hands. \"Only occasionally useful, yet always a mess.\"" CR CR>
			 <TELL
"We had no idea what he was talking about, of course, and it seemed best not
to pursue the matter further.">)
			(T
			 <TELL
"Praxix then had the peculiar notion of casting his mud spell">
			 <TELL ", but decided it was a terrible waste of time.">
			 <UNUSE-ESSENCES>)>>)>

<OBJECT LIGHTNING-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Lightning")
	(TEMP 0)
	(KBD %<ASCII !\L>)
	(EBITS <+ ,WATERBIT ,FIREBIT>)
	(PRSI
	 <EXECUTE ()
		  <FIND-OBJECTS ,HERE ,DONT-CAST>
		  <COND (<AND <NOT <FSET? ,HERE ,ENCLOSED>>
			      <NOT <FSET? ,HERE ,INDOORS>>>
			 <FIND-OBJECT ,GROUND>)>
		  <PRSI-TBL "at">>)
	(ACTION
	 <EXECUTE ()
		  <COND (<UNDERGROUND-CHECK> T)
			(<PRE-SPELL> T)
			(<PRSI? GROUND>
			 <TELL
"Praxix raised a finger to the wind, then took a quick glance at the sky.
The rest of us looked on in bewilderment as Praxix
removed some fire and water essences from his pouch and mixed them carefully
in his hand. Finally, he added just the smallest amount of earth essence
and cast the combination into the sky while aiming his staff at a nearby
piece of earth." CR CR>
			 <TELL
"A moment later, the sky was filled with clouds. A dull rumble of
thunder preceded a single bolt of white lightning which smote the ground
at which Praxix' staff was still pointing.">
			 <COND (<NOT <QSET? ,LIGHTNING-SPELL ,INCAPACITATED>>
				<TELL CR CR
"Praxix, proud of his accomplishment, turned to me and said, \"It's
that tiny bit of earth essence that gives the lightning spell its
extra punch!\" Then, he turned to the others and spoke.">)>
			 <TELL CR CR
"\"It's quite exciting to watch,\" he said, \"and sometimes it is
even helpful!\"">
			 <COND (<IN-PARTY? ,ESHER>
				<TELL CR CR
"\"I assume you'll let us know when that is,\" Esher said, derisively.">
				<TELL CR CR
"Praxix frowned and replied, \"I shall make it a point that you are
the first to know.\"">)>
			 <DISSIPATION-CHECK>
			 <FSET ,LIGHTNING-SPELL ,SEEN>
			 <CHECK-CAST-LIMIT>)
			(T
			 <PECULIAR-NOTION "lightning">)>>)>

<ROUTINE PECULIAR-NOTION (STR)
	 <TELL
"Praxix then had the peculiar notion of casting his " .STR " spell">
	 <COND (,ACTION-PRSI
		<TELL " on the " D ,ACTION-PRSI>)>
	 <TELL ", but decided it ">
	 <COND (<PRSI? MOAT-BRIDGE>
		<TELL
"would ruin any chance he might have of reaching the castle grounds">)
	       (T
		<TELL
"was a terrible waste of time">)>
	 <TELL ".">
	 <UNUSE-ESSENCES>
	 ;<FSET ,ACTION-PRSI ,DONT-CAST>>

<ROUTINE PRAXIX-DEFAULT-CAST ()
	 <COND (<OR <FSET? ,HERE ,DANGEROUS>
		    <FSET? ,SCENE-OBJECT ,DANGEROUS>>
		<PRAXIX-TOO-DANGEROUS-TO-CAST>)
	       (T <PRAXIX-NO-CAST>)>>

<OBJECT GROUND
	(SDESC "ground")
	(LOC RANDOM-OBJECTS)
	(KBD %<ASCII !\G>)>	

<OBJECT RANDOM-OBJECTS>

<OBJECT FIRE-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Blaze")
	(TEMP 0)
	(KBD %<ASCII !\B>)
	(EBITS FIREBIT)
	(PRSI
	 <EXECUTE ()
		  <FIND-OBJECTS ,HERE ,DONT-CAST>
		  <FIND-OBJECT ,GROUND>
		  <PRSI-TBL "at">>)
	(ACTION
	 <EXECUTE ()
		  <COND (<PRE-SPELL> T)
			(<OBJECT? GROUND>
			 <TELL
"Praxix took out his fire essence and cast it on the ground before
our feet. The spot burst into a white-hot flame that died out only
a few moments later." CR CR>
			 <TELL
"\"Quite useful,\" Praxix said, mainly to himself. \"Keeping away
dangerous beasts, cooking meals, warming up a cold campsite. One never
knows when a good fire will be needed!\"">
			 <DISSIPATION-CHECK>
			 <CHECK-CAST-LIMIT>)
			(T
			 <PECULIAR-NOTION "blaze">)>>)>	

<OBJECT UNDERGROUND-SPELLS>

<OBJECT LIGHT-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Glow")
	(TEMP 0)
	(KBD %<ASCII !\G>)
	(EBITS <+ ,FIREBIT ,EARTHBIT>)
	(PRSI
	 <EXECUTE ()
		  <FIND-OBJECTS ,PRAXIX-CAST-OBJECTS>
		  <FIND-OBJECTS ,INVENTORY ,DONT-CAST>
		  <FIND-OBJECTS ,HERE ,DONT-CAST>
		  <PRSI-TBL "on">>)
	(ACTION CAST-LIGHT)>

<OBJECT FAR-VISION-SPELL
	(LOC ALWAYS-SPELLS)
	(SDESC "Flare")
	(TEMP 0)
	(KBD %<ASCII !\F>)
	(EBITS <+ ,FIREBIT ,AIRBIT>)
	(ACTION CAST-FAR-VISION)>
		
<GLOBAL WEBBA-MAP-GLOW-LOC 0>

<OBJECT I-CLEAR-WEBBA-MAP-EXAMINE
	(TIME 0)
	(ACTION
	 <EXECUTE ()
		  <COND (<NOT <EQUAL? ,HERE ,WEBBA-MAP-GLOW-LOC>>
			 <REMOVE ,I-CLEAR-WEBBA-MAP-EXAMINE>
			 <UPDATE-FSET ,WEBBA-MAP ,DONT-EXAMINE>)>>)>

<ROUTINE CAST-LIGHT ()
	 <COND (<PRSI? STAFF>
		<COND (<AND <NOT <FSET? ,HERE ,UNDERGROUND>>
			    <NOT <FSET? ,HERE ,NEAR-DARK>>>
		       <COND (<FSET? ,PRAXIX ,LIT>
			      <DONT-WASTE-LIGHT>)
			     (<FSET? ,HERE ,NEAR-DARK>
			      <SETG DARKNESS-CAST? <>>
			      <FSET ,PRAXIX ,LIT>
			      <TELL
"Thinking light might be soon needed, Praxix removed his pouch of essences
and, combining that of earth and fire, applied the mix to his staff, which
started to glow a faint red color.">)
			     (T
			      <TELL
"Presumably for practice, or perhaps out of boredom, Praxix removed his
pouch of magical essences and, combining two of them, applied the resulting
mixture to his staff which started to glow a faint red color.">
			      <SETG DARKNESS-CAST? <>>
			      <COND (<NOT ,SUBGROUP-MODE>
				     <TELL CR CR
"\"Gotten me out of many a tight spot,\" he said without explanation.">)>
			      <FSET ,PRAXIX ,LIT>
			      <DISSIPATION-CHECK>
			      <CHECK-CAST-LIMIT>)>)
		      (<AND <NOT <FSET? ,PRAXIX ,LIT>>
			    <NOT ,SUBGROUP-MODE>>
		       <FSET ,PRAXIX ,LIT>
		       <COND (<FSET? ,HERE ,NEAR-DARK>
			      <TELL
"Praxix now withdrew some earth and fire essences and cast them at his staff,
causing it">)
			     (T
			      <TELL
"You can imagine our surprise when, in this deepest gloom, Praxix' staff
began">)>
		       <TELL
" to glow with a brilliant red light. \"A good thing we found fire essence,\"
Praxix said, blankly. \"I only hope I didn't use too much.\"">
		       <COND (<IN-PARTY? ,ESHER>
			      <TELL CR CR
"\"Some Wizard!\" replied Esher. \"Heaven help us!\"">)>
		       <CHECK-CAST-LIMIT>
		       <COND (<EQUAL? ,HERE ,BERN-I-LAV ,DWARF-MEETING-LOC>
			      <CAVERN-GRAPHIC>)>
		       <RTRUE>)
		      (<NOT <QSET? ,PRAXIX ,LIT>>
		       <TELL
"Praxix now withdrew some earth and fire essences and cast them at his staff,
causing it to glow with a brilliant red light." CR CR>
		       <TELL
"\"Should do nicely,\" he said to himself. \"Very nicely indeed.\"">)
		      (,SUBGROUP-MODE
		       <DONT-WASTE-LIGHT>)
		      (T
		       <TELL
"The light emanating from Praxix' staff appeared fine to us, but
Praxix took more fire and earth essence from his pouch and applied it to the
staff anyway. \"Can't be too sure,\" he said.">
		       <REMOVE ,HYE-GLOW>
		       <CHECK-CAST-LIMIT>)>)
	       (<PRSI? WEBBA-MAP>
		<FCLEAR ,WEBBA-MAP ,DEAD>
		<FSET ,WEBBA-MAP ,SOLVED>
		<UPDATE-FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>
		<SETG WEBBA-MAP-GLOW-LOC ,HERE>
		<QUEUE I-CLEAR-WEBBA-MAP-EXAMINE -1>
		<FSET ,WEBBA-MAP ,ENCHANTED>
		<QUEUE ,I-WEBBA-MAP-GLOW 1>
		<FSET ,ACTION-PRSI ,DONT-CAST>
		<TELL
"I suppose it was only a hunch, but Praxix decided to cast his glow spell on the
map that Webba had given us. Much to our surprise, a chain of runes began to glow,
pointing the way to some unknown place." CR CR>
		<TELL
"\"This solves the mystery of which runes were originally there,\" he said, proudly,
\"though it says nothing of who put it there, and why">
		<COND (<EQUAL? ,HERE ,ASTRIX-MAZE>
		       <TELL ", though I would lay odds it was Astrix himself">)>
		<TELL ".\"">)
	       (<PRSI? GATE-RUNES>
		<FSET ,ACTION-PRSI ,DONT-CAST>
		<TELL
"This sort of thing had worked before, so Praxix took out his magical powders
and cast his glow enchantment on the strange ruins above the gate. The runes
did, in fact, glow more brightly than they had before, yet no other change
occurred - certainly none that we found useful in getting through the gate.">)
	       (T
		<TELL
"Praxix then had the most peculiar notion of casting his glow spell on the "
D ,ACTION-PRSI ", but decided it was a terrible waste of time.">
		<UNUSE-ESSENCES>
		;<FSET ,ACTION-PRSI ,DONT-CAST>)>>

<OBJECT I-WEBBA-MAP-GLOW
	(TIME 0)
	(ACTION
	 <EXECUTE () <FCLEAR ,WEBBA-MAP ,ENCHANTED>>)>

<ROUTINE DONT-WASTE-LIGHT ()
	 <TELL
"Praxix checked his staff, but a usable light was already emanating from
it. Figuring it best not to waste magical essences, he decided against
recharging it with light.">
	 <UNUSE-ESSENCES>
	 <CHECK-CAST-LIMIT>>

<ROUTINE CAST-FAR-VISION ("OPTIONAL" (DFLT? T))
	 <COND (<OR <FSET? ,HERE ,ENCLOSED>
		    <FSET? ,HERE ,INDOORS>>
	        <TELL
"Praxix now considered using his flare spell, but felt it was too dangerous
considering how enclosed our surroundings were.">
		<UNUSE-ESSENCES>
		<RTRUE>)
	       (<NOT <QSET? ,FAR-VISION-SPELL ,SEEN>>
		<TELL
"Praxix raised his arm before him, and from his crooked forefinger shot
a small ball of fire">
		<COND (<FSET? ,HERE ,UNDERGROUND>
		       <TELL
", illuminating the cavern walls as it sped into the gloom.">)
		      (T
		       <TELL
", disappearing into the air before him.">
		       <CHECK-CAST-LIMIT>)>)
	       (<FSET? ,HERE ,UNDERGROUND>
		<TELL
"Praxix, using his flare spell, illuminated the darkness before ">
		<COND (,SUBGROUP-MODE <TELL "him.">)
		      (T <TELL "us.">)>)
	       (T
		<TELL
"Praxix, casting his flare spell, shot a ball of fire into the
distance.">)>
	 <COND (.DFLT?
		<TELL " Unfortunately, ">
		<COND (<FSET? ,HERE ,UNDERGROUND>
		       <TELL "nothing was revealed in the gloom.">)
		      (T
		       <TELL "there was no response, and nothing new
was revealed.">)>)>
	 <RTRUE>>

<CONSTANT UNSTABLE-MIX 0>

<GLOBAL MIX-ESSENCE 0>

<GLOBAL MIX-REAGENT <>>

<COMMAND MIX O-MIX ()
	 <TELL
"Carefully, Praxix mixed the " AO " with an equal amount of ">
	 <TELL D ,ACTION-PRSI ", ">
	 <SETG MIX-ESSENCE ,ACTION-PRSI>
	 <SETG MIX-REAGENT ,ACTION-OBJECT>
	 <COND (<AND <EQUAL? ,MIX-REAGENT ,REAGENT ,BLUE-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-FIRE>>
		<SETG MIXTURE ,SPECIAL-VISION-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,REAGENT ,BLUE-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-WATER>>
		<SETG MIXTURE ,ANIMATE-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,GRAY-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-AIR>>
		<SETG MIXTURE ,FOREBODING-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,GRAY-REAGENT>
		     <EQUAL? ,MIX-ESSENCE ,ESSENCE-FIRE>>
		<SETG MIXTURE ,BEND-WILL-SPELL>)
	       (<AND <EQUAL? ,MIX-REAGENT ,BLACK-REAGENT>
		     <EQUAL? ,HERE ,ZAN-CAVE>>
		<COND (<EQUAL? ,MIX-ESSENCE ,ESSENCE-FIRE>
		       <SETG MIXTURE ,DARKNESS-SPELL>)
		      (<EQUAL? ,MIX-ESSENCE ,ESSENCE-WATER>
		       <SETG MIXTURE ,ILLNESS-SPELL>)
		      (<EQUAL? ,MIX-ESSENCE ,ESSENCE-EARTH>
		       <SETG MIXTURE ,COLD-SPELL>)
		      (T
		       <SETG MIXTURE ,DESPAIR-SPELL>)>)
	       (T
		<SETG MIXTURE ,UNSTABLE-MIX>)>
	 <COND (<AND <EQUAL? ,MIX-REAGENT ,BLACK-REAGENT>
		     <EQUAL? ,MIXTURE ,UNSTABLE-MIX>>
		<UPDATE-REMOVE ,BLACK-REAGENT>
		<TELL "but the strangest thing happened. The mixture
itself, along with the remaining black reagent, simply vanished into the
air." CR CR>
		<COND (<G? ,BLACK-COUNT 0>
		       <TELL
"\"It would appear that without Umber, the mixtures are powerless,\"
Praxix said. \"He possesses a great power, and his magic has harnessed
the very essence of evil! But for what purpose?\"">)>
		<RTRUE>)
	       (<AND ,MIXTURE <FSET? ,MIXTURE ,SEEN>>
		<TELL "and was soon ready to cast the mixture.">)
	       (T
		<COND (,MIXTURE
		       <FSET ,MIXTURE ,SEEN>)>
		<TELL "and was now ready to cast the unknown mix
to see what enchantment it would perform.">)>
	 <SETG MIX-DONE T>
	 <COND (,MIXTURE
		<USE-ESSENCES ,MIXTURE>)
	       (T
		<USE-ESSENCE ,MIX-REAGENT>
		<USE-ESSENCE ,MIX-ESSENCE>)>
	 <FIXUP-PRAXIX-COMMANDS>>

<ROUTINE FIXUP-PRAXIX-COMMANDS ()
	 <COND (<NOT ,MIX-DONE>
		<TRAVEL-COMMANDS ,PRAXIX
				 ,CAST-COMMAND
				 ,MIX-COMMAND
				 ,EXAMINE-COMMAND>)
	       (T
		<TRAVEL-COMMANDS ,PRAXIX
				 ,CAST-COMMAND
				 ,USE-MIX-COMMAND
				 ,EXAMINE-COMMAND>)>>

<GLOBAL MIX-DONE <>>

<COMMAND USE-MIX O-CAST-MIX ()
	 <SETG MIX-DONE <>>
	 <FIXUP-PRAXIX-COMMANDS>
	 <COND (<EQUAL? ,PARTY-MODE ,FIGHT-MODE>
		<CHANGE-CIT ,PRAXIX 2 ,NUL-COMMAND>)>
	 <COND (<EQUAL? ,MIXTURE ,UNSTABLE-MIX>
		<COND (<EQUAL? ,MIX-REAGENT ,GRAY-REAGENT>
		       <FSET ,MIX-ESSENCE ,GRAY-MIX>)
		      (<EQUAL? ,MIX-REAGENT ,BLUE-REAGENT ,REAGENT>
		       <FSET ,MIX-ESSENCE ,BLUE-MIX>)
		      (T
		       <FSET ,MIX-ESSENCE ,BLACK-MIX>)>
		<TELL
"Even as Praxix cast this unknown mixture, it disintegrated into the air." CR CR>
		<COND (,SUBGROUP-MODE
		       <TELL
"\"Blasted powders,\" he said aloud.">)
		      (<NOT <QSET? ,MIX-REAGENT ,TRAPPED>>
		       <TELL
"\"Astrix warned us that some mixtures would be unstable,\" he said,
\"It would appear that he was right.\"">)
		      (T
		       <TELL
"\"Another unstable mixture,\" Praxix said with a sigh.">)>)
	       (T
		<TELL
"Praxix cast his mixture at ">
		<COND (<NOT <EQUAL? ,ACTION-OBJECT
				    ,BERGON-OBJECT
				    ,ESHER-OBJECT
				    ,MINAR-OBJECT>>
		       <TELL "the ">)>
		<TELL  AO ", but nothing appeared to
happen. \"It was worth a try,\" Praxix said, but he was clearly disappointed
with the result.">)>>

<ROUTINE O-CAST-MIX ()
	 <FIND-OBJECTS ,HERE ,DONT-CAST>
	 <FIND-OBJECTS ,PRAXIX-CAST-OBJECTS>>

<OBJECT PRAXIX-CAST-OBJECTS>

<OBJECT STAFF
	(LOC PRAXIX-CAST-OBJECTS)
	(SDESC "staff")
	(KBD %<ASCII !\S>)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? USE-MIX>
		      <NOT <EQUAL? ,MIXTURE ,UNSTABLE-MIX>>>
		 <COND (<EQUAL? ,MIXTURE ,FOREBODING-SPELL>
			;"Dangerous? Foreboding?"
			<FSET ,FOREBODING-SPELL ,ENCHANTED>
			<TELL
"Praxix cast this strange new mixture at his staff, and the oddest
thing happened. Rather than the pale red glow of his \"glow\" spell,
his staff now gave off a ">
			<COND (<FSET? ,HERE ,FORBIDDING>
			       <TELL "deep red glow">)
			      (T
			       <TELL
"dim green glow which was barely perceptible to the eye">)>
			<TELL ".">
			<QUEUE RESET-FOREBODING-OBJ 5>
			<COND (<NOT <QSET? ,STAFF ,ENCHANTED>>
			       <TELL
" We waited a while longer, but nothing further happened.">
			       <REMOVE ,HYE-FOREBODING>
			       <TELL CR CR
"\"Odd,\" Praxix said, \"Either the spell is useless, or it works in a
manner that we have not yet discovered - I wonder which.\"">)>
			<MIXTURE-CAST>
			<RTRUE>) 
		       (T
			<TELL
"Unsure of what to cast the mixture at, Praxix thought to try his staff. Sadly,
though, nothing happened.">
			<MIXTURE-CAST>
			<RTRUE>)>)>)>

<ROUTINE FIND-PARTY-OBJECTS ("AUX" (CNT 0) CHR)
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RETURN>)
		       (<AND <SET CHR <GET ,PARTY .CNT>>
			     <IN-PARTY? .CHR>
			     <NOT <EQUAL? .CHR ,PRAXIX>>
			     <SET CHR <GETP .CHR ,P?ROBJ>>
			     <LOC .CHR> ;"Added 3/15">
			<FIND-OBJECT .CHR>)>>>

<GLOBAL MIXTURE 0>

<OBJECT SPECIAL-VISION-SPELL
	(EBITS <+ ,FIREBIT ,BLUEBIT>)>

<OBJECT ANIMATE-SPELL
	(EBITS <+ ,WATERBIT ,BLUEBIT>)>

<OBJECT FOREBODING-SPELL
	(EBITS <+ ,AIRBIT ,GRAYBIT>)>

<OBJECT BEND-WILL-SPELL
	(EBITS <+ ,FIREBIT ,GRAYBIT>)>

<OBJECT ILLNESS-SPELL
	(EBITS <+ ,WATERBIT ,BLACKBIT>)>

<OBJECT DARKNESS-SPELL
	(EBITS <+ ,FIREBIT ,BLACKBIT>)>

<OBJECT COLD-SPELL
	(EBITS <+ ,EARTHBIT ,BLACKBIT>)>

<OBJECT DESPAIR-SPELL
	(EBITS <+ ,AIRBIT ,BLACKBIT>)>

<OBJECT REAGENT
	(SDESC "reagent")
	;(LOC REAGENTS)
	(KBD %<ASCII !\R>)
	(EOFF 5)
	(PRSI PRSI-ESSENCE)
	(FLAGS DONT-EXAMINE)>

<OBJECT BLUE-REAGENT
	(SDESC "blue reagent")
	(8DESC "blue rgt")
	(KBD %<ASCII !\B>)
	(EOFF 5)
	(PRSI PRSI-ESSENCE)
	(FLAGS DONT-EXAMINE)>

<OBJECT GRAY-REAGENT
	(SDESC "gray reagent")
	(8DESC "gray rgt")
	(KBD %<ASCII !\G>)
	(EOFF 6)
	(PRSI PRSI-ESSENCE)
	(FLAGS DONT-EXAMINE)>

<OBJECT BLACK-REAGENT
	(SDESC "black reagent")
	(12DESC "black rgt.")
	(8DESC "blk rgt")
	(KBD %<ASCII !\G>)
	(EOFF 7)
	(PRSI PRSI-ESSENCE)
	(FLAGS DONT-EXAMINE)>

<ROUTINE PRSI-TBL (STR "AUX" (OBJ1 <>) (OBJ2 <>) (OBJ3 <>) (OBJ4 <>) CNT)
	 <COND (<ZERO? <SET CNT <O-COUNT>>>
		<SETG ACTION-PRSI <>>
		<RTRUE>)
	       (<EQUAL? .CNT 4>
		<PRSI-SETUP <GET ,O-TABLE 1> <GET ,O-TABLE 2> <GET ,O-TABLE 3>
			    <GET ,O-TABLE 4>>)
	       (<EQUAL? .CNT 3>
		<PRSI-SETUP <GET ,O-TABLE 1> <GET ,O-TABLE 2> <GET ,O-TABLE 3>>)
	       (<EQUAL? .CNT 2>
		<PRSI-SETUP <GET ,O-TABLE 1> <GET ,O-TABLE 2>>)
	       (<EQUAL? .CNT 1>
		<PRSI-SETUP <GET ,O-TABLE 1>>)>
	 <COND (<G? .CNT 4>
		<PRSI-INPUT .STR <>>)
	       (T
		<PRSI-INPUT .STR T>)>>

<ROUTINE PRSI-SETUP ("OPTIONAL" OBJ1 OBJ2 OBJ3 OBJ4 "AUX" (CNT 0))
	 <COND (<AND <ASSIGNED? OBJ1>
		     <LOC .OBJ1>>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ1>)>
	 <COND (<AND <ASSIGNED? OBJ2>
		     <LOC .OBJ2>>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ2>)>
	 <COND (<AND <ASSIGNED? OBJ3>
		     <LOC .OBJ3>>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ3>)>
	 <COND (<AND <ASSIGNED? OBJ4>
		     <LOC .OBJ4>>
		<SET CNT <+ .CNT 1>>
		<PUT ,O-TABLE <+ .CNT 5> .OBJ4>)>
	 <PUT ,O-TABLE 5 .CNT>
	 <PUT ,O-TABLE 0 <+ 6 .CNT>>>

<ROUTINE PRSI-ESSENCE ()
	 <CLEAR-O-TABLE>
	 <FIND-OBJECTS ,ESSENCES>
	 <PRSI-TBL "with">>

<OBJECT ESSENCES>

<OBJECT ESSENCE-FIRE
	(LOC ESSENCES)
	(SDESC "fire essence")
	(12DESC "fire")
	(8DESC "fire")
	(EOFF 2)
	(TEMP 2)
	(COLOR 0)
	(MIX-SPELL LIGHT-SPELL FAR-VISION-SPELL TAG-POWDERS LIGHTNING-SPELL)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\F>)>

<OBJECT ESSENCE-WATER
	(LOC ESSENCES)
	(SDESC "water essence")
	(12DESC "water")
	(8DESC "water")
	(EOFF 4)
	(TEMP 3)
	(COLOR 0)
	(MIX-SPELL MUD-SPELL FOG-SPELL LIGHTNING-SPELL TAG-POWDERS)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\W>)>

<OBJECT ESSENCE-AIR
	(LOC ESSENCES)
	(SDESC "air essence")
	(12DESC "air")
	(8DESC "air")
	(EOFF 1)
	(TEMP 1)
	(COLOR 0)
	(MIX-SPELL LEVITATE-SPELL TAG-POWDERS FAR-VISION-SPELL FOG-SPELL)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\A>)>

<OBJECT ESSENCE-EARTH
	(LOC ESSENCES)
	(SDESC "earth essence")
	(12DESC "earth")
	(8DESC "earth")
	(EOFF 3)
	(TEMP 0)
	(COLOR 0)
	(MIX-SPELL TAG-POWDERS LEVITATE-SPELL LIGHT-SPELL MUD-SPELL)
	(PRSI ESSENCE-PRSI)
	(KBD %<ASCII !\E>)>

;"The phony four essences..."

<OBJECT SALT
	;"No initial location..."
	(SDESC "salt")
	(TEMP 4)
	(COLOR 0)>

<OBJECT NUL-ESSENCE-1
	(LOC ESSENCES)
	(SDESC "nul essence")
	(TEMP 5)
	(COLOR 0)>

<OBJECT NUL-ESSENCE-2
	(LOC ESSENCES)
	(SDESC "nul essence")
	(TEMP 6)
	(COLOR 0)>

<OBJECT NUL-ESSENCE-3
	(LOC ESSENCES)
	(SDESC "nul essence")
	(TEMP 7)
	(COLOR 0)>

<ROUTINE ESSENCE-PRSI ()
	 <COND (<OBJECT? ESSENCE-EARTH>
		<PRSI-SETUP ,ESSENCE-AIR ,ESSENCE-FIRE ,ESSENCE-WATER>)
	       (<OBJECT? ESSENCE-AIR>
		<PRSI-SETUP ,ESSENCE-EARTH ,ESSENCE-FIRE ,ESSENCE-WATER>)
	       (<OBJECT? ESSENCE-FIRE>
		<PRSI-SETUP ,ESSENCE-EARTH ,ESSENCE-AIR ,ESSENCE-WATER>)
	       (T
		<PRSI-SETUP ,ESSENCE-EARTH ,ESSENCE-AIR ,ESSENCE-FIRE>)>
	 <PRSI-INPUT "with" T>>

<ROUTINE GET-SPELL (C1 C2 "AUX" TBL E1 E2)
	 <SET E1 <GETP .C1 ,P?ESSENCE>>
	 <SET E2 <GETP .C2 ,P?ESSENCE>>
	 <COND (<OR <NOT <GETPT .E1 ,P?MIX-SPELL>>
		    <NOT <GETPT .E2 ,P?MIX-SPELL>>>
		,TAG-POWDERS)
	       (T
		<SET TBL <GETPT .E1 ,P?MIX-SPELL>>
		<GET .TBL <GETP .E2 ,P?TEMP>>)>>

<ROUTINE TELL-COLOR (E1 E2 "AUX" TBL P1 P2)
	 <SET P1 <GETP .E1 ,P?COLOR>>
	 <SET P2 <GETP .E2 ,P?COLOR>>
	 <COND (<AND <FSET? .P1 ,COARSE>
		     <FSET? .P2 ,COARSE>>
		<TELL "coarse ">)
	       (<AND <NOT <FSET? .P1 ,COARSE>>
		     <NOT <FSET? .P2 ,COARSE>>>
		<TELL "fine ">)
	       (T
		<TELL "medium textured ">)>
	 <SET TBL <GETPT .P1 ,P?MIX-COLOR>>
	 <TELL <GET .TBL <GETP .P2 ,P?TEMP>>>>

<OBJECT REAGENTS>

<GLOBAL NUM-POWDERS 8>

<ROUTINE REMOVE-MISSING-POWDERS ()
	 <EP-CHECK ,ESSENCE-FIRE>
	 <EP-CHECK ,ESSENCE-WATER>
	 <EP-CHECK ,ESSENCE-AIR>
	 <EP-CHECK ,ESSENCE-EARTH>>

<ROUTINE EP-CHECK (ESS)
	 <COND (<NOT <IN? .ESS ,ESSENCES>>
		<SETG NUM-POWDERS <- ,NUM-POWDERS 1>>
		<REMOVE <GETP .ESS ,P?COLOR>>)>>

<ROUTINE O-MIX ()
	 <COND (<EQUAL? ,ACTOR ,TAG>
		<REMOVE-MISSING-POWDERS>
		<FIND-OBJECTS ,TAG-POWDERS>)
	       (<AND <EQUAL? ,HERE ,ZAN-OUTSKIRTS>
		     <FSET? ,HERE ,SEEN>>
		<FIND-OBJECTS ,ESSENCES>)
	       (<FIRST? ,ESSENCES>
		;"Don't have mix option if no essences left..."
		<FIND-OBJECTS ,REAGENTS>)>>

<ROUTINE MIXTURE-CAST ()
	 <SETG MIX-DONE <>>
	 <FIXUP-PRAXIX-COMMANDS>
	 <RTRUE>>

<ROUTINE SAVE-SPELL ("OPTIONAL" (SP ,ACTION-OBJECT))
	 <COND (<NOT <GETPT .SP ,P?TEMP>>
		<TELL "[Error: No Spell TEMP]">)
	       (T
		<PUTP .SP ,P?TEMP <LOC .SP>>
		<UPDATE-MOVE .SP ,SAVED-SPELLS>)>>

<ROUTINE RESTORE-SPELLS ("AUX" F N)
	 <SET F <FIRST? ,SAVED-SPELLS>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (T
			<SET N <NEXT? .F>>
			<UPDATE-MOVE .F <GETP .F ,P?TEMP>>
			<SET F .N>)>>>

<OBJECT SAVED-SPELLS>

<GLOBAL DEMON-COUNT -1>

<OBJECT TAG-POWDERS
	(SDESC "mixture")
	(ACTION
	 <ACOND ()
		(CAST
		 <COND (<AND <EQUAL? ,TAG-SPELL ,LIGHTNING-SPELL>
			     <EQUAL? ,TAG-PINCH ,ESSENCE-EARTH>>
			<GRAPHIC ,G-EVIL-ONE>
			<TELL
"The time seemed right, so I flung the mixture of essences at the Dread
Lord and, as an added touch, I grabbed Praxix' staff and pointed it at him as well. 
The clouds approached, and before the demon could react, a single bolt of
lightning was hurled from the sky, smiting him and the hideous creature that had
borne him here. All that remained was his silver locket, which clattered to
the ground at our feet." CR CR> 
			<TELL
"But as the smoking remains of the Dread Lord rose into the sky, so did another
shape, forming itself from the very ashes. Its face was a pale gray, its eyes a
fiery red." CR CR>
			<TELL
"\"You are fortunate to have defeated me,\" it said in a dark whisper, \"but, after
all, my form was merely flesh and blood, as was the miserable creature that carried
me here.\"" CR CR>
			<TELL
"And then, his eyes turned to me, and his gaze burned my skin.
\"I shall make it a point that we meet again; and then, we shall see...\"
The smoke dissipated, and the voice trailed off into nothingness." CR CR>
			<TELL
"Praxix, having missed the whole thing, now regained consciousness, and
I told him what had happened. Then, I bent down and picked up the demon's locket,
placing it in my pack." CR CR>
			<TELL
"\"Well, well,\" he said, proudly. \"We shall be making a Wizard of
you yet!\"">
			<END-DEMON>)
		       (T
			<SETG DEMON-COUNT 10>
			;"More than enough..."
			<HINT ,HINT-MAGIC>
			<TELL
"As soon as the mixture left my fingertips, I knew I had failed. For
what happened was that ">
			<COND (<EQUAL? ,TAG-SPELL ,LIGHTNING-SPELL>
			       <TELL
"the clouds gathered slowly, and a few small bolts of lightning appeared,
though they did not nearly reach the earth.">) 
			      (<EQUAL? ,TAG-SPELL ,LEVITATE-SPELL>
			       <TELL
"the demon rose into the air! I had cast a spell of elevation
on him, and he merely laughed at my futile effort.">)
			      (<EQUAL? ,TAG-SPELL ,MUD-SPELL>
			       <TELL
"the ground before us turned soft and squishy; I had a mud producing
spell, and the demon laughed hideously at my ridiculous effort.">)
			      (<EQUAL? ,TAG-SPELL ,LIGHT-SPELL>			    
			       <TELL
"the demon's cape started to glow faintly - I had cast the glow spell
my mistake!">)
			      (<EQUAL? ,TAG-SPELL ,FOG-SPELL>
			       <TELL
"a thick fog started to form around us; the demon blew it away with a
powerful breath! I had prepared the wrong mixture!">)
			      (<EQUAL? ,TAG-SPELL ,FAR-VISION-SPELL>
			       <TELL
"a fireball flew from my fingertips, passing the demon by harmlessly -
in my haste, I had prepared the wrong mixture!">)
			      (T
			       <TELL "nothing whatever happened.">)>)>)>)>

<GLOBAL TAG-SPELL <>>

;<GLOBAL TAG-COLOR <>>

<GLOBAL TAG-PINCH <>>

<ROUTINE TAG-POWDER-MIX ("AUX" OFF)
	 <COND (<ACTION? MIX>
		<SET OFF <GETP ,ACTION-PRSI ,P?TEMP>>
		;<SETG TAG-COLOR <GET <GETPT ,ACTION-OBJECT ,P?MIX-COLOR> .OFF>>
		<SETG TAG-SPELL <GET-SPELL ,ACTION-OBJECT ,ACTION-PRSI>>
		<REMOVE ,ACTION-OBJECT>
		<REMOVE ,ACTION-PRSI>
		<TELL
"Trying not to attract the attention of the demon, I quietly mixed
roughly equal amounts of the " AO " powder and the " D ,ACTION-PRSI " powder,
hoping the resulting combination would create a powerful lightning spell.
In any event, I would soon find out.">
		;"No PRSI action here..."
		<PUTP ,TAG-C-RED-POWDER ,P?PRSI <>>
		<PUTP ,TAG-C-BLUE-POWDER ,P?PRSI <>>
		<PUTP ,TAG-C-YELLOW-POWDER ,P?PRSI <>>
		<PUTP ,TAG-C-WHITE-POWDER ,P?PRSI <>>
		<PUTP ,TAG-RED-POWDER ,P?PRSI <>>
		<PUTP ,TAG-BLUE-POWDER ,P?PRSI <>>
		<PUTP ,TAG-YELLOW-POWDER ,P?PRSI <>>
		<PUTP ,TAG-WHITE-POWDER ,P?PRSI <>>
		<TRAVEL-COMMANDS ,TAG ,CAST-COMMAND ,ADD-PINCH-COMMAND>)>>

<COMMAND ADD-PINCH O-ADD-PINCH ()
	 <SETG TAG-PINCH <GETP ,ACTION-OBJECT ,P?ESSENCE>>
	 <TRAVEL-COMMANDS ,TAG ,CAST-COMMAND>
	 <TELL
"Then, I added to the mixture just the smallest pinch of the " AO " powder.">>

<ROUTINE O-ADD-PINCH ("AUX" F)
	 <FIND-OBJECTS ,TAG-POWDERS>
	 <RTRUE>>

<OBJECT TAG-C-RED-POWDER
	(LOC TAG-POWDERS)
	(SDESC "coarse red")
	(8DESC "crs red")
	(FLAGS COARSE)
	(KBD %<ASCII !\R>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 0)
	(ESSENCE 0)
	(MIX-COLOR "red" "violet" "orange" "pink")
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-RED-POWDER
	(LOC TAG-POWDERS)
	(SDESC "fine red")
	(KBD %<ASCII !\R>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 0)
	(ESSENCE 0)
	(MIX-COLOR "red" "violet" "orange" "pink")
	(ACTION TAG-POWDER-MIX)> 

<OBJECT TAG-C-BLUE-POWDER
	(LOC TAG-POWDERS)
	(SDESC "coarse blue")
	(8DESC "crs blue")
	(FLAGS COARSE)
	(KBD %<ASCII !\B>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 1)
	(ESSENCE 0)
	(MIX-COLOR "violet" "blue" "green" "pale blue")
	(ACTION TAG-POWDER-MIX)>
 
<OBJECT TAG-BLUE-POWDER
	(LOC TAG-POWDERS)
	(SDESC "fine blue")
	(KBD %<ASCII !\B>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 1)
	(ESSENCE 0)
	(MIX-COLOR "violet" "blue" "green" "pale blue")
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-C-YELLOW-POWDER
	(LOC TAG-POWDERS)
	(SDESC "coarse yellow")
	(12DESC "crs. yellow")
	(8DESC "crs yell")
	(FLAGS COARSE)
	(KBD %<ASCII !\Y>)
	(TEMP 2)
	(ESSENCE 0)
	(MIX-COLOR "orange" "green" "yellow" "pale yellow")
	(PRSI PRSI-TAG-POWDERS)
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-YELLOW-POWDER
	(LOC TAG-POWDERS)
	(SDESC "fine yellow")
	(8DESC "fin yell")
	(KBD %<ASCII !\Y>)
	(TEMP 2)
	(ESSENCE 0)
	(MIX-COLOR "orange" "green" "yellow" "pale yellow")
	(PRSI PRSI-TAG-POWDERS)
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-C-WHITE-POWDER
	(LOC TAG-POWDERS)
	(SDESC "coarse white")
	(8DESC "crs white")
	(FLAGS COARSE)
	(KBD %<ASCII !\W>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 3)
	(ESSENCE 0)
	(MIX-COLOR "pink" "pale blue" "pale yellow" "white")
	(ACTION TAG-POWDER-MIX)>

<OBJECT TAG-WHITE-POWDER
	;"No initial location..."
	(SDESC "fine white")
	(8DESC "fin white")
	(KBD %<ASCII !\W>)
	(PRSI PRSI-TAG-POWDERS)
	(TEMP 3)
	(ESSENCE 0)
	(MIX-COLOR "pink" "pale blue" "pale yellow" "white")
	(ACTION TAG-POWDER-MIX)>

<ROUTINE PRSI-TAG-POWDERS ()
	 <REMOVE ,ACTION-OBJECT>
	 <FIND-OBJECTS ,TAG-POWDERS>
	 <MOVE ,ACTION-OBJECT ,TAG-POWDERS>
	 <PRSI-TBL "with">>

