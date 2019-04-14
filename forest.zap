
	.SEGMENT "FOREST"


	.FUNCT	MOVE-TO-FOREST-RIDGE:ANY:0:0
	PRINTI	"Looking back, we could follow the long canyon path back to the horizon, where I imagined I could see the fork just beyond Lavos. But the view ahead filled us with astonishment, for a vast forest stretched out before us, thick with pine, fir, and redwood. Beyond the forest, a wide river flowed from the north, disappearing into deep canyons to the south. And beyond the forest, the Sunrise Mountain, its jagged peak towering high above the surrounding mountains."
	CRLF	
	CRLF	
	PRINTI	"""Magnificent!"" Praxix said. ""We stand before the Old Forest!"""
	CRLF	
	CRLF	
	PRINTI	"""I have heard many a tale of the Old Forest,"" I said with a smile, reminiscing of the fanciful tales oft told about the forest."
	CRLF	
	CRLF	
	PRINTI	"""I too have heard tales,"" Praxix replied, gravely. ""But judging by the comical look on your face, I suspect we have not heard the same ones."""
	CRLF	
	CRLF	
	ICALL	UPDATE-MOVE,TALE-ELVES,PRAXIX-TALES
	ICALL1	NEXT-DAY
	ICALL1	NEXT-DAY
	PRINTI	"It was now dark and after a hearty meal we slept. I dreamed of the forest that night, of brightly colored birds, and of the beautiful Wood Elves from the stories of my childhood. The next day, we rose with the sun."
	CRLF	
	CRLF	
	PRINTI	"The morning was still and hazy, and we started toward the forest with great eagerness. Praxix spotted a wide path which headed due east toward the Sunrise Mountain, and we spent a glorious morning beneath tall trees and a blue sky. Around midday, we came to a small clearing, where we decided to stop for lunch."
	FSET?	STAIR-BOTTOM,SEEN /?CCL3
	CALL1	SKIP-BITE-FOREST
	RSTACK	
?CCL3:	CALL2	MOVE-TO,BITE-FOREST
	RSTACK	


	.FUNCT	ANONF-96:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK \?CCL3
	FSET?	MINAR,IN-PARTY \?CCL6
	SET	'BITE-VICTIM,MINAR
	SET	'BITE-VICTIM-OBJECT,MINAR-OBJECT
	JUMP	?CND4
?CCL6:	FSET?	ESHER,IN-PARTY \?CCL8
	SET	'BITE-VICTIM,ESHER
	SET	'BITE-VICTIM-OBJECT,ESHER-OBJECT
?CND4:	ICALL2	GRAPHIC,G-NIGHTFANG
	CRLF	
	CRLF	
	PRINTI	"And then, without warning, a large snake lunged at "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	", grabbing him by the leg. "
	FSET?	BERGON,IN-PARTY \?CCL11
	PRINTI	"Bergon"
	JUMP	?CND9
?CCL8:	ICALL1	SKIP-BITE-FOREST
	RTRUE	
?CCL11:	ICALL2	WPRINTD,BITE-VICTIM
?CND9:	PRINTI	", reacting instinctively, killed the snake with a single blow of his sword"
	FSET?	BERGON,IN-PARTY \?CCL14
	PRINTI	"; "
	ICALL2	WPRINTD,BITE-VICTIM
	JUMP	?CND12
?CCL14:	PRINTI	" and"
?CND12:	PRINTI	" collapsed against a tree."
	CRLF	
	CRLF	
	PRINTI	"""The snake,"" he started, grimacing with pain. ""Nightfang...."" His voice trailed off, and his eyes took on a glazed, vacant look."
	CRLF	
	CRLF	
	PRINTI	"""But that cannot be! I thought Nightfang were nocturnal, like the Starstalker!"" I said, hopefully."
	CRLF	
	CRLF	
	PRINTI	"""And you were right,"" replied Praxix. ""They were nocturnal. "
	FSET?	BERGON,IN-PARTY \?CCL17
	PRINTI	"Bergon, t"
	JUMP	?CND15
?CCL17:	PRINTC	84
?CND15:	PRINTI	"his man will die unless we can find some westflake root. There is little time!"""
	ICALL	UPDATE-MOVE,BITE-VICTIM-OBJECT,HERE
	FSET	BITE-VICTIM,INCAPACITATED
	CALL	MAKE-BUSY,BITE-VICTIM,ILL-COMMAND
	RSTACK	
?CCL3:	IN?	WOOD-ELF,HERE \?CND18
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,TAG-ROUTE-COMMAND,ELF-HOME-COMMAND
?CND18:	FSET?	BERGON,TRAPPED /?CND20
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,BERGON-ROUTE-COMMAND
?CND20:	FSET?	BITE-VICTIM,INCAPACITATED \?CCL24
	FSET?	BITE-VICTIM,DEAD /?CCL24
	IN?	WOOD-ELF,HERE /?CND27
	IN?	WESTFLAKE-ROOT,PRAXIX /?CND27
	ICALL2	GRAPHIC,G-NIGHTFANG
?CND27:	ZERO?	SUBGROUP-MODE \?CND31
	FSET?	BITE-VICTIM,IN-PARTY /?CND31
	ICALL2	PARTY-ADD,BITE-VICTIM
?CND31:	ICALL	UPDATE-MOVE,BITE-VICTIM-OBJECT,HERE
	CALL	MAKE-BUSY,BITE-VICTIM,ILL-COMMAND
	RSTACK	
?CCL24:	FSET?	WOOD-ELF,TRAPPED /?CCL36
	FSET?	BITE-VICTIM,DEAD \FALSE
?CCL36:	CALL2	GRAPHIC,G-FOREST
	RSTACK	


	.FUNCT	ANONF-97:ANY:0:0
	ZERO?	SUBGROUP-MODE \FALSE
	ZERO?	BITE-VICTIM /FALSE
	FSET?	BITE-VICTIM,INCAPACITATED /?CCL3
	FSET?	BITE-VICTIM,DEAD \FALSE
?CCL3:	CALL2	PARTY-REMOVE,BITE-VICTIM
	RSTACK	


	.FUNCT	ANONF-98:ANY:0:0
	EQUAL?	ACTION,ENTER-TUNNEL-COMMAND \?CCL3
	PRINTI	"We chose next to explore the tunnel that we had discovered underneath the stump, and, descending from our camp, quickly retraced our steps to the point at which we had entered it earlier. "
	CALL	MOVE-TO,WARREN,STR?412
	RSTACK	
?CCL3:	EQUAL?	ACTION,ELF-HOME-COMMAND \?CCL5
	FSET?	BERGON,TRAPPED \?CND6
	FSET	BERGON,DEAD
?CND6:	FSET?	WOOD-ELF,TRAPPED \?CCL10
	PRINTI	"Doing as V'ren had told us, I retraced my steps to the pool. V'ren was waiting there for us, and led us"
	JUMP	?CND8
?CCL10:	PRINTI	"V'ren led us to the pool at which we had met, then"
?CND8:	PRINTI	" through twisty forest paths until we reached a small clearing. ""This is the Elf Home,"" she said, without words. ""Home of our Mothers since the beginning of all things."""
	CRLF	
	CRLF	
	CALL	MOVE-TO,ELF-HOME,STR?413
	RSTACK	
?CCL5:	EQUAL?	ACTION,TAG-ROUTE-COMMAND \?CCL12
	FSET?	BERGON,TRAPPED \?CND13
	FSET	BERGON,DEAD
?CND13:	PRINTI	"I retraced my earlier steps, "
	FSET?	ELFSTREAM-1,SEEN /?CCL17
	PRINTI	"but this time we decided to follow the stream."
	CALL	MOVE-TO,ELFSTREAM,STR?414
	RSTACK	
?CCL17:	CALL	MOVE-TO,ELFSTREAM,STR?415
	RSTACK	
?CCL12:	EQUAL?	ACTION,BERGON-ROUTE-COMMAND \?CCL19
	IN?	WOOD-ELF,HERE \?CND20
	FSET	WOOD-ELF,TRAPPED
	PRINTI	"We decided to follow Bergon's route in hopes of discovering his fate. V'ren said she could not come with us, but that we were welcome at the Elf Home. ""Come to the pool where we met,"" she said to me, ""and we shall meet again!"" And with that, she sped into the forest."
	CRLF	
	CRLF	
?CND20:	CALL	MOVE-TO,TANGLEWOOD,STR?416
	RSTACK	
?CCL19:	EQUAL?	ACTION,PRAXIX-ROUTE-COMMAND \?CCL23
	FSET?	BERGON,TRAPPED \?CND24
	FSET	BERGON,DEAD
?CND24:	IN?	WOOD-ELF,HERE \?CND26
	FSET?	WOOD-ELF,TRAPPED /?CND26
	PRINTI	"As we prepared to leave, V'ren explained that she must return to the Elf Home, but that we could find her anytime by returning to the pool at which we had first met. ""Good luck in your travels,"" she said without speech, and swiftly disappeared into the forest."
	CRLF	
	CRLF	
?CND26:	PRINTI	"Praxix led the way, and we soon arrived at the glade he had found nearby."
	CALL	QSET?,FOREST-GLADE,SEEN
	ZERO?	STACK \?CCL32
	PRINTI	" But, just as he was explaining his decision to go no farther, he stumbled over a tree stump that had been hidden in the knee-high grass!"
	JUMP	?CND30
?CCL32:	CALL	QSET?,GLADE-STUMP,SEEN
	ZERO?	STACK \?CND30
	FSET?	FOREST-GLADE,SEEN \?CND34
	CRLF	
	CRLF	
	PRINTI	"""Here's the stump that I walked into before,"" he said, giving it a"
	FSET?	GLADE-STUMP,EXAMINED \?CCL38
	PRINTI	"nother rap with his staff."
	JUMP	?CND34
?CCL38:	PRINTI	" rap with his staff."
?CND34:	IN?	WESTFLAKE-ROOT,PRAXIX \?CCL41
	PRINTI	" ""Taught it a lesson!"" he added, pointing to its broken remains and the passage leading downward."
	JUMP	?CND30
?CCL41:	PRINTI	" This, oddly, produced a hollow tone."
?CND30:	CALL2	MOVE-TO,FOREST-GLADE
	RSTACK	
?CCL23:	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL43
	EQUAL?	ACTION-OBJECT,BITE-VICTIM-OBJECT \?CCL43
	ICALL	UPDATE-FSET,BITE-VICTIM-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" examined "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	". ""Unless we find the antidote, he will be dead before the sun sets."""
	FSET?	BERGON,IN-PARTY \TRUE
	PRINTI	" Bergon gazed up at the sky and frowned."
	RTRUE	
?CCL43:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL49
	FSET?	BITE-VICTIM,INCAPACITATED \?CCL49
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"Unsure of how to save "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	", Bergon asked for our advice. Praxix felt we had no alternative but to split up in search of the lifesaving root. I agreed, though I was fearful at the prospect of exploring this forest on my own."
	RTRUE	
?CCL49:	EQUAL?	ACTION,SPLIT-UP-COMMAND \?CCL53
	PRINTI	"It was agreed that we split up the group in search of the elusive westflake root, and "
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	FSET?	BERGON,IN-PARTY \?CCL56
	PRINTI	"Bergon indicated"
	JUMP	?CND54
?CCL56:	PRINTI	"we decided on"
?CND54:	PRINTI	" the paths we should follow."
	CRLF	
	CRLF	
	FSET?	BERGON,IN-PARTY \?CCL59
	FSET?	DWARF-MEETING,SEEN /?CCL59
	PRINTI	"""I shall remain here to tend to "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	". Now go, and return before sunset! Do not wander far!"" he commanded."
	FSET?	ESHER,IN-PARTY \?CND57
	EQUAL?	BITE-VICTIM,ESHER /?CND57
	PRINTI	" But Esher would not leave, preferring to do what he could to keep Minar comfortable. And thus it was that Praxix and I went our separate ways into the forest."
	JUMP	?CND57
?CCL59:	FSET?	BERGON,IN-PARTY \?CCL67
	PRINTI	"""We will meet back here before sunset! Don't wander too far!"" he said."
	JUMP	?CND57
