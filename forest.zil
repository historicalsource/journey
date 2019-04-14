"FOREST for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT FOREST>

<GLOBAL BITE-VICTIM <>>
<GLOBAL BITE-VICTIM-OBJECT <>>

<ROUTINE MOVE-TO-FOREST-RIDGE ()
	 <TELL
"Looking back, we could follow the long canyon path back to the horizon,
where I imagined I could see the fork just beyond Lavos. But the view ahead
filled us with astonishment, for a vast forest stretched out before us, thick
with pine, fir, and redwood. Beyond the forest, a wide river flowed from the
north, disappearing into deep canyons to the south. And beyond the forest, the
Sunrise Mountain, its jagged peak towering high above the surrounding mountains." CR CR>
	 <TELL
"\"Magnificent!\" Praxix said. \"We stand before the Old Forest!\"" CR CR>
	 <TELL
"\"I have heard many a tale of the Old Forest,\" I said with a smile, reminiscing
of the fanciful tales oft told about the forest." CR CR>
	 <TELL
"\"I too have heard tales,\" Praxix replied, gravely. \"But judging by the comical
look on your face, I suspect we have not heard the same ones.\"" CR CR> 
	 <UPDATE-MOVE ,TALE-ELVES ,PRAXIX-TALES>
	 <NEXT-DAY>
	 <NEXT-DAY>
	 <TELL
"It was now dark and after a hearty meal we slept. I dreamed of the
forest that night, of brightly colored birds, and of the beautiful Wood
Elves from the stories of my childhood. The next day, we rose with
the sun." CR CR>
	 <TELL
"The morning was still and hazy, and we started toward the forest with
great eagerness. Praxix spotted a wide path which headed due east
toward the Sunrise Mountain, and we spent a glorious morning
beneath tall trees and a blue sky. Around midday, we came to a small
clearing, where we decided to stop for lunch.">
	 <COND (<NOT <FSET? ,STAIR-BOTTOM ;,DWARF-MEETING ,SEEN>>
		<SKIP-BITE-FOREST>)
	       (T
		<MOVE-TO ,BITE-FOREST>)>>

<ROOM BITE-FOREST
      (TRAVEL-COMMANDS COMB-AREA-COMMAND SPLIT-UP-COMMAND NUL-COMMAND)
      (FLAGS ADVISE DONT-SCOUT DANGEROUS)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <QSET? ,HERE ,SEEN>>
		       <COND (<IN-PARTY? ,MINAR>
			      <SETG BITE-VICTIM ,MINAR>
			      <SETG BITE-VICTIM-OBJECT ,MINAR-OBJECT>)
			     (<IN-PARTY? ,ESHER>
			      <SETG BITE-VICTIM ,ESHER>
			      <SETG BITE-VICTIM-OBJECT ,ESHER-OBJECT>)
			     (T
			      <SKIP-BITE-FOREST>
			      <RTRUE>)>
		       <GRAPHIC ,G-NIGHTFANG>
		       <TELL CR CR
"And then, without warning, a large snake lunged at ">
		       <TELL D ,BITE-VICTIM ", grabbing him by the
leg. ">
		       <COND (<IN-PARTY? ,BERGON>
			      <TELL "Bergon">)
			     (T
			      <TELL D ,BITE-VICTIM>)>
		       <TELL
", reacting instinctively, killed the snake with a single blow
of his sword">
		       <COND (<IN-PARTY? ,BERGON>
			      <TELL "; " D ,BITE-VICTIM>)
			     (T
			      <TELL " and">)>
		       <TELL " collapsed against a tree." CR CR>
		       <TELL
"\"The snake,\" he started, grimacing with pain. \"Nightfang....\" His
voice trailed off, and his eyes took on a glazed, vacant look." CR CR>
		       <TELL
"\"But that cannot be! I thought Nightfang were nocturnal, like the
Starstalker!\" I said, hopefully."
			CR CR>
		       <TELL
"\"And you were right,\" replied Praxix. \"They were nocturnal. ">
		       <COND (<IN-PARTY? ,BERGON>
			      <TELL "Bergon, t">)
			     (T
			      <TELL "T">)>
		       <TELL "his man
