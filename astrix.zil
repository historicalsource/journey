"ASTRIX for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT RIVER>

<GLOBAL ASTRIX-TRAP <>>

<COMMAND GIVE-UP>

<ROOM ASTRIX-MAZE
      (TRAVEL-COMMANDS LEFT-COMMAND RIGHT-COMMAND NUL-COMMAND)
      (ENTER
       <EXECUTE ()
		<FCLEAR ,WEBBA-MAP ,DONT-EXAMINE>>)
      (GRAPHIC G-MOUNTAIN)
      (CAST-LIMIT INF)
      (ACTION
       <ACOND ()
	      (SCOUT:REMOVE 
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL ACT
" was sent to scout out the various paths, and returned a short while
later. \"They all seem to lead up the mountain,\" he said. \"Perhaps
it does not matter which one we take.\"">)
		     (T
		      <TELL ACT
" went ahead to scout the various paths, and returned a short while
later. \"I have not been this far east in my travels,\" he said, \"I
sense great danger here; I wish we did not have to guess which path
to take up the mountain.\"">)>
	       <TELL CR CR
"\"I fear that such a powerful Wizard as Astrix would try to defend
himself against unwanted visitors,\" Praxix ">
	       <COND (<EQUAL? ,ACTOR ,ESHER>
		      <TELL "countered">)
		     (T
		      <TELL "said, echoing Minar's concerns">)>
	       <TELL ".">)
	      (LEFT
	       <AM-MOVE 0>)
	      (RIGHT
	       <AM-MOVE 1>)
	      (BACK
	       <AM-MOVE -1>)
	      (<AND <ACTION? CAST>
		    <OBJECT? FAR-VISION-SPELL>
		    <NOT <QSET? ,FAR-VISION-SPELL ,INCAPACITATED>>>
	       <ASTRIX-RESPONDS-TO-FLARE>)
	      (GIVE-UP
	       <HINT ,HINT-WEBBA-MAP>
	       <REMOVE ,HINT-AVALANCHE>
	       <REMOVE ,HINT-MTN-LION>
	       <GIVE-UP-ENDING>)>)>

<ROUTINE GIVE-UP-ENDING ()
	 <TELL
"I am sad to report that we never did reach Astrix, though we had travelled so far
and accomplished so much. It was a sad retreat back to Lavos, and word of our failure
spread throughout the land like a winter's gale. The end had come for our journey,
and there would be no others.">
	 <BAD-ENDING>>

<GLOBAL ASTRIX-MAZE-PATH 0>
<GLOBAL ASTRIX-MAZE-ROUTE 1>
<GLOBAL ASTRIX-FORK 1>