?CCL67:	PRINTI	"""We must meet back before sunset. Go quickly!"" Praxix said."
?CND57:	FSET?	BERGON,IN-PARTY \?CCL70
	FSET?	DWARF-MEETING,SEEN \?CCL70
	ICALL1	DIVIDER
	PRINTI	"Choosing for himself the most difficult path, Bergon strode off into the thickening forest to our west."
	FSET	BERGON-SEARCH,SEEN
	CALL2	SCENE,BERGON-SEARCH
	RSTACK	
?CCL70:	CALL2	SCENE,PRAXIX-SEARCH
	RSTACK	
?CCL53:	EQUAL?	ACTION,COMB-AREA-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We spent many frantic minutes searching the area for some westflake root, but to no avail. "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" was now seemingly paralyzed; only the infrequent blinking of his eyes gave any clue that he remained alive."
	RTRUE	


	.FUNCT	MOVE-TO-ELF-HOME:ANY:0:0
	PRINTI	"Then, taking me by the hand, she led us through twisty forest paths until we reached a small clearing. ""This is the Elf Home,"" she said, without words. ""Home of our Mothers for all the long ages."""
	CRLF	
	CRLF	
	CALL	MOVE-TO,ELF-HOME,STR?417
	RSTACK	


	.FUNCT	ANONF-99:ANY:0:0
	EQUAL?	ACTION,SCENE-START-COMMAND \FALSE
	ICALL1	DIVIDER
	FSET?	BERGON,TRAPPED \?CCL6
	PRINTI	"Praxix fared much better; leaving camp, he entered"
	JUMP	?CND4
?CCL6:	FSET?	BERGON,IN-PARTY /?CCL8
	PRINTI	"Praxix chose to explore"
	JUMP	?CND4
?CCL8:	PRINTI	"Bergon sent Praxix off to explore"
?CND4:	PRINTI	" the forest that lay to the east, and it was not long before he came to the edge of a grassy glade."
	ICALL	CHANGE-TRAVEL-COMMAND,BERGON,EXAMINE-COMMAND,GET-ADVICE-COMMAND
	ICALL2	MAKE-SUBGROUP,PRAXIX
	ICALL	REMOVE-TRAVEL-COMMAND,PRAXIX,TELL-LEGEND-COMMAND
	CALL2	MOVE-TO,FOREST-GLADE-EDGE
	RSTACK	


	.FUNCT	ANONF-100:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"He had entered the glade and was moving swiftly through the knee-high grasses and wildflowers, when he walked straight into a tree stump that had been hidden in the undergrowth. Stifling a scream, Praxix rubbed his injured leg."
	CRLF	
	CRLF	
	PRINTI	"""What an absurd place to leave a stump,"" he said, petulantly."
	CALL2	MOVE-TO,FOREST-GLADE
	RSTACK	
?CCL3:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	PRINTI	"Praxix, unconvinced that westflake would be found here, returned to camp."
	CALL2	SCENE,TAG-SEARCH
	RSTACK	


	.FUNCT	ANONF-101:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	PRINTI	"Praxix inspected this misplaced piece of tree; then, as if to vent his anger, he rapped it with his staff, producing a hollow tone. ""Now, that is odd!"" he said, rubbing his still sore foot. Looking more closely now, he was unable to find any sign of how it might open."
	RTRUE	


	.FUNCT	ANONF-102:ANY:0:0
	ICALL2	HINT,HINT-STUMP
	PUTP	HERE,P?CAST-LIMIT,2
	FSET?	GLADE-STUMP,ENCHANTED \?CND1
	FSET?	UNDERFOREST-2,TRIED /?CND1
	ICALL	ADD-TRAVEL-COMMAND,HERE,DOWN-COMMAND
?CND1:	FSET	FOREST-GLADE,SEEN
	RTRUE	


	.FUNCT	ANONF-103:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	ZERO?	SUBGROUP-MODE /?CCL6
	PRINTI	"Limping slightly, Praxix continued on his way; before long, the terrain fell into a deep glen. ""Never get back in time!"" he said to himself, and returned to the glade."
	FSET	HERE,DONT-SCOUT
	RTRUE	
?CCL6:	FSET?	BITE-VICTIM,INCAPACITATED \?CCL8
	PRINTI	"We walked to the far end of the glade; the terrain sloped down sharply. ""No time to go farther!"" Praxix said, and he was right. It was nearly sunset, and "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" was close to death."
	RTRUE	
?CCL8:	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	PRINTI	"The terrain ahead of us appeared unpromising, so we decided to take a different route."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
	FSET?	BITE-VICTIM,INCAPACITATED \?CCL13
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went ahead to the far end of the glade, where the terrain sloped down sharply. ""No time to go farther!"" he said, and he was right. It was nearly sunset, and "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" was close to death."
	RTRUE	
?CCL13:	ICALL2	WPRINTD,ACTOR
	PRINTI	" checked out the far end of the glade, but returned with the report that the terrain appeared unpromising."
	RTRUE	
?CCL10:	EQUAL?	ACTION,RETURN-COMMAND \?CCL15
	ZERO?	SUBGROUP-MODE /?CCL18
	PRINTI	"Finding no sign of westflake, Praxix returned to our camp."
	CALL2	SCENE,TAG-SEARCH
	RSTACK	
?CCL18:	PRINTI	"We returned to our camp, having found nothing "
	FSET?	BITE-VICTIM,INCAPACITATED \?CCL21
	PRINTI	"which could help our ailing friend"
	JUMP	?CND19
?CCL21:	PRINTI	"useful along the route that Praxix had taken"
?CND19:	PRINTC	46
	ICALL	REMOVE-TRAVEL-COMMAND,BITE-FOREST,PRAXIX-ROUTE-COMMAND
	CALL2	MOVE-TO,BITE-FOREST
	RSTACK	
?CCL15:	EQUAL?	ACTION,DOWN-COMMAND \?CCL23
	ZERO?	SUBGROUP-MODE \?CCL26
	CALL	QSET?,HERE,TRIED
	ZERO?	STACK /?CND27
	ICALL1	REMOVE-TRAVEL-COMMAND
?CND27:	CALL	MOVE-TO,UNDERFOREST-2,STR?419
	RSTACK	
?CCL26:	CALL	MOVE-TO,UNDERFOREST-2,STR?420
	RSTACK	
?CCL23:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?PRD35
	EQUAL?	ACTION-PRSI,GLADE-STUMP /?PRD33
?PRD35:	EQUAL?	ACTION-OBJECT,FIRE-SPELL \?PRD38
	EQUAL?	ACTION-PRSI,GLADE-STUMP /?PRD33
?PRD38:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \FALSE
?PRD33:	CALL	QSET?,GLADE-STUMP,ENCHANTED
	ZERO?	STACK \FALSE
	ICALL	UPDATE-FSET,GLADE-STUMP,DONT-EXAMINE
	ICALL	ADD-TRAVEL-COMMAND,HERE,DOWN-COMMAND
	ICALL2	GRAPHIC,G-STUMP
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CCL43
	FSET	LIGHTNING-SPELL,SEEN
	PRINTI	"Praxix carefully prepared a mixture of water and fire essences; then, he added just the slightest pinch of earth essence. He cast the mixture into the air and lifted his staff; from nowhere, clouds gathered and soon the sky was twilight-dark. Then, a single bolt of lightning fell from the sky, splitting the stump in two, and"
	JUMP	?CND41
?CCL43:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL45
	PRINTI	"Praxix removed some earth essence from his pouch and cast it at the stump; the earth trembled briefly and the stump split in two"
	JUMP	?CND41
?CCL45:	PRINTI	"Praxix removed a small handful of fire essence from his cloak and spread it over the stump. Within moments, the stump was afire; it burned itself out a few moments later,"
?CND41:	PRINTI	" revealing a passage below. ""Not bad! Not bad!"" he said, and he peered into the darkness below."
	ZERO?	SUBGROUP-MODE \?CND46
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CND46
	CALL	QSET?,LIGHTNING-SPELL,INCAPACITATED
	ZERO?	STACK \?CND46
	CRLF	
	CRLF	
	PRINTI	"Praxix, proud of his accomplishment, turned to me and whispered that it was the pinch of earth essence that really gives the lightning spell its added punch. But however the magic had been prepared, its effect was profound."
?CND46:	PUTP	HERE,P?GRAPHIC,G-STUMP
	RTRUE	


	.FUNCT	ANONF-104:ANY:0:0
	FSET?	PRAXIX,LIT /FALSE
	CALL2	CHECK-ESSENCES,LIGHT-SPELL
	ZERO?	STACK \FALSE
	CALL2	CHECK-ESSENCES,LEVITATE-SPELL
	ZERO?	STACK \FALSE
	FSET	HERE,TRAPPED
	RTRUE	


	.FUNCT	ANONF-105:ANY:0:0
	LOC	HINT-STUMP
	ZERO?	STACK /?CND1
	ICALL2	UPDATE-REMOVE,HINT-STUMP
?CND1:	FSET?	PRAXIX,LIT \?CCL5
	ICALL2	GRAPHIC,G-WARREN
	CRLF	
	CRLF	
	PRINTI	"With the aid of "
	ZERO?	SUBGROUP-MODE /?CCL8
	PRINTI	"his enchanted staff, Praxix"
	JUMP	?CND6
?CCL8:	PRINTI	"Praxix' enchanted staff, we"
?CND6:	PRINTI	" could see that the passage led both back toward our camp and away."
	ICALL2	ADD-PARTY-COMMAND,AWAY-COMMAND
	ICALL	CHANGE-PARTY-COMMAND,FEEL-AROUND-COMMAND,BACK-COMMAND
	JUMP	?CND3
?CCL5:	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	ICALL1	CAVERN-GRAPHIC
?CND3:	FSET?	PRAXIX,LIT \FALSE
	ZERO?	SUBGROUP-MODE \FALSE
	FSET?	BITE-VICTIM,INCAPACITATED /FALSE
	CALL	CHANGE-PARTY-COMMAND,AWAY-COMMAND,PROCEED-COMMAND
	RSTACK	


	.FUNCT	ANONF-106:ANY:0:0
	EQUAL?	ACTION,AWAY-COMMAND \?CCL3
	ICALL2	REMOVE-PARTY-COMMAND,AWAY-COMMAND
	PRINTI	"Praxix absentmindedly started to head away from our camp, when he remembered how little time there was to save "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTC	46
	CRLF	
	CRLF	
	PRINTI	"""There will be time for this later,"" he said, scolding himself, and quickly retraced his steps to his starting point."
	RTRUE	
?CCL3:	EQUAL?	ACTION,UP-COMMAND \?CCL5
	ZERO?	SUBGROUP-MODE /?CCL8
	ICALL2	REMOVE-PARTY-COMMAND,UP-COMMAND
	PRINTI	"Try as he might, Praxix couldn't climb out of this hole he had dug for himself."
	RTRUE	
?CCL8:	FCLEAR	HERE,DEAD
	CALL	MOVE-TO,FOREST-GLADE,STR?423
	RSTACK	
?CCL5:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL10
	FSET?	HERE,TRAPPED \?CCL13
	PRINTI	"The remainder of the day was spent tediously feeling our way through scores of dark, underground chambers until we finally reached an exit. We clambered out "
	CALL1	MOVE-TO-ELFSTREAM
	RSTACK	
?CCL13:	FSET?	PRAXIX,LIT /?CCL15
	PRINTI	"We decided to explore this underground tunnel, but without light, the prospects were dim."
	RTRUE	
?CCL15:	CALL	MOVE-TO,WARREN,STR?424
	RSTACK	
?CCL10:	EQUAL?	ACTION,CAST-COMMAND \?CCL17
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL17
	ZERO?	SUBGROUP-MODE /?CCL22
	PRINTI	"Then, taking out his air and earth essences, Praxix created an elevation spell and used it to raise himself back into the glade."
	JUMP	?CND20