will die unless we can find some westflake root. There is little time!\"">
		       <UPDATE-MOVE ,BITE-VICTIM-OBJECT ,HERE>
		       <FSET ,BITE-VICTIM ,INCAPACITATED>
		       <MAKE-BUSY ,BITE-VICTIM ,ILL-COMMAND>)
		      (T
		       <COND (<IN? ,WOOD-ELF ,HERE>
			      <CHANGE-TRAVEL-COMMAND ,HERE
						     ,TAG-ROUTE-COMMAND
						     ,ELF-HOME-COMMAND>)>
		       <COND (<NOT <FSET? ,BERGON ,TRAPPED>>
			      <REMOVE-TRAVEL-COMMAND ,HERE ,BERGON-ROUTE-COMMAND>)>
		       <COND (<AND <FSET? ,BITE-VICTIM ,INCAPACITATED>
				   <NOT <FSET? ,BITE-VICTIM ,DEAD>>>
			      <COND (<AND <NOT <IN? ,WOOD-ELF ,HERE>>
					  <NOT <IN? ,WESTFLAKE-ROOT ,PRAXIX>>>
				     ;"Not going to be healed..."
				     <GRAPHIC ,G-NIGHTFANG>)>
			      <COND (<AND <NOT ,SUBGROUP-MODE>
					  <NOT <IN-PARTY? ,BITE-VICTIM>>>
				     <PARTY-ADD ,BITE-VICTIM>)>
			      <UPDATE-MOVE ,BITE-VICTIM-OBJECT ,HERE>
			      <MAKE-BUSY ,BITE-VICTIM ,ILL-COMMAND>)
			     (<OR <FSET? ,WOOD-ELF ,TRAPPED>
				  <FSET? ,BITE-VICTIM ,DEAD>>
			      <GRAPHIC ,G-FOREST>)>)>>)
      (EXIT
       <EXECUTE ()
		<COND (<AND <NOT ,SUBGROUP-MODE>
			    ,BITE-VICTIM
			    <OR <FSET? ,BITE-VICTIM ,INCAPACITATED>
				<FSET? ,BITE-VICTIM ,DEAD>>>
		       <PARTY-REMOVE ,BITE-VICTIM>)>>)
      (ACTION
       <ACOND ()
	      (ENTER-TUNNEL
	       <TELL
"We chose next to explore the tunnel that we had discovered underneath the stump,
and, descending from our camp, quickly retraced our steps to the point at which
we had entered it earlier. ">
	       <MOVE-TO ,WARREN
"With Praxix' staff to guide us, we continued down the tunnel,
entering a small chamber. Moss and lichen lined the tunnel, and the
dampness here soon became oppressive. Before us, the passage
continued into the darkness.">)
	      (ELF-HOME
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <FSET ,BERGON ,DEAD>)>
	       <COND (<FSET? ,WOOD-ELF ,TRAPPED>
		      ;"She's gone by now..."
		      <TELL
"Doing as V'ren had told us, I retraced my steps to the pool. V'ren
was waiting there for us, and led us">)
		     (T
		      <TELL
"V'ren led us to the pool at which we had met, then">)>
	       <TELL " through twisty
forest paths until we reached a small clearing. \"This is the Elf
Home,\" she said, without words. \"Home of our Mothers since the
beginning of all things.\"" CR CR>
	       <MOVE-TO ,ELF-HOME
"I looked up, and was amazed to see the trees filled with what could
best be described as hammocks. \"This is where we live - in the trees,\" V'ren
explained.">)
	      (TAG-ROUTE
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <FSET ,BERGON ,DEAD>)>
	       <TELL
"I retraced my earlier steps, ">
	       <COND (<NOT <FSET? ,ELFSTREAM-1 ,SEEN>>
		      <TELL
"but this time we decided to follow the stream.">
		      <MOVE-TO ,ELFSTREAM
" After about fifty paces, the stream coursed
over a small waterfall and into a shallow pool.">)
		     (T
		      <MOVE-TO ,ELFSTREAM
"and found myself back at the waterfall
and pool. It was deserted, with no sign of what had been there before.">)>)
	      (BERGON-ROUTE
	       ;"Because he's trapped..."
	       <COND (<IN? ,WOOD-ELF ,HERE>
		      <FSET ,WOOD-ELF ,TRAPPED>
		      <TELL
"We decided to follow Bergon's route in hopes of discovering his
fate. V'ren said she could not come with us, but that we were
welcome at the Elf Home. \"Come to the pool where we met,\" she
said to me, \"and we shall meet again!\" And with that, she sped into the
forest." CR CR>)> 
	       <MOVE-TO ,TANGLEWOOD
"We moved swiftly, even as the forest grew thicker and more
sinister. As the twisted trees closed in around us, we saw Bergon,
his body contorted by the undulating tentacles that had surrounded him.">)
	      (PRAXIX-ROUTE
	       <COND (<FSET? ,BERGON ,TRAPPED>
		      <FSET ,BERGON ,DEAD>)>
	       <COND (<AND <IN? ,WOOD-ELF ,HERE>
			   <NOT <FSET? ,WOOD-ELF ,TRAPPED>>>
		      <TELL
"As we prepared to leave, V'ren explained that
she must return to the Elf Home, but that we could find her
anytime by returning to the pool at which we had first met.
\"Good luck in your travels,\" she said without speech, and
swiftly disappeared into the forest." CR CR>)>
	       <TELL
"Praxix led the way, and we soon arrived at the glade he had found
nearby.">
	       <COND (<NOT <QSET? ,FOREST-GLADE ,SEEN>>
		      <TELL
" But, just as he was explaining his decision to go no farther, he stumbled
over a tree stump that had been hidden in the knee-high grass!">)
		     (<NOT <QSET? ,GLADE-STUMP ,SEEN>>
		      <COND (<FSET? ,FOREST-GLADE ,SEEN>
			     <TELL CR CR
"\"Here's the stump that I walked into before,\" he said, giving
it a">
			     <COND (<FSET? ,GLADE-STUMP ,EXAMINED>
				    <TELL
"nother rap with his staff.">)
				   (T
				    <TELL
" rap with his staff.">)>)>
		      <COND (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
			     <TELL " \"Taught it a lesson!\" he added,
pointing to its broken remains and the passage leading downward.">)
			    (T
			     <TELL " This, oddly, produced a hollow tone.">)>)>
	       <MOVE-TO ,FOREST-GLADE>)
	      (<AND <ACTION? EXAMINE> <OBJECT? BITE-VICTIM-OBJECT>>
	       <UPDATE-FSET ,BITE-VICTIM-OBJECT ,DONT-EXAMINE>
	       <TELL ACT
" examined " D ,BITE-VICTIM ". \"Unless we find the antidote, he will be
dead before the sun sets.\"">
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL " Bergon gazed up at the sky and frowned.">)>
	       <RTRUE>)
	      (<AND <ACTION? GET-ADVICE>
		    <FSET? ,BITE-VICTIM ,INCAPACITATED>>
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <TELL
"Unsure of how to save " D ,BITE-VICTIM ", Bergon asked for our advice. Praxix
felt we had no alternative but to split up in search of the lifesaving
root. I agreed, though I was fearful at the prospect of exploring this
forest on my own.">)  
	      (SPLIT-UP
	       <TELL
"It was agreed that we split up the group in search of the elusive
westflake root, and ">
	       <UPDATE-FCLEAR ,HERE ,ADVISE>
	       <COND (<IN-PARTY? ,BERGON>
		      <TELL "Bergon indicated">)
		     (T
		      <TELL "we decided on">)>
	       <TELL " the paths we should follow." CR CR>
	       <COND (<AND <IN-PARTY? ,BERGON>
			   <NOT <FSET? ,DWARF-MEETING ,SEEN>>>
		      <TELL
"\"I shall remain here to tend to " D ,BITE-VICTIM ". Now go,
and return before sunset! Do not wander far!\" he commanded.">
		      <COND (<AND <IN-PARTY? ,ESHER>
				  <NOT <EQUAL? ,BITE-VICTIM ,ESHER>>>
			     <TELL
" But Esher would not leave, preferring to do what he could to
keep Minar comfortable. And thus it was that Praxix and I went our
separate ways into the forest.">)>)
		     (<IN-PARTY? ,BERGON>
		      <TELL
"\"We will meet back here before sunset! Don't wander too far!\" he
said.">)
		     (T
		      <TELL
"\"We must meet back before sunset. Go quickly!\" Praxix said.">)>
	       <COND (<AND <IN-PARTY? ,BERGON>
			   <FSET? ,DWARF-MEETING ,SEEN>>
		      <DIVIDER>
		      ;<TELL CR CR "Bergon's Story" CR CR>
		      <TELL
"Choosing for himself the most difficult path, Bergon strode off into
the thickening forest to our west.">
		      <FSET ,BERGON-SEARCH ,SEEN>
		      <SCENE ,BERGON-SEARCH>)
		     (T
		      <SCENE ,PRAXIX-SEARCH>)>)
	      (COMB-AREA:REMOVE
	       <TELL
"We spent many frantic minutes searching the area for some westflake
root, but to no avail. " D ,BITE-VICTIM " was now seemingly paralyzed; only the
infrequent blinking of his eyes gave any clue that he remained alive.">)>)>

<ROUTINE MOVE-TO-ELF-HOME ()
	 <TELL
"Then, taking me by the hand, she led us through twisty
forest paths until we reached a small clearing. \"This is the Elf
Home,\" she said, without words. \"Home of our Mothers for all
the long ages.\"" CR CR>
	 <MOVE-TO ,ELF-HOME
"I looked up, and was amazed to see the trees filled with what seemed
to be hammocks. \"This is where we live - in the trees,\" V'ren
explained.">>

<OBJECT PRAXIX-SEARCH
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <DIVIDER>
		 <COND (<FSET? ,BERGON ,TRAPPED>
			<TELL
"Praxix fared much better; leaving camp, he entered">)
		       (<NOT <IN-PARTY? ,BERGON>>
			<TELL
"Praxix chose to explore">)
		       (T
			<TELL
"Bergon sent Praxix off to explore">)>
		 <TELL " the forest that lay to the east, and
it was not long before he came to the edge of a grassy glade.">
		 <CHANGE-TRAVEL-COMMAND ,BERGON
					,EXAMINE-COMMAND ,GET-ADVICE-COMMAND>
		 <MAKE-SUBGROUP ,PRAXIX>
		 <REMOVE-TRAVEL-COMMAND ,PRAXIX ,TELL-LEGEND-COMMAND>
		 <MOVE-TO ,FOREST-GLADE-EDGE>)>)>

<ROOM FOREST-GLADE-EDGE
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (GRAPHIC G-FOREST)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"He had entered the glade and was moving swiftly through the knee-high
grasses and wildflowers, when he walked straight into a tree stump that
had been hidden in the undergrowth. Stifling a scream, Praxix rubbed his
injured leg." CR CR>
	       <TELL
"\"What an absurd place to leave a stump,\" he said, petulantly.">
	       <MOVE-TO ,FOREST-GLADE>)
	      (RETURN
	       <TELL
"Praxix, unconvinced that westflake would be found here, returned
to camp.">
	       <SCENE ,TAG-SEARCH>)>)>

<OBJECT GLADE-STUMP
	(SDESC "stump")
	(KBD %<ASCII !\S>)
	(LOC FOREST-GLADE)
	(FLAGS DONT-TAKE)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"Praxix inspected this misplaced piece of tree; then, as if to vent his anger,
he rapped it with his staff, producing a hollow tone. \"Now, that is odd!\" he
said, rubbing his still sore foot. Looking more closely now, he was unable to
find any sign of how it might open.">)>)>

<ROOM FOREST-GLADE
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (CAST-LIMIT 2)
      (GRAPHIC G-GLADE)
      (ENTER
       <EXECUTE ()
		<HINT ,HINT-STUMP>
		<PUTP ,HERE ,P?CAST-LIMIT 2>
		<COND (<AND <FSET? ,GLADE-STUMP ,ENCHANTED>
			    <NOT <FSET? ,UNDERFOREST-2 ,TRIED>>>
		       <ADD-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>)> 
		<FSET ,FOREST-GLADE ,SEEN>>)
      (ACTION
       <ACOND ()
	      (PROCEED:REMOVE
	       <COND (,SUBGROUP-MODE
		      <TELL
"Limping slightly, Praxix continued on his way; before long, the terrain
fell into a deep glen. \"Never get back in time!\" he said to
himself, and returned to the glade.">
		      <FSET ,HERE ,DONT-SCOUT>)
		     (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		      <TELL
"We walked to the far end of the glade; the terrain sloped
down sharply. \"No time to go farther!\" Praxix said, and he
was right. It was nearly sunset, and " D ,BITE-VICTIM " was close to death.">)
		     (T
		      <UPDATE-FSET ,HERE ,DONT-SCOUT>
		      <TELL
"The terrain ahead of us appeared unpromising, so we decided
to take a different route.">)>) 
	      (SCOUT:REMOVE
	       <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>
	       <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		      <TELL ACT
" went ahead to the far end of the glade, where the terrain sloped
down sharply. \"No time to go farther!\" he said, and he
was right. It was nearly sunset, and " D ,BITE-VICTIM " was close to death.">)
		     (T
		      <TELL ACT
" checked out the far end of the glade, but returned with the report that the
terrain appeared unpromising.">)>)
	      (RETURN
	       <COND (,SUBGROUP-MODE
		      <TELL
"Finding no sign of westflake, Praxix returned to our camp.">
		      <SCENE ,TAG-SEARCH>)
		     (T
		      <TELL
"We returned to our camp, having found nothing "> 
		      <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			     <TELL
"which could help our ailing friend">)
			    (T
			     <TELL
"useful along the route that Praxix had taken">)>
		      <TELL ".">
		      <REMOVE-TRAVEL-COMMAND ,BITE-FOREST
					     ,PRAXIX-ROUTE-COMMAND>
		      <MOVE-TO ,BITE-FOREST>)>)
	      (DOWN
	       <COND (<NOT ,SUBGROUP-MODE>
		      ;"Added 3/7"
		      <COND (<QSET? ,HERE ,TRIED>
			     <REMOVE-TRAVEL-COMMAND>)>
		      <MOVE-TO ,UNDERFOREST-2
"We lowered ourselves down into the hole; it was dark and damp,
and had a peculiar odor.">)
		     (T
		      <MOVE-TO ,UNDERFOREST-2
"Praxix tried to lower himself down gracefully, but having nothing with
which to support himself, he fell unceremoniously to the bottom of a dark and
damp hole.">)>) 
	      (<AND <ACTION? CAST>
		    <OR <AND <OBJECT? LIGHTNING-SPELL>
			     <PRSI? GLADE-STUMP>>
			<AND <OBJECT? FIRE-SPELL>
			     <PRSI? GLADE-STUMP>>
			<OBJECT? TREMOR-SPELL>>
		    <NOT <QSET? ,GLADE-STUMP ,ENCHANTED>>>
	       <UPDATE-FSET ,GLADE-STUMP ,DONT-EXAMINE>
	       <ADD-TRAVEL-COMMAND ,HERE ,DOWN-COMMAND>	       
	       <GRAPHIC ,G-STUMP>
	       <COND (<OBJECT? LIGHTNING-SPELL>
		      <FSET ,LIGHTNING-SPELL ,SEEN>
		      <TELL
"Praxix carefully prepared a mixture of water and fire essences; then, he
added just the slightest pinch of earth essence. He cast the mixture
into the air and lifted his staff; from nowhere, clouds gathered and soon the
sky was twilight-dark. Then, a single bolt of lightning fell from the
sky, splitting the stump in two, and">)
		     (<OBJECT? TREMOR-SPELL>
		      <TELL
"Praxix removed some earth essence from his pouch and cast it at the
stump; the earth trembled briefly and the stump split in two">)
		     (T
		      <TELL
"Praxix removed a small handful of fire essence from his cloak and
spread it over the stump. Within moments, the stump was afire;
it burned itself out a few moments later,">)>
	       <TELL
" revealing a passage below. \"Not bad! Not bad!\" he said, and he peered
into the darkness below.">
	       <COND (<AND <NOT ,SUBGROUP-MODE>
			   <OBJECT? LIGHTNING-SPELL>
			   <NOT <QSET? ,LIGHTNING-SPELL ,INCAPACITATED>>>
		      <TELL CR CR
"Praxix, proud of his accomplishment, turned to me and whispered that it
was the pinch of earth essence that really gives the lightning spell its
added punch. But however the magic had been prepared, its effect was
profound.">)>
	       <PUTP ,HERE ,P?GRAPHIC ,G-STUMP>)>)>

<COMMAND AWAY>

<ROOM UNDERFOREST-2
      (TRAVEL-COMMANDS UP-COMMAND FEEL-AROUND-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND)
      (CAST-LIMIT INF)            
      (CLOCK
       <EXECUTE ()
		<COND (<AND <NOT <FSET? ,PRAXIX ,LIT>>
			    <NOT <CHECK-ESSENCES ,LIGHT-SPELL>>
			    <NOT <CHECK-ESSENCES ,LEVITATE-SPELL>>>
		       ;"We're stuck here now..."
		       <FSET ,HERE ,TRAPPED>)>>)
      (ENTER
       <EXECUTE () 
		<COND (<LOC ,HINT-STUMP>
		       <UPDATE-REMOVE ,HINT-STUMP>)>
		<COND (<FSET? ,PRAXIX ,LIT>
		       <GRAPHIC ,G-WARREN>
		       <TELL CR CR "With the aid of ">
		       <COND (,SUBGROUP-MODE
			      <TELL "his enchanted staff, Praxix">)
			     (T
			      <TELL "Praxix' enchanted staff, we">)>
		       <TELL
" could see that the passage led both back toward our camp and away.">
		       <ADD-PARTY-COMMAND ,AWAY-COMMAND>
		       <CHANGE-PARTY-COMMAND ,FEEL-AROUND-COMMAND
					     ,BACK-COMMAND>)
		      (T
		       <UPDATE-FSET ,HERE ,DONT-SCOUT>
		       <CAVERN-GRAPHIC>)>
		<COND (<AND <FSET? ,PRAXIX ,LIT>
			    <NOT ,SUBGROUP-MODE>
			    <NOT <FSET? ,BITE-VICTIM ,INCAPACITATED>>>
		       ;<REMOVE-PARTY-COMMAND ,BACK-COMMAND>
		       <CHANGE-PARTY-COMMAND ,AWAY-COMMAND
					     ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()	      
	      (AWAY
	       <REMOVE-PARTY-COMMAND ,AWAY-COMMAND>
	       <TELL
"Praxix absentmindedly started to head away from our camp, when he
remembered how little time there was to save ">
	       <TELL D ,BITE-VICTIM "." CR CR>
	       <TELL
"\"There will be time for this later,\" he said, scolding himself, and
quickly retraced his steps to his starting point.">)
	      (UP
	       <COND (,SUBGROUP-MODE
		      <REMOVE-PARTY-COMMAND ,UP-COMMAND>
		      <TELL
"Try as he might, Praxix couldn't climb out of this hole
he had dug for himself.">)
		     (T
		      <FCLEAR ,HERE ,DEAD>
		      <MOVE-TO ,FOREST-GLADE
"It wasn't easy, but we managed to lift ourselves out of the
hole and back into the glade.">)>)
	      (PROCEED
	       <COND (<FSET? ,HERE ,TRAPPED>
		      <TELL
"The remainder of the day was spent tediously feeling our way through scores of
dark, underground chambers until we finally reached an exit. We clambered out ">
		      <MOVE-TO-ELFSTREAM>)
		     (<NOT <FSET? ,PRAXIX ,LIT>>
		      <TELL
"We decided to explore this underground tunnel, but without light, the
prospects were dim.">)
		     (T
		      <MOVE-TO ,WARREN
"With Praxix' staff to guide us, we made our way down the tunnel,
entering a small chamber. Moss and lichen lined the tunnel, and the
dampness here soon became oppressive. Before us, the passage
continued into the darkness.">)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>>
	       <COND (,SUBGROUP-MODE
		      <TELL
"Then, taking out his air and earth essences, Praxix created an elevation spell
and used it to raise himself back into the glade.">)
		     (T
		      <TELL
"Praxix then used his elevation spell to lift " D ,ACTION-PRSI " out of the hole;
it was then a simple matter for the rest of us to make our way out.">)>
	       <FSET ,HERE ,TRIED>
	       <MOVE-TO ,FOREST-GLADE>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LIGHT-SPELL>
		    <PRSI? STAFF>
		    <NOT <QSET? ,PRAXIX ,LIT>>>	       
	       <COND (<LOC ,HINT-STUMP>
		      <UPDATE-REMOVE ,HINT-STUMP>)>
	       <GRAPHIC ,G-WARREN>
	       <UPDATE-FCLEAR ,HERE ,DONT-SCOUT>
	       <COND (<AND <NOT ,SUBGROUP-MODE>
			   <NOT <FSET? ,BITE-VICTIM ,INCAPACITATED>>>
		      <COND (<FSET? ,HERE ,DEAD>
			     <ADD-PARTY-COMMAND ,PROCEED-COMMAND>)
			    (T
			     <CHANGE-PARTY-COMMAND ,FEEL-AROUND-COMMAND
						   ,PROCEED-COMMAND>)>)
		     (T
		      <COND (<FSET? ,HERE ,DEAD>
			     <ADD-PARTY-COMMAND ,BACK-COMMAND>)
			    (T
			     <CHANGE-PARTY-COMMAND ,FEEL-AROUND-COMMAND
						   ,BACK-COMMAND>)>
		      <ADD-PARTY-COMMAND ,AWAY-COMMAND>)>
	       <TELL
"It took some doing, but Praxix managed to fumble through his pouch and
remove some fire and earth essence. He applied it to his staff, causing it
to glow a dull red. ">
	       <COND (,SUBGROUP-MODE <TELL "H">)
		     (T
		       <TELL "W">)>
	       <TELL "e could now see
that he was in a tunnel, with passages leading in two directions, though
only one of these would head in the direction of camp.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>>
	       <TELL
"Praxix, with his flare spell, lit the walls of the tunnel,
revealing that it was covered with a mossy, plantlike material, and that it
spread out far in both directions.">)
	      (BACK
	       <TELL
"Using his staff for light, ">
	       <COND (,SUBGROUP-MODE
		      <TELL D ,PRAXIX>)
		     (T
		      <TELL "we">)>
	       <TELL 
" continued down the tunnel in the direction of camp.">
	       <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		      <TELL " Casually scanning the walls, ">
		      <COND (,SUBGROUP-MODE
			     <TELL "he">)
			    (T
			     <TELL "we">)>
		      <TELL
" recognized the plant that almost completely surrounded ">
		      <COND (,SUBGROUP-MODE
			     <TELL "him">)
			    (T
			     <TELL "us">)>
		      <TELL ": westflake! ">
		      <COND (<NOT ,SUBGROUP-MODE>
			     <TELL D ,PRAXIX>)
			    (T
			     <TELL "He">)>
		      <TELL
" gathered some of the root for " D ,BITE-VICTIM ", placing it in his
cloak.">)>
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TELL " We">)
		     (T
		      <TELL " He">)>
	       <TELL
" continued down the tunnel, coming eventually to a ladder carved into the
earth and rising into a hollowed-out tree stump!">
	       <COND (,SUBGROUP-MODE
		      <TELL " The sound of a
voice (or was it voices) could be heard just above, and Praxix
eagerly pulled himself up the ladder.">
		      <MOVE ,WESTFLAKE-ROOT ,PRAXIX>
		      <SCENE ,TAG-SEARCH>)
		     (T
		      <TELL
" We raised ourselves out of the stump; we were back at our camp.">
		      <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			     <MOVE-TO ,BITE-FOREST>
			     <TELL CR CR
"Praxix rushed over to " D ,BITE-VICTIM " and made a terrible discovery. ">
			     <BITE-VICTIM-DIES>
			     <CHANGE-TRAVEL-COMMAND ,BITE-FOREST
						    ,PRAXIX-ROUTE-COMMAND
						    ,ENTER-TUNNEL-COMMAND>
			     <MOVE-TO ,BITE-FOREST>)
			    (T
			     <TELL CR CR
"\"As I suspected, this route leads only back to our camp,\" Praxix said.
\"Come, let us see what lies at the other end of the tunnel.\"" CR CR>
			     <TELL
"In a matter of moments, we had climbed back down into the tunnel,
retracing our steps to our point of entry in the glade. ">
			     <MOVE-TO ,WARREN
"With Praxix' staff to guide us, we made our way down the tunnel,
entering a small chamber. Moss and lichen lined the tunnel, and the
dampness here soon became oppressive. Before us, the passage
continued into the darkness.">)>
		      <RTRUE>)>)
	      (FEEL-AROUND
	       <REMOVE-PARTY-COMMAND ,FEEL-AROUND-COMMAND>
	       <FSET ,HERE ,DEAD>
	       <TELL "Though ">
	       <COND (,SUBGROUP-MODE <TELL "h">)
		     (T <TELL "w">)>
	       <TELL "e could not see, it was clear by feeling around that ">
	       <COND (,SUBGROUP-MODE <TELL "he was">)
		     (T <TELL "we were">)>
	       <TELL " in some sort of tunnel. Without any light, movement
would be painfully slow and uncomfortable.">)>)>

<OBJECT WESTFLAKE-ROOT
	(SDESC "westflake")
	(KBD %<ASCII !\W>)>

<OBJECT TAG-SEARCH
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <DIVIDER>
		 <GRAPHIC ,G-FOREST>
		 <COND (<AND <IN-PARTY? ,BERGON>
			     <NOT <FSET? ,BERGON ,TRAPPED>>>
			<TELL
"\"" TAG ", you search the forest to the north,\" Bergon said, and
that was what I did">)
		       (T
			<TELL
"I headed out into the forest that lay to the north">)>
		 <TELL
", though I was filled with apprehension at the
thought of exploring on my own." CR CR>
		 <TELL
"But the forest was beautiful, and the air cool and fresh. Up ahead,
the sound of flowing water could be heard ever more clearly, and I
followed that sound until I came upon a small stream, which took off at
an angle to my path.">
		 <ADD-TRAVEL-COMMAND ,PRAXIX ,TELL-LEGEND-COMMAND>
		 <MAKE-TAG-SUBGROUP>
		 <MOVE-TO ,ELFWOOD-2>)
		(SCENE-END
		 <COND (<AND <FSET? ,WOOD-ELF ,SEEN>
			     <NOT <FSET? ,ELFSTREAM-1 ,SOLVED>>>
			<HINT ,HINT-ELF-SPEAK>)
		       (<AND <NOT <FSET? ,ELFSTREAM-1 ,SEEN>>
			     <IN? ,WESTFLAKE-ROOT ,PRAXIX>>
			<HINT ,HINT-BITE-FOREST>)
		       (<AND <NOT <FSET? ,WOOD-ELF ,SEEN>>
			     <IN? ,WESTFLAKE-ROOT ,PRAXIX>>
			<HINT ,HINT-WOOD-ELF>)>)>)>

<ROUTINE SEARCH-END ("AUX" TMP)
	 <MOVE-TO-NO-GFX ,BITE-FOREST>
	 <CLEAR-SUBGROUP>
	 <RESTORE-TAG-COMMANDS>
	 <SCENE <> <>>
	 ;"Go through the possible outcomes..."
	 <TELL CR CR>
	 ;"First, the healing part (if any are successful)"
	 <COND (<IN? ,WOOD-ELF ,HERE>
		;"Tag has brought her back..."
		<TELL
"We arrived a short time later; " D ,BITE-VICTIM " appeared lifeless, though he
was breathing slowly. The Wood Elf strode to his side, placed
her spindled arm on his wound, and entered a trance-like state." CR CR>
		<GRAPHIC ,G-NIGHTFANG ,G-ELF-HEALS-BITE ,BOTTOM-LEFT>
		<COND (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
		       ;"His root is not needed now..."
		       <PRAXIX-STUMP-APPEARANCE>)
		      (T
		       ;"He returns anyway..."
		       <TELL
"Praxix returned, empty-handed, and started toward " D ,BITE-VICTIM ". After
just a few steps, he ">)>
		<TELL
"stopped, startled by the sight of my new friend." CR CR>
		<TELL
"\"You have done well, " TAG "! Very well indeed!\" I blushed, for it wasn't
often this Wizard handed out compliments. \"There are but few Wood
Elves left in this world, and lucky is the day we meet one!\"" CR CR>
		<TELL
"We approached " D ,BITE-VICTIM " and watched in silence as the Wood
Elf healed him with her touch. ">
		<BITE-VICTIM-BITE-HEALED>) 
	       (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
		;"Praxix has the root..."
		<GRAPHIC ,G-NIGHTFANG ,G-PRAXIX-HEALS-BITE ,BOTTOM-LEFT>
		<PRAXIX-STUMP-APPEARANCE>
		<TELL
"knelt at his side, binding the westflake root onto the wound. ">
		<BITE-VICTIM-BITE-HEALED>)
	       (T
		;"Esher is in BIG trouble..."
		<GRAPHIC ,G-NIGHTFANG>
		<HINT ,HINT-NIGHTFANG>
		<TELL
"Praxix and I arrived back at the same time, neither having found any
westflake root. " D ,BITE-VICTIM " was motionless, eyes staring without
seeing.">)>
	 ;"Now, where is Bergon?"
	 <SET TMP ,ELF-HOME-COMMAND>
	 <COND (<NOT <IN? ,WOOD-ELF ,HERE>>
		<SET TMP ,TAG-ROUTE-COMMAND>)>
	 <COND (<FSET? ,BERGON ,TRAPPED>
		<TRAVEL-COMMANDS ,HERE
				 ,BERGON-ROUTE-COMMAND
				 ,PRAXIX-ROUTE-COMMAND
				 .TMP>)
	       (T
		<TRAVEL-COMMANDS ,HERE
				 ,PRAXIX-ROUTE-COMMAND
				 .TMP>)>
	 <COND (<FSET? ,BERGON ,TRAPPED>
		;"In bad shape, that's where!"
		<TELL CR CR>
		<COND (<FSET? ,BITE-VICTIM ,BUSY>
		       ;"This is turning into a lousy day!"
		       <TELL
"As if things were not bad enough, Bergon was missing. We waited
until nearly sunset, and still he had not returned.">)
		      (T
		       ;"Could be worse..."
		       <TELL
"Surprisingly, it was Esher who first noticed Bergon's absence. We
decided to wait, but by sunset, there was still no sign of him.">)>
		<TELL CR CR
"\"It is not like Bergon to be late. I fear something has happened
to him,\" Praxix said; he was tired now, and filled with concern.">)
	       (<AND <FSET? ,BITE-VICTIM ,BUSY>
		     <IN-PARTY? ,BERGON>>
		;"Returned, nothing found. Esher's in trouble."
		<TELL CR CR>
		<COND (<FSET? ,BERGON-SEARCH ,SEEN>
		       <TELL
"Bergon arrived a short time later; he, too, had failed to find
the westflake root. ">)>
		<TELL "We stood over our friend, but no words were
spoken; we had failed!">)
	       (<AND <IN-PARTY? ,BERGON> <FSET? ,BERGON-SEARCH ,SEEN>>
		;"All's well that ends well."
		<TELL CR CR
"Bergon, who had missed all of the excitement, returned a short
time later, and, relieved at " D ,BITE-VICTIM "'s condition, told
of his adventures.">)>
	 ;"Tag tells about wood elves, if he hasn't..."
	 <COND (<AND <FSET? ,ELFSTREAM-1 ,SEEN>
		     <NOT <IN? ,WOOD-ELF ,HERE>>>
		;"He's at least seen them..."
		<TELL CR CR "Thinking that it ">
		<COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
		       <TELL "somehow might help">)
		      (<FSET? ,BERGON ,TRAPPED>
		       <TELL "might be helpful (though it didn't
seem relevant to the problem of finding Bergon)">)
		      (T
		       <TELL "might be important">)>
		<TELL ", I told ">
		<COND (<AND <OR <FSET? ,BERGON ,TRAPPED>
				<NOT <IN-PARTY? ,BERGON>>>
			    <FSET? ,BITE-VICTIM ,INCAPACITATED>>
		       <TELL D ,PRAXIX>)
		      (T
		       <TELL "the others">)>
		<TELL " about my adventure at the edge of the stream.">
		<COND (<FSET? ,WOOD-ELF ,SEEN>
		       <TELL
" Praxix was delighted! \"Wood Elves! Well, then! This is indeed our lucky
day. Let us hope we shall be meeting them again!\"">)>
		<RTRUE>)
	       (<IN? ,WOOD-ELF ,HERE>
		<TELL CR CR
"I thought this might be a good time for introductions, so I presented
the Wood Elf to the others. \"I am happy to introduce...\" I started,
but came up empty, and the Elf placed her hand on my shoulder.
\"V'ren, of the House of G'lor,\" she said. \"And, if you wish, I shall take
you to the Elf Home.\"" CR CR>
		<TELL
"We thanked V'ren for her gracious offer of help, but we had much to consider
before we could commit to any decision. V'ren stood and waited as we discussed
our options.">)>	 
	 <RTRUE>>

<ROUTINE BITE-VICTIM-BITE-HEALED ()
	 <UPDATE-MOVE ,BITE-VICTIM-OBJECT ,RANDOM-OBJECTS>
	 <FCLEAR ,BITE-VICTIM ,INCAPACITATED>
	 <UPDATE-FCLEAR ,BITE-FOREST ,ADVISE>
	 <MAKE-UNBUSY ,BITE-VICTIM>
	 <FCLEAR ,BITE-VICTIM-OBJECT ,DONT-EXAMINE>
	 <TELL
"It took a long while, though it was still light when " D ,BITE-VICTIM
"'s eyes regained their sight and his body stirred. \"What are you all looking
at?\" he said, blankly, and even Praxix' lips turned up into a smile.">
	 <COND (<EQUAL? ,BITE-VICTIM ,ESHER>
		<TELL CR CR
"\"We are looking at one very poor excuse for a physician,\" he said.">)>
	 <RTRUE>>

<ROUTINE PRAXIX-STUMP-APPEARANCE ()
	 <TELL
"Just then, from out of nowhere, Praxix rose from the
ground! I was mesmerized by the sight, and stood there, speechless.
\"Don't just stand there!\" he shouted, \"Help an old man up!\"" CR CR>
	 <TELL
"Embarrassed, I helped him out of a hollowed-out stump that had been
inconspicuously sitting nearby. But before I could ask him how he had gotten
there, he rushed toward " D ,BITE-VICTIM ", then ">>

<ROOM ELFWOOD-2
      (TRAVEL-COMMANDS PROCEED-COMMAND STREAM-PATH-COMMAND RETURN-COMMAND)
      (ENTER FSET-SEEN)
      (GRAPHIC G-FOREST)
      (ACTION
       <ACOND ()
	      (PROCEED:REMOVE
	       <FSET ,HERE ,EXAMINED>
	       <TELL
"The path descended into a deep ravine, and I was loath to follow it this
near to twilight. Across the ravine, the forest was unnaturally dark, as though
a black curtain had been drawn over it.">)
	      (STREAM-PATH
	       <COND (<FSET? ,HERE ,EXAMINED>
		      <TELL
"Rather than giving up, I chose to follow the stream in search for
the needed root.">)
		     (T
		      <TELL
"Moving quickly and scanning the ground for any sign of westflake, I
chose to follow the stream.">)>
	       <MOVE-TO ,ELFSTREAM-1
" After about fifty paces, the stream coursed
over a small waterfall and into a shallow pool, where, to my surprise,
a young woman was sitting, with her back toward me. I hid myself behind
a rock, unsure of whether to reveal myself.">)
	      (RETURN
	       <TELL
"Unable to find any westflake root, I returned to camp.">
	       <SEARCH-END>)>)>

<ROUTINE MOVE-TO-NO-GFX (RM "OPTIONAL" (STR <>))
	 <MOVE-TO .RM .STR <> T <>>>

<OBJECT WOOD-ELF
	(SDESC "woman")
	(KBD %<ASCII !\W>)
	(FLAGS DONT-TAKE)
	(LOC ELFSTREAM-1)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <FSET ,WOOD-ELF ,EXAMINED>
		 <COND (<FSET? ,WOOD-ELF ,SEEN>
			<TELL
"Having recovered from the shock of that first look, I looked at
this creature again and I began to feel her age and wisdom, and even
sense a beauty that lay beneath her tree-like exterior.">)
		       (T
			<TELL
"The woman was slender, with long flowing hair. I could not see
her face, yet some warm inner feeling was touched by her gentle
grace.">)>)>)>

<COMMAND (TALK-TO-ELF TALK)>
<COMMAND (SPEAK-ELVISH SPEAK)>

<ROOM ELFSTREAM-1
      (TRAVEL-COMMANDS STAY-HIDDEN-COMMAND APPROACH-COMMAND RETURN-COMMAND)
      (ENTER      
       <EXECUTE ()
		<FSET ,HERE ,SEEN>
		<GRAPHIC ,G-WATERFALL-NO-ELF ,G-WATERFALL ,BOTTOM-RIGHT>>)
      (ACTION
       <ACOND ()
	      (TALK-TO-ELF:REMOVE
	       <TELL
"\"I am pleased to meet you,\" I began, stumbling over the words. \"My friend is
badly hurt...\"" CR CR>
	       <TELL
"But this creature that I assumed to be a Wood Elf appeared confused by my speech.
I tried other, non-verbal means of communication, and was soon quite frustrated at
my inability to communicate the desire that she come to the aid of " D ,BITE-VICTIM
", if indeed that was within her power. And then, just as I was about to return to
our camp, she spoke in soft, lilting tones in a language that I presumed to be
Elvish.">
	       <ADD-TRAVEL-COMMAND ,HERE ,SPEAK-ELVISH-COMMAND>
	       <FSET ,HERE ,BLUE-MIX>)	      
	      (SPEAK-ELVISH
	       <TELL
"Well, what did I know of Elvish? But there was little else to do, so I gave it my
best try...." CR CR>
	       <COND (<READ-ELVISH ,TAG>
		      T)
		     (T
		      <TELL
"At least, I thought I would, but no sound came through my lips and at last, dejected,
I raced back to camp, eager to tell the others of my discovery.">
		      <SEARCH-END>)>)
	      (APPROACH
	       <COND (<NOT <QSET? ,WOOD-ELF ,SEEN>>
		      <TELL
"I approached cautiously, hoping not to startle her. But as I neared,
she sensed my presence, stood, and turned toward me...." CR CR>
		      <TELL
"I gasped, stumbling backward onto the ground, and twisted my ankle.
She was grotesque, her face leathery and brown, more like a gnarled tree
than a person. She stretched her spindled arms toward me, and opened her eyes
for the first time: clear, large, and fathomless.">
		      <GRAPHIC ,G-ELF>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,STAY-HIDDEN-COMMAND>
		      <UPDATE-FCLEAR ,WOOD-ELF ,DONT-EXAMINE>)
		     (T
		      <TELL
"As if under some hypnotic spell, I rose and hobbled toward this creature of
the forest. Her eyes were kind and gentle, yet she backed off as I approached.">
		      <CHANGE-TRAVEL-COMMAND ,HERE
					     ,APPROACH-COMMAND
					     ,TALK-TO-ELF-COMMAND>)>)    
	      (STAY-HIDDEN
	       <COND (<NOT <QSET? ,WOOD-ELF ,SCOUTED>>
		      <TELL
"I waited there, mesmerized by the beauty of this forest dweller.
After a few moments, two people came into view from further downstream
but it was late in the afternoon, and
the rays of the setting sun made it impossible to see them clearly.
The woman motioned to the newcomers, who then returned to the forest.">)
		     (T
		      <TELL
"Then the woman rose and followed the stream out of sight into the
forest.">
		      <REMOVE-TRAVEL-COMMAND ,HERE ,APPROACH-COMMAND>
		      <CHANGE-TRAVEL-COMMAND ,HERE
					     ,STAY-HIDDEN-COMMAND
					     ,FOLLOW-COMMAND>)>)
	      (FOLLOW
	       <TELL
"I decided to follow the mysterious woman, but soon lost track of her
as she sped along the course of the stream. It was now late, and
I had no choice but to return to camp.">
	       <SEARCH-END>)   
	      (RETURN
	       <COND (<FSET? ,WOOD-ELF ,SEEN>
		      <TELL
"Though my ankle was hurt, I stumbled and crawled my way back to camp.">)
		     (T
		      <TELL
"It was getting late, so I returned to camp with the intention of telling
the others about these forest people.">)>
	       <SEARCH-END>)>)>

<ROOM ELFSTREAM
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (GRAPHIC G-WATERFALL-NO-ELF)
      (ENTER
       <EXECUTE ()
		<COND (<IN? ,WOOD-ELF ,BITE-FOREST>
		       <TRAVEL-COMMANDS ,HERE ,ELF-HOME-COMMAND>)
		      (<OR <NOT <FSET? ,BITE-VICTIM ,INCAPACITATED>>
			   <FSET? ,BITE-VICTIM ,DEAD>>
		       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>)
		      (T
		       <TRAVEL-COMMANDS ,HERE ,RETURN-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (ELF-HOME
	       ;"BV cured, and Elves found..."
	       <TELL
"We called out for V'ren, who quickly arrived at the side of the pool. ">
	       <MOVE-TO-ELF-HOME>)
	      (PROCEED
	       ;"Only if BV cured, but no Elves found..."
	       <TELL
"The pool was refreshingly cool, and we drank from it contentedly.">
	       <COND (<FSET? ,ELFSTREAM-1 ,SEEN>
		      <TELL
" But none of the creatures I had seen before were here, and it soon became
apparent that we had missed our opportunity of meeting them.">)>
	       <COND (<NOT ,2ND-PASS>
		      <SKIP-BITE-FOREST>)
		     (T
		      <TELL CR CR>
		      <N-DAY-TREK 1>)>)
	      (RETURN
	       ;"Only if BV hasn't been cured..."
	       <TELL
"We returned to our camp at nightfall, full of despair and hopelessness.
Praxix went over to where " D ,BITE-VICTIM " lay.">
	       <BITE-VICTIM-DIES>
	       <MOVE-TO ,BITE-FOREST>)>)> 

<ROUTINE BITE-VICTIM-DIES ()
	 <HINT ,HINT-NIGHTFANG>
	 <TELL "\"We are too late!\" he said softly. \"Too late!\"" CR CR>
	 <TELL
"I was barely able to hold back tears as we lifted our fallen friend
and placed him in the cold earth. Praxix incanted an ancient and
sorrowful song as we covered him with dirt and placed a burial cairn
over the spot.">
	 <COND (<NOT <FSET? ,BERGON ,TRAPPED>>
		<TELL " Exhausted, we fell into a deep sleep.">)>    
	 <NEXT-DAY>
	 <FCLEAR ,BITE-VICTIM ,INCAPACITATED>
	 <FSET ,BITE-VICTIM ,DEAD>
	 <UPDATE-MOVE ,BITE-VICTIM-OBJECT>>

<OBJECT ELF-HOME-ELVES
	(LOC ELF-HOME)
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"\"Look,\" " ACT " said, pointing out the Elves that were everywhere -
climbing down trees, grabbing axes and crude buckets; soon, all would be
heading north to fight the advancing blaze.">)>)>

<OBJECT ELF-HOME-FIRE
	(LOC ELF-HOME)
	(FLAGS DONT-TAKE)
	(SDESC "fire")
	(KBD %<ASCII !\F>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" pointed toward the north, where the sky was filled with a dark, billowing
smoke. Every
few moments, a flash of red flame could be seen lapping at the tree tops
in the distance.">)>)>

<ROOM ELF-HOME
      (TRAVEL-COMMANDS FOLLOW-ELVES-COMMAND PROCEED-COMMAND NUL-COMMAND)
      (FLAGS ADVISE DANGEROUS)
      (ENTER
       <EXECUTE ()
		<GRAPHIC ,G-ELF-HOME>
		<COND (<NOT <FSET? ,FOREST-FIRE ,SEEN>>
		       <TELL CR CR
"We talked among ourselves, marvelling at this ancient place, when
three Elves rushed into the clearing, and their cries filled our ears.
\"Fire!\" they said. \"The great flame approaches!\"" CR CR>
		       <TELL
"Across the way, an older Elf clambered down from his tree-hammock.
\"Awake! Awake!\" he cried, and dozens of Elves were soon marching
to the north, where smoke could be seen in the treetops.">
		       <COND (<FSET? ,ELFWOOD-2 ,EXAMINED>
			      <TELL CR CR
"\"That would explain the black forest I observed while searching for the
westflake root!\" I exclaimed." CR CR>
			      <TELL
"\"The fire moves quickly, then,\" Praxix said. \"We are all in danger
here!\"">)>
		       <RTRUE>)
		      (T
		       <REMOVE-TRAVEL-COMMAND ,HERE ,FOLLOW-ELVES-COMMAND>
		       <UPDATE-FCLEAR ,HERE ,ADVISE>)>>)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"We talked among ourselves, but could reach no consensus.">
	       <COND (<IN-PARTY? ,BITE-VICTIM>
		      <TELL " " D ,BITE-VICTIM " felt
strongly that we must help the Elves, if it were at all possible.
Praxix was unsure; he could sense how near we were to the eastern
mountains and Astrix, and was wary of the delay.">)>
	       <RTRUE>)
	      (FOLLOW-ELVES
	       <COND (<IN-PARTY? ,BITE-VICTIM>
		      <TELL D ,BITE-VICTIM 
" reacted quickly. \"We must help these Elves, if it is at all within our
power to do so.\"" CR CR>)>
	       <MOVE-TO ,FOREST-FIRE
"\"The fire from the north threatens us all. Let us go!\" Praxix said,
and we were on our way to the northernmost parts of their forest,
where tall flames lapped at the trees, and dark, acrid smoke filled the
air.">)
	      (PROCEED
	       <COND (<FSET? ,BERGON ,DEAD>
		      <HINT ,HINT-TANGLETREES>
		      <TELL
"We prepared to leave the forest, but were soon accosted by V'ren and two
other Elves. \"I have tragic news for you. One of our scouts has located
your friend; he had been strangled by the Tangle Trees into whose forest he
had wandered. We have buried him here, among our bravest brethren. I am
sorry.\"" CR CR>
		      <TELL
"This was tragic news indeed, and we were greatly saddened by the loss
of our leader. \"I feared this when he did not return last evening,\" Praxix
said, \"He shall be sorely missed.\"" CR CR>)  
		     (T
		      <TELL
"Unsure of how to help, we decided to continue with our quest. ">)>
	       <TELL
"With V'ren guiding us, we soon came to the eastern edge of the forest, at
the shore of a great river. \"Be well,\" V'ren said. \"I must return
to help my people.\" And with that, she turned and ran back into
the forest.">
	       <COND (<NOT <IN? ,ELF-STONE ,INVENTORY>>
		      <HINT ,HINT-ELVES>)>
	       <COND (,2ND-PASS
		      <TELL CR CR>
		      <N-DAY-TREK 1>
		      <RTRUE>)
		     (T
		      <MOVE-TO ,RIVER-2>)>)
	      (SCOUT:REMOVE
	       <TELL ACT
" rushed ahead with the Elves, and soon returned. \"It is a great fire,
borne by the north wind,\" he reported. \"It won't be long until we
are in danger here!\"">)>)>

<OBJECT FOREST-FIRE-FIRE
	(LOC FOREST-FIRE)
	(SDESC "fire")
	(KBD %<ASCII !\F>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"A wall of flame stood before us, consuming everything in its path. As
if part of a conspiracy, the wind blew harder now, pushing the blaze
toward the Elves' home a few mere miles downwind.">
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL CR CR
"\"These Elves are in great danger,\" Praxix said. \"We must do something
now or leave, lest we be destroyed with them.\"">)
		       (T
			<TELL CR CR
"\"We must retreat from here,\" " ACT " said. \"It is not safe!\"">)>)>)>

<OBJECT FOREST-FIRE-ELVES
	(LOC FOREST-FIRE)
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,ESHERBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL
"Hundreds of Elves were here, trying desperately to fight the onrushing
fire with buckets of water. Others were clearing brush and opening a wide
trench, hoping to stop the flames at the trench line." CR CR>
		 <COND (<IN-PARTY? ,ESHER>
			<TELL
"\"They'll never hold back the fire,\" Esher said, and it was hard to
disagree. Praxix stood there in silent thought, eyes fixed on the
approaching flames.">)>
		 <RTRUE>)>)>

;"Actually, you need one plus this amount..."
<CONSTANT FIRE-RAIN-REQUIRED 5>

<ROOM FOREST-FIRE
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT)
      (CAST-LIMIT 2)
      (GRAPHIC G-FOREST-FIRE)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ("AUX" TMP)
	      (RETURN
	       <MOVE-TO ,ELF-HOME
"We watched in horror as the flames approached, and finally we
retreated back to the Elf Home, where V'ren was waiting for us.
\"You must leave!\" she said. \"I can sense the importance of
your quest; do not risk what you have travelled so very far for
on account of the Elves!\"">)
	      (CAST
	       <COND (<OBJECT? RAIN-SPELL>
		      <COND (<L? <SET TMP <GET ,ESSENCE-TBL ,WATEROFF>>
				 ,FIRE-RAIN-REQUIRED>
			     <TELL
"\"I don't believe I have enough,\" Praxix said, as he took all of his
remaining water essence and cast it into the sky. Clouds gathered and a ">
			     <COND (<EQUAL? .TMP 3 4>
				    <TELL "good soaking rain">)
				   (<EQUAL? .TMP 2>
				    <TELL "few showers soon">)
				   (T
				    <TELL "sprinkle of rain">)>
			     <FSET ,FOREST-FIRE ,TRIED>
			     <TELL
" fell, but it was quickly evident that Praxix' assessment was accurate.
The rains were too little, too late. The fires had been slowed, but not nearly
enough." CR CR>
			     <UPDATE-REMOVE ,ESSENCE-WATER>
			     <PUT ,ESSENCE-TBL ,WATEROFF 0>
			     ;"Fake a RETURN"
			     <SETG ACTION ,RETURN-COMMAND>
			     <AGAIN>)
			    (T 
			     <GRAPHIC ,G-FIRE-RAINS>
			     ;"Use up 5 water essences (plus, of course, the one
							used up automatically...)"
			     <PUT ,ESSENCE-TBL ,WATEROFF <- .TMP ,FIRE-RAIN-REQUIRED>>
			     <COND (<EQUAL? .TMP ,FIRE-RAIN-REQUIRED>
				    <UPDATE-REMOVE ,ESSENCE-WATER>)>
			     <TELL
"Seeing little choice, Praxix removed ">
			     <COND (<NOT <EQUAL? .TMP ,FIRE-RAIN-REQUIRED>>
				    <TELL "almost ">)>
			     <TELL "all of his stock of water essence
and cast it into the sky. The sky was obscured in smoke, yet the
approaching storm could be felt in the air. Lightning danced through
the clouds, and the roar of thunder soon filled the sky. All at once,
the clouds burst, dropping a drenching rain on us. So violent was it,
that many Elves were carried off by the rushing water. It was as though
the rains would never end, and Praxix appeared somewhat embarrassed." CR CR>
			     <TELL
"\"Perhaps I did not need so much,\" he said, \"but these things are
quite unpredictable; one must take into account such variables as the
winds, the temperature, the time of year, the altitude...\"" CR CR>
			     <COND (<IN-PARTY? ,ESHER>
				    <TELL
"\"The expertise of the Wizard who cast it?\" Esher added." CR CR>
				    <TELL
"\"Harumph!\" was Praxix' reply, and as if to second his rejoinder, ">)
				   (T
				    <TELL "But happily ">)>
			     <TELL "the
rains suddenly stopped, and the sky partially cleared. The fire had
been extinguished!" CR CR>
			     <TELL
"There was much cleaning up to do, and we each did what we could to
help. And then, tired and dirty, we returned to the Elf Home where
we bathed, and went off to sleep." CR CR>
			     <NEXT-DAY>
			     <REMOVE ,HYE-RIVER>
			     <MOVE-TO ,ELF-HOME-2>)>
		      <RTRUE>)
		     (<AND <OR <OBJECT? LIGHTNING-SPELL>
			       <OBJECT? FIRE-SPELL>>
			   <PRSI? FOREST-FIRE-FIRE>>
		      <REMOVE ,HYE-FIRE>
		      <COND (<OBJECT? LIGHTNING-SPELL>
			     <FSET ,LIGHTNING-SPELL ,SEEN>)>
		      <TELL
"In the spirit of fairness, I will call it absentmindedness, but Praxix now
attempted to fight fire with fire as he cast his \"" AO "\" spell at the onrushing
flames. Fortunately, he was unobserved by the others and his spell did little damage,
but I began to have my doubts as to the stability of our wizardly friend.">)
		     (<OBJECT? TREMOR-SPELL>
		      <TELL
"Praxix took some earth essence and flung it at the earth before him.
The earth shook, and the ground opened up before us. But this small
rift would hold the fire only a short time." CR CR>
		      <TELL ,PRAXIX-HASNT-GOT-ENOUGH>)
		     (<OBJECT? WIND-SPELL>
		      <TELL
"Praxix took some air essence from his pouch and flung it at the
approaching flames. A new, southern wind fought with the cold
north wind, and the Elves were cheered by the slowing progress
of the fire. But Praxix' magical wind departed within the hour,
and the fire continued its relentless approach." CR CR>
		      <TELL ,PRAXIX-HASNT-GOT-ENOUGH>)
		     (T
		      <UNUSE-ESSENCES>
		      <TELL
"Praxix now thought to cast his \"" AO "\" spell, but it didn't occur to
him how it could possibly help.">)>
	       <COND (<AND <NOT <CHECK-ESSENCES ,RAIN-SPELL>>
			   <NOT <QSET? ,HERE ,DEAD>>>
		      ;"Are none of what we need..."
		      <TELL CR CR
"\"What I need is water essence,\" the Wizard said mournfully, \"Without it,
I fear we are of no use to the Elves.\"">)>
	       <RTRUE>)>)>

<CONSTANT PRAXIX-HASNT-GOT-ENOUGH
"Reaching back into his pouch, Praxix said, mournfully, \"I haven't enough
magical essence to last us the afternoon.\"">

<ROOM ELF-HOME-2
      (TRAVEL-COMMANDS NUL-COMMAND NUL-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE ()
		<TELL
"When we awoke the next morning, a great feast had been prepared for
us - breads, berries, fruits, and many foods we had never seen
before. After eating heartily, the food was taken away, and we were
led to the Elf leader, who sat upon a tall wooden throne." CR CR>
		<TELL
"\"I am N'dar,\" he began, \"and I thank you on behalf of the Elves.
We have not seen the last of these scourges from the north, and I
am keenly aware that your quest is our quest also.\"" CR CR>
		<MOVE ,ELF-STONE ,INVENTORY>
		<COND (<FSET? ,BERGON ,DEAD>
		       <HINT ,HINT-TANGLETREES>
		       <TELL
"\"This is a day for rejoicing, but I am afraid that I have tragic news for
you. One of our scouts has located your friend; he had been strangled by the
Snaketrees into whose forest he had wandered. We have buried him here,
among our bravest brethren. I am indeed sorry.\"" CR CR>)>
		<TELL
"Then, he stood and took a green amulet from around his neck. \"This
is our most precious possession. It is said that it held great power once;
perhaps, it shall again.\" And, so saying, he called Praxix forward and
placed it around the Wizard's neck." CR CR>
		<TELL
"Thanking N'dar, we prepared to leave. V'ren was saddened, but
said nothing as she led us east through the forest and to the edge of a
great river.">
		<COND (<NOT <IN? ,ELF-STONE ,INVENTORY>>
		       <HINT ,HINT-ELVES>)>
		<COND (,2ND-PASS
		       <TELL " ">
		       <N-DAY-TREK 1>
		       <RTRUE>)>
		<TELL CR CR
"\"I must leave now,\" she said, and turning her back, she ran into
the forest.">
		<MOVE-TO ,RIVER-2>>)>

<COMMAND (FOLLOW-ELVES FOLLOW)>
<COMMAND STAY>

;"Another maze! Yow! Are we writing a Zork yet?"

;"To be here, Praxix' staff must be lit, at least initially."

<OBJECT WARREN-WALLS
	(LOC WARREN)
	(SDESC "walls")
	(KBD %<ASCII !\W>)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,ESHERBIT ,PRAXIXBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <CLEAR-EXBIT>
		 <COND (<NOT <QSET? ,WARREN-WALLS ,EXAMINED>>
			<TELL
"The walls here were slimy to the touch, and covered in green
mosses and lichens.  Life flourished here, though it was not the
sort of life that was happily endured: spiders, slugs,
toads, worms, lizards, and maggots. But not all of us were
disheartened." CR CR>)>
		 <COND (<EQUAL? ,ACTOR ,PRAXIX>
			<TELL
"\"If I were a maker of magic potions,\" Praxix said, wistfully, \"I
should have a field day here!\"">
			<COND (<IN-PARTY? ,ESHER>
			       <TELL CR CR
"Esher shook his head in disbelief. \"Yes,\" he said with indelicate
sarcasm, \"A lovely spot for a party. Now, why don't you make yourself
useful and get us out of here? Damned Wizard...\" His voice trailed off to
a whining whisper.">)>)
		       (T
			<FSET ,WARREN-WALLS ,SOLVED>
			<TELL
"\"Hawkbane,\" Esher said, holding up a phosphorescent root that he had
discovered growing in the walls of this warren, or whatever it was." CR CR>
			<TELL
"\"Hawkbane?\" Praxix echoed, unaware of any such thing." CR CR>
			<TELL
"\"Yes, a remarkable find,\" he replied. \"A very rare medicinal herb, not
seen much where we come from. It's the most potent inhibitor of allergic
reactions that exists, but its rarity makes it virtually unknown outside of
professional circles.\" Getting down on his knees, he pulled a few more of
the faintly glowing roots and placed them inside his cloak.">)>
		 <RTRUE>)>)> 

<ROOM WARREN
      (TRAVEL-COMMANDS PROCEED-COMMAND BACK-COMMAND UP-COMMAND NUL-COMMAND)
      (FLAGS UNDERGROUND DANGEROUS ADVISE)
      (CAST-LIMIT INF)
      (GRAPHIC G-WARREN)
      (TEMP 0)
      (ENTER FSET-SEEN)
      (ACTION
       <ACOND ("AUX" TMP)
	      (DROP
	       <UPDATE-FSET ,HERE ,DONT-DROP>
	       <TELL
"I thought to drop something as an aid in mapping this labyrinth,
but realized we had too few items to spare in case we got lost.">)
	      (CAST
	       <COND (<AND <OBJECT? LIGHT-SPELL>
			   <PRSI? STAFF>
			   <NOT <FSET? ,HERE ,BLUE-MIX>>>
		      <SET TMP <GET-TEMP>>
		      <COND (<OR <ZERO? <MOD .TMP 4>>
				 <ZERO? <MOD .TMP 3>>>
			     <TELL
"Preferring to see where we were going, Praxix pulled more fire
and earth essences from his pouch and applied them to his staff, causing it to
glow more brightly. \"We had best leave this water-logged prison soon, for I shan't
be able to do this often!\" he said.">)
			    (<ZERO? <MOD .TMP 5>>
			     <FSET ,HERE ,BLUE-MIX>
			     <TELL
"Praxix fumbled for some fire and earth essence, which he applied to the
end of his staff. Soon it was glowing again with a pale red glow.">)
			    (<G? ,WARREN-COUNT 12>
			     <TELL
"\"This,\" Praxix said petulantly, \"is ridiculous. I refuse to
use more precious essences on this festering sore of a tunnel!\" He
put his pouch away, and stood there, fuming.">
			     <RTRUE>)
			    (T
			     <TELL
"Fearing that his staff's light was fading in the dampness, Praxix
applied some additional fire and earth essence, making it brighten
somewhat.">)>
		      <CLEAR-TEMP>)
		     (<OBJECT? FAR-VISION-SPELL>
		      <CAST-FAR-VISION <>>
		      <TELL " But little was illuminated. ">
		      <COND (<OR <NOT <FSET? ,HERE ,EXAMINED>>
				 <NOT <IN-PARTY? ,ESHER>>>
			     <TELL "\"I fear
we shall have little help in getting ourselves out of this maze!\"
he said.">)
			    (T
			     <TELL "\"I think that should put
your fears to rest, Esher,\" he said." CR CR>
			     <TELL
"\"Not really. It gives rise to new ones,\" he replied, leading me to
wonder whether Esher in fact had a sense of humor after all.">)>)
		     (<OBJECT? TREMOR-SPELL>
		      <COND (<NOT <QSET? ,HERE ,ENCHANTED>>
			     <TELL
"Thinking perhaps that a good jolt would lead us back into the
forest, Praxix cast his tremor spell. The results were not spectacular;
I was covered in a mossy slime, and Bergon's head received a visit from
a pile of hard-packed mud." CR CR>
			     <TELL
"\"Well, well, yes,\" he said proudly. \"Just a little more tremor and I'm
quite certain we'll be back above ground.\"" CR CR>
			     <TELL
"\"Or buried alive,\" I replied, thinking not only for my safety but for that
of our belongings.">)
			    (T
			     <TELL
"\"Well, here goes,\" Praxix said as he cast yet another tremor spell. The effect
was certainly more pronounced than the last time, and, indeed, the tunnel split
apart with such force that we were thrown from our feet and nearly buried in the
mud, moss, and slime. But we had survived, and our possessions all appeared to be
in place. Sunlight streamed in from above, and we were quickly back on our feet and
ready to clamber up and out of this underground maze of tunnels.">
			     <COND (<IN? ,WEBBA-MAP ,INVENTORY>
				    <FSET ,WEBBA-MAP ,INCAPACITATED>)>
			     <FSET ,HERE ,USED-UP>
			     ;"Fake an UP command"
			     <SETG ACTION ,UP-COMMAND>
			     <AGAIN>)>)>)
	      (GET-ADVICE:REMOVE
	       <TELL ACT
" looked to each of us, but none had any good ideas on how to escape
this soggy underground nest of twisting passages." CR CR>
	       <TELL
"\"Then we had best continue,\" Bergon said, \"There must be an exit
somewhere!\" We were beginning to have our doubts.">)
	      (<OR <ACTION? PROCEED> <ACTION? BACK>
		   <ACTION? LEFT> <ACTION? RIGHT>>
	       <SET-TEMP <SET TMP <+ <GET-TEMP> 1>>>
	       <COND (<AND <EQUAL? .TMP 1> <ACTION? BACK>>
		      <TELL
"Hoping to avoid getting lost in what appeared to be an underground
labyrinth, we turned back and were surprised to find two
passages behind us, one leading left and the other right." CR CR>
		      <COND (<NOT <QSET? ,HERE ,DEAD>>
			     <TELL ,OH-DEAR-MAZE>)
			    (T
			     <TELL ,OH-DEAR-MAZE-2>)>
		      <TRAVEL-COMMANDS ,HERE
				       ,LEFT-COMMAND
				       ,RIGHT-COMMAND
				       ,UP-COMMAND>)
		     (T
		      <COBBLE-WARREN-DESC>
		      <COND (<EQUAL? .TMP 1>
			     <COND (<NOT <QSET? ,HERE ,DEAD>>
				    <TELL CR CR ,OH-DEAR-MAZE>)
				   (T
				    <TELL CR CR ,OH-DEAR-MAZE-2>)>)
			    (<ZERO? <MOD .TMP 3>>
			     <COND (<L? ,WARREN-COUNT 5>
				    <TELL CR CR
"\"Blast the dampness,\" growled Praxix, as his staff started
growing dim. \"Never in my long years have I seen this!
Soon we shall be growing moss!\"" CR CR>
				    <TELL
"But then, his anger turned to some measure of excitement as he discovered some
small stones containing fire essence. \"Just a moment, if you will,\" he implored,
as he crushed the stones and placed the resulting small pile of essence into his
pouch. \"Given what the humidity here is doing to my glow spell, we shall be glad
to have found this!\"">				    
				    <FIND-ESSENCE ,ESSENCE-FIRE 2>)
				   (T
				    <TELL CR CR
"\"Not again!\" Praxix said, wearily, as his staff again started
to grow dim from the extreme humidity. \"Toads will be soon be leaping
from our clothes if we don't find our way out of here.\"">)>)
			    (<ZERO? <MOD .TMP 4>>
			     <TELL CR CR
"Praxix' staff glowed with an ever fainter light; soon, it would
be impossible to see the way before us.">)
			    (<ZERO? <MOD .TMP 5>>
			     <GRAPHIC ,G-WARREN-LIGHT>
			     <FCLEAR ,PRAXIX ,LIT>
			     <TELL CR CR
"Just then, Praxix' staff went out, and the tunnel went dark.
Dark, that is, except for the pale light of day faintly peeking
its way through the cracks in a hole just above us." CR CR>
			     <TELL
"\"Well, I'll be!\" said Praxix, with a smile. \"It seems that
sometimes, darkness is the best light to see by!\"">
			     <UPDATE-FSET ,HERE ,DONT-SCOUT>
			     <UPDATE-FCLEAR ,HERE ,ADVISE>
			     <TRAVEL-COMMANDS ,HERE ,UP-COMMAND>
			     <RTRUE>)>
		      <TRAVEL-COMMANDS ,HERE
				       ,LEFT-COMMAND
				       ,RIGHT-COMMAND
				       ,BACK-COMMAND
				       ,UP-COMMAND>)>)
	      (SCOUT:REMOVE
	       <TELL
"We thought to send " ACT " ahead, but were fearful of getting lost,
so we decided to stay together until we could find a way out.">)
	      (UP
	       <COND (<OR <FSET? ,HERE ,USED-UP>
			  <AND <NOT <FSET? ,PRAXIX ,LIT>>
			       <ZERO? <MOD .TMP 5>>>>
		      <COND (<IN? ,WOOD-ELF ,BITE-FOREST>
			     <TRAVEL-COMMANDS ,ELFSTREAM
					      ,ELF-HOME-COMMAND>)>
		      <TELL
"With an exit in sight, we happily climbed out of the warren ">
		      <MOVE-TO-ELFSTREAM>)
		     (T
		      <REMOVE-PARTY-COMMAND ,UP-COMMAND>
		      <TELL
"Hoping to find some way out, we tried feeling our way around the top of
the tunnel, but the thick growth above us made this all but impossible.
There might be a way out up there, but it was unlikely we were going
to find it.">)>)>)>

<ROUTINE MOVE-TO-ELFSTREAM ()
	 <COND (<FSET? ,ELFSTREAM-1 ,SEEN>
		<TELL
"and found ourselves alongside the pool and waterfall where I had first seen
the Wood Elf.">)
	       (T
		<TELL
" at a place where a gently flowing stream cascades over a small waterfall
and into a shallow pool.">)>
	 <MOVE-TO ,ELFSTREAM>>

<CONSTANT OH-DEAR-MAZE
"\"Oh, dear,\" said Praxix. \"I hope this isn't one of those underground
mazes.\"">

<CONSTANT OH-DEAR-MAZE-2
"\"Oh, dear,\" said Praxix. \"This is becoming rather tiresome.\"">

<CONSTANT WARREN-TBL-1
	  <LTABLE 0
		  "Selecting"
		  "Opting for"
		  "Choosing this time">> 

<CONSTANT WARREN-TBL-2
	  <LTABLE 0
		  "the results were discouragingly the same."
		  "this brought us to another similar spot."
		  "it was no good; it appeared that we were lost in
an endless maze of mossy sameness.">>

<ROUTINE TELL-WARREN-DIR ()
	 <COND (<ACTION? LEFT> <TELL "left path">)
	       (<ACTION? RIGHT> <TELL "path to the right">)
	       (<ACTION? PROCEED> <TELL "path before us">)
	       (T <TELL "path behind us">)>>

<GLOBAL WARREN-COUNT 0>

<ROUTINE COBBLE-WARREN-DESC ("AUX" (TMP <GET-TEMP>))
	 <SETG WARREN-COUNT <+ ,WARREN-COUNT 1>>
	 <COND (<AND <G? .TMP 1> <PROB 50>>
		<TELL <PICK-ONE ,WARREN-TBL-1>>
		<TELL " the ">
		<TELL-WARREN-DIR>
		<TELL
", we went a short way before coming to another junction.">)
	       (<NOT <EQUAL? <MOD .TMP 5> 1>>
		<TELL "This time, we went down the ">
		<TELL-WARREN-DIR>
		<TELL ", but ">
		<TELL <PICK-ONE ,WARREN-TBL-2>>)
	       (T
		<TELL "I had the unpleasant feeling that it little mattered,
but we started along the ">
		<TELL-WARREN-DIR>
		<TELL " and soon came to a similar spot.">
		<COND (<EQUAL? .TMP 1>
		       <TELL CR CR
"Sure enough, it now appeared that similar passages were leading off in all
directions.">)>)>
	 <COND (<AND <EQUAL? ,WARREN-COUNT 2>
		     <G? <GETP ,PRISON ,P?TEMP> 1>>
		<FSET ,HERE ,EXAMINED>
		<COND (<IN-PARTY? ,ESHER>
		       <TELL CR CR
"Esher, who had been unusually silent, said \"I have the strange
feeling I've been here before,\" no doubt referring to the Dwarves'
prison. Then, putting two and two together and achieving five, he
added, \"We have gone nowhere!\"" CR CR>
		       <TELL
"Praxix corrected him, though it wasn't easy.">)
		      (T
		       <TELL CR CR
"I offered the suggestion that our situation seemed familiar,
thinking of the Dwarves' prison, but Praxix disagreed.">)>
		<TELL " \"I have been looking
carefully at these passages, and I believe they are not the same.
If you wish, we can try using the flare enchantment, but I
already know the result.\"">)>>

<ROUTINE DIVIDER ("OPTIONAL" (NUM 4) "AUX" COL Y STARWID SCRWID (CURX 1))
	 <TELL CR CR>
	 <CURGET ,CURGET-TABLE>
	 <SET Y <ZGET ,CURGET-TABLE 0>>
	 <SET STARWID <TEXT-WIDTH "*">>
	 <SET SCRWID <* <- ,SCREEN-WIDTH ,TEXT-WINDOW-LEFT> ,CHRH>>
	 <SET COL </ <- .SCRWID <* <- .NUM 1> .STARWID>> .NUM>>
	 <SET CURX <+ 1 .COL>>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 1> <RETURN>)
		       (T
			<CURSET .Y .CURX>
			<TELL "*">
			<SET CURX <+ .CURX .COL .STARWID>>)>>
	 <TELL CR CR>>

;"Newfangled Elf stuff"

<BUZZ ;"The party"
      TAG BERGON ASTRIX MINAR ESHER HURTH
      ;"Elvish words of great antiquity"
      LA BRAN AGRITH VALEN GRAN LOREM
      ;"Drunken captains"
      STEGG CALFON ANDRIL ELEVAR CRIBALD BENDOR SISKA IBARA KELNOR ULMAN
      ANSAX GILFAN VENDOR MEREZI>

<ROUTINE PARSE-ELVISH ("AUX" (WDS <GETB ,E-LEXV 1>)
		             (W1 <GET ,E-LEXV 1>) (W2 <GET ,E-LEXV 3>))
	 <SETG SPOKE-ELVISH T>
	 <TELL "\"">
	 <PRINTT ,E-TEMP ,E-TEMP-LEN>
	 <TELL ",\" I said in my best imitation of an Elvish accent. ">
	 <COND (<G? .WDS 2>
		<TELL
"But the Elf appeared even more bewildered, and it occurred to me that I should speak
only a few words at a time to make myself more clearly understood.">)
	       (<AND <EQUAL? .W2 ,W?LA>
		     <NOT ,FOO-LA-FLAG>>
		<SETG FOO-LA-FLAG T>
		<TELL "The Elf appeared to understand, and regarded me intently">
		<COND (<AND <NOT <EQUAL? .W1 ,W?TAG>>
			    <ZERO? ,TAG-NAME-LENGTH>>			   
		       <FSET ,WOOD-ELF ,USED-UP>
		       <TELL ", though with evident suspicion">)>
		<TELL ", as if waiting for me to say more.">)	       
	       (<AND <EQUAL? .W1 ,W?VALEN>
		     <EQUAL? .W2 ,W?BRAN>
		     <NOT ,VALEN-BRAN-FLAG>>
		<SETG VALEN-BRAN-FLAG T>
		<TELL "It was clear that the Elf understood the words I had spoken,
but she did not respond, except, perhaps, with a quizzical look.">)
	       (<AND <EQUAL? ,W?BRAN .W1 .W2>
		     <EQUAL? ,W?AGRITH .W1 .W2>
		     <NOT <EQUAL? .W1 .W2>>>		    
		;"Friend of Agrith"
		<TELL
"The Elf paused for a moment, then smiled. You can imagine my surprise when she spoke
to me in my own tongue." CR CR>
		<TELL
"\"Do not be so surprised,\" she said. \"There are many enemies abroad on our lands,
and many would appear to be friends. Some, indeed, speak our tongue to deceive us. ">
		<COND (<FSET? ,WOOD-ELF ,USED-UP>
		       <TELL "I do not know why you have given a false name, b">)
		      (T
		       <TELL "B">)>
		<TELL "ut it is plain that you have met Agrith, and he has always been
like kin to the Elves. But more of this later. We had best look after your friend. I
believe I can help if you will take me to him.\"" CR CR>
		<UPDATE-MOVE ,WOOD-ELF ,BITE-FOREST>
		<FSET ,WOOD-ELF ,DONT-EXAMINE>
		<FSET ,ELFSTREAM-1 ,SOLVED>
		<TELL
"With little time to lose, we sped through the forest, finally reaching our camp at
sunset.">
		<SEARCH-END>)
	       (<AND <EQUAL? .W1 ,W?BRAN>
		     <NOT ,BRAN-FOO-FLAG>>
		<SETG BRAN-FOO-FLAG T>
		<TELL
"I must have said something meaningful, for the Elf appeared to listen more
intently to my words. Yet, she did not respond. Clearly, I was not saying anything
she cared to hear.">) 
	       (T
		<TELL
"The Elf looked at me with the utmost suspicion, then quickly leapt away through the
trees and out of sight. Discouraged, I returned to our camp.">
		<SEARCH-END>
		<RTRUE>)>>

<GLOBAL VALEN-BRAN-FLAG <>>
<GLOBAL FOO-LA-FLAG <>>
<GLOBAL BRAN-FOO-FLAG <>>
	 
<END-SEGMENT>

<BEGIN-SEGMENT TANGLEWOOD>

<OBJECT BERGON-SEARCH
	(GRAPHIC G-TANGLEWOOD)
	(ACTION
	 <ACOND ()
		(SCENE-START
		 <MAKE-SUBGROUP ,BERGON>
		 <CHANGE-TRAVEL-COMMAND ,BERGON
					,GET-ADVICE-COMMAND
					,EXAMINE-COMMAND>
		 <MOVE-TO ,TANGLEWOOD-1>)>)>

<OBJECT TANGLE-TREES-1
	(SDESC "trees")
	(KBD %<ASCII !\T>)
	(LOC TANGLEWOOD-1)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT ,BERGONBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:REMOVE
		 <TELL ACT
" stopped to admire the surrounding pine and alder. But up ahead, the forest
appeared darker and more forebidding.">)>)>

<OBJECT TANGLETREE
	(LOC TANGLEWOOD)
	(SDESC "snake tree")
	(8DESC "snaketree")
	(KBD %<ASCII !\S>)
	(FLAGS DONT-TAKE DONT-EXAMINE)>	

<ROOM TANGLEWOOD
      (TRAVEL-COMMANDS RETURN-COMMAND NUL-COMMAND NUL-COMMAND)
      (CAST-LIMIT 2)
      (GRAPHIC G-TANGLEWOOD)
      (FLAGS DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<MOVE ,HYE-TANGLE ,HAVE-YOU-EVER>>)
      (ACTION
       <ACOND ()
	      (RETURN
	       <REMOVE-TRAVEL-COMMAND ,BITE-FOREST ,BERGON-ROUTE-COMMAND>
	       <MOVE-TO ,BITE-FOREST>
	       <COND (<FSET? ,BERGON ,DEAD>
		      <TELL
"Carrying Bergon's body on our shoulders,">)
		     (<FSET? ,BERGON ,TRAPPED>
		      <TELL
"Unable to help Bergon, and with the snake-trees moving ever closer,">)
		     (T
		      <TELL
"Carrying Bergon on our shoulders,">)>
	       <TELL " we retreated to the safety of our camp.">
	       <COND (<FSET? ,BERGON ,DEAD>
		      <HINT ,HINT-TANGLETREES>
		      <TELL CR CR
"We buried Bergon there, after a short ritual performed by Praxix.">)
		     (<NOT <FSET? ,BERGON ,TRAPPED>>
		      <COND (<FSET? ,BITE-VICTIM ,INCAPACITATED>
			     <TELL CR CR
"Bergon regained his strength quickly; he looked at " D ,BITE-VICTIM " and
frowned. \"We must do something quickly, or he will die!\"">)
			    (T
			     <TELL CR CR
"It had been a long and frightening day; the sun had set, and we fell into
a deep and dreamless sleep.">
			     <NEXT-DAY>)>)
		     (T
		      <FSET ,BERGON ,DEAD>)>)
	      (<AND <ACTION? CAST>
		    <OBJECT? LEVITATE-SPELL>
		    <PRSI? BERGON-OBJECT>>
	       <TELL
"Praxix tried using his spell of elevation, but the trees' grip was
too strong.">)
	      (<AND <ACTION? CAST>
		    <OBJECT? FIRE-SPELL>>
	       <UNUSE-ESSENCES>
	       <TELL
"Praxix started to reach for his fire and earth essence, but he stopped
himself. \"Not the best place for a bonfire,\" he said softly.">) 
	      (<AND <ACTION? CAST>
		    <OR <AND <OBJECT? LIGHTNING-SPELL>
			     <PRSI? TANGLETREE>>
			<OBJECT? FAR-VISION-SPELL>>>
	       <COND (<OBJECT? FAR-VISION-SPELL>
		      <GRAPHIC ,G-TANGLEWOOD-BURNS>)>
	       <COND (<IN? ,WESTFLAKE-ROOT ,PRAXIX>
		      <TELL "For the second time that day, ">)>
	       <TELL
"Praxix put his magic to good use! ">
	       <COND (<OBJECT? LIGHTNING-SPELL>			   
		      <FSET ,LIGHTNING-SPELL ,SEEN>
		      <TELL 
"He mixed together the essences of fire and water, then added just a pinch
of earth essence. Just moments after casting the mixture, clouds gathered
around him, and the sky turned black. He motioned with his
staff at the deadly tree and a bolt of white lightning struck it, splitting it
down the middle. A few branches caught fire, and instinctively withdrew,
as if in pain.">
		      <COND (<NOT <QSET? ,LIGHTNING-SPELL ,INCAPACITATED>>
			     <TELL CR CR
"Praxix, proud of his accomplishment, turned to me and whispered that it
was the pinch of earth essence that really gives the lightning spell its
added punch. But however the magic had been prepared, its effect was
profound.">)>) 
		     (T
		      <TELL
"Praxix prepared his flare enchantment, and cast it at the tree before
us. The ball of flame sped through the forest before us, and the tentacles
withdrew, as if in pain, clearing a path in its wake.">)>
	       <TELL
" The tentacles loosened, we retrieved Bergon from their deadly
embrace.">
	       <FCLEAR ,BERGON ,TRAPPED>
	       <COND (<FSET? ,BERGON ,DEAD>
		      <TELL
" But it was too late; Bergon was dead!">)
		     (T
		      <PARTY-ADD ,BERGON>
		      <MAKE-BUSY ,BERGON ,ILL-COMMAND>
		      <TELL CR CR
"\"They don't much care for fire,\" Praxix mused, \"Let's get away before
they recover!\"">)>
	       <RTRUE>)
	      (<AND <ACTION? EXAMINE>
		    <OBJECT? BERGON-OBJECT>>
	       <TELL ACT
" looked Bergon over; he was unconscious. The tentacles were
slowly, inexorably, squeezing the life out of him!">)>)>

<ROOM TANGLEWOOD-1
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT DONT-CAST)
      (GRAPHIC G-TANGLEWOOD)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL "As ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "w">)
		     (T <TELL "h">)>
	       <TELL
"e continued, the forest grew increasingly dark and foreboding.
The stately stands of pine and alder were gone, replaced by shorter,
more twisted trees that seemed to choke the very life out of the
forest. A rustling noise filled ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "our">)
		     (T <TELL "his">)>
	       <TELL " ears, and the trees writhed with a hypnotic motion, though
the air was still, with no hint of a breeze.">
	       <MOVE-TO ,TANGLEWOOD-2>)
	      (RETURN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TANGLE-NO-RETURN>)
		     (T
		      <START-PRAXIX-SEARCH
"With little hope of finding the westflake in this direction">)>)>)>

<ROUTINE TANGLE-NO-RETURN ()
	 <SETG TANGLE-TWO-B T>
	 <REMOVE-PARTY-COMMAND ,RETURN-COMMAND>
	 <TELL
"I suggested turning back but Praxix">
	 <COND (<IN-PARTY? ,BERGON>
		<TELL " and Bergon">)>
	 <TELL " would not hear of it." CR CR>
	 <COND (,A-B-FLAG
		<TELL
"\"Going back into the caverns is not an alternative,\" Praxix said. \"Indeed, we
are fortunate enough to have found the one way out; I do not relish the thought
of finding another.\"">)
	       (T
		<TELL
"\"No, this is the path we have chosen,\" Bergon said firmly. \"I feel we
are heading in the direction Astrix would have wished.\"" CR CR>
		<TELL
"\"Yes,\" Praxix said, \"This might well be a good choice, whether or
not it was the one Astrix had in mind.\"">)>>

<GLOBAL TANGLE-TWO-B <>>

<ROUTINE START-PRAXIX-SEARCH (STR)
	 <TELL .STR ", Bergon slowly headed back toward camp.">
	 <SCENE ,PRAXIX-SEARCH>>

<OBJECT TANGLE-TREES-2
	(SDESC "trees")
	(KBD %<ASCII !\T>)
	(LOC TANGLEWOOD-2)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT ,BERGONBIT>)
	(FLAGS DONT-TAKE)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<NOT ,SUBGROUP-MODE>
			<TELL "W">)
		       (T
			<TELL "H">)> 
		 <TELL
"e looked around, but could find no source of the rustling noises,
except for the trees themselves.">
		 <COND (<IN-PARTY? ,BERGON>
			<TELL CR CR
"\"Argh!\" Bergon cried, seeing a fox twisted until nearly unrecognizable
by the strangling branches.">)>
		 <RTRUE>)>)>

<ROOM TANGLEWOOD-2
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (FLAGS DANGEROUS DONT-SCOUT)
      (GRAPHIC G-TANGLEWOOD)
      (ENTER
       <EXECUTE ()
		<COND (<AND <FSET? ,HERE ,BLACK-MIX>
			    <NOT <QSET? ,HERE ,BLUE-MIX>>>
		       <TELL CR CR
"\"These are the same trees that trapped me in the forest where " D ,BITE-VICTIM
" was stricken by the Nightfang,\" Bergon said." CR CR>
		       <TELL
"\"Yes,\" replied Praxix. \"Let us hope that my magic will work now as it did
before!\"">)
		      (<AND <FSET? ,HERE ,TRIED>
			    <NOT <QSET? ,HERE ,BLUE-MIX>>>
		       <TELL CR CR
"\"I have seen these trees before,\" Bergon said darkly, \"in the forest,
where " D ,BITE-VICTIM " was stricken by the Nightfang. We must find some
other way, for there is no escape for us if we are caught in their grasp!\"">)>      
		<COND (,SUBGROUP-MODE
		       ;"Say Bergon was here before..."
		       <FSET ,HERE ,TRIED>)
		      (<AND ,PART-TWO ,TANGLE-TWO-B>
		       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED
	       <TELL
"The gnarled trees were soon too thick to penetrate, and ">
	       <COND (<IN-PARTY? ,BERGON> <TELL "Bergon">)
		     (T
		      <TELL D <FIRST-IN-PARTY ,ESHER ,MINAR, HURTH ,PRAXIX>>)> 
	       <TELL " finally
unsheathed his sword, hacking at the undulating branches. But the branches
did not break; they sloughed off, falling to the ground in a pool
of steamy green slime. The air was now steamy, and the wavy branches
taunted ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "us">)
		     (T <TELL "him">)>
	       <TELL ", goading ">
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "us">)
		     (T <TELL "him">)>
	       <TELL " onward into their unrelenting grasp.">
	       <MOVE-TO ,TANGLEWOOD-3>)
	      (RETURN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,RETURN-COMMAND>
		      <TANGLE-NO-RETURN>)
		     (T
		      <START-PRAXIX-SEARCH
"Discouraged, and making little progress">)>)>)>

<OBJECT TANGLE-TREES-3
	(SDESC "trees")
	(KBD %<ASCII !\T>)
	(LOC TANGLEWOOD-3)
	(FLAGS DONT-TAKE)
	(EXBITS <+ ,PRAXIXBIT ,ESHERBIT ,BERGONBIT>)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL ACT
" turned, but the choking trees were everywhere. Escape would be difficult,
if not impossible!">)>)>

<ROOM TANGLEWOOD-3
      (TRAVEL-COMMANDS PROCEED-COMMAND RETURN-COMMAND NUL-COMMAND)
      (CAST-LIMIT INF)
      (FLAGS DANGEROUS DONT-SCOUT)
      (GRAPHIC G-TANGLEWOOD)
      (ENTER
       <EXECUTE ()
		<COND (,SUBGROUP-MODE
		       <FSET ,TANGLEWOOD-2 ,BLACK-MIX>)>
		<COND (<AND ,PART-TWO ,TANGLE-TWO-B>
		       <TRAVEL-COMMANDS ,HERE ,PROCEED-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (PROCEED:REMOVE
	       <COND (<NOT ,SUBGROUP-MODE> <TELL "We">)
		     (T
		      <TELL "Bergon">)>
	       <TELL
" tried to move forward, but it was no use. The growth was too thick!">)
	      (RETURN
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TELL
"Sensing our peril, we tried to retreat, but the trees had closed in
behind us. A branch rested on Bergon's">)
		     (T
		      <TELL
"Bergon, sensing his peril, tried to move back, but the trees had closed in
behind him. A branch rested on his">)>
	       <TELL " shoulder, writhing and undulating as it spread itself
around his arms and chest. The trees were closing in, and ">
	       <COND (<NOT ,SUBGROUP-MODE>
		      <TELL "we were trapped!">
		      <REMOVE-TRAVEL-COMMAND ,HERE ,RETURN-COMMAND>)
		     (T
		      <TELL "Bergon was trapped!">
		      <FSET ,BERGON ,TRAPPED>
		      <PARTY-REMOVE ,BERGON>
		      <SCENE ,PRAXIX-SEARCH>)>)>)>

;"Part II tangletrees..."

<OBJECT TANGLESCENE
	(TIME 0)
	(CLOCK
	 <EXECUTE ()
		  <COND (<AND <EQUAL? ,HERE ,TANGLEWOOD-3>
			      <NOT <CHECK-ESSENCES ,FAR-VISION-SPELL>>>
			 <FORCE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)>>)
	(ACTION
	 <ACOND ("AUX" TMP)
		(<AND <ACTION? PROCEED>
		      <EQUAL? ,HERE ,TANGLEWOOD-3>
		      <NOT <CHECK-ESSENCES ,FAR-VISION-SPELL>>>
		 <HINT ,HINT-TANGLESCENE>		 
		 ;"Really trapped here, with no alternative..."
		 <SET TMP <FIRST-IN-PARTY ,BERGON ,HURTH ,ESHER ,MINAR>>
		 <PARTY-REMOVE .TMP>
		 <SCENE <>>
		 <TELL
"There appeared to be no alternative to hacking and slashing our way through these
infernal trees, and for a while no harm came to us. But I am appalled to
report that one of the trees grabbed " D .TMP " and crushed him to death before
our very eyes. And, most eerily, the trees then bothered us no longer, as if
satisfied at our sacrifice. You can imagine our desolation as, safe at last from
the accursed forest, we made our camp for the night.">
		 <COND (<L? ,PARTY-MAX 3>
			<TELL CR CR>
			<PART-TWO-TOO-FEW>
			<RTRUE>)>
		 <MOVE-TO ,FOG-CAMP>)
		(CAST
		 <COND (<AND <OBJECT? FIRE-SPELL>
			     <EQUAL? ,ACTION-PRSI
				     ,TANGLE-TREES-1
				     ,TANGLE-TREES-2
				     ,TANGLE-TREES-3>>
			<TELL
"\"Perhaps they do not like fire,\" Praxix said, but fearing an uncontrollable
blaze, he cast only a small amount of magical powders at a nearby tree.
Sure enough, the tree recoiled as if in pain." CR CR>
			<TELL
"\"The problem is,\" Praxix said, \"that I haven't enough magical powders to
burn every tree we need to pass through. And if I use too much at one time, I
may cause a great forest fire, with even less chance of escape than we now
have!\ No,\" he said, \"there must be a better way.\"">)
		       (<OBJECT? LIGHTNING-SPELL>
			<FSET ,LIGHTNING-SPELL ,SEEN>
			<TELL
"Clouds gathered as Praxix cast his lightning spell, and as he pointed
his staff at the tree before us, a bolt of white lightning split it in
two. A few branches caught fire and instinctively withdrew, as if in
pain." CR CR>
			<COND (<NOT <QSET? ,LIGHTNING-SPELL ,INCAPACITATED>>
			       <TELL
"Praxix, proud of his accomplishment, turned to me and said, \"It's
that tiny bit of earth essence that gives the lightning spell its
extra punch!\" Then, he turned to the others and spoke. ">)>
			<TELL
"\"Effective, but inefficient,\" Praxix declared. \"I don't have nearly
enough fire essence to strike every tree that lies before us!\"">)
		       (<OBJECT? RAIN-SPELL>
			<REMOVE ,HYE-TANGLE>
			<TELL
"Praxix cast his rain spell, and soon a heavy rain fell over the forest.
But rather than helping our condition, rather the trees appeared to strengthen
from the moisture, so much so that we were now more endangered than we
had been before.">)
		       (<OBJECT? FAR-VISION-SPELL>
			<GRAPHIC G-TANGLEWOOD-BURNS>
			<TELL
"And then Praxix found the solution. Taking out his air and
fire essences, he cast the flare enchantment in our direction of travel.
A ball of white-hot flame flew from his fingertips, and the tentacles withdrew
from the approaching fire, leaving a narrow, but clear, path in its
wake." CR CR>		
			<TELL
"He wiped the ">
			<TELL-COLOR ,ESSENCE-FIRE ,ESSENCE-AIR>
			<TELL
" residue from his fingertips and implored us onward.
\"Come quickly,\" Praxix cried, \"Even hurt, these trees are disquieting,
and I wish to be long gone when they make their recovery.\"" CR CR>
			<SCENE <>>
			<TELL
"It was a long march through these tangled trees, and it was a few hours
before  we reached their farthest limits. That night, we made our camp in
a clearing nearby. To celebrate our escape, ">
			<TELL D <FIRST-IN-PARTY ,BERGON ,HURTH ,ESHER ,PRAXIX>>
			<TELL " rounded up a few large rabbits, from which we made
a hearty stew." CR CR>
			<TELL
"Sitting around the campfire, we began to eat our meal. Praxix, though, had
removed his pouch of magical essences and brought forth a fine, white powder
which he cast ever so carefully at his portion of supper. We gazed
intently as Praxix fretted and stared at his food, then cast more of the powder
and fretted and stared some more. Finally, Praxix returned his pouch to his cloak
and ate his dinner with relish. Looking up from his fast-emptying bowl, he saw us
staring at him with a mixture of curiosity and bewilderment. Finally, I asked him
what magic he had so delicately performed on his dinner." CR CR>
			<TELL
"\"Not magic,\" he said. \"Salt. Can't digest a rabbit stew properly without
it.\"" CR CR>
			<TELL
"After dinner, we slept, but the night was cold and damp, and we rested fitfully,
awakening to a dark and foggy morning.">
			<GRAPHIC ,G-FOREST>
			<MOVE-TO ,FOG-CAMP>)>)>)>

<END-SEGMENT>