"PART2 for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

;"Connection to 2nd part from Astrix Tower"

<BEGIN-SEGMENT PART2>

<GLOBAL PART-TWO <>>

<ROUTINE START-PART-TWO ()
	 <REMOVE ,STORY-CAVERNS>
	 <REMOVE ,NYMPH-STONE>
	 <REMOVE ,ELF-STONE>
	 <UPDATE-REMOVE ,DWARF-STONE>
	 <SETG PART-TWO T>
	 <FCLEAR ,WEBBA-MAP ,DONT-DROP>
	 <REMOVE-ALL ,HURTH-STORIES>
	 <COND (<OR ,CHEAT <FSET? ,HERMIT-POWDER ,SEEN>>
		<UPDATE-REMOVE ,HERMIT-POWDER>
		<FSET ,REAGENT ,SOLVED>
		<MOVE ,REAGENT ,REAGENTS>
		<FIXUP-PRAXIX-COMMANDS> 
		<COND (<FSET? ,HERMIT-POWDER ,INCAPACITATED>
		       <TELL
"In retrospect, it seems strange that Praxix had not mentioned it when we
first came to the Sunrise Tower, but he now took out the hermit's strange
powder and showed it the Astrix, who">)
		      (T
		       <TELL
"Praxix showed Astrix the strange powder the hermit had thrown at us,
and Astrix">)>
		<TELL
" eyed it knowingly. Tasting the blue-green powder
to confirm his suspicions, he smiled and explained." CR CR>
		<TELL
"\"I cannot think where Garlimon found this powder, but it is fortunate
indeed that he did. This,\" he said, rubbing the powder between his
fingers, \"is a rare magical reagent which can be mixed with the
earthly essences to produce powerful enchantments. Be careful; the reagent
is most unstable, and should be mixed only when needed. Even then, some
mixtures may not have any effect whatever.\"">)
	       (T
		<TELL
"Astrix had some words for Praxix regarding the next phase of our journey.
\"In the lowest levels of the Dwarves caverns, there are magical reagents
which can be mixed with the earthly essences to create powerful enchantments.
The most valuable is a blue-green rock which crumbles to a fine powder
that is bitter to the taste. Take care if you find it, for it is most
unstable, and should be mixed only when needed. Even then, some mixtures
may not have any magical effect.\""> 
		<TRAVEL-COMMANDS ,PRAXIX
				 ,CAST-COMMAND
				 ,EXAMINE-COMMAND>)>
	 <TELL CR CR
"When it was time to leave, Astrix gave us rough directions through the
forest to the Dwarvish gate at Bern i-Fen, at the extreme eastern
end of the Reth a-Zar. \"I shall alert the Dwarves of your coming,\"
he said, and spoke in some forgotten tongue to an eagle who was perched
quietly on the tower's battlements. The eagle gave a shrill cry, then
soared from sight into the west." CR CR>
	 <TELL
"\"Your path will be difficult, that is certain, but remember: we have many
friends yet who live upon the earth. Be careful!
Make good speed!\" And with that, he turned and limped back to his
high tower." CR CR>
	 <NEXT-DAY 2>
	 <TELL
"Our path became difficult, but not at first, as we headed ever westward
through the Old Forest toward the caverns of the Dwarves. It was mid-afternoon
when the road unexpectedly forked; both paths led roughly to the west,
one heading more southerly and the other more northerly.">
	 <MOVE-TO ,FOREST-FORK>>

<COMMAND (NORTH-ROUTE NORTH)>
<COMMAND (SOUTH-ROUTE SOUTH)>

<GLOBAL A-B-FLAG <>>

<ROOM FOREST-FORK
      (TRAVEL-COMMANDS NORTH-ROUTE-COMMAND SOUTH-ROUTE-COMMAND
       		       NUL-COMMAND)
      (FLAGS ADVISE)
      (GRAPHIC G-FOREST)
      (ACTION
       <ACOND ()
	      (GET-ADVICE:REMOVE
	       <TELL
"Bergon reminded us that Astrix had said the Dwarvish gate was west
of our position">
	       <COND (<FSET? ,HERE ,SCOUTED>
		      <TELL
", and suggested taking the northern route, it being
the closest to due west. He solicited advice from the others in the
group, who were all in general agreement.">)
		     (T
		      <TELL
". The problem, we reminded him, was that both paths appeared to be
heading in a westerly direction, giving no obvious sign as to which would
be the best route to take.">)>) 
	      (SCOUT:REMOVE
	       <FSET ,HERE ,SCOUTED>
	       <TELL ACT
" sped off into the forest, returned, then sped off down the other fork.
When he returned, he offered no help in our decision." CR CR>
	       <TELL
"\"Both paths appear to run roughly west, though I'd say the northern
path is a bit more direct,\" he said.">) 
	      (NORTH-ROUTE
	       <SETG A-B-FLAG T>
	       <TELL
"We chose the more northerly path, and by day's end we had reached the
place described by Astrix as the Dwarvish gate of Bern i-Fen.">
	       <TELL ,FOREST-NIGHT>
	       <TELL CR CR
"When we awoke the next morning, a cold wind blew from the north, yet
a dark shroud of mist lay over the forest. It seemed an ill-omened day,
and our hearts were heavy with uncertainty and doubt. I packed our
things, and our party approached the gate.">
	       <MOVE-TO ,FOREST-GATE>)
	      (SOUTH-ROUTE
	       <TELL
"Choosing the more southerly path, we moved quickly as the forest appeared
to become older and darker. Rather than entering this foreboding forest so
late in the day, we camped just outside.">
	       <TELL ,FOREST-NIGHT>
	       <TELL " We rose to a cold, but sunny morning and were soon
in the midst of the dark forest.">
	       <SCENE ,TANGLESCENE>
	       <MOVE-TO ,TANGLEWOOD-1>)>)>

<CONSTANT FOREST-NIGHT " The night was
cold, for winter was nigh upon us; the stars shone down brightly on us, and a
crescent moon rose over the Sunrise Mountain. Perhaps, I thought, this presaged
better days yet to come.">

<END-SEGMENT>

<BEGIN-SEGMENT CAVERNS>

<ROOM FOREST-GATE
      (TRAVEL-COMMANDS ENTER-COMMAND NUL-COMMAND NUL-COMMAND)      
      (FLAGS DONT-SCOUT)
      (ENTER
       <EXECUTE ()
		<GRAPHIC ,G-GATE-RUNES ;,G-GATE-OPENS ;,BOTTOM-RIGHT>>)
      (ACTION
       <ACOND ()
	      (ENTER
	       <PICINF ,G-HURTH-SHADOW ,PICINF-TBL>
	       <TELL
"\"Klem'ela,\" Praxix intoned, and the Dwarvish door winked into
existence and opened. Cold, fetid air rushed from the caverns to meet
us, filling us with a morbid disgust." CR CR>
	       <TELL
"\"There is something, well, unwholesome about this cavern,\" I said,
as we started into the darkness. Happily, Astrix had lit Praxix' staff
before we had departed, and its pale red light still glowed enough to
see by." CR CR>
	       <FSET ,PRAXIX ,LIT>
	       <TELL
"We made quick progress down the arrow-straight road and soon
came upon a steep stair cut in the rock. I was about to comment
upon the Dwarves' monumental stonework, when Bergon stopped me
in my tracks." CR CR>
	       <TELL
"\"Shhh!\" he whispered roughly, \"there is something moving in
the shadows ahead!\"">
	       <MOVE-TO ,MINE-STAIR>)>)>

<COMMAND CONFRONT>

<ROOM MINE-STAIR
      (TRAVEL-COMMANDS PROCEED-COMMAND DOWN-COMMAND NUL-COMMAND)
      (GRAPHIC G-HURTH-SHADOW)
      (FLAGS UNDERGROUND ADVISE)
      (ENTER
       <EXECUTE ()
		<COND (<NOT <IN-PARTY? ,HURTH>>
		       <OPTION ,BERGON ,CONFRONT-COMMAND ,IGNORE-COMMAND>)>>)
      (ACTION
       <ACOND ()
	      (<OR <ACTION? SCOUT> <ACTION? GET-ADVICE>>
	       <UPDATE-FSET ,HERE ,DONT-SCOUT>
	       <FCLEAR ,HERE ,ADVISE>
	       <COND (<AND <ACTION? GET-ADVICE> <IN-PARTY? ,HURTH>>
		      <TELL
"Bergon asked Hurth to scout ahead, but Hurth replied, \"I have come from
the path before us, and it is dark and full of evil. ">)
		     (T
		      <TELL ACT
" went on ahead, and returned with a disturbing report." CR CR>
		      <TELL
"\"The caverns are cold and dark, and feel, well, evil,\" he said.">
		      <COND (<AND <NOT <EQUAL? ,ACTOR ,HURTH>>
				  <IN-PARTY? ,HURTH>>
			     <TELL CR CR
"Hurth agreed. \"I have felt this myself,\" he said, adding, \"">)
			    (T <TELL " ">)>)>
	       <TELL
"It would be best to descend into the lower caverns here.\"">)
	      (<OR <ACTION? CONFRONT> <ACTION? IGNORE>>
	       <COND (<ACTION? CONFRONT>
		      <TELL
"At Bergon's command, we drew our weapons and moved forward. And then,">)
		     (T
		      <TELL
"\"A trick of the eye, perhaps,\" Praxix volunteered, pointing out other
suspicious shadows that his staff now cast upon the rocks." CR CR>
		      <TELL
"\"Perhaps,\" said Bergon, taking his hand off the hilt of his broadsword,
\"But these caverns teem with orcs, and we cannot be too careful. Yes,
now that I look again, I believe Praxix is right.\"" CR CR>
		      <TELL
"Just then, in pointed contradition to my elder's conclusions,">)>
	       <TELL
" a man stepped from the shadows, his face glowing in the pale light of
Praxix' outstretched staff." CR CR>
	       <TELL
"\"Hurth!\" I gasped, taking a step backward." CR CR>
	       <TELL
"\"Stand back,\" Bergon shouted at us and drawing his sword, he approached
the ghostly shadow of our lost friend. \"Begone, false image,\" he
demanded, and waved his sword menacingly before him." CR CR>
	       <COND (<IN? ,HINT-DARK-PRESENCE ,HINTS>
		      ;"Party messed up pretty badly, letting it loose..."
		      <TELL
"\"Put down your weapon, Bergon,\" the shadow responded, \"It is I, Hurth.\"">
		      <TELL CR CR
"\"But how...\" I blurted out, still hiding behind Bergon's cloak." CR CR>
		      <TELL
"\"The story is long and will have to wait,\" Hurth began, \"Astrix sent word
that you may be needing assistance, but I am afraid we Dwarves have none to
offer. A great, dark evil has been loosed in these very halls and all of
our efforts are bent toward its destruction. Take not the path ahead, but
rather these stairs even to the lowest levels. It is there that you may find
what you seek - the stone of Cedrith!\"" CR CR>
		      <TELL
"\"I must return to my people. Good luck!\" he cried, and was gone." CR CR>
		      <TELL
"\"I fear we ourselves unleashed this evil upon the Dwarves,\" Praxix
moaned, \"These are dark days indeed, but hope remains if the Stone can be
found.\"">
		      <UPDATE-FCLEAR ,HERE ,ADVISE>
		      <REMOVE-TRAVEL-COMMAND ,HERE ,PROCEED-COMMAND>)
		     (T
		      <TELL
"\"It is I, Bergon,\" the shadow responded, \"I am sorry if I have upset
you, but Astrix said you would be needing some help!\"" CR CR>
		      <TELL
"\"But how...,\" I blurted out, still hiding behind Bergon's cloak." CR CR>
		      <TELL
"\"There is much to tell, and little time for the telling,\" he responded,
and bowing his head in sorrow, explained, \"My father, Agrith, saved my
life after our encounter with the orcs. The procedure cost him his own.\"
He then attempted a smile,
saying, \"Our hope lies in finding the ancient Stone, if Astrix is to be
believed. We Dwarves are certain it lies below, in the darkest regions of
these halls, where Cedrith was said to have found it, many long ages ago.\"">
		      <UPDATE-MOVE ,STORY-CEDRITH ,HURTH-STORIES>
		      <MOVE ,STORY-AGRITH ,HURTH-STORIES>
		      <PARTY-ADD ,HURTH>)>
	       <END-OPTION>
	       <NEW-DEFAULT>)
	      (PROCEED
	       <COND (<FSET? ,PRAXIX-VS-EVIL ,SEEN>
		      <REMOVE-PARTY-COMMAND ,PROCEED-COMMAND>
		      <TELL
"We started down the dark passage, and soon felt the dark Evil we
had encountered earlier in our journey." CR CR>
		      <TELL
"\"We should have expected this; when last we met, we were not
much farther along this same path!\" Praxix said." CR CR>
		      <TELL
"There was little discussion - we had to return to the stairs,
lest we face the unseen terror yet again.">)
		     (T
		      <MOVE-TO ,DARK-EVIL-CAVERN
"For some strange reason, I was apprehensive about this route
through the caverns, but Hurth was cheerful as we made quick
progress through the eastern regions of the Reth a-Zar.">)>)
	      (DOWN
	       <MOVE-TO-2-W>)>)> 
 
<ROUTINE MOVE-TO-2-W ()
	 <TELL
"The stair became steeper as we descended, and it was hours before
we came to the next level of the caverns. Here, a major path led
away into the darkness, but the stair continued its relentless
descent into the depths of the earth.">
	 <COND (<IN-PARTY? ,HURTH>
		<TELL CR CR
"\"We are not nearly to the lower levels,\" Hurth said. \"The path
leads down much farther!\"">)>
	 <MOVE-TO ,MINE-2-W>>