?CCL22:	PRINTI	"Praxix then used his elevation spell to lift "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" out of the hole; it was then a simple matter for the rest of us to make our way out."
?CND20:	FSET	HERE,TRIED
	CALL2	MOVE-TO,FOREST-GLADE
	RSTACK	
?CCL17:	EQUAL?	ACTION,CAST-COMMAND \?CCL24
	EQUAL?	ACTION-OBJECT,LIGHT-SPELL \?CCL24
	EQUAL?	ACTION-PRSI,STAFF \?CCL24
	CALL	QSET?,PRAXIX,LIT
	ZERO?	STACK \?CCL24
	LOC	HINT-STUMP
	ZERO?	STACK /?CND29
	ICALL2	UPDATE-REMOVE,HINT-STUMP
?CND29:	ICALL2	GRAPHIC,G-WARREN
	ICALL	UPDATE-FCLEAR,HERE,DONT-SCOUT
	ZERO?	SUBGROUP-MODE \?CCL33
	FSET?	BITE-VICTIM,INCAPACITATED /?CCL33
	FSET?	HERE,DEAD \?CCL38
	ICALL2	ADD-PARTY-COMMAND,PROCEED-COMMAND
	JUMP	?CND31
?CCL38:	ICALL	CHANGE-PARTY-COMMAND,FEEL-AROUND-COMMAND,PROCEED-COMMAND
	JUMP	?CND31
?CCL33:	FSET?	HERE,DEAD \?CCL41
	ICALL2	ADD-PARTY-COMMAND,BACK-COMMAND
	JUMP	?CND39
?CCL41:	ICALL	CHANGE-PARTY-COMMAND,FEEL-AROUND-COMMAND,BACK-COMMAND
?CND39:	ICALL2	ADD-PARTY-COMMAND,AWAY-COMMAND
?CND31:	PRINTI	"It took some doing, but Praxix managed to fumble through his pouch and remove some fire and earth essence. He applied it to his staff, causing it to glow a dull red. "
	ZERO?	SUBGROUP-MODE /?CCL44
	PRINTC	72
	JUMP	?CND42
?CCL44:	PRINTC	87
?CND42:	PRINTI	"e could now see that he was in a tunnel, with passages leading in two directions, though only one of these would head in the direction of camp."
	RTRUE	
?CCL24:	EQUAL?	ACTION,CAST-COMMAND \?CCL46
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL46
	PRINTI	"Praxix, with his flare spell, lit the walls of the tunnel, revealing that it was covered with a mossy, plantlike material, and that it spread out far in both directions."
	RTRUE	
?CCL46:	EQUAL?	ACTION,BACK-COMMAND \?CCL50
	PRINTI	"Using his staff for light, "
	ZERO?	SUBGROUP-MODE /?CCL53
	ICALL2	WPRINTD,PRAXIX
	JUMP	?CND51
?CCL53:	PRINTI	"we"
?CND51:	PRINTI	" continued down the tunnel in the direction of camp."
	FSET?	BITE-VICTIM,INCAPACITATED \?CND54
	PRINTI	" Casually scanning the walls, "
	ZERO?	SUBGROUP-MODE /?CCL58
	PRINTI	"he"
	JUMP	?CND56
?CCL58:	PRINTI	"we"
?CND56:	PRINTI	" recognized the plant that almost completely surrounded "
	ZERO?	SUBGROUP-MODE /?CCL61
	PRINTI	"him"
	JUMP	?CND59
?CCL61:	PRINTI	"us"
?CND59:	PRINTI	": westflake! "
	ZERO?	SUBGROUP-MODE \?CCL64
	ICALL2	WPRINTD,PRAXIX
	JUMP	?CND62
?CCL64:	PRINTI	"He"
?CND62:	PRINTI	" gathered some of the root for "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	", placing it in his cloak."
?CND54:	ZERO?	SUBGROUP-MODE \?CCL67
	PRINTI	" We"
	JUMP	?CND65
?CCL67:	PRINTI	" He"
?CND65:	PRINTI	" continued down the tunnel, coming eventually to a ladder carved into the earth and rising into a hollowed-out tree stump!"
	ZERO?	SUBGROUP-MODE /?CCL70
	PRINTI	" The sound of a voice (or was it voices) could be heard just above, and Praxix eagerly pulled himself up the ladder."
	MOVE	WESTFLAKE-ROOT,PRAXIX
	CALL2	SCENE,TAG-SEARCH
	RSTACK	
?CCL70:	PRINTI	" We raised ourselves out of the stump; we were back at our camp."
	FSET?	BITE-VICTIM,INCAPACITATED \?CCL73
	ICALL2	MOVE-TO,BITE-FOREST
	CRLF	
	CRLF	
	PRINTI	"Praxix rushed over to "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" and made a terrible discovery. "
	ICALL1	BITE-VICTIM-DIES
	ICALL	CHANGE-TRAVEL-COMMAND,BITE-FOREST,PRAXIX-ROUTE-COMMAND,ENTER-TUNNEL-COMMAND
	ICALL2	MOVE-TO,BITE-FOREST
	RTRUE	
?CCL73:	CRLF	
	CRLF	
	PRINTI	"""As I suspected, this route leads only back to our camp,"" Praxix said. ""Come, let us see what lies at the other end of the tunnel."""
	CRLF	
	CRLF	
	PRINTI	"In a matter of moments, we had climbed back down into the tunnel, retracing our steps to our point of entry in the glade. "
	ICALL	MOVE-TO,WARREN,STR?424
	RTRUE	
?CCL50:	EQUAL?	ACTION,FEEL-AROUND-COMMAND \FALSE
	ICALL2	REMOVE-PARTY-COMMAND,FEEL-AROUND-COMMAND
	FSET	HERE,DEAD
	PRINTI	"Though "
	ZERO?	SUBGROUP-MODE /?CCL78
	PRINTC	104
	JUMP	?CND76
?CCL78:	PRINTC	119
?CND76:	PRINTI	"e could not see, it was clear by feeling around that "
	ZERO?	SUBGROUP-MODE /?CCL81
	PRINTI	"he was"
	JUMP	?CND79
?CCL81:	PRINTI	"we were"
?CND79:	PRINTI	" in some sort of tunnel. Without any light, movement would be painfully slow and uncomfortable."
	RTRUE	


	.FUNCT	ANONF-107:ANY:0:0
	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL3
	ICALL1	DIVIDER
	ICALL2	GRAPHIC,G-FOREST
	FSET?	BERGON,IN-PARTY \?CCL6
	FSET?	BERGON,TRAPPED /?CCL6
	PRINTC	34
	ICALL1	WPRINTTAG
	PRINTI	", you search the forest to the north,"" Bergon said, and that was what I did"
	JUMP	?CND4
?CCL6:	PRINTI	"I headed out into the forest that lay to the north"
?CND4:	PRINTI	", though I was filled with apprehension at the thought of exploring on my own."
	CRLF	
	CRLF	
	PRINTI	"But the forest was beautiful, and the air cool and fresh. Up ahead, the sound of flowing water could be heard ever more clearly, and I followed that sound until I came upon a small stream, which took off at an angle to my path."
	ICALL	ADD-TRAVEL-COMMAND,PRAXIX,TELL-LEGEND-COMMAND
	ICALL1	MAKE-TAG-SUBGROUP
	CALL2	MOVE-TO,ELFWOOD-2
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCENE-END-COMMAND \FALSE
	FSET?	WOOD-ELF,SEEN \?CCL13
	FSET?	ELFSTREAM-1,SOLVED /?CCL13
	CALL2	HINT,HINT-ELF-SPEAK
	RSTACK	
?CCL13:	FSET?	ELFSTREAM-1,SEEN /?CCL17
	IN?	WESTFLAKE-ROOT,PRAXIX \?CCL17
	CALL2	HINT,HINT-BITE-FOREST
	RSTACK	
?CCL17:	FSET?	WOOD-ELF,SEEN /FALSE
	IN?	WESTFLAKE-ROOT,PRAXIX \FALSE
	CALL2	HINT,HINT-WOOD-ELF
	RSTACK	


	.FUNCT	SEARCH-END:ANY:0:0,TMP
	ICALL2	MOVE-TO-NO-GFX,BITE-FOREST
	ICALL1	CLEAR-SUBGROUP
	ICALL1	RESTORE-TAG-COMMANDS
	ICALL	SCENE,FALSE-VALUE,FALSE-VALUE
	CRLF	
	CRLF	
	IN?	WOOD-ELF,HERE \?CCL3
	PRINTI	"We arrived a short time later; "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" appeared lifeless, though he was breathing slowly. The Wood Elf strode to his side, placed her spindled arm on his wound, and entered a trance-like state."
	CRLF	
	CRLF	
	ICALL	GRAPHIC,G-NIGHTFANG,G-ELF-HEALS-BITE,BOTTOM-LEFT
	IN?	WESTFLAKE-ROOT,PRAXIX \?CCL6
	ICALL1	PRAXIX-STUMP-APPEARANCE
	JUMP	?CND4
?CCL6:	PRINTI	"Praxix returned, empty-handed, and started toward "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	". After just a few steps, he "
?CND4:	PRINTI	"stopped, startled by the sight of my new friend."
	CRLF	
	CRLF	
	PRINTI	"""You have done well, "
	ICALL1	WPRINTTAG
	PRINTI	"! Very well indeed!"" I blushed, for it wasn't often this Wizard handed out compliments. ""There are but few Wood Elves left in this world, and lucky is the day we meet one!"""
	CRLF	
	CRLF	
	PRINTI	"We approached "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" and watched in silence as the Wood Elf healed him with her touch. "
	ICALL1	BITE-VICTIM-BITE-HEALED
	JUMP	?CND1
?CCL3:	IN?	WESTFLAKE-ROOT,PRAXIX \?CCL8
	ICALL	GRAPHIC,G-NIGHTFANG,G-PRAXIX-HEALS-BITE,BOTTOM-LEFT
	ICALL1	PRAXIX-STUMP-APPEARANCE
	PRINTI	"knelt at his side, binding the westflake root onto the wound. "
	ICALL1	BITE-VICTIM-BITE-HEALED
	JUMP	?CND1
?CCL8:	ICALL2	GRAPHIC,G-NIGHTFANG
	ICALL2	HINT,HINT-NIGHTFANG
	PRINTI	"Praxix and I arrived back at the same time, neither having found any westflake root. "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" was motionless, eyes staring without seeing."
?CND1:	SET	'TMP,ELF-HOME-COMMAND
	IN?	WOOD-ELF,HERE /?CND9
	SET	'TMP,TAG-ROUTE-COMMAND
?CND9:	FSET?	BERGON,TRAPPED \?CCL13
	ICALL	TRAVEL-COMMANDS,HERE,BERGON-ROUTE-COMMAND,PRAXIX-ROUTE-COMMAND,TMP
	JUMP	?CND11
?CCL13:	ICALL	TRAVEL-COMMANDS,HERE,PRAXIX-ROUTE-COMMAND,TMP
?CND11:	FSET?	BERGON,TRAPPED \?CCL16
	CRLF	
	CRLF	
	FSET?	BITE-VICTIM,BUSY \?CCL19
	PRINTI	"As if things were not bad enough, Bergon was missing. We waited until nearly sunset, and still he had not returned."
	JUMP	?CND17
