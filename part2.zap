
	.SEGMENT "PART2"


	.FUNCT	START-PART-TWO:ANY:0:0
	REMOVE	STORY-CAVERNS
	REMOVE	NYMPH-STONE
	REMOVE	ELF-STONE
	ICALL2	UPDATE-REMOVE,DWARF-STONE
	SET	'PART-TWO,TRUE-VALUE
	FCLEAR	WEBBA-MAP,DONT-DROP
	ICALL2	REMOVE-ALL,HURTH-STORIES
	ZERO?	CHEAT \?CTR2
	FSET?	HERMIT-POWDER,SEEN \?CCL3
?CTR2:	ICALL2	UPDATE-REMOVE,HERMIT-POWDER
	FSET	REAGENT,SOLVED
	MOVE	REAGENT,REAGENTS
	ICALL1	FIXUP-PRAXIX-COMMANDS
	FSET?	HERMIT-POWDER,INCAPACITATED \?CCL8
	PRINTI	"In retrospect, it seems strange that Praxix had not mentioned it when we first came to the Sunrise Tower, but he now took out the hermit's strange powder and showed it the Astrix, who"
	JUMP	?CND6
?CCL8:	PRINTI	"Praxix showed Astrix the strange powder the hermit had thrown at us, and Astrix"
?CND6:	PRINTI	" eyed it knowingly. Tasting the blue-green powder to confirm his suspicions, he smiled and explained."
	CRLF	
	CRLF	
	PRINTI	"""I cannot think where Garlimon found this powder, but it is fortunate indeed that he did. This,"" he said, rubbing the powder between his fingers, ""is a rare magical reagent which can be mixed with the earthly essences to produce powerful enchantments. Be careful; the reagent is most unstable, and should be mixed only when needed. Even then, some mixtures may not have any effect whatever."""
	JUMP	?CND1
?CCL3:	PRINTI	"Astrix had some words for Praxix regarding the next phase of our journey. ""In the lowest levels of the Dwarves caverns, there are magical reagents which can be mixed with the earthly essences to create powerful enchantments. The most valuable is a blue-green rock which crumbles to a fine powder that is bitter to the taste. Take care if you find it, for it is most unstable, and should be mixed only when needed. Even then, some mixtures may not have any magical effect."""
	ICALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,EXAMINE-COMMAND
?CND1:	CRLF	
	CRLF	
	PRINTI	"When it was time to leave, Astrix gave us rough directions through the forest to the Dwarvish gate at Bern i-Fen, at the extreme eastern end of the Reth a-Zar. ""I shall alert the Dwarves of your coming,"" he said, and spoke in some forgotten tongue to an eagle who was perched quietly on the tower's battlements. The eagle gave a shrill cry, then soared from sight into the west."
	CRLF	
	CRLF	
	PRINTI	"""Your path will be difficult, that is certain, but remember: we have many friends yet who live upon the earth. Be careful! Make good speed!"" And with that, he turned and limped back to his high tower."
	CRLF	
	CRLF	
	ICALL2	NEXT-DAY,2
	PRINTI	"Our path became difficult, but not at first, as we headed ever westward through the Old Forest toward the caverns of the Dwarves. It was mid-afternoon when the road unexpectedly forked; both paths led roughly to the west, one heading more southerly and the other more northerly."
	CALL2	MOVE-TO,FOREST-FORK
	RSTACK	


	.FUNCT	ANONF-217:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"Bergon reminded us that Astrix had said the Dwarvish gate was west of our position"
	FSET?	HERE,SCOUTED \?CCL6
	PRINTI	", and suggested taking the northern route, it being the closest to due west. He solicited advice from the others in the group, who were all in general agreement."
	RTRUE	
?CCL6:	PRINTI	". The problem, we reminded him, was that both paths appeared to be heading in a westerly direction, giving no obvious sign as to which would be the best route to take."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL8
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" sped off into the forest, returned, then sped off down the other fork. When he returned, he offered no help in our decision."
	CRLF	
	CRLF	
	PRINTI	"""Both paths appear to run roughly west, though I'd say the northern path is a bit more direct,"" he said."
	RTRUE	
