"TALES for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

;"The tales Praxix an tell are contained in the following object. Tales
can be added/removed at will with MOVE/REMOVE"

<OBJECT UMBER-STORIES>

<OBJECT HURTH-STORIES>

<OBJECT PRAXIX-TALES>

;"If a spell has the SEEN bit, it is permanent. Otherwise, it is REMOVEd
after being told."

<ROUTINE COUNT (OBJ "AUX" (CNT 0))
	 <SET OBJ <FIRST? .OBJ>>
	 <REPEAT ()
	    <COND (<ZERO? .OBJ> <RETURN .CNT>)
		  (T
		   <SET CNT <+ .CNT 1>>
		   <SET OBJ <NEXT? .OBJ>>)>>>

<ROUTINE TELL-TALE (TL)
	 <APPLY <GETP .TL ,P?TEXT>>
	 <COND (<NOT <FSET? .TL ,SEEN>>
		<UPDATE-MOVE .TL>)>>

<OBJECT STORY-TOWERS
	(SDESC "Sun Towers")
	(8DESC "Sun Tower")
	(KBD %<ASCII !\S>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"When asked about the Tower of the Sunset, Hurth told of the Dwarves'
building of two great towers on opposite sides of the Hedras River. One,
the Sunset Tower, was the pride of the Dwarves; the other, the Sunrise
Tower was the last home of the Wizards, of whom only Astrix remains.">>)>

<ROUTINE REMOVE-ALL (OBJ "OPTIONAL" (OBJ2 <>) (PCH? <>) "AUX" F N)
	 <SET F <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .F> <RETURN>)
		       (T
			<SET N <NEXT? .F>>
			<COND (.OBJ2 <MOVE .F .OBJ2>)
			      (<OR <NOT .PCH?>
				   <NOT <EQUAL? .F ,POUCH>>>
			       <REMOVE .F>)>
			<SET F .N>)>>>

<ROUTINE MOVE-ALL (OBJ1 OBJ2)
	 <REMOVE-ALL .OBJ1 .OBJ2>>

<OBJECT STORY-CASTLE
	(LOC UMBER-STORIES)
	(SDESC "Castle")
	(KBD %<ASCII !\A>)
	(KBD2 %<ASCII !\C>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"\"You've come here often, then?\" Praxix asked, feebly attempting to make
conversation." CR CR>
		  <TELL
"\"Often enough,\" Umber replied, \"A profitable spot in so many ways!\"
Umber was now making himself obscure again. No matter; Praxix was getting
used to it. Umber paused briefly, then continued." CR CR>
		  <TELL
"\"From what I gather, this place has been here for quite a while. Some
say it was the Elves' home, before they disappeared from the earth - that
is, if you believe they existed at all, which I frequently do.\"">>)>

<OBJECT STORY-AGRITH
	(SDESC "Agrith")
	(KBD %<ASCII !\A>)
	(TEXT
	 <EXECUTE ()
		 <TELL
"The question was on all of our minds, but it was finally Praxix that asked
Hurth to explain his cryptic comment about his father, Agrith, and what had
happened after our fight with the orcs. He replied, but we could not help
but feel his pain in the telling of the tale." CR CR>
		 <TELL
"\"The Dwarves are more than meet the eye,\" he began, \"Far more. Descended
from the oldest of races, we remain close to the earth, and know it well.
Through the long ages, much great learning has been passed from father to
son, but the greatest perhaps is that of Klar'ama - I suppose you would
call it 'Life Passage,' and consider it a form of magic." CR CR>
		 <TELL
"\"It is a gift, however, passed down from the Wizards who, with our
ancestors, delved in the earth in search of the essences of our world.
But this gift of life is bittersweet, for it takes the life of he that
gives it. This my father did for me as I lay slain by the escaping orcs.
It is a kindness that came unasked for, and that can never be repaid.\"">>)>