?CCL19:	PRINTI	"Surprisingly, it was Esher who first noticed Bergon's absence. We decided to wait, but by sunset, there was still no sign of him."
?CND17:	CRLF	
	CRLF	
	PRINTI	"""It is not like Bergon to be late. I fear something has happened to him,"" Praxix said; he was tired now, and filled with concern."
	JUMP	?CND14
?CCL16:	FSET?	BITE-VICTIM,BUSY \?CCL21
	FSET?	BERGON,IN-PARTY \?CCL21
	CRLF	
	CRLF	
	FSET?	BERGON-SEARCH,SEEN \?CND24
	PRINTI	"Bergon arrived a short time later; he, too, had failed to find the westflake root. "
?CND24:	PRINTI	"We stood over our friend, but no words were spoken; we had failed!"
	JUMP	?CND14
?CCL21:	FSET?	BERGON,IN-PARTY \?CND14
	FSET?	BERGON-SEARCH,SEEN \?CND14
	CRLF	
	CRLF	
	PRINTI	"Bergon, who had missed all of the excitement, returned a short time later, and, relieved at "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	"'s condition, told of his adventures."
?CND14:	FSET?	ELFSTREAM-1,SEEN \?CCL31
	IN?	WOOD-ELF,HERE /?CCL31
	CRLF	
	CRLF	
	PRINTI	"Thinking that it "
	FSET?	BITE-VICTIM,INCAPACITATED \?CCL36
	PRINTI	"somehow might help"
	JUMP	?CND34
?CCL36:	FSET?	BERGON,TRAPPED \?CCL38
	PRINTI	"might be helpful (though it didn't seem relevant to the problem of finding Bergon)"
	JUMP	?CND34
?CCL38:	PRINTI	"might be important"
?CND34:	PRINTI	", I told "
	FSET?	BERGON,TRAPPED /?PRD43
	FSET?	BERGON,IN-PARTY /?CCL41
?PRD43:	FSET?	BITE-VICTIM,INCAPACITATED \?CCL41
	ICALL2	WPRINTD,PRAXIX
	JUMP	?CND39
?CCL41:	PRINTI	"the others"
?CND39:	PRINTI	" about my adventure at the edge of the stream."
	FSET?	WOOD-ELF,SEEN \TRUE
	PRINTI	" Praxix was delighted! ""Wood Elves! Well, then! This is indeed our lucky day. Let us hope we shall be meeting them again!"""
	RTRUE	
?CCL31:	IN?	WOOD-ELF,HERE \TRUE
	CRLF	
	CRLF	
	PRINTI	"I thought this might be a good time for introductions, so I presented the Wood Elf to the others. ""I am happy to introduce..."" I started, but came up empty, and the Elf placed her hand on my shoulder. ""V'ren, of the House of G'lor,"" she said. ""And, if you wish, I shall take you to the Elf Home."""
	CRLF	
	CRLF	
	PRINTI	"We thanked V'ren for her gracious offer of help, but we had much to consider before we could commit to any decision. V'ren stood and waited as we discussed our options."
	RTRUE	


	.FUNCT	BITE-VICTIM-BITE-HEALED:ANY:0:0
	ICALL	UPDATE-MOVE,BITE-VICTIM-OBJECT,RANDOM-OBJECTS
	FCLEAR	BITE-VICTIM,INCAPACITATED
	ICALL	UPDATE-FCLEAR,BITE-FOREST,ADVISE
	ICALL2	MAKE-UNBUSY,BITE-VICTIM
	FCLEAR	BITE-VICTIM-OBJECT,DONT-EXAMINE
	PRINTI	"It took a long while, though it was still light when "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	"'s eyes regained their sight and his body stirred. ""What are you all looking at?"" he said, blankly, and even Praxix' lips turned up into a smile."
	EQUAL?	BITE-VICTIM,ESHER \TRUE
	CRLF	
	CRLF	
	PRINTI	"""We are looking at one very poor excuse for a physician,"" he said."
	RTRUE	


	.FUNCT	PRAXIX-STUMP-APPEARANCE:ANY:0:0
	PRINTI	"Just then, from out of nowhere, Praxix rose from the ground! I was mesmerized by the sight, and stood there, speechless. ""Don't just stand there!"" he shouted, ""Help an old man up!"""
	CRLF	
	CRLF	
	PRINTI	"Embarrassed, I helped him out of a hollowed-out stump that had been inconspicuously sitting nearby. But before I could ask him how he had gotten there, he rushed toward "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	", then "
	RTRUE	


	.FUNCT	ANONF-108:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET	HERE,EXAMINED
	PRINTI	"The path descended into a deep ravine, and I was loath to follow it this near to twilight. Across the ravine, the forest was unnaturally dark, as though a black curtain had been drawn over it."
	RTRUE	
?CCL3:	EQUAL?	ACTION,STREAM-PATH-COMMAND \?CCL5
	FSET?	HERE,EXAMINED \?CCL8
	PRINTI	"Rather than giving up, I chose to follow the stream in search for the needed root."
	JUMP	?CND6
?CCL8:	PRINTI	"Moving quickly and scanning the ground for any sign of westflake, I chose to follow the stream."
?CND6:	CALL	MOVE-TO,ELFSTREAM-1,STR?426
	RSTACK	
?CCL5:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	PRINTI	"Unable to find any westflake root, I returned to camp."
	CALL1	SEARCH-END
	RSTACK	


	.FUNCT	MOVE-TO-NO-GFX:ANY:1:2,RM,STR
	CALL	MOVE-TO,RM,STR,FALSE-VALUE,TRUE-VALUE,FALSE-VALUE
	RSTACK	


	.FUNCT	ANONF-109:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	FSET	WOOD-ELF,EXAMINED
	FSET?	WOOD-ELF,SEEN \?CCL6
	PRINTI	"Having recovered from the shock of that first look, I looked at this creature again and I began to feel her age and wisdom, and even sense a beauty that lay beneath her tree-like exterior."
	RTRUE	
?CCL6:	PRINTI	"The woman was slender, with long flowing hair. I could not see her face, yet some warm inner feeling was touched by her gentle grace."
	RTRUE	


	.FUNCT	ANONF-110:ANY:0:0
	FSET	HERE,SEEN
	CALL	GRAPHIC,G-WATERFALL-NO-ELF,G-WATERFALL,BOTTOM-RIGHT
	RSTACK	


	.FUNCT	ANONF-111:ANY:0:0
	EQUAL?	ACTION,TALK-TO-ELF-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"""I am pleased to meet you,"" I began, stumbling over the words. ""My friend is badly hurt..."""
	CRLF	
	CRLF	
	PRINTI	"But this creature that I assumed to be a Wood Elf appeared confused by my speech. I tried other, non-verbal means of communication, and was soon quite frustrated at my inability to communicate the desire that she come to the aid of "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	", if indeed that was within her power. And then, just as I was about to return to our camp, she spoke in soft, lilting tones in a language that I presumed to be Elvish."
	ICALL	ADD-TRAVEL-COMMAND,HERE,SPEAK-ELVISH-COMMAND
	FSET	HERE,BLUE-MIX
	RTRUE	
?CCL3:	EQUAL?	ACTION,SPEAK-ELVISH-COMMAND \?CCL5
	PRINTI	"Well, what did I know of Elvish? But there was little else to do, so I gave it my best try...."
	CRLF	
	CRLF	
	CALL2	READ-ELVISH,TAG
	ZERO?	STACK \TRUE
	PRINTI	"At least, I thought I would, but no sound came through my lips and at last, dejected, I raced back to camp, eager to tell the others of my discovery."
	CALL1	SEARCH-END
	RSTACK	
?CCL5:	EQUAL?	ACTION,APPROACH-COMMAND \?CCL10
	CALL	QSET?,WOOD-ELF,SEEN
	ZERO?	STACK \?CCL13
	PRINTI	"I approached cautiously, hoping not to startle her. But as I neared, she sensed my presence, stood, and turned toward me...."
	CRLF	
	CRLF	
	PRINTI	"I gasped, stumbling backward onto the ground, and twisted my ankle. She was grotesque, her face leathery and brown, more like a gnarled tree than a person. She stretched her spindled arms toward me, and opened her eyes for the first time: clear, large, and fathomless."
	ICALL2	GRAPHIC,G-ELF
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,STAY-HIDDEN-COMMAND
	CALL	UPDATE-FCLEAR,WOOD-ELF,DONT-EXAMINE
	RSTACK	
?CCL13:	PRINTI	"As if under some hypnotic spell, I rose and hobbled toward this creature of the forest. Her eyes were kind and gentle, yet she backed off as I approached."
	CALL	CHANGE-TRAVEL-COMMAND,HERE,APPROACH-COMMAND,TALK-TO-ELF-COMMAND
	RSTACK	
?CCL10:	EQUAL?	ACTION,STAY-HIDDEN-COMMAND \?CCL15
	CALL	QSET?,WOOD-ELF,SCOUTED
	ZERO?	STACK \?CCL18
	PRINTI	"I waited there, mesmerized by the beauty of this forest dweller. After a few moments, two people came into view from further downstream but it was late in the afternoon, and the rays of the setting sun made it impossible to see them clearly. The woman motioned to the newcomers, who then returned to the forest."
	RTRUE	
?CCL18:	PRINTI	"Then the woman rose and followed the stream out of sight into the forest."
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,APPROACH-COMMAND
	CALL	CHANGE-TRAVEL-COMMAND,HERE,STAY-HIDDEN-COMMAND,FOLLOW-COMMAND
	RSTACK	
?CCL15:	EQUAL?	ACTION,FOLLOW-COMMAND \?CCL20
	PRINTI	"I decided to follow the mysterious woman, but soon lost track of her as she sped along the course of the stream. It was now late, and I had no choice but to return to camp."
	CALL1	SEARCH-END
	RSTACK	
?CCL20:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	FSET?	WOOD-ELF,SEEN \?CCL25
	PRINTI	"Though my ankle was hurt, I stumbled and crawled my way back to camp."
	JUMP	?CND23
?CCL25:	PRINTI	"It was getting late, so I returned to camp with the intention of telling the others about these forest people."
?CND23:	CALL1	SEARCH-END
	RSTACK	


	.FUNCT	ANONF-112:ANY:0:0
	IN?	WOOD-ELF,BITE-FOREST \?CCL3
	CALL	TRAVEL-COMMANDS,HERE,ELF-HOME-COMMAND
	RSTACK	
?CCL3:	FSET?	BITE-VICTIM,INCAPACITATED \?CTR4
	FSET?	BITE-VICTIM,DEAD \?CCL5
?CTR4:	CALL	TRAVEL-COMMANDS,HERE,PROCEED-COMMAND
	RSTACK	
?CCL5:	CALL	TRAVEL-COMMANDS,HERE,RETURN-COMMAND
	RSTACK	


	.FUNCT	ANONF-113:ANY:0:0
	EQUAL?	ACTION,ELF-HOME-COMMAND \?CCL3
	PRINTI	"We called out for V'ren, who quickly arrived at the side of the pool. "
	CALL1	MOVE-TO-ELF-HOME
	RSTACK	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL5
	PRINTI	"The pool was refreshingly cool, and we drank from it contentedly."
	FSET?	ELFSTREAM-1,SEEN \?CND6
	PRINTI	" But none of the creatures I had seen before were here, and it soon became apparent that we had missed our opportunity of meeting them."
?CND6:	ZERO?	2ND-PASS \?CCL10
	CALL1	SKIP-BITE-FOREST
	RSTACK	
?CCL10:	CRLF	
	CRLF	
	CALL2	N-DAY-TREK,1
	RSTACK	
?CCL5:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	PRINTI	"We returned to our camp at nightfall, full of despair and hopelessness. Praxix went over to where "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" lay."
	ICALL1	BITE-VICTIM-DIES
	CALL2	MOVE-TO,BITE-FOREST
	RSTACK	


	.FUNCT	BITE-VICTIM-DIES:ANY:0:0
	ICALL2	HINT,HINT-NIGHTFANG
	PRINTI	"""We are too late!"" he said softly. ""Too late!"""
	CRLF	
	CRLF	
	PRINTI	"I was barely able to hold back tears as we lifted our fallen friend and placed him in the cold earth. Praxix incanted an ancient and sorrowful song as we covered him with dirt and placed a burial cairn over the spot."
	FSET?	BERGON,TRAPPED /?CND1
	PRINTI	" Exhausted, we fell into a deep sleep."