?CCL8:	EQUAL?	ACTION,NORTH-ROUTE-COMMAND \?CCL10
	SET	'A-B-FLAG,TRUE-VALUE
	PRINTI	"We chose the more northerly path, and by day's end we had reached the place described by Astrix as the Dwarvish gate of Bern i-Fen."
	PRINT	FOREST-NIGHT
	CRLF	
	CRLF	
	PRINTI	"When we awoke the next morning, a cold wind blew from the north, yet a dark shroud of mist lay over the forest. It seemed an ill-omened day, and our hearts were heavy with uncertainty and doubt. I packed our things, and our party approached the gate."
	CALL2	MOVE-TO,FOREST-GATE
	RSTACK	
?CCL10:	EQUAL?	ACTION,SOUTH-ROUTE-COMMAND \FALSE
	PRINTI	"Choosing the more southerly path, we moved quickly as the forest appeared to become older and darker. Rather than entering this foreboding forest so late in the day, we camped just outside."
	PRINT	FOREST-NIGHT
	PRINTI	" We rose to a cold, but sunny morning and were soon in the midst of the dark forest."
	ICALL2	SCENE,TANGLESCENE
	CALL2	MOVE-TO,TANGLEWOOD-1
	RSTACK	

	.ENDSEG

	.SEGMENT "CAVERNS"


	.FUNCT	ANONF-218:ANY:0:0
	CALL2	GRAPHIC,G-GATE-RUNES
	RSTACK	


	.FUNCT	ANONF-219:ANY:0:0
	EQUAL?	ACTION,ENTER-COMMAND \FALSE
	PICINF	G-HURTH-SHADOW,PICINF-TBL /?BOGUS4
?BOGUS4:	PRINTI	"""Klem'ela,"" Praxix intoned, and the Dwarvish door winked into existence and opened. Cold, fetid air rushed from the caverns to meet us, filling us with a morbid disgust."
	CRLF	
	CRLF	
	PRINTI	"""There is something, well, unwholesome about this cavern,"" I said, as we started into the darkness. Happily, Astrix had lit Praxix' staff before we had departed, and its pale red light still glowed enough to see by."
	CRLF	
	CRLF	
	FSET	PRAXIX,LIT
	PRINTI	"We made quick progress down the arrow-straight road and soon came upon a steep stair cut in the rock. I was about to comment upon the Dwarves' monumental stonework, when Bergon stopped me in my tracks."
	CRLF	
	CRLF	
	PRINTI	"""Shhh!"" he whispered roughly, ""there is something moving in the shadows ahead!"""
	CALL2	MOVE-TO,MINE-STAIR
	RSTACK	


	.FUNCT	ANONF-220:ANY:0:0
	FSET?	HURTH,IN-PARTY /FALSE
	CALL	OPTION,BERGON,CONFRONT-COMMAND,IGNORE-COMMAND
	RSTACK	


	.FUNCT	ANONF-221:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND /?CTR2
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
?CTR2:	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FCLEAR	HERE,ADVISE
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL8
	FSET?	HURTH,IN-PARTY \?CCL8
	PRINTI	"Bergon asked Hurth to scout ahead, but Hurth replied, ""I have come from the path before us, and it is dark and full of evil. "
	JUMP	?CND6
?CCL8:	ICALL2	WPRINTD,ACTOR
	PRINTI	" went on ahead, and returned with a disturbing report."
	CRLF	
	CRLF	
	PRINTI	"""The caverns are cold and dark, and feel, well, evil,"" he said."
	EQUAL?	ACTOR,HURTH /?CCL13
	FSET?	HURTH,IN-PARTY \?CCL13
	CRLF	
	CRLF	
	PRINTI	"Hurth agreed. ""I have felt this myself,"" he said, adding, """
	JUMP	?CND6
?CCL13:	PRINTC	32
?CND6:	PRINTI	"It would be best to descend into the lower caverns here."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,CONFRONT-COMMAND /?CTR16
	EQUAL?	ACTION,IGNORE-COMMAND \?CCL17
?CTR16:	EQUAL?	ACTION,CONFRONT-COMMAND \?CCL22
	PRINTI	"At Bergon's command, we drew our weapons and moved forward. And then,"
	JUMP	?CND20
?CCL22:	PRINTI	"""A trick of the eye, perhaps,"" Praxix volunteered, pointing out other suspicious shadows that his staff now cast upon the rocks."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps,"" said Bergon, taking his hand off the hilt of his broadsword, ""But these caverns teem with orcs, and we cannot be too careful. Yes, now that I look again, I believe Praxix is right."""
	CRLF	
	CRLF	
	PRINTI	"Just then, in pointed contradition to my elder's conclusions,"