<OBJECT STORY-CEDRITH
	(SDESC "Cedrith")
	(KBD %<ASCII !\C>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"\"There is a poem written about Cedrith, one which all Dwarves know
by heart. Here is how the story is told:" CR CR>
		  <FSET ,STORY-CEDRITH ,EXAMINED>
		  <TELL
"Long time ago in caverns old,|
The Dwarf-lord Cedrith sought for gold,|
In mountains deep, in Dwarvish lands,|
Where Targh, the lonely Tower, stands," CR CR>
		  <TELL
"While digging there, in miner's guise,|
A stone appeared before his eyes,|
That in the gloom of deepest night,|
Could fill the air with dreamy light," CR CR>
		  <TELL
"So took he then the prize he'd found,|
And climbed the mines with ne'er a sound,|
And rested there his weary men,|
Near Dwarvish gate, at Bern i-Fen." CR CR>
		  <TELL
"But unbeknownst, the demons crept,|
And ambushed Cedrith where he slept.|
And as they circled round their prey,|
Did Cedrith bow his head and pray," CR CR>
		  <TELL
"A chasm there was opened wide|
Below his feet. The Dwarf-lord cried,|
\"Vendeli Breth,\" and fell he far,|
Beneath the earth, in Reth a-Zar." CR CR>
		  <TELL
"Far darker than the blackest crow,|
Where even light doth fear to go,|
'Tween Hell and earth in deepest hole,|
Is buried there his living soul.">>)>

<OBJECT STORY-ORCS
	(LOC HURTH-STORIES)
	(SDESC "Orcs")
	(KBD %<ASCII !\O>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"I asked Hurth about the Orcs, and he told us this story. \"There
are many names for these evil denizens of the earth - goblins, grues,
orcs; perhaps you have heard one of them. They have lived in the earth
many ages, and it is said they worked hand in hand with our forefathers
when these caves were first built." CR CR>
		  <TELL
"\"But they were twisted and warped with the passing ages, much as we have
been saddened by them. There was no problem at first, for the orcs had
moved to the deeper caverns where we have long feared to go. But now
they become more brazen, and attack our people unprovoked, seemingly
only for amusement. We have sought to destroy them, but our ranks are
small. We grow weaker by the day, and the orcs grow stronger.\"">>)>

<OBJECT STORY-ELVES
	(LOC HURTH-STORIES)
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"I asked Hurth whether he knew of the legendary Elves of the Old Forest, and
smiled broadly." CR CR>
		  <TELL
"\"I have not thought of the Elves in many years,\" he said. \"We - the Dwarves, I
mean - have always considered the Elves a kindred race. But it seems the years have
turned them inward, and now they venture little outside their own lands, suspicious
of all who come near. Indeed, I have not seen them since I was a child.\"" CR CR>
		  <TELL
"\"I remember, as a boy, Agrith taking me before the throne of the Elvish leader,
N'dar. The friendship of the two was, and is, very close, yet Elvish introductions
were quite formal, so Agrith taught me the Elvish words of greeting." CR CR>
		  <TELL
"\"Hurth-la,\" I sputtered, \"Av-Agrith,\" which means 'Hurth is here, the son of
Agrith.'" CR CR>
		  <TELL
"\"Well, N'dar laughed aloud, and my face turned a very bright crimson. Then N'dar said,
'Va'len, b'ran!', 'Come, friend!' and led us to a great feast. I shall not forget
that day. I wonder what has become of N'dar, and of all Elves. Perhaps Agrith knows,
for the Elves still count him among their few non-Elvish friends.\"">>)>