?CND1:	ICALL1	NEXT-DAY
	FCLEAR	BITE-VICTIM,INCAPACITATED
	FSET	BITE-VICTIM,DEAD
	CALL2	UPDATE-MOVE,BITE-VICTIM-OBJECT
	RSTACK	


	.FUNCT	ANONF-114:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"""Look,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, pointing out the Elves that were everywhere - climbing down trees, grabbing axes and crude buckets; soon, all would be heading north to fight the advancing blaze."
	RTRUE	


	.FUNCT	ANONF-115:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" pointed toward the north, where the sky was filled with a dark, billowing smoke. Every few moments, a flash of red flame could be seen lapping at the tree tops in the distance."
	RTRUE	


	.FUNCT	ANONF-116:ANY:0:0
	ICALL2	GRAPHIC,G-ELF-HOME
	FSET?	FOREST-FIRE,SEEN /?CCL3
	CRLF	
	CRLF	
	PRINTI	"We talked among ourselves, marvelling at this ancient place, when three Elves rushed into the clearing, and their cries filled our ears. ""Fire!"" they said. ""The great flame approaches!"""
	CRLF	
	CRLF	
	PRINTI	"Across the way, an older Elf clambered down from his tree-hammock. ""Awake! Awake!"" he cried, and dozens of Elves were soon marching to the north, where smoke could be seen in the treetops."
	FSET?	ELFWOOD-2,EXAMINED \TRUE
	CRLF	
	CRLF	
	PRINTI	"""That would explain the black forest I observed while searching for the westflake root!"" I exclaimed."
	CRLF	
	CRLF	
	PRINTI	"""The fire moves quickly, then,"" Praxix said. ""We are all in danger here!"""
	RTRUE	
?CCL3:	ICALL	REMOVE-TRAVEL-COMMAND,HERE,FOLLOW-ELVES-COMMAND
	CALL	UPDATE-FCLEAR,HERE,ADVISE
	RSTACK	


	.FUNCT	ANONF-117:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"We talked among ourselves, but could reach no consensus."
	FSET?	BITE-VICTIM,IN-PARTY \TRUE
	PRINTC	32
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" felt strongly that we must help the Elves, if it were at all possible. Praxix was unsure; he could sense how near we were to the eastern mountains and Astrix, and was wary of the delay."
	RTRUE	
?CCL3:	EQUAL?	ACTION,FOLLOW-ELVES-COMMAND \?CCL7
	FSET?	BITE-VICTIM,IN-PARTY \?CND8
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" reacted quickly. ""We must help these Elves, if it is at all within our power to do so."""
	CRLF	
	CRLF	
?CND8:	CALL	MOVE-TO,FOREST-FIRE,STR?434
	RSTACK	
?CCL7:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL11
	FSET?	BERGON,DEAD \?CCL14
	ICALL2	HINT,HINT-TANGLETREES
	PRINTI	"We prepared to leave the forest, but were soon accosted by V'ren and two other Elves. ""I have tragic news for you. One of our scouts has located your friend; he had been strangled by the Tangle Trees into whose forest he had wandered. We have buried him here, among our bravest brethren. I am sorry."""
	CRLF	
	CRLF	
	PRINTI	"This was tragic news indeed, and we were greatly saddened by the loss of our leader. ""I feared this when he did not return last evening,"" Praxix said, ""He shall be sorely missed."""
	CRLF	
	CRLF	
	JUMP	?CND12
?CCL14:	PRINTI	"Unsure of how to help, we decided to continue with our quest. "
?CND12:	PRINTI	"With V'ren guiding us, we soon came to the eastern edge of the forest, at the shore of a great river. ""Be well,"" V'ren said. ""I must return to help my people."" And with that, she turned and ran back into the forest."
	IN?	ELF-STONE,INVENTORY /?CND15
	ICALL2	HINT,HINT-ELVES
?CND15:	ZERO?	2ND-PASS /?CCL19
	CRLF	
	CRLF	
	ICALL2	N-DAY-TREK,1
	RTRUE	
?CCL19:	CALL2	MOVE-TO,RIVER-2
	RSTACK	
?CCL11:	EQUAL?	ACTION,SCOUT-COMMAND \FALSE
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" rushed ahead with the Elves, and soon returned. ""It is a great fire, borne by the north wind,"" he reported. ""It won't be long until we are in danger here!"""
	RTRUE	


	.FUNCT	ANONF-118:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"A wall of flame stood before us, consuming everything in its path. As if part of a conspiracy, the wind blew harder now, pushing the blaze toward the Elves' home a few mere miles downwind."
	EQUAL?	ACTOR,PRAXIX \?CCL6
	CRLF	
	CRLF	
	PRINTI	"""These Elves are in great danger,"" Praxix said. ""We must do something now or leave, lest we be destroyed with them."""
	RTRUE	
?CCL6:	CRLF	
	CRLF	
	PRINTI	"""We must retreat from here,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said. ""It is not safe!"""
	RTRUE	


	.FUNCT	ANONF-119:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"Hundreds of Elves were here, trying desperately to fight the onrushing fire with buckets of water. Others were clearing brush and opening a wide trench, hoping to stop the flames at the trench line."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \TRUE
	PRINTI	"""They'll never hold back the fire,"" Esher said, and it was hard to disagree. Praxix stood there in silent thought, eyes fixed on the approaching flames."
	RTRUE	


	.FUNCT	ANONF-120:ANY:0:0,TMP
?FCN:	EQUAL?	ACTION,RETURN-COMMAND \?CCL3
	CALL	MOVE-TO,ELF-HOME,STR?435
	RSTACK	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,RAIN-SPELL \?CCL8
	GET	ESSENCE-TBL,WATEROFF >TMP
	LESS?	TMP,FIRE-RAIN-REQUIRED \?CCL11
	PRINTI	"""I don't believe I have enough,"" Praxix said, as he took all of his remaining water essence and cast it into the sky. Clouds gathered and a "
	EQUAL?	TMP,3,4 \?CCL14
	PRINTI	"good soaking rain"
	JUMP	?CND12
?CCL14:	EQUAL?	TMP,2 \?CCL16
	PRINTI	"few showers soon"
	JUMP	?CND12
?CCL16:	PRINTI	"sprinkle of rain"
?CND12:	FSET	FOREST-FIRE,TRIED
	PRINTI	" fell, but it was quickly evident that Praxix' assessment was accurate. The rains were too little, too late. The fires had been slowed, but not nearly enough."
	CRLF	
	CRLF	
	ICALL2	UPDATE-REMOVE,ESSENCE-WATER
	PUT	ESSENCE-TBL,WATEROFF,0
	SET	'ACTION,RETURN-COMMAND
	JUMP	?FCN
?CCL11:	ICALL2	GRAPHIC,G-FIRE-RAINS
	SUB	TMP,FIRE-RAIN-REQUIRED
	PUT	ESSENCE-TBL,WATEROFF,STACK
	EQUAL?	TMP,FIRE-RAIN-REQUIRED \?CND17
	ICALL2	UPDATE-REMOVE,ESSENCE-WATER
?CND17:	PRINTI	"Seeing little choice, Praxix removed "
	EQUAL?	TMP,FIRE-RAIN-REQUIRED /?CND19
	PRINTI	"almost "
?CND19:	PRINTI	"all of his stock of water essence and cast it into the sky. The sky was obscured in smoke, yet the approaching storm could be felt in the air. Lightning danced through the clouds, and the roar of thunder soon filled the sky. All at once, the clouds burst, dropping a drenching rain on us. So violent was it, that many Elves were carried off by the rushing water. It was as though the rains would never end, and Praxix appeared somewhat embarrassed."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps I did not need so much,"" he said, ""but these things are quite unpredictable; one must take into account such variables as the winds, the temperature, the time of year, the altitude..."""
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CCL23
	PRINTI	"""The expertise of the Wizard who cast it?"" Esher added."
	CRLF	
	CRLF	
	PRINTI	"""Harumph!"" was Praxix' reply, and as if to second his rejoinder, "
	JUMP	?CND21
?CCL23:	PRINTI	"But happily "
?CND21:	PRINTI	"the rains suddenly stopped, and the sky partially cleared. The fire had been extinguished!"
	CRLF	
	CRLF	
	PRINTI	"There was much cleaning up to do, and we each did what we could to help. And then, tired and dirty, we returned to the Elf Home where we bathed, and went off to sleep."
	CRLF	
	CRLF	
	ICALL1	NEXT-DAY
	REMOVE	HYE-RIVER
	ICALL2	MOVE-TO,ELF-HOME-2
	RTRUE	
?CCL8:	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL /?PRD27
	EQUAL?	ACTION-OBJECT,FIRE-SPELL \?CCL25
?PRD27:	EQUAL?	ACTION-PRSI,FOREST-FIRE-FIRE \?CCL25
	REMOVE	HYE-FIRE
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CND30
	FSET	LIGHTNING-SPELL,SEEN
?CND30:	PRINTI	"In the spirit of fairness, I will call it absentmindedness, but Praxix now attempted to fight fire with fire as he cast his """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell at the onrushing flames. Fortunately, he was unobserved by the others and his spell did little damage, but I began to have my doubts as to the stability of our wizardly friend."
	JUMP	?CND6
?CCL25:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL33
	PRINTI	"Praxix took some earth essence and flung it at the earth before him. The earth shook, and the ground opened up before us. But this small rift would hold the fire only a short time."
	CRLF	
	CRLF	
	PRINT	PRAXIX-HASNT-GOT-ENOUGH
	JUMP	?CND6
?CCL33:	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL35
	PRINTI	"Praxix took some air essence from his pouch and flung it at the approaching flames. A new, southern wind fought with the cold north wind, and the Elves were cheered by the slowing progress of the fire. But Praxix' magical wind departed within the hour, and the fire continued its relentless approach."
	CRLF	
	CRLF	
	PRINT	PRAXIX-HASNT-GOT-ENOUGH
	JUMP	?CND6
?CCL35:	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix now thought to cast his """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but it didn't occur to him how it could possibly help."
?CND6:	CALL2	CHECK-ESSENCES,RAIN-SPELL
	ZERO?	STACK \TRUE
	CALL	QSET?,HERE,DEAD
	ZERO?	STACK \TRUE
	CRLF	
	CRLF	
	PRINTI	"""What I need is water essence,"" the Wizard said mournfully, ""Without it, I fear we are of no use to the Elves."""
	RTRUE	


	.FUNCT	ANONF-121:ANY:0:0
	PRINTI	"When we awoke the next morning, a great feast had been prepared for us - breads, berries, fruits, and many foods we had never seen before. After eating heartily, the food was taken away, and we were led to the Elf leader, who sat upon a tall wooden throne."
	CRLF	
	CRLF	
	PRINTI	"""I am N'dar,"" he began, ""and I thank you on behalf of the Elves. We have not seen the last of these scourges from the north, and I am keenly aware that your quest is our quest also."""
	CRLF	
	CRLF	
	MOVE	ELF-STONE,INVENTORY
	FSET?	BERGON,DEAD \?CND1
	ICALL2	HINT,HINT-TANGLETREES
	PRINTI	"""This is a day for rejoicing, but I am afraid that I have tragic news for you. One of our scouts has located your friend; he had been strangled by the Snaketrees into whose forest he had wandered. We have buried him here, among our bravest brethren. I am indeed sorry."""
	CRLF	
	CRLF	
?CND1:	PRINTI	"Then, he stood and took a green amulet from around his neck. ""This is our most precious possession. It is said that it held great power once; perhaps, it shall again."" And, so saying, he called Praxix forward and placed it around the Wizard's neck."
	CRLF	
	CRLF	
	PRINTI	"Thanking N'dar, we prepared to leave. V'ren was saddened, but said nothing as she led us east through the forest and to the edge of a great river."
	IN?	ELF-STONE,INVENTORY /?CND3
	ICALL2	HINT,HINT-ELVES
?CND3:	ZERO?	2ND-PASS /?CND5
	PRINTC	32
	ICALL2	N-DAY-TREK,1
	RTRUE	