?CND20:	PRINTI	" a man stepped from the shadows, his face glowing in the pale light of Praxix' outstretched staff."
	CRLF	
	CRLF	
	PRINTI	"""Hurth!"" I gasped, taking a step backward."
	CRLF	
	CRLF	
	PRINTI	"""Stand back,"" Bergon shouted at us and drawing his sword, he approached the ghostly shadow of our lost friend. ""Begone, false image,"" he demanded, and waved his sword menacingly before him."
	CRLF	
	CRLF	
	IN?	HINT-DARK-PRESENCE,HINTS \?CCL25
	PRINTI	"""Put down your weapon, Bergon,"" the shadow responded, ""It is I, Hurth."""
	CRLF	
	CRLF	
	PRINTI	"""But how..."" I blurted out, still hiding behind Bergon's cloak."
	CRLF	
	CRLF	
	PRINTI	"""The story is long and will have to wait,"" Hurth began, ""Astrix sent word that you may be needing assistance, but I am afraid we Dwarves have none to offer. A great, dark evil has been loosed in these very halls and all of our efforts are bent toward its destruction. Take not the path ahead, but rather these stairs even to the lowest levels. It is there that you may find what you seek - the stone of Cedrith!"""
	CRLF	
	CRLF	
	PRINTI	"""I must return to my people. Good luck!"" he cried, and was gone."
	CRLF	
	CRLF	
	PRINTI	"""I fear we ourselves unleashed this evil upon the Dwarves,"" Praxix moaned, ""These are dark days indeed, but hope remains if the Stone can be found."""
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
	JUMP	?CND23
?CCL25:	PRINTI	"""It is I, Bergon,"" the shadow responded, ""I am sorry if I have upset you, but Astrix said you would be needing some help!"""
	CRLF	
	CRLF	
	PRINTI	"""But how...,"" I blurted out, still hiding behind Bergon's cloak."
	CRLF	
	CRLF	
	PRINTI	"""There is much to tell, and little time for the telling,"" he responded, and bowing his head in sorrow, explained, ""My father, Agrith, saved my life after our encounter with the orcs. The procedure cost him his own."" He then attempted a smile, saying, ""Our hope lies in finding the ancient Stone, if Astrix is to be believed. We Dwarves are certain it lies below, in the darkest regions of these halls, where Cedrith was said to have found it, many long ages ago."""
	ICALL	UPDATE-MOVE,STORY-CEDRITH,HURTH-STORIES
	MOVE	STORY-AGRITH,HURTH-STORIES
	ICALL2	PARTY-ADD,HURTH
?CND23:	ICALL1	END-OPTION
	CALL1	NEW-DEFAULT
	RSTACK	
?CCL17:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL27
	FSET?	PRAXIX-VS-EVIL,SEEN \?CCL30
	ICALL2	REMOVE-PARTY-COMMAND,PROCEED-COMMAND
	PRINTI	"We started down the dark passage, and soon felt the dark Evil we had encountered earlier in our journey."
	CRLF	
	CRLF	
	PRINTI	"""We should have expected this; when last we met, we were not much farther along this same path!"" Praxix said."
	CRLF	
	CRLF	
	PRINTI	"There was little discussion - we had to return to the stairs, lest we face the unseen terror yet again."
	RTRUE	
?CCL30:	CALL	MOVE-TO,DARK-EVIL-CAVERN,STR?567
	RSTACK	
?CCL27:	EQUAL?	ACTION,DOWN-COMMAND \FALSE
	CALL1	MOVE-TO-2-W
	RSTACK	


	.FUNCT	MOVE-TO-2-W:ANY:0:0
	PRINTI	"The stair became steeper as we descended, and it was hours before we came to the next level of the caverns. Here, a major path led away into the darkness, but the stair continued its relentless descent into the depths of the earth."
	FSET?	HURTH,IN-PARTY \?CND1
	CRLF	
	CRLF	
	PRINTI	"""We are not nearly to the lower levels,"" Hurth said. ""The path leads down much farther!"""
?CND1:	CALL2	MOVE-TO,MINE-2-W
	RSTACK	

	.ENDSEG

	.ENDI
