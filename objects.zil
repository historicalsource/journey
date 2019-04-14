"OBJECTS for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

<ROUTINE QSET? (OBJ BIT)
	 <COND (<FSET? .OBJ .BIT> T)
	       (T
		<FSET .OBJ .BIT>
		<RFALSE>)>>

<ROUTINE UPDATE-REMOVE (OBJ)
	 <UPDATE-MOVE .OBJ>>

<ROUTINE UPDATE-FSET (OBJ BIT)
	 <SETG UPDATE-FLAG T>
	 <FSET .OBJ .BIT>>

<ROUTINE UPDATE-FCLEAR (OBJ BIT)
	 <SETG UPDATE-FLAG T>
	 <FCLEAR .OBJ .BIT>>

<ROUTINE UPDATE-MOVE ("OPTIONAL" (OBJ ,ACTION-OBJECT) (TO <>) "AUX" (L <LOC .OBJ>))
	 <SETG UPDATE-FLAG T>
	 <COND (.TO <MOVE .OBJ .TO>)
	       (T
		<REMOVE .OBJ>)>
	 <RTRUE>>

;"Moveable objects..."

<OBJECT SPYGLASS
	(SDESC "spyglass")
	(FLAGS DONT-EXAMINE DONT-DROP DONT-CAST)
	(KBD %<ASCII !\S>)
	(ACTION
	 <ACOND ()
		(<AND <ACTION? DROP>
		      <CHARACTER-HERE? ,PRAXIX>>
		 <FSET ,SPYGLASS ,TRIED>
		 <TELL
"I don't know why, but I suddenly had the urge to lighten my pack at the expense
of the spyglass that I had taken in the Dwarves' high tower. When Praxix saw what
I was about to do, he urged me to keep it, saying it was a rare antiquity of great
beauty and, perhaps, value.">)
		(PICK-UP
		 <TELL
"Although wiser minds than I had concluded that the spyglass was unfit
for use, I was nonetheless taken by its beauty, and quietly placed it in my
pack. I do not think the others noticed, or, if they did, they said
nothing.">
		 <UPDATE-MOVE ,SPYGLASS ,INVENTORY>)>)>

<OBJECT NYMPH-STONE
	(SDESC "blue amulet")
	(8DESC "bl amlt")
	(LOC UL-TREASURY)
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP)
	(STONE-NAME "Nymph Stone")
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<EQUAL? ,ACTOR ,TAG> <TELL "I">)
		       (T
			<TELL ACT>)>
		 <TELL