?CND5:	CRLF	
	CRLF	
	PRINTI	"""I must leave now,"" she said, and turning her back, she ran into the forest."
	CALL2	MOVE-TO,RIVER-2
	RSTACK	


	.FUNCT	ANONF-122:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	CALL	QSET?,WARREN-WALLS,EXAMINED
	ZERO?	STACK \?CND4
	PRINTI	"The walls here were slimy to the touch, and covered in green mosses and lichens. Life flourished here, though it was not the sort of life that was happily endured: spiders, slugs, toads, worms, lizards, and maggots. But not all of us were disheartened."
	CRLF	
	CRLF	
?CND4:	EQUAL?	ACTOR,PRAXIX \?CCL8
	PRINTI	"""If I were a maker of magic potions,"" Praxix said, wistfully, ""I should have a field day here!"""
	FSET?	ESHER,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"Esher shook his head in disbelief. ""Yes,"" he said with indelicate sarcasm, ""A lovely spot for a party. Now, why don't you make yourself useful and get us out of here? Damned Wizard..."" His voice trailed off to a whining whisper."
	RTRUE	
?CCL8:	FSET	WARREN-WALLS,SOLVED
	PRINTI	"""Hawkbane,"" Esher said, holding up a phosphorescent root that he had discovered growing in the walls of this warren, or whatever it was."
	CRLF	
	CRLF	
	PRINTI	"""Hawkbane?"" Praxix echoed, unaware of any such thing."
	CRLF	
	CRLF	
	PRINTI	"""Yes, a remarkable find,"" he replied. ""A very rare medicinal herb, not seen much where we come from. It's the most potent inhibitor of allergic reactions that exists, but its rarity makes it virtually unknown outside of professional circles."" Getting down on his knees, he pulled a few more of the faintly glowing roots and placed them inside his cloak."
	RTRUE	


	.FUNCT	ANONF-123:ANY:0:0,TMP
?FCN:	EQUAL?	ACTION,DROP-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-DROP
	PRINTI	"I thought to drop something as an aid in mapping this labyrinth, but realized we had too few items to spare in case we got lost."
	RTRUE	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL5
	EQUAL?	ACTION-OBJECT,LIGHT-SPELL \?CCL8
	EQUAL?	ACTION-PRSI,STAFF \?CCL8
	FSET?	HERE,BLUE-MIX /?CCL8
	GETP	HERE,P?TEMP >TMP
	MOD	TMP,4
	ZERO?	STACK /?CTR13
	MOD	TMP,3
	ZERO?	STACK \?CCL14
?CTR13:	PRINTI	"Preferring to see where we were going, Praxix pulled more fire and earth essences from his pouch and applied them to his staff, causing it to glow more brightly. ""We had best leave this water-logged prison soon, for I shan't be able to do this often!"" he said."
	JUMP	?CND12
?CCL14:	MOD	TMP,5
	ZERO?	STACK \?CCL18
	FSET	HERE,BLUE-MIX
	PRINTI	"Praxix fumbled for some fire and earth essence, which he applied to the end of his staff. Soon it was glowing again with a pale red glow."
	JUMP	?CND12
?CCL18:	GRTR?	WARREN-COUNT,12 \?CCL20
	PRINTI	"""This,"" Praxix said petulantly, ""is ridiculous. I refuse to use more precious essences on this festering sore of a tunnel!"" He put his pouch away, and stood there, fuming."
	RTRUE	
?CCL20:	PRINTI	"Fearing that his staff's light was fading in the dampness, Praxix applied some additional fire and earth essence, making it brighten somewhat."
?CND12:	PUTP	HERE,P?TEMP,0
	RTRUE	
?CCL8:	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL22
	ICALL2	CAST-FAR-VISION,FALSE-VALUE
	PRINTI	" But little was illuminated. "
	FSET?	HERE,EXAMINED \?CTR24
	FSET?	ESHER,IN-PARTY /?CCL25
?CTR24:	PRINTI	"""I fear we shall have little help in getting ourselves out of this maze!"" he said."
	RTRUE	
?CCL25:	PRINTI	"""I think that should put your fears to rest, Esher,"" he said."
	CRLF	
	CRLF	
	PRINTI	"""Not really. It gives rise to new ones,"" he replied, leading me to wonder whether Esher in fact had a sense of humor after all."
	RTRUE	
?CCL22:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \FALSE
	CALL	QSET?,HERE,ENCHANTED
	ZERO?	STACK \?CCL32
	PRINTI	"Thinking perhaps that a good jolt would lead us back into the forest, Praxix cast his tremor spell. The results were not spectacular; I was covered in a mossy slime, and Bergon's head received a visit from a pile of hard-packed mud."
	CRLF	
	CRLF	
	PRINTI	"""Well, well, yes,"" he said proudly. ""Just a little more tremor and I'm quite certain we'll be back above ground."""
	CRLF	
	CRLF	
	PRINTI	"""Or buried alive,"" I replied, thinking not only for my safety but for that of our belongings."
	RTRUE	
?CCL32:	PRINTI	"""Well, here goes,"" Praxix said as he cast yet another tremor spell. The effect was certainly more pronounced than the last time, and, indeed, the tunnel split apart with such force that we were thrown from our feet and nearly buried in the mud, moss, and slime. But we had survived, and our possessions all appeared to be in place. Sunlight streamed in from above, and we were quickly back on our feet and ready to clamber up and out of this underground maze of tunnels."
	IN?	WEBBA-MAP,INVENTORY \?CND33
	FSET	WEBBA-MAP,INCAPACITATED
?CND33:	FSET	HERE,USED-UP
	SET	'ACTION,UP-COMMAND
	JUMP	?FCN
?CCL5:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL36
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" looked to each of us, but none had any good ideas on how to escape this soggy underground nest of twisting passages."
	CRLF	
	CRLF	
	PRINTI	"""Then we had best continue,"" Bergon said, ""There must be an exit somewhere!"" We were beginning to have our doubts."
	RTRUE	
?CCL36:	EQUAL?	ACTION,PROCEED-COMMAND /?CTR37
	EQUAL?	ACTION,BACK-COMMAND /?CTR37
	EQUAL?	ACTION,LEFT-COMMAND /?CTR37
	EQUAL?	ACTION,RIGHT-COMMAND \?CCL38
?CTR37:	GETP	HERE,P?TEMP
	ADD	STACK,1 >TMP
	PUTP	HERE,P?TEMP,TMP
	EQUAL?	TMP,1 \?CCL45
	EQUAL?	ACTION,BACK-COMMAND \?CCL45
	PRINTI	"Hoping to avoid getting lost in what appeared to be an underground labyrinth, we turned back and were surprised to find two passages behind us, one leading left and the other right."
	CRLF	
	CRLF	
	CALL	QSET?,HERE,DEAD
	ZERO?	STACK \?CCL50
	PRINT	OH-DEAR-MAZE
	JUMP	?CND48
?CCL50:	PRINT	OH-DEAR-MAZE-2
?CND48:	CALL	TRAVEL-COMMANDS,HERE,LEFT-COMMAND,RIGHT-COMMAND,UP-COMMAND
	RSTACK	
?CCL45:	ICALL1	COBBLE-WARREN-DESC
	EQUAL?	TMP,1 \?CCL53
	CALL	QSET?,HERE,DEAD
	ZERO?	STACK \?CCL56
	CRLF	
	CRLF	
	PRINT	OH-DEAR-MAZE
	JUMP	?CND51
?CCL56:	CRLF	
	CRLF	
	PRINT	OH-DEAR-MAZE-2
	JUMP	?CND51
?CCL53:	MOD	TMP,3
	ZERO?	STACK \?CCL58
	LESS?	WARREN-COUNT,5 \?CCL61
	CRLF	
	CRLF	
	PRINTI	"""Blast the dampness,"" growled Praxix, as his staff started growing dim. ""Never in my long years have I seen this! Soon we shall be growing moss!"""
	CRLF	
	CRLF	
	PRINTI	"But then, his anger turned to some measure of excitement as he discovered some small stones containing fire essence. ""Just a moment, if you will,"" he implored, as he crushed the stones and placed the resulting small pile of essence into his pouch. ""Given what the humidity here is doing to my glow spell, we shall be glad to have found this!"""
	ICALL	FIND-ESSENCE,ESSENCE-FIRE,2
	JUMP	?CND51
?CCL61:	CRLF	
	CRLF	
	PRINTI	"""Not again!"" Praxix said, wearily, as his staff again started to grow dim from the extreme humidity. ""Toads will be soon be leaping from our clothes if we don't find our way out of here."""
	JUMP	?CND51
?CCL58:	MOD	TMP,4
	ZERO?	STACK \?CCL63
	CRLF	
	CRLF	
	PRINTI	"Praxix' staff glowed with an ever fainter light; soon, it would be impossible to see the way before us."
?CND51:	CALL	TRAVEL-COMMANDS,HERE,LEFT-COMMAND,RIGHT-COMMAND,BACK-COMMAND,UP-COMMAND
	RSTACK	
?CCL63:	MOD	TMP,5
	ZERO?	STACK \?CND51
	ICALL2	GRAPHIC,G-WARREN-LIGHT
	FCLEAR	PRAXIX,LIT
	CRLF	
	CRLF	
	PRINTI	"Just then, Praxix' staff went out, and the tunnel went dark. Dark, that is, except for the pale light of day faintly peeking its way through the cracks in a hole just above us."
	CRLF	
	CRLF	
	PRINTI	"""Well, I'll be!"" said Praxix, with a smile. ""It seems that sometimes, darkness is the best light to see by!"""
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	ICALL	TRAVEL-COMMANDS,HERE,UP-COMMAND
	RTRUE	
?CCL38:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL66
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	PRINTI	"We thought to send "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" ahead, but were fearful of getting lost, so we decided to stay together until we could find a way out."
	RTRUE	
?CCL66:	EQUAL?	ACTION,UP-COMMAND \FALSE
	FSET?	HERE,USED-UP /?CTR70
	FSET?	PRAXIX,LIT /?CCL71
	MOD	TMP,5
	ZERO?	STACK \?CCL71
?CTR70:	IN?	WOOD-ELF,BITE-FOREST \?CND76
	ICALL	TRAVEL-COMMANDS,ELFSTREAM,ELF-HOME-COMMAND
?CND76:	PRINTI	"With an exit in sight, we happily climbed out of the warren "
	CALL1	MOVE-TO-ELFSTREAM
	RSTACK	
?CCL71:	ICALL2	REMOVE-PARTY-COMMAND,UP-COMMAND
	PRINTI	"Hoping to find some way out, we tried feeling our way around the top of the tunnel, but the thick growth above us made this all but impossible. There might be a way out up there, but it was unlikely we were going to find it."
	RTRUE	


	.FUNCT	MOVE-TO-ELFSTREAM:ANY:0:0
	FSET?	ELFSTREAM-1,SEEN \?CCL3
	PRINTI	"and found ourselves alongside the pool and waterfall where I had first seen the Wood Elf."
	JUMP	?CND1
?CCL3:	PRINTI	" at a place where a gently flowing stream cascades over a small waterfall and into a shallow pool."
?CND1:	CALL2	MOVE-TO,ELFSTREAM
	RSTACK	


	.FUNCT	TELL-WARREN-DIR:ANY:0:0
	EQUAL?	ACTION,LEFT-COMMAND \?CCL3
	PRINTI	"left path"
	RTRUE	
?CCL3:	EQUAL?	ACTION,RIGHT-COMMAND \?CCL5
	PRINTI	"path to the right"
	RTRUE	
?CCL5:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL7
	PRINTI	"path before us"
	RTRUE	
?CCL7:	PRINTI	"path behind us"
	RTRUE	


	.FUNCT	COBBLE-WARREN-DESC:ANY:0:0,TMP
	GETP	HERE,P?TEMP >TMP
	INC	'WARREN-COUNT
	GRTR?	TMP,1 \?CCL3
	RANDOM	100
	LESS?	50,STACK /?CCL3
	CALL2	PICK-ONE,WARREN-TBL-1
	PRINT	STACK
	PRINTI	" the "
	ICALL1	TELL-WARREN-DIR
	PRINTI	", we went a short way before coming to another junction."
	JUMP	?CND1
?CCL3:	MOD	TMP,5
	EQUAL?	STACK,1 /?CCL7
	PRINTI	"This time, we went down the "
	ICALL1	TELL-WARREN-DIR
	PRINTI	", but "
	CALL2	PICK-ONE,WARREN-TBL-2
	PRINT	STACK
	JUMP	?CND1