<OBJECT STORY-CAVERNS
	(LOC HURTH-STORIES)
	(SDESC "Caverns")
	(KBD %<ASCII !\C>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"In a quiet moment, I asked Hurth about this place, the home of the Dwarves." CR CR>
		  <TELL
"\"We Dwarves have lived in these halls for all of history,\" he replied.
\"But now, the caverns, especially the deeper ones, have been largely overrun
by orcs and things more evil yet. We do what we can to keep the orcs at bay, but
we now live only in the higher levels, in forgotten caverns that remain unknown
to our enemies. And yet, we know that this sanctuary will be discovered in time.
There is great beauty to be found in these halls, but I regret that I cannot take
you there. Perhaps in happier times it shall be possible.">>)>

<OBJECT STORY-DWARF-GATES
	(LOC HURTH-STORIES)
	(SDESC "Gates")
	(KBD %<ASCII !\G>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"Hurth was asked by Praxix about the true story of the Dwarf Gates.
Hurth replied eagerly, pleased to give us a taste of Dwarvish
history." CR CR>
		  <UPDATE-MOVE ,TALE-BERN-I-ELAN ,PRAXIX-TALES>
		  <TELL
"\"Our fathers built four gates, each leading to one of the outposts
of the world. The Bern i-Lav, where you entered, was our link to
the plains of Lavos. The Bern i-Fen, at the opposite end of the
Long Road, leads to the forests of the Elves. And the Bern i-Zar
leads upwards to the high mountains of Thur.\"" CR CR>
		  <TELL
"\"And what of the fourth gate?\" Bergon asked." CR CR>
		  <TELL
"\"Of the fourth gate, the Bern i-Lan,\" Hurth replied gravely,
\"it is not spoken. Perhaps it no longer exists; this is what
we Dwarves fear most.\"">>)>

<OBJECT TALE-MAGIC
	(LOC PRAXIX-TALES)
	(SDESC "Magic")
	(KBD %<ASCII !\M>)
	(TEXT
	 <EXECUTE ("AUX" CNT)
		  <FSET ,TALE-MAGIC ,EXAMINED>
		  <TELL
"I have always been curious about the workings of magic, and I took this
opportunity to ask Praxix about it." CR CR>
		  <TELL
"\"Well, well,\" he replied, \"that would be a long tale indeed.\"" CR CR>
		  <TELL
"Then, smiling, he took out his pouch of magical powders and held them
before my eyes. Each of the ">
		  <SET CNT <COUNT ,ESSENCES>>
		  <TELL <GET ,INT-STR .CNT> " was a different color, and each
glowed faintly, almost imperceptibly." CR CR>
		  <TELL
"\"There are four magical essences,\" he began, \"and I suppose you could
say that they represent the four elemental substances of our world: earth,
air, fire, and water.">
		  <COND (<L? .CNT 4>
			 <TELL " Alas, that I have only " <GET ,INT-STR .CNT> "!">)>
		  <TELL " The Wizards have long understood the nature of the
essences and how two essences could be combined to produce effects that are now
called 'magic.' Sometimes, in fact, we add just a pinch of a third essence
to make a spell even more powerful." CR CR>
		  <TELL
"\"The Wizards, with the help of the Dwarves, mined the few places where pure
essences could be found; few of these places are now known, and none by me. Much
lore and learning has been lost, and I am but a distant relative of the Wizards
of old; but the spells I know are useful enough and I hope they will serve us well.\"">
		  <COND (<CHECK-ESSENCES ,LEVITATE-SPELL>
			 <USE-ESSENCES ,LEVITATE-SPELL>
			 <TELL CR CR
"\"Here,\" he said, placing a mixture of air and earth essences in my
hand, \"Place some of this on your cloak.\"" CR CR>
			 <TELL
"I did so, and soon I began to rise gently into the air. A short moment later,
I descended to the solid ground. \"Good lad!\" he said, \"Perhaps, someday, you
shall be an apprentice Wizard yourself! But for now, get some water and clean off
your hands!\"" CR CR>
			 <TELL
"I could not imagine what Praxix meant until I looked down at my fingers
and saw they were covered with a burnt, ">
			 <TELL-COLOR ,ESSENCE-AIR ,ESSENCE-EARTH>
			 <TELL " residue; it took a good deal of
scrubbing, but I finally did remove the essences. And that was my first
lesson in magic!">)>
		  <RTRUE>>)>

<OBJECT TALE-ELVES
	(SDESC "Elves")
	(KBD %<ASCII !\E>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"Praxix took a moment to speak of the Elves. \"The Elves
are among the four races which first populated the lands. Preferring
to live among the verdant forests, they were known in the ancient
tongue as El-fen, meaning 'from the forest.'  It is said that they
have lived so long with the trees that they have grown quite a bit
alike. But few have survived the long years, and happy is the day we
should meet them.\"">>)>

<OBJECT TALE-BERN-I-ELAN
	(SDESC "Bern i-Lan")
	(8DESC "BerniLan")
	(KBD %<ASCII !\B>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"Bergon looked to Praxix, and asked the question that was on our
minds ever since Hurth had first mentioned it. \"What do you know about
the Bern i-Lan?\"" CR CR>
		  <TELL
"Praxix replied, \"The legend says that the Bern i-Lan is the
gateway through which the Dwarves might someday leave this world
for a better one. The Dwarves are immortal; yet deep in their
hearts they yearn to leave this world for the world of their
fathers, who had known the way and are long since gone.\"">
		  <COND (<IN-PARTY? ,HURTH>
			 <TELL CR CR
"Hurth lowered his head and wept.">)>>)>		   

<OBJECT TALE-WIZARDS
	(LOC PRAXIX-TALES)
	(SDESC "Wizards")
	(KBD %<ASCII !\W>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"Out of curiosity, I asked Praxix about other Wizards like himself." CR CR>
		  <COND (<IN-PARTY? ,ESHER>
			 <TELL
"\"Don't tell me there are more like him!\" Esher said, wincing. Praxix did
not acknowledge Esher's words, but simply started his story." CR CR>)>
		  <TELL 
"\"Like me...,\" Praxix said, thoughtfully. \"Yes, I suppose there are more
like me. But there are few like the Wizards of old, a race whose
bloodline ran pure for three long ages, and whose like shall not be seen
again. For they have gone, I do not know where; all, it is said, but
Astrix, who lives alone atop the Sunrise Mountain.\"" CR CR>
		  <TELL
"\"Oh, we have learned from the ancient texts, and understand the essence
of many things. Enough, anyway, to start a fire or a rainstorm; or
shake the earth and cause the winds to blow. But much is forgotten, or
lost....\" His voice faded to a hollow whisper and his face became
dark and clouded." CR CR>
		  <TELL
"But his visage soon brightened, and his voice took on a cheerier tone.
\"We shall learn much ">
		  <COND (,2ND-PASS
			 <TELL "when we return to">)
			(T
			 <TELL "if we can find">)>
		  <TELL " Astrix,\" he said, \"and there is
great hope in that!\"">>)>

<OBJECT TALE-DWARVES
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"In a quiet moment, Praxix told us about the Dwarves." CR CR>
		  <TELL
"\"It is told that the Dwarves were one of the four races that first
roamed the earth. Preferring cold stone to warm air and clear waters, they
lived in caves, perfecting their stone-working skills. Before long, they had
built enormous caves and labyrinths under the earth, connecting virtually all
of our lands. In that time, our forefathers called them D'ru-ar-Fen, or
Diggers-in-the-Earth.\"" CR CR>
		  <TELL
"Praxix paused for a moment and smiled, as though at some private joke.
\"Of course, nobody believes in the Dwarves anymore, except the
few">
		  <COND (<FSET? ,DWARF-MEETING ,SEEN>
			 <TELL ", like us,">)>
		  <TELL " who claim to have seen them.\"">>)>

<OBJECT TALE-DWARF-GATES
	(SDESC "Gates")
	(KBD %<ASCII !\G>)
	(TEXT
	 <EXECUTE ()
		  <TELL
"I asked Praxix about the gate leading to the caverns." CR CR>
		  <COND (<NOT <FSET? ,TALE-RETH-A-ZAR ,EXAMINED>>
			 <UPDATE-MOVE ,TALE-RETH-A-ZAR ,PRAXIX-TALES>)>
		  <TELL
"\"It is said that the Dwarves built their Reth a-Zar, their
Road Under the Mountains, many long ages ago. Four gates there
were, each linking the Dwarves' kingdom with the lands above.
If memory serves, they were the Bern i-Lav, gateway to the plains;
Bern i-Fen, gateway to the forests; Bern i-Zar, gateway to the
mountains; and Bern i-Lan, the Gate to Heaven.\"">>)>

<OBJECT TALE-RETH-A-ZAR
	(SDESC "Reth a-Zar")
	(8DESC "RethaZar")
	(KBD %<ASCII !\R>)
	(TEXT
	 <EXECUTE ()
		  <COND (<IN? ,TALE-DWARVES ,PRAXIX-TALES>
			 <TELL-TALE ,TALE-DWARVES>
			 <TELL CR CR>)>
		  <FSET ,TALE-RETH-A-ZAR ,EXAMINED>
		  <TELL
"Asked about the meaning of Reth a-Zar, Praxix shook his head, ridding
himself of the last shreds of disbelief. \"Seemingly more far-fetched
than the tale of the Dwarves is the tale of Reth a-Zar, the Road Under
the Mountains, stretching from the plains of Lavos to the high forest
at Zar a-Lan. I believe we are the first of our kind to witness this miracle
in many a long age!\"">>)>  