" took a moment to admire the amulet. It was a small, golden orb, and in its
center lay a clear stone whose color was like that of the deep oceans. Surrounding
the stone were many hundreds of small, white diamonds, woven into an intricate
pattern of great beauty.">)
		(PICK-UP
		 <FSET ,NYMPH-STONE ,TRIED>
		 <UPDATE-MOVE ,ACTION-OBJECT ,INVENTORY>
		 <TREASURY-GRAPHIC>
		 <TELL
"Unsure of the wisdom of my intentions, I nonetheless grasped the amulet and
took it from atop its pedestal. To my surprise, no alarms rang and no guards
charged into the chamber. I held firmly on to the amulet, and planned my
escape.">)
		(DROP
		 <TELL
"Having done so much to obtain the amulet, it would have been foolish to put it
down on the ground, so I resisted the temptation to do just that.">)>)>

<OBJECT HERMIT-POWDER
	(SDESC "bag")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP)
	(ACTION
	 <ACOND ()
		(EXAMINE
		 <COND (<EQUAL? ,ACTOR ,TAG>
			<TELL
"I decided to check on the contents of the hermit's bag and found
five smaller bags of powders, much like those used by Praxix. Presumably,
Praxix would want to examine them himself.">) 
		       (<NOT <EQUAL? ,ACTOR ,PRAXIX>>
			<TELL ACT
" looked in the bag, opened it, and sniffed its contents.
\"Powders of some sort, I would guess,\" he said." CR CR>
			<TELL
"Praxix snatched the bag from " ACT>)
		       (T
			<TELL
"Praxix took the bag, opened it,">)>
		 <FSET ,HERMIT-POWDER ,SEEN>
		 <UPDATE-MOVE ,HERMIT-POWDER>
		 <FIND-ESSENCE ,ESSENCE-WATER 3>
		 <FIND-ESSENCE ,ESSENCE-AIR 2>
		 <FIND-ESSENCE ,ESSENCE-FIRE 3>
		 <FIND-ESSENCE ,ESSENCE-EARTH 4>
		 <TELL
" and reached inside. Nodding his head knowingly, he pulled five smaller
packets from the bag, and said, \"Magical
powders. Garlimon was quite resourceful to have salvaged these from
the carnage of his party. Perhaps it is the reason he has survived
this long.\" And then, examining the contents of each packet, he
continued. \"The four basic essences are here: air, earth, fire, and
water - of course, there's not much of any of them here. But this fifth powder...\"
His voice trailed off as he gazed intently at the blue-green powder">
		 <COND (,PART-TWO
		        <COND (<NOT <QSET? ,REAGENT ,SOLVED>>
			       <FIXUP-PRAXIX-COMMANDS>)>
			<TELL ". \"This must be the reagent that
Astrix told us about. How silly of me to have forgotten to examine
Garlimon's bag sooner!\"">)
		       (T
			<COND (<EQUAL? ,HERE ,HIGH-PLAIN>
			       <TELL
", then turned his eyes back toward the hermit's hut">)>
			<TELL ". \"I have never seen this
before. Ah, well! Perhaps Astrix will know it.\"">)>
		 <TELL " And with that, he placed
the powders among his own.">)>)>

<OBJECT RED-ROCK
	(SDESC "red rock" ;"Was 'bit of red rock'")
	(12DESC "red rock")
	(KBD %<ASCII !\R>)
	(FLAGS DONT-DROP DONT-CAST)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ()
		(PICK-UP
		 <UPDATE-MOVE ,RED-ROCK ,INVENTORY>		 
		 <COND (<FSET? ,RED-ROCK ,DONT-EXAMINE>
			<TELL
"Praxix was very much more interested in the red rock than the
miner, though he did not say why. Just in case, I picked up a few
small rocks">)
		       (T
			<TELL
"The red rocks intrigued me, so I picked a few up">)>
		 <TELL " and placed them in my pack for safe keeping.">
		 <FSET ,RED-ROCK ,DONT-EXAMINE>
		 <FSET ,RED-ROCK ,SOLVED>)
		(EXAMINE:CLEAR
		 <TELL ACT
" reached down to pick up the red rock, but was interrupted by the
miner." CR CR>
		 <TELL
"\"That, my friend, is what you might call junk rock,\" the miner said
with an unmistakable tension in his voice. \"Pretty enough, but not worth a
tinker's damn.\"">)>)>

<OBJECT DWARF-STONE
	(SDESC "brown amulet")
	(8DESC "brn amlt")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP)
	(STONE-NAME "Dwarf Stone")
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"The amulet was a golden brown stone that had been set in another,
darker stone, and hung at the end of a chain of gold.">)>)>

<OBJECT ELF-STONE
	(SDESC "green amulet")
	(8DESC "grn amlt")
	(KBD %<ASCII !\G>)
	(FLAGS DONT-DROP)
	(STONE-NAME "Elf Stone")
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"The stone in the amulet that N'dar had given us was a rich green, like that
of the forest itself, and hung on a single strand of some vine-like material
that was unfamiliar to me; certainly, no such thing grew back
in the plains.">)>)>

<OBJECT WEBBA-MAP
	(LOC WEBBAS)
	(SDESC "map")
	(KBD %<ASCII !\M>)
	(FLAGS DONT-DROP)
	(EXBITS PRAXIXBIT)
	(ACTION
	 <ACOND ("AUX" TMP)
		(EXAMINE
		 <COND (<EQUAL? ,HERE ,WEBBAS>
			<FSET ,WEBBA-MAP ,DONT-EXAMINE>
			<COND (<NOT <IN? ,WEBBA-MAP ,INVENTORY>>
			       <TELL
"Praxix expressed a keen interest in the map, and Webba obliged him by taking
the old parchment from the wall and, not letting it out of his grasp, holding
it up before the Wizard. ">)>
			<SINGLE-MOVE-GRAPHIC ,G-MAP>
			<TELL "The map was old and worn, and of
a land unknown to us. Suddenly looking grave, Webba asked, \"So you're
going on... to the Outlands?\"">
			<OPTION ,ACTOR ,REPLY-COMMAND ,IGNORE-COMMAND>)
		       (T
			<UPDATE-FSET ,ACTION-OBJECT ,DONT-EXAMINE>
			<COND (<NOT <FSET? ,WEBBA-MAP ,ENCHANTED>>
			       <TELL
"As we stood, unsure of which way to proceed, I was asked by " ACT " to
bring out the map we had bought at Webba's. Removing it from my pack,
I unfolded it and handed it to him." CR CR>)>
			<COND (<FSET? ,WEBBA-MAP ,INCAPACITATED>
			       <UPDATE-REMOVE ,WEBBA-MAP>
			       <TELL
"\"Why, this is terrible,\" he said, looking at the mud-soaked and hopelessly
damaged map. My fears in the mossy, underground maze had been realized, and
I tossed the map away in disgust.">
			       <COND (<NOT <EQUAL? ,HERE ,ASTRIX-MAZE>>
				      <TELL
" All we could do was hope the map wouldn't be needed.">)>
			       <RTRUE>)>
			<COND (<EQUAL? ,HERE ,SUNSET-TOWER>
			       <TELL
"\"Yes,\" Praxix said, looking over the map. \"The paths on the map are
there, across the great river. They appear to lead to the tower of Astrix -
it is a good thing we bought the map after all!">)
			      (<NOT <EQUAL? ,HERE ,ASTRIX-MAZE>>
			       <TELL
"His eyes darted from the map to our surroundings, and back again to the map.
Then, he slowly shook his head in the negative. \"The map indicates both a
river and mountain paths,\" he said. \"It would seem that the map refers to
someplace else.\" Discouraged, I took back the map and returned it to my pack.">
			       <RTRUE>)>
			<COND (<FSET? ,WEBBA-MAP ,DEAD>
			       <UPDATE-FSET ,WEBBA-MAP ,DONT-EXAMINE>
			       <SINGLE-MOVE-GRAPHIC ,G-MAP>
			       <TELL
"Once again, we examined the map carefully, but could discern no method by
which we could determine the correct path to Astrix' tower." CR CR>
			       <TELL
"\"The map is of no use to us,\" Praxix said finally, and he was right.">
			       <RTRUE>)>
			<TELL
"\"Yes!\" he said, knowingly. \"There is the river we crossed with the
forest behind it, and the mountains - here - lie ahead of us.\"" CR CR>
			<COND (<FSET? ,WEBBA-MAP ,SOLVED>
			       <FSET ,WEBBA-MAP ,BLUE-MIX>
			       <TELL
"\"And these runes here, the ones which are glowing faintly,\" Praxix
began, \"These mark the path we are to take.">
			       <COND (<NOT <EQUAL? ,ASTRIX-MAZE-ROUTE 1>>
				      <TELL
" Of course, we'll have to backtrack to the river first, but no matter.">)>
			       <TELL "\" ">
			       <ARRIVE-AT-ASTRIX-TOWER>)
			      (T
			       <FSET ,WEBBA-MAP ,DEAD>
			       <SINGLE-MOVE-GRAPHIC ,G-MAP>
			       <TELL
"\"But which path is the right one?\" I asked, pointing at the bewildering array
of marks which adorned each and every fork." CR CR>
			       <TELL
"\"I'm afraid we cannot know,\" Praxix admitted. \"Perhaps they are
all good paths,\" he added, with little conviction.">)>)>)
		(BUY
		 <TELL
"Not knowing if it would ever be of use to us, we nevertheless decided
to buy the strange map." CR CR>
		 <COND (<SET TMP <GET-TEMP>>
			<CLEAR-BUSY>
			<TELL
"Just then, " D .TMP ", having concluded his survey of the shop, wandered back into
our midst and stared blankly at the parchment. ">
			<CHANGE-CIT .TMP 1 ,NUL-COMMAND>)>
		 <TELL
"\"Rivers, forests, and mountains,\" ">
		 <COND (.TMP
			<TELL "he">)
		       (T
			<TELL "Esher">)>
		 <TELL " said sourly, glancing at the map
as I stowed it away in my pack, \"Why, this place could be anywhere!\"" CR CR>
		 <TELL
"\"Yes,\" answered Praxix, \"and I fear that is precisely where we are headed.\"">
		 <UPDATE-MOVE ,WEBBA-MAP ,INVENTORY>)>)>

<OBJECT ROPE
	(SDESC "rope")
	(KBD %<ASCII !\R>)
	(LOC INVENTORY)
	(FLAGS DONT-EXAMINE DONT-DROP DONT-CAST)>

<OBJECT IRON-KEY
	(SDESC "key")
	(KBD %<ASCII !\K>)
	(FLAGS DONT-DROP)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <COND (<EQUAL? ,ACTOR <GET-TEMP>>
			<TELL ACT
" asked us to look over the key more closely. We did, reporting back into
the hole that it had no markings, and, given its enormous size, must have
been intended for a door of similar proportions.">)
		       (T
			<TELL ACT
" took the key and looked it over. It was ludicrously large and without
markings; the door it was intended to open would presumably match it in
proportions.">)>)>)>

<OBJECT SPIRIT-STONE
	(SDESC "white stone")
	(8DESC "wht stone")
	(KBD %<ASCII !\W>)
	(FLAGS DONT-DROP)
	(ACTION
	 <ACOND ()
		(<OR <ACTION? EXAMINE> <ACTION? PICK-UP>>
		 <UPDATE-FSET ,SPIRIT-STONE ,DONT-EXAMINE>
		 <UPDATE-MOVE ,SPIRIT-STONE ,INVENTORY>
		 ;<GRAPHIC ,G-VAULT ,G-COFFIN ,BOTTOM-LEFT>
		 <COND (<ACTION? PICK-UP> <TELL "I">)
		       (T <TELL ACT>)>
		 <TELL
" took the white stone from around the neck of Cedrith and held it up
before him." CR CR>
		 <TELL
"\"It is weightless, or so it seems,\" ">
		 <COND (<ACTION? PICK-UP> <TELL "I">)
		       (T <TELL "he">)>
		 <TELL " said, suddenly filled with fear.">
		 <COND (<NOT <EQUAL? ,PRAXIX ,ACTOR>>
			<TELL CR CR>)
		       (T <TELL " ">)>
		 <TELL "\"It is not of this world!\"">
		 <COND (<NOT <EQUAL? ,PRAXIX ,ACTOR>>
			<TELL " Praxix responded, taking it in his hand.">)>
		 <TELL CR CR
"\"If I heard Astrix correctly, this stone is one of the Two.">
		 <COND (<FSET? ,STORY-CEDRITH ,EXAMINED>
			<TELL
" Cedrith's prize,\" Praxix said, holding up the white stone.">)
		       (T
			<TELL "\"">)>
		 <TELL
" He handed it to me, and I placed it securely in my pack.">
		 <RTRUE>)>)>

<OBJECT SIXTH-STONE
	(SDESC "black stone")
	(8DESC "blk stone")
	(KBD %<ASCII !\B>)
	(FLAGS DONT-DROP)
	(ACTION
	 <ACOND ()
		(EXAMINE:CLEAR
		 <TELL
"Praxix peered into the round, black stone, and as he did, its blackness grew deeper
and darker until Praxix was certain he had gone completely blind. He pressed his
eyes tightly closed and thrust the stone within his cloak; when he opened his eyes,
his vision had been restored.">)>)>