?CCL7:	PRINTI	"I had the unpleasant feeling that it little mattered, but we started along the "
	ICALL1	TELL-WARREN-DIR
	PRINTI	" and soon came to a similar spot."
	EQUAL?	TMP,1 \?CND1
	CRLF	
	CRLF	
	PRINTI	"Sure enough, it now appeared that similar passages were leading off in all directions."
?CND1:	EQUAL?	WARREN-COUNT,2 \FALSE
	GETP	PRISON,P?TEMP
	GRTR?	STACK,1 \FALSE
	FSET	HERE,EXAMINED
	FSET?	ESHER,IN-PARTY \?CCL17
	CRLF	
	CRLF	
	PRINTI	"Esher, who had been unusually silent, said ""I have the strange feeling I've been here before,"" no doubt referring to the Dwarves' prison. Then, putting two and two together and achieving five, he added, ""We have gone nowhere!"""
	CRLF	
	CRLF	
	PRINTI	"Praxix corrected him, though it wasn't easy."
	JUMP	?CND15
?CCL17:	CRLF	
	CRLF	
	PRINTI	"I offered the suggestion that our situation seemed familiar, thinking of the Dwarves' prison, but Praxix disagreed."
?CND15:	PRINTI	" ""I have been looking carefully at these passages, and I believe they are not the same. If you wish, we can try using the flare enchantment, but I already know the result."""
	RTRUE	


	.FUNCT	DIVIDER:ANY:0:1,NUM,COL,Y,STARWID,SCRWID,CURX
	ASSIGNED?	'NUM /?CND1
	SET	'NUM,4
?CND1:	SET	'CURX,1
	CRLF	
	CRLF	
	CURGET	CURGET-TABLE
	GET	CURGET-TABLE,0 >Y
	CALL2	TEXT-WIDTH,STR?449 >STARWID
	SUB	SCREEN-WIDTH,TEXT-WINDOW-LEFT
	MUL	STACK,CHRH >SCRWID
	SUB	NUM,1
	MUL	STACK,STARWID
	SUB	SCRWID,STACK
	DIV	STACK,NUM >COL
	ADD	1,COL >CURX
?PRG3:	DLESS?	'NUM,1 /?REP4
	CURSET	Y,CURX
	PRINTC	42
	ADD	CURX,COL
	ADD	STACK,STARWID >CURX
	JUMP	?PRG3
?REP4:	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	PARSE-ELVISH:ANY:0:0,WDS,W1,W2
	GETB	E-LEXV,1 >WDS
	GET	E-LEXV,1 >W1
	GET	E-LEXV,3 >W2
	SET	'SPOKE-ELVISH,TRUE-VALUE
	PRINTC	34
	PRINTT	E-TEMP,E-TEMP-LEN
	PRINTI	","" I said in my best imitation of an Elvish accent. "
	GRTR?	WDS,2 \?CCL3
	PRINTI	"But the Elf appeared even more bewildered, and it occurred to me that I should speak only a few words at a time to make myself more clearly understood."
	RTRUE	
?CCL3:	EQUAL?	W2,W?LA \?CCL5
	ZERO?	FOO-LA-FLAG \?CCL5
	SET	'FOO-LA-FLAG,TRUE-VALUE
	PRINTI	"The Elf appeared to understand, and regarded me intently"
	EQUAL?	W1,W?TAG /?CND8
	ZERO?	TAG-NAME-LENGTH \?CND8
	FSET	WOOD-ELF,USED-UP
	PRINTI	", though with evident suspicion"
?CND8:	PRINTI	", as if waiting for me to say more."
	RTRUE	
?CCL5:	EQUAL?	W1,W?VALEN \?CCL13
	EQUAL?	W2,W?BRAN \?CCL13
	ZERO?	VALEN-BRAN-FLAG \?CCL13
	SET	'VALEN-BRAN-FLAG,TRUE-VALUE
	PRINTI	"It was clear that the Elf understood the words I had spoken, but she did not respond, except, perhaps, with a quizzical look."
	RTRUE	
?CCL13:	EQUAL?	W?BRAN,W1,W2 \?CCL18
	EQUAL?	W?AGRITH,W1,W2 \?CCL18
	EQUAL?	W1,W2 /?CCL18
	PRINTI	"The Elf paused for a moment, then smiled. You can imagine my surprise when she spoke to me in my own tongue."
	CRLF	
	CRLF	
	PRINTI	"""Do not be so surprised,"" she said. ""There are many enemies abroad on our lands, and many would appear to be friends. Some, indeed, speak our tongue to deceive us. "
	FSET?	WOOD-ELF,USED-UP \?CCL24
	PRINTI	"I do not know why you have given a false name, b"
	JUMP	?CND22
?CCL24:	PRINTC	66
?CND22:	PRINTI	"ut it is plain that you have met Agrith, and he has always been like kin to the Elves. But more of this later. We had best look after your friend. I believe I can help if you will take me to him."""
	CRLF	
	CRLF	
	ICALL	UPDATE-MOVE,WOOD-ELF,BITE-FOREST
	FSET	WOOD-ELF,DONT-EXAMINE
	FSET	ELFSTREAM-1,SOLVED
	PRINTI	"With little time to lose, we sped through the forest, finally reaching our camp at sunset."
	CALL1	SEARCH-END
	RSTACK	
?CCL18:	EQUAL?	W1,W?BRAN \?CCL26
	ZERO?	BRAN-FOO-FLAG \?CCL26
	SET	'BRAN-FOO-FLAG,TRUE-VALUE
	PRINTI	"I must have said something meaningful, for the Elf appeared to listen more intently to my words. Yet, she did not respond. Clearly, I was not saying anything she cared to hear."
	RTRUE	
?CCL26:	PRINTI	"The Elf looked at me with the utmost suspicion, then quickly leapt away through the trees and out of sight. Discouraged, I returned to our camp."
	ICALL1	SEARCH-END
	RTRUE	

	.ENDSEG

	.SEGMENT "TANGLEWOOD"


	.FUNCT	ANONF-124:ANY:0:0
	EQUAL?	ACTION,SCENE-START-COMMAND \FALSE
	ICALL2	MAKE-SUBGROUP,BERGON
	ICALL	CHANGE-TRAVEL-COMMAND,BERGON,GET-ADVICE-COMMAND,EXAMINE-COMMAND
	CALL2	MOVE-TO,TANGLEWOOD-1
	RSTACK	


	.FUNCT	ANONF-125:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" stopped to admire the surrounding pine and alder. But up ahead, the forest appeared darker and more forebidding."
	RTRUE	


	.FUNCT	ANONF-126:ANY:0:0
	MOVE	HYE-TANGLE,HAVE-YOU-EVER
	RTRUE	


	.FUNCT	ANONF-127:ANY:0:0
	EQUAL?	ACTION,RETURN-COMMAND \?CCL3
	ICALL	REMOVE-TRAVEL-COMMAND,BITE-FOREST,BERGON-ROUTE-COMMAND
	ICALL2	MOVE-TO,BITE-FOREST
	FSET?	BERGON,DEAD \?CCL6
	PRINTI	"Carrying Bergon's body on our shoulders,"
	JUMP	?CND4
?CCL6:	FSET?	BERGON,TRAPPED \?CCL8
	PRINTI	"Unable to help Bergon, and with the snake-trees moving ever closer,"
	JUMP	?CND4
?CCL8:	PRINTI	"Carrying Bergon on our shoulders,"
?CND4:	PRINTI	" we retreated to the safety of our camp."
	FSET?	BERGON,DEAD \?CCL11
	ICALL2	HINT,HINT-TANGLETREES
	CRLF	
	CRLF	
	PRINTI	"We buried Bergon there, after a short ritual performed by Praxix."
	RTRUE	
?CCL11:	FSET?	BERGON,TRAPPED /?CCL13
	FSET?	BITE-VICTIM,INCAPACITATED \?CCL16
	CRLF	
	CRLF	
	PRINTI	"Bergon regained his strength quickly; he looked at "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" and frowned. ""We must do something quickly, or he will die!"""
	RTRUE	
?CCL16:	CRLF	
	CRLF	
	PRINTI	"It had been a long and frightening day; the sun had set, and we fell into a deep and dreamless sleep."
	CALL1	NEXT-DAY
	RSTACK	
?CCL13:	FSET	BERGON,DEAD
	RTRUE	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \?CCL18
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL18
	EQUAL?	ACTION-PRSI,BERGON-OBJECT \?CCL18
	PRINTI	"Praxix tried using his spell of elevation, but the trees' grip was too strong."
	RTRUE	
?CCL18:	EQUAL?	ACTION,CAST-COMMAND \?CCL23
	EQUAL?	ACTION-OBJECT,FIRE-SPELL \?CCL23
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix started to reach for his fire and earth essence, but he stopped himself. ""Not the best place for a bonfire,"" he said softly."
	RTRUE	
?CCL23:	EQUAL?	ACTION,CAST-COMMAND \?CCL27
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?PRD31
	EQUAL?	ACTION-PRSI,TANGLETREE /?CTR26
?PRD31:	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL27
?CTR26:	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CND34
	ICALL2	GRAPHIC,G-TANGLEWOOD-BURNS
?CND34:	IN?	WESTFLAKE-ROOT,PRAXIX \?CND36
	PRINTI	"For the second time that day, "
?CND36:	PRINTI	"Praxix put his magic to good use! "
	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CCL40
	FSET	LIGHTNING-SPELL,SEEN
	PRINTI	"He mixed together the essences of fire and water, then added just a pinch of earth essence. Just moments after casting the mixture, clouds gathered around him, and the sky turned black. He motioned with his staff at the deadly tree and a bolt of white lightning struck it, splitting it down the middle. A few branches caught fire, and instinctively withdrew, as if in pain."
	CALL	QSET?,LIGHTNING-SPELL,INCAPACITATED
	ZERO?	STACK \?CND38
	CRLF	
	CRLF	
	PRINTI	"Praxix, proud of his accomplishment, turned to me and whispered that it was the pinch of earth essence that really gives the lightning spell its added punch. But however the magic had been prepared, its effect was profound."
	JUMP	?CND38
?CCL40:	PRINTI	"Praxix prepared his flare enchantment, and cast it at the tree before us. The ball of flame sped through the forest before us, and the tentacles withdrew, as if in pain, clearing a path in its wake."
?CND38:	PRINTI	" The tentacles loosened, we retrieved Bergon from their deadly embrace."
	FCLEAR	BERGON,TRAPPED
	FSET?	BERGON,DEAD \?CCL45
	PRINTI	" But it was too late; Bergon was dead!"
	RTRUE	
?CCL45:	ICALL2	PARTY-ADD,BERGON
	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
	CRLF	
	CRLF	
	PRINTI	"""They don't much care for fire,"" Praxix mused, ""Let's get away before they recover!"""
	RTRUE	
?CCL27:	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT \FALSE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" looked Bergon over; he was unconscious. The tentacles were slowly, inexorably, squeezing the life out of him!"
	RTRUE	


	.FUNCT	ANONF-128:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"As "
	ZERO?	SUBGROUP-MODE \?CCL6
	PRINTC	119
	JUMP	?CND4
?CCL6:	PRINTC	104
?CND4:	PRINTI	"e continued, the forest grew increasingly dark and foreboding. The stately stands of pine and alder were gone, replaced by shorter, more twisted trees that seemed to choke the very life out of the forest. A rustling noise filled "
	ZERO?	SUBGROUP-MODE \?CCL9
	PRINTI	"our"
	JUMP	?CND7
?CCL9:	PRINTI	"his"
?CND7:	PRINTI	" ears, and the trees writhed with a hypnotic motion, though the air was still, with no hint of a breeze."
	CALL2	MOVE-TO,TANGLEWOOD-2
	RSTACK	
?CCL3:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	ZERO?	SUBGROUP-MODE \?CCL14
	CALL1	TANGLE-NO-RETURN
	RSTACK	