<ROUTINE AM-MOVE (LR)
	 <FORCE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND>
	 <COND (<L? .LR 0>
		<TELL
"Unsure of whether our last decision was correct, we backtracked to ">
		<SETG ASTRIX-MAZE-ROUTE <SHIFT ,ASTRIX-MAZE-ROUTE -1>>
		<SETG ASTRIX-FORK <- ,ASTRIX-FORK 1>>
		<COND (<EQUAL? ,ASTRIX-MAZE-ROUTE 1>
		       <CHANGE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND ,GIVE-UP-COMMAND>
		       <TELL "where all paths began, at the edge of the Great
River.">)
		      (T
		       <TELL "the previous fork along the path.">)>
		<RTRUE>)
	       (T
		<SETG ASTRIX-MAZE-ROUTE <+ <SHIFT ,ASTRIX-MAZE-ROUTE 1> .LR>>
		<SETG ASTRIX-FORK <+ ,ASTRIX-FORK 1>>)>
	 <COND (<EQUAL? ,ASTRIX-MAZE-ROUTE ,ASTRIX-MAZE-PATH>
		<FSET ,WEBBA-MAP ,DONT-EXAMINE>
		<ARRIVE-AT-ASTRIX-TOWER>)
	       (<G? ,ASTRIX-MAZE-ROUTE 63>
		;"We've gone six turns and are all messed up now..."
		<SETG ASTRIX-MAZE-ROUTE 1>
		<SETG ASTRIX-FORK 1>
		<CHANGE-TRAVEL-COMMAND ,HERE ,BACK-COMMAND ,GIVE-UP-COMMAND>
		<COND (<PROB 50>
		       <AM-LION>)
		      (T
		       <AM-AVALANCHE>)>)
	       (T
		;"Text depending on how far we are (check high bit of ROUTE)"
		<TELL <GET ,ASTRIX-MAZE-STR-1 ,ASTRIX-FORK>>
		<COND (<ZERO? .LR> <TELL "left">)
		      (T <TELL "right">)>
		<TELL "hand path. ">
		<TELL <GET ,ASTRIX-MAZE-STR-2 ,ASTRIX-FORK>>)>>
	      
<CONSTANT ASTRIX-MAZE-STR-1
	  <LTABLE "We decided to start by taking the "
		  "Both paths looked much the same, but nevertheless we chose the "
		  "At this fork, we took the "
		  "After some discussion, we decided upon the "
		  "We nearly came to blows over the next decision, but it was finally
agreed to pursue the "
		  "\"This had better be the path,\" Praxix said, as we started out
upon the "
		  "\"A bug,\" said Praxix, who turned into a newt and raced down the ">>

<CONSTANT ASTRIX-MAZE-STR-2
	  <LTABLE
"Judging by the speed at which the path ascended, we felt certain that we were on the
right path, or, at any rate, a path good enough to take us to Astrix' tower atop the
mountain. But the path soon forked, and gave no hint as to which would lead us further."
"The climb became steeper, and our movement slower, yet the fortress of Astrix loomed
ever closer. And then, the path split again, with larger path heading left and the
narrower one right."
"Although the path climbed for a short while, it soon began to descend down a steep
gully, lowering our hopes that we had chosen well. When we again reached a fork, we
were relieved, figuring that one would return us to our ascent of the mountain. Yet
both appeared to descend even further."
"Down and down we went, and we had soon lost Astrix' tower from our view. \"Guess
what,\" Praxix said, pointing out the spot ahead at which the path forked for yet
another time. It wasn't necessary, as the appearance of forks in the path was starting
to wear on our nerves."
"Sure enough, we hadn't gone more than one hundred paces, when we came to another fork.
\"At least we didn't have to march for hours this time,\" Praxix said, testily."
"And it well might have been, for we started climbing swiftly, and were soon scrambling
over rocks as we attempted to follow the feeble path that lay before us. \"If this isn't
the path,\" he said, \"then I'm one unhappy Wizard.\" And that is precisely what Praxix
became when we came at last to another fork in the path."
"\"And a lousy, rotten one at that!\"">>

<ROUTINE AM-LION ("AUX" FIP)
	 <SET FIP <SPARE-VICTIM>>
	 <TELL
"Our path rose steeply for a short while, but the path ended abruptly. ">
	 <COND (<AND .FIP <NOT ,ASTRIX-TRAP>>
		<SETG ASTRIX-TRAP T>
		<PARTY-REMOVE .FIP>
		<HINT ,HINT-MTN-LION>
		<TELL "As " D .FIP " began clambering up the
rock face, he was struck by a mountain lion, killing him instantly.
The lion stood there before us, protecting his kill.">
		<COND (<CHECK-ESSENCES ,FIRE-SPELL>
		       <TELL " Praxix, quickly taking
some fire essence from his pouch, cast it upon the lion, engulfing him in
flame.">
		       <USE-ESSENCES ,FIRE-SPELL>
		       <TELL
" We buried poor " D .FIP " there, with Praxix performing the burial
ritual. And then,">)
		      (T
		       <TELL
"With no magic that might help us retrieve " D .FIP "'s body,">)>)
	       (T
		<TELL "\"We shall be spending the next week
climbing rock,\" Praxix said, \"I suggest trying another path.\"
I agreed, and">)>
	 <TELL " we slowly backtracked down the paths we had chosen, thereby
reaching our starting point at the base of the mountain.">>

<ROUTINE AM-AVALANCHE ("AUX" FIP)
	 <TELL
"Our chosen path wound its way steeply up the side of the mountain.">
	 <SET FIP <SPARE-VICTIM>>
	 <COND (<AND .FIP <NOT ,ASTRIX-TRAP>>
		<SETG ASTRIX-TRAP T>
		<PARTY-REMOVE .FIP>
		<HINT ,HINT-AVALANCHE>
		<TELL
" With no warning, Praxix shouted, \"Down! Rocks!\" but " D .FIP " did not
move quickly enough. A large rock struck him on the head, splitting his skull
and knocking him off the path, and down into a deep gully." CR CR>
		<UPDATE-FSET ,HERE ,DONT-SCOUT>
		<HAPPENED-QUICKLY .FIP>)
	       (T
		<TELL
" I was about to continue when Praxix grabbed me, pulling me out of the
path of some large falling rocks. \"Let us try another path,\" he said.
And so we made the long descent back to the river to attempt again to find
the path to Astrix.">)>>

<ROUTINE SPARE-VICTIM ()
	 <COND (<AND <IN-PARTY? ,MINAR>
		     <FSET? ,DWARF-MEETING ,SEEN>>
		,MINAR)
	       (<IN-PARTY? ,ESHER> ,ESHER)
	       (<AND <IN-PARTY? ,BERGON>
		     <FSET? ,DWARF-MEETING ,SEEN>
		     <FSET? ,HIGH-PLAIN ,SEEN>> ,BERGON)>>

<ROUTINE HAPPENED-QUICKLY (FIP)
	 <TELL
"It had happened so quickly, we stood in stunned silence, staring at
the place where " D .FIP " had met his end. \"We have come so far;
this is a tragic blow!\" Praxix said, then performed a brief burial
ritual. We descended all of the way back to our starting point at the river, but
no words were spoken.">>

<ROUTINE ARRIVE-AT-ASTRIX-TOWER ("AUX" (CNT <STONE-COUNT>) STN)
	 <SETG 2ND-PASS T>
	 <COND (<IN? ,HERMIT-POWDER ,INVENTORY>
		<FSET ,HERMIT-POWDER ,INCAPACITATED>)>
	 <GRAPHIC ,G-ASTRIX>
	 <TELL
"For six long hours, we continued to climb steeply up the side of the
Sunrise Mountain, and thus we came to the high tower of Astrix, the
Wizard. No sooner had we arrived, than the tower's massive oak door
opened." CR CR>
	 <TELL
"\"I have been following your progress with great interest,\"
the Wizard said, stroking his stringy gray beard. \"You are
a very resourceful group, that is certain!\"" CR CR>
	 <TELL
"His voice then became dark. \"The question is: Have you mettle enough to make
siege on the " ,BAD-GUY " himself?\" And then, smiling, the darkness fell from
his voice, and he answered his own question, \"We shall see, I suppose; we shall
see.\"" CR CR>
	 <TELL
"Leading us to his hearth, he sat us in a semi-circle around the
blazing fire and spoke. \"There is a story I must tell, a story of
Seven Stones. Created in a time lost to living memory, these Stones
contained the very strength and essence of our world. Of the Seven,
Four were entrusted to the races of men who could use them best:
Elves, Dwarves, Nymphs, and Wizards.\"" CR CR>
	 <TELL
"\"These are the Four: the Elf Stone, green as the forests of old, and the
Dwarf Stone, brown as the caverns of Forn a-klamen; the Nymph Stone,
blue as the deep waters of M'nera, and the Wizard Stone, red as the
dark fire of Serdi.\"" CR CR>
	 <TELL
"\"The four races are now sundered, and the Four have long
been kept apart, but now, with the " ,BAD-GUY " rearing his misshapen head
in our lands, we must bring them together again. For with them, we can
hope to find the Two, and then, finally, the One with whose help we can destroy
all Evil.\"" CR CR>
	 <TELL
"\"For it is told that having the Four, it is possible to find the Two;
so, also, do the Two give witness to their master, the One that in elder
days was called the Anvil!\"" CR CR>	       
	 <COND (<G? .CNT 0>
		<TELL
"\"Do they look anything like this?\" I asked, sheepishly, holding
up the " D <SET STN <FIRST-STONE>> " to Astrix' view." CR CR>
		<TELL
"\"You are too modest,\" he said, grinning widely, \"Yes, this is the ">
		<TELL <STONE-NAME .STN>>
		<TELL ".\"" CR CR>)>
	 <COND (<G? .CNT 1>
		<TELL
		 "\"Oh,\" I said. \"And th">
		<COND (<EQUAL? .CNT 2>
		       <TELL "is">)
		      (T
		       <TELL "ese">)>
		<TELL "...?\"" CR CR>
		<TELL
"\"Indeed, you have been busy,\" Astrix said, taking the stones, and slapping
me heartily on the back." CR CR>)>
	 <SETG PASS-1-STONES .CNT>
	 <COND (<EQUAL? .CNT 3>
		<ASTRIX-SHOWS-STONE>
		<RTRUE>)>
	 ;"Don't need these - they just clutter up the inventory..."
	 <COND (<IN? ,NYMPH-STONE ,INVENTORY>
		<REMOVE ,NYMPH-STONE>)>
	 <COND (<IN? ,DWARF-STONE ,INVENTORY>
		<REMOVE ,DWARF-STONE>)>
	 <COND (<IN? ,ELF-STONE ,INVENTORY>
		<REMOVE ,ELF-STONE>)>		     
	 <COND (<NOT <FSET? ,DWARF-MEETING ,SEEN>>
		<TELL
"Astrix sat in deep thought, then spoke again. \"I am certain the
Dwarves who still walk the dark caverns can be of help to us. I know
of a gate...,\" Astrix said, and he proceeded to tell us where
we might find entrance to the Dwarves' kingdom." CR CR>
		<TELL
"We trekked for five days until we reached the spot Astrix
had sent us to; ironically, we were not far from the fork at
Lavos where we had started our journey.">
		<NEXT-DAY 5>
		<COND (<FSET? ,CANYON-GATE ,SCOUTED>
		       <TRAVEL-COMMANDS ,CANYON-GATE ,ENTER-COMMAND>)
		      (T
		       <TRAVEL-COMMANDS ,CANYON-GATE>)>
		<MOVE-TO ,CANYON-GATE>)
	       (<NOT <FSET? ,HIGH-PLAIN ,SEEN>>
		<TELL
"\"There is a place,\" Astrix began, \"a place high in the
mountains where we may find help in our cause.\" He gave
us directions, and sent us on our way." CR CR>
		<TELL
"We trekked for three days until we reached the high plain to which
Astrix had sent us. Below, a large, clear lake sat in a bowl in
the mountains.">
		<NEXT-DAY 3>
		<MOVE-TO ,HIGH-PLAIN>)
	       (T
		<RETURN-TO-ASTRIX-TOWER T>)>>

<ROUTINE STONE-COUNT ("AUX" (OBJ <FIRST? ,INVENTORY>) (CNT 0))
	 <REPEAT ()
		 <COND (<NOT .OBJ> <RETURN .CNT>)
		       (<EQUAL? .OBJ ,DWARF-STONE ,ELF-STONE ,NYMPH-STONE>
			<SET CNT <+ .CNT 1>>)>
		 <SET OBJ <NEXT? .OBJ>>>>

<ROUTINE STONE-NAME (STN)
	 <GETP .STN ,P?STONE-NAME>> 

<ROUTINE FIRST-STONE ("AUX" (OBJ <FIRST? ,INVENTORY>))
	 <REPEAT ()
		 <COND (<NOT .OBJ> <RFALSE>)
		       (<EQUAL? .OBJ ,DWARF-STONE ,ELF-STONE ,NYMPH-STONE>
			<RETURN .OBJ>)>
		 <SET OBJ <NEXT? .OBJ>>>>

<GLOBAL PASS-1-STONES 0>