?CCL14:	CALL2	START-PRAXIX-SEARCH,STR?453
	RSTACK	


	.FUNCT	TANGLE-NO-RETURN:ANY:0:0
	SET	'TANGLE-TWO-B,TRUE-VALUE
	ICALL2	REMOVE-PARTY-COMMAND,RETURN-COMMAND
	PRINTI	"I suggested turning back but Praxix"
	FSET?	BERGON,IN-PARTY \?CND1
	PRINTI	" and Bergon"
?CND1:	PRINTI	" would not hear of it."
	CRLF	
	CRLF	
	ZERO?	A-B-FLAG /?CCL5
	PRINTI	"""Going back into the caverns is not an alternative,"" Praxix said. ""Indeed, we are fortunate enough to have found the one way out; I do not relish the thought of finding another."""
	RTRUE	
?CCL5:	PRINTI	"""No, this is the path we have chosen,"" Bergon said firmly. ""I feel we are heading in the direction Astrix would have wished."""
	CRLF	
	CRLF	
	PRINTI	"""Yes,"" Praxix said, ""This might well be a good choice, whether or not it was the one Astrix had in mind."""
	RTRUE	


	.FUNCT	START-PRAXIX-SEARCH:ANY:1:1,STR
	PRINT	STR
	PRINTI	", Bergon slowly headed back toward camp."
	CALL2	SCENE,PRAXIX-SEARCH
	RSTACK	


	.FUNCT	ANONF-129:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ZERO?	SUBGROUP-MODE \?CCL6
	PRINTC	87
	JUMP	?CND4
?CCL6:	PRINTC	72
?CND4:	PRINTI	"e looked around, but could find no source of the rustling noises, except for the trees themselves."
	FSET?	BERGON,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Argh!"" Bergon cried, seeing a fox twisted until nearly unrecognizable by the strangling branches."
	RTRUE	


	.FUNCT	ANONF-130:ANY:0:0
	FSET?	HERE,BLACK-MIX \?CCL3
	CALL	QSET?,HERE,BLUE-MIX
	ZERO?	STACK \?CCL3
	CRLF	
	CRLF	
	PRINTI	"""These are the same trees that trapped me in the forest where "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" was stricken by the Nightfang,"" Bergon said."
	CRLF	
	CRLF	
	PRINTI	"""Yes,"" replied Praxix. ""Let us hope that my magic will work now as it did before!"""
	JUMP	?CND1
?CCL3:	FSET?	HERE,TRIED \?CND1
	CALL	QSET?,HERE,BLUE-MIX
	ZERO?	STACK \?CND1
	CRLF	
	CRLF	
	PRINTI	"""I have seen these trees before,"" Bergon said darkly, ""in the forest, where "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" was stricken by the Nightfang. We must find some other way, for there is no escape for us if we are caught in their grasp!"""
?CND1:	ZERO?	SUBGROUP-MODE /?CCL11
	FSET	HERE,TRIED
	RTRUE	
?CCL11:	ZERO?	PART-TWO /FALSE
	ZERO?	TANGLE-TWO-B /FALSE
	CALL	TRAVEL-COMMANDS,HERE,PROCEED-COMMAND
	RSTACK	


	.FUNCT	ANONF-131:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"The gnarled trees were soon too thick to penetrate, and "
	FSET?	BERGON,IN-PARTY \?CCL6
	PRINTI	"Bergon"
	JUMP	?CND4
?CCL6:	CALL	FIRST-IN-PARTY,ESHER,MINAR,HURTH,PRAXIX
	ICALL2	WPRINTD,STACK
?CND4:	PRINTI	" finally unsheathed his sword, hacking at the undulating branches. But the branches did not break; they sloughed off, falling to the ground in a pool of steamy green slime. The air was now steamy, and the wavy branches taunted "
	ZERO?	SUBGROUP-MODE \?CCL9
	PRINTI	"us"
	JUMP	?CND7
?CCL9:	PRINTI	"him"
?CND7:	PRINTI	", goading "
	ZERO?	SUBGROUP-MODE \?CCL12
	PRINTI	"us"
	JUMP	?CND10
?CCL12:	PRINTI	"him"
?CND10:	PRINTI	" onward into their unrelenting grasp."
	CALL2	MOVE-TO,TANGLEWOOD-3
	RSTACK	
?CCL3:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	ZERO?	SUBGROUP-MODE \?CCL17
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,RETURN-COMMAND
	CALL1	TANGLE-NO-RETURN
	RSTACK	
?CCL17:	CALL2	START-PRAXIX-SEARCH,STR?454
	RSTACK	


	.FUNCT	ANONF-132:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" turned, but the choking trees were everywhere. Escape would be difficult, if not impossible!"
	RTRUE	


	.FUNCT	ANONF-133:ANY:0:0
	ZERO?	SUBGROUP-MODE /?CND1
	FSET	TANGLEWOOD-2,BLACK-MIX
?CND1:	ZERO?	PART-TWO /FALSE
	ZERO?	TANGLE-TWO-B /FALSE
	CALL	TRAVEL-COMMANDS,HERE,PROCEED-COMMAND
	RSTACK	


	.FUNCT	ANONF-134:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	ZERO?	SUBGROUP-MODE \?CCL6
	PRINTI	"We"
	JUMP	?CND4
?CCL6:	PRINTI	"Bergon"
?CND4:	PRINTI	" tried to move forward, but it was no use. The growth was too thick!"
	RTRUE	
?CCL3:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	ZERO?	SUBGROUP-MODE \?CCL11
	PRINTI	"Sensing our peril, we tried to retreat, but the trees had closed in behind us. A branch rested on Bergon's"
	JUMP	?CND9
?CCL11:	PRINTI	"Bergon, sensing his peril, tried to move back, but the trees had closed in behind him. A branch rested on his"
?CND9:	PRINTI	" shoulder, writhing and undulating as it spread itself around his arms and chest. The trees were closing in, and "
	ZERO?	SUBGROUP-MODE \?CCL14
	PRINTI	"we were trapped!"
	CALL	REMOVE-TRAVEL-COMMAND,HERE,RETURN-COMMAND
	RSTACK	
?CCL14:	PRINTI	"Bergon was trapped!"
	FSET	BERGON,TRAPPED
	ICALL2	PARTY-REMOVE,BERGON
	CALL2	SCENE,PRAXIX-SEARCH
	RSTACK	


	.FUNCT	ANONF-135:ANY:0:0
	EQUAL?	HERE,TANGLEWOOD-3 \FALSE
	CALL2	CHECK-ESSENCES,FAR-VISION-SPELL
	ZERO?	STACK \FALSE
	CALL	FORCE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
	RSTACK	


	.FUNCT	ANONF-136:ANY:0:0,TMP
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	EQUAL?	HERE,TANGLEWOOD-3 \?CCL3
	CALL2	CHECK-ESSENCES,FAR-VISION-SPELL
	ZERO?	STACK \?CCL3
	ICALL2	HINT,HINT-TANGLESCENE
	CALL	FIRST-IN-PARTY,BERGON,HURTH,ESHER,MINAR >TMP
	ICALL2	PARTY-REMOVE,TMP
	ICALL2	SCENE,FALSE-VALUE
	PRINTI	"There appeared to be no alternative to hacking and slashing our way through these infernal trees, and for a while no harm came to us. But I am appalled to report that one of the trees grabbed "
	ICALL2	WPRINTD,TMP
	PRINTI	" and crushed him to death before our very eyes. And, most eerily, the trees then bothered us no longer, as if satisfied at our sacrifice. You can imagine our desolation as, safe at last from the accursed forest, we made our camp for the night."
	LESS?	PARTY-MAX,3 \?CND7
	CRLF	
	CRLF	
	ICALL1	PART-TWO-TOO-FEW
	RTRUE	
?CND7:	CALL2	MOVE-TO,FOG-CAMP
	RSTACK	
?CCL3:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FIRE-SPELL \?CCL13
	EQUAL?	ACTION-PRSI,TANGLE-TREES-1,TANGLE-TREES-2,TANGLE-TREES-3 \?CCL13
	PRINTI	"""Perhaps they do not like fire,"" Praxix said, but fearing an uncontrollable blaze, he cast only a small amount of magical powders at a nearby tree. Sure enough, the tree recoiled as if in pain."
	CRLF	
	CRLF	
	PRINTI	"""The problem is,"" Praxix said, ""that I haven't enough magical powders to burn every tree we need to pass through. And if I use too much at one time, I may cause a great forest fire, with even less chance of escape than we now have! No,"" he said, ""there must be a better way."""
	RTRUE	
?CCL13:	EQUAL?	ACTION-OBJECT,LIGHTNING-SPELL \?CCL17
	FSET	LIGHTNING-SPELL,SEEN
	PRINTI	"Clouds gathered as Praxix cast his lightning spell, and as he pointed his staff at the tree before us, a bolt of white lightning split it in two. A few branches caught fire and instinctively withdrew, as if in pain."
	CRLF	
	CRLF	
	CALL	QSET?,LIGHTNING-SPELL,INCAPACITATED
	ZERO?	STACK \?CND18
	PRINTI	"Praxix, proud of his accomplishment, turned to me and said, ""It's that tiny bit of earth essence that gives the lightning spell its extra punch!"" Then, he turned to the others and spoke. "
?CND18:	PRINTI	"""Effective, but inefficient,"" Praxix declared. ""I don't have nearly enough fire essence to strike every tree that lies before us!"""
	RTRUE	
?CCL17:	EQUAL?	ACTION-OBJECT,RAIN-SPELL \?CCL21
	REMOVE	HYE-TANGLE
	PRINTI	"Praxix cast his rain spell, and soon a heavy rain fell over the forest. But rather than helping our condition, rather the trees appeared to strengthen from the moisture, so much so that we were now more endangered than we had been before."
	RTRUE	
?CCL21:	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \FALSE
	ICALL2	GRAPHIC,G-TANGLEWOOD-BURNS
	PRINTI	"And then Praxix found the solution. Taking out his air and fire essences, he cast the flare enchantment in our direction of travel. A ball of white-hot flame flew from his fingertips, and the tentacles withdrew from the approaching fire, leaving a narrow, but clear, path in its wake."
	CRLF	
	CRLF	
	PRINTI	"He wiped the "
	ICALL	TELL-COLOR,ESSENCE-FIRE,ESSENCE-AIR
	PRINTI	" residue from his fingertips and implored us onward. ""Come quickly,"" Praxix cried, ""Even hurt, these trees are disquieting, and I wish to be long gone when they make their recovery."""
	CRLF	
	CRLF	
	ICALL2	SCENE,FALSE-VALUE
	PRINTI	"It was a long march through these tangled trees, and it was a few hours before  we reached their farthest limits. That night, we made our camp in a clearing nearby. To celebrate our escape, "
	CALL	FIRST-IN-PARTY,BERGON,HURTH,ESHER,PRAXIX
	ICALL2	WPRINTD,STACK
	PRINTI	" rounded up a few large rabbits, from which we made a hearty stew."
	CRLF	
	CRLF	
	PRINTI	"Sitting around the campfire, we began to eat our meal. Praxix, though, had removed his pouch of magical essences and brought forth a fine, white powder which he cast ever so carefully at his portion of supper. We gazed intently as Praxix fretted and stared at his food, then cast more of the powder and fretted and stared some more. Finally, Praxix returned his pouch to his cloak and ate his dinner with relish. Looking up from his fast-emptying bowl, he saw us staring at him with a mixture of curiosity and bewilderment. Finally, I asked him what magic he had so delicately performed on his dinner."
	CRLF	
	CRLF	
	PRINTI	"""Not magic,"" he said. ""Salt. Can't digest a rabbit stew properly without it."""
	CRLF	
	CRLF	
	PRINTI	"After dinner, we slept, but the night was cold and damp, and we rested fitfully, awakening to a dark and foggy morning."
	ICALL2	GRAPHIC,G-FOREST
	CALL2	MOVE-TO,FOG-CAMP
	RSTACK	

	.ENDSEG

	.ENDI
