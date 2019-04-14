
	.SEGMENT "0"


	.FUNCT	HINT:ANY:1:1,H
	MOVE	H,HINTS
	RTRUE	


	.FUNCT	V-MUSINGS:ANY:0:0,STR
	CLEAR	TEXT-WINDOW
	ZERO?	GAME-WON? /?CND1
	ICALL1	HAVE-YOU-EVER-TRIED?
	RTRUE	
?CND1:	PRINTI	"The following marginal notes appeared in "
	ICALL1	WPRINTTAG
	PRINTI	"'s account of the Journey:"
	CRLF	
	CRLF	
	PRINTI	"[Warning: "
	ICALL1	WPRINTTAG
	PRINTI	" gave great thought to the events he witnessed during his Journey and was able to deduce the solutions to many of the mysteries and puzzles that faced his party during those dark days. You are encouraged to solve these puzzles without reference to the musings, as they may tend to reduce your enjoyment of the game.]"
	CRLF	
?PRG3:	PUT	O-TABLE,0,0
	ICALL2	FIND-OBJECTS,HINTS
	GET	O-TABLE,0
	ZERO?	STACK \?CND5
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,MUSINGS-COMMAND
	ICALL1	CLEAR-FIELDS
	ICALL1	NEW-DEFAULT
	RTRUE	
?CND5:	ICALL2	FIND-OBJECT,CANCEL-OBJECT
	ICALL1	CLEAR-FIELDS
	CALL2	GET-COMMAND,MUSINGS-COMMAND
	ICALL	BOLD-CURSOR,1,1,STACK
	ICALL1	PRINT-COLUMNS
	ICALL1	COMMAND-OBJECT-INPUT
	CRLF	
	EQUAL?	ACTION-OBJECT,CANCEL-OBJECT \?CCL9
	ICALL1	CLEAR-FIELDS
	ICALL1	NEW-DEFAULT
	RTRUE	
?CCL9:	GETP	ACTION-OBJECT,P?ACTION
	CALL	STACK
	ZERO?	STACK \?CND7
	GETP	ACTION-OBJECT,P?NUDGE >STR
	ZERO?	STR /?CCL13
	PUTP	ACTION-OBJECT,P?NUDGE,FALSE-VALUE
	PRINT	STR
	JUMP	?CND7
?CCL13:	GETP	ACTION-OBJECT,P?SOLUTION
	PRINT	STACK
	ICALL2	UPDATE-REMOVE,ACTION-OBJECT
?CND7:	CRLF	
	JUMP	?PRG3


	.FUNCT	ANONF-371:ANY:0:0
	ICALL2	UPDATE-REMOVE,HINT-NIGHTFANG
	PRINTI	"I have always wondered whether we could have saved "
	ICALL2	WPRINTD,BITE-VICTIM
	PRINTI	" from the deadly bite of the Nightfang."
	FSET?	ELFSTREAM-1,SEEN \?CCL3
	PRINTI	" Could the woman at the stream have helped if I had approached her?"
	JUMP	?CND1
?CCL3:	PRINTI	" Would it have helped if I had followed the stream?"
?CND1:	PRINTI	" Was there someplace else Praxix could have explored?"
	RTRUE	


	.FUNCT	ANONF-372:ANY:0:0
	FSET?	ELFSTREAM-1,BLUE-MIX /?CCL3
	PRINTI	"Perhaps I should have tried talking to the Elf, even though there was little chance of being understood."
	JUMP	?CND1
?CCL3:	ZERO?	SPOKE-ELVISH \?CCL5
	PRINTI	"I might have tried speaking Elvish, though I don't know whether I could have said anything meaningful."
	JUMP	?CND1
?CCL5:	FSET?	STORY-ELVES,SEEN \?CCL7
	CALL	QSET?,STORY-ELVES,USED-UP
	ZERO?	STACK \?CCL7
	PRINTI	"Thinking back, I'm certain I heard one of our party saying some Elvish words; clearly, I should have paid closer attention."
	RTRUE	
?CCL7:	FSET?	STORY-ELVES,SEEN \?CCL11
	PRINTI	"I believe Hurth said something about his meeting the Elves. What strikes me is that his father, Agrith, was their friend. Was there any way I could tell them that I was a friend of Agrith?"
	JUMP	?CND1
?CCL11:	CALL	QSET?,STORY-ELVES,USED-UP
	ZERO?	STACK \?CCL13
	PRINTI	"I don't believe I heard any of our party speaking Elvish, so I can't see how I could have communicated with the Elf. It's possible, of course, that either Praxix or Hurth might have known the language, but nothing they said indicated it."
	RTRUE	
?CCL13:	PRINTI	"I wonder if Hurth knew any stories about the Elves that would have helped me communicate with them."
?CND1:	CALL2	UPDATE-REMOVE,HINT-ELF-SPEAK
	RSTACK	


	.FUNCT	ANONF-373:ANY:0:0
	FSET?	LAKE-POOL,SEEN /?CCL3
	PRINTI	"I do not know why we failed to explore the area around the lake for clues to "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	"'s disappearance."
	JUMP	?CND1
?CCL3:	FSET?	UL-2,SEEN /?CCL5
	PRINTI	"I do not understand our hesitation to more fully explore the cave and the pool we had found within it."
	JUMP	?CND1
?CCL5:	ZERO?	NYMPHS-COMING? /?CCL7
	FSET?	UL-2,TRIED /?CCL7
	PRINTI	"If only I could have avoided the strange creatures that had captured "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	". I may have inadvertantly worsened my chances by allowing myself to have been seen by one of them earlier."
	JUMP	?CND1
?CCL7:	ZERO?	NYMPHS-COMING? /?CCL11
	PRINTI	"If I had explored more quickly, I might have averted discovery by the creatures that had captured "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTC	46
	JUMP	?CND1
?CCL11:	PRINTI	"Perhaps if I had allowed more time for "
	ICALL2	WPRINTD,LAKE-VICTIM
	PRINTI	" to have regained consciousness, I could have rescued him."
?CND1:	CALL2	UPDATE-MOVE,HINT-LAKE
	RSTACK	


	.FUNCT	ANONF-374:ANY:0:0
	FSET?	UL-TREASURY,SEEN /?CCL3
	PRINTI	"Perhaps I should have spend more time exploring the Nymphs' world."
	JUMP	?CND1
?CCL3:	FSET?	NYMPH-STONE,TRIED /?CCL5
	PRINTI	"Knowing that we needed the Nymph Stone, why did I not try to take it when I had the chance?"
	JUMP	?CND1
?CCL5:	FSET?	UL-TREASURY,SCOUTED \?CCL7
	CALL	QSET?,HINT-NYMPH-STONE,BLUE-MIX
	ZERO?	STACK \?CCL7
	PRINTI	"I could not remove the Nymph Stone by normal means; was there another way?"
	RTRUE	
?CCL7:	FSET?	UL-PIT,TORCHBIT \?CCL11
	PRINTI	"Exploration of the Nymphs' world would have been easier with a portable light source. But I didn't try taking all of the torches!"
	JUMP	?CND1
?CCL11:	FSET?	UL-2-PIT,SCOUTED /?CCL13
	FSET?	UL-TREASURY-PIT,SCOUTED /?CCL13
	PRINTI	"I wonder at the significance of the circular stone pieces. Could they have been moved?"
	JUMP	?CND1
?CCL13:	ZERO?	UL-DROPPED \?CCL17
	PRINTI	"What was the meaning of the pits? I couldn't find out where they led, or could I?"
	JUMP	?CND1
?CCL17:	PRINTI	"I think I was on the right track when I tried dropping things into the pools. Where did they lead?"
?CND1:	CALL2	UPDATE-REMOVE,HINT-NYMPH-STONE
	RSTACK	


	.FUNCT	ANONF-375:ANY:0:0
	ICALL2	UPDATE-REMOVE,HINT-ELVES
	FSET?	FOREST-FIRE,TRIED \?CCL3
	PRINTI	"It is unfortunate that Praxix hadn't enough water essence to put out the Elves' fire. Perhaps there was more water essence to be found, or less that could have been used earlier?"
	RTRUE	
?CCL3:	FSET?	FOREST-FIRE,SEEN \?CCL5
	PRINTI	"I regret that, in our haste to find Astrix, we did not try to help the Elves try to contain the great fire that burned to the north."
	RTRUE	
?CCL5:	FSET?	ESSENCE-WATER,SCOUTED /?CCL7
	PRINTI	"We would have helped the Elves if it were possible, but it seemed we had no means to accomplish the task."
	RTRUE	
?CCL7:	PRINTI	"I suppose we could have helped the Elves with their fire; perhaps Praxix had some reason for standing by and doing nothing."
	RTRUE	


	.FUNCT	ANONF-376:ANY:0:0
	CALL	QSET?,HINT-ORC-FIGHT,BLUE-MIX
	ZERO?	STACK \?CCL3
	PRINTI	"Did we fight to our best advantage? I think not."
	RTRUE	
?CCL3:	FSET?	ORC-FIGHT,SEEN /?CCL5
	PRINTI	"Perhaps things would have gone differently if we had gained the element of surprise by sending one of our party to flank the orcs."
	JUMP	?CND1
?CCL5:	FSET?	ORC-FIGHT,BLUE-MIX \?CCL7
	PRINTI	"Sending one of our party to flank the orcs was a good move, but its effect would have been greater if we had thought of it earlier."
	JUMP	?CND1
?CCL7:	ZERO?	ORC-FIGHT-SPELL \?CCL9
	PRINTI	"Even with the element of surprise, we were not strong enough for the orcs. Maybe Praxix' magic could have helped things along."
	JUMP	?CND1
?CCL9:	PRINTI	"The right spell might have made all the difference in our fight with the orcs - something to slow them down perhaps. But what?"
?CND1:	CALL2	UPDATE-REMOVE,HINT-ORC-FIGHT
	RSTACK	


	.FUNCT	HINT-MAP:ANY:0:0
	FSET?	WEBBA-MAP,INCAPACITATED \?CCL3
	PRINTI	"The map had been rendered useless; if only we had found a better way out of the underground tunnel!"
	JUMP	?CND1
?CCL3:	FSET?	WEBBA-MAP,SOLVED \?CCL5
	IN?	WEBBA-MAP,INVENTORY \?CCL5
	PRINTI	"I don't understand why we didn't examine Webba's map more often. Perhaps it would have helped show the way to Astrix."
	JUMP	?CND1
?CCL5:	FSET?	WEBBA-MAP,USED-UP \?CCL9
	IN?	WEBBA-MAP,INVENTORY \?CCL9
	PRINTI	"I fear there is something we missed in Webba's explanation of the circumstances surrounding his acquisition of the mysterious map we purchased."
	JUMP	?CND1
?CCL9:	IN?	WEBBA-MAP,INVENTORY \?CCL13
	PRINTI	"We never did find out what the strange runes on the map we bought at Webba's meant. Perhaps if we had spoken to him, he would have explained."
	JUMP	?CND1
?CCL13:	PRINTI	"I don't know how we might have avoided the grizzly scene at the Sunrise Mountain. We had no map, and all paths looked similar. Perhaps it was unavoidable."
?CND1:	CALL2	UPDATE-REMOVE,ACTION-OBJECT
	RSTACK	


	.FUNCT	ANONF-377:ANY:0:0
	FSET?	HINT-ALLERGY,BLUE-MIX \?CCL3
	PRINTI	"I don't believe we could have saved Hurth from the illness that caused his death. If only Esher or Praxix had been there, I feel there would have been a chance of saving him."
	JUMP	?CND1
?CCL3:	FSET?	HURTH-OBJECT,BLACK-MIX /?CCL5
	PRINTI	"Why didn't Esher examine Hurth? After all, he was a physician, even if he wasn't knowledgable about Dwarvish illnesses."
	JUMP	?CND1
?CCL5:	CALL	QSET?,HINT-ALLERGY,BLACK-MIX
	ZERO?	STACK \?CCL7
	PRINTI	"Esher had no potion, herb, or root that could help him, but perhaps one could have been found earlier in our travels."
	RTRUE	
?CCL7:	PRINTI	"It occurs to me that the underground tunnel in the forest, with all of its mysterious growths, might have been worth examining more closely."
?CND1:	CALL2	UPDATE-REMOVE,HINT-ALLERGY
	RSTACK	


	.FUNCT	ANONF-378:ANY:0:0
	ICALL2	UPDATE-REMOVE,HINT-EVIL-CAVERN
	FSET?	DARK-EVIL-CAVERN,SEEN /?CCL3
	PRINTI	"Exploration was always vital in our quest; why, then, did we never finish exploring the Dwarven caverns past the stairs?"
	RTRUE	
?CCL3:	PRINTI	"It was a relief to get away from the dark, evil presence we felt in the Dwarven caverns. Yet we turned back with great haste, not fully exploring what lay ahead. Perhaps there was nothing but evil to be found, but, then again, who can say?"
	RTRUE	


	.FUNCT	ANONF-379:ANY:0:0
	ZERO?	A-B-FLAG \?CCL3
	PRINTI	"Perhaps taking the northern path in the forest would have prevented us from walking into the orcs' trap."
	CALL2	UPDATE-REMOVE,HINT-ORC-TRAP
	RSTACK	
?CCL3:	FSET?	MINE-JUNCTION,SEEN /?CCL5
	PRINTI	"Why we did not fully explore the lower chambers remains a mystery."
	CALL2	UPDATE-REMOVE,HINT-ORC-TRAP
	RSTACK	
?CCL5:	CALL	QSET?,ACTIVE-MINE,SOLVED
	ZERO?	STACK \?CCL7
	PRINTI	"We never did discover the meaning of the tapping sounds in the mine. It may have been worthwhile to check them out again."
	RTRUE	
?CCL7:	FSET?	RED-ROCK,SOLVED \?CCL9
	PRINTI	"I'm certain the red rock I recovered from the mine was the key to the miner's disappearances! Could we have used it to save "
	ICALL2	WPRINTD,TRAP-VICTIM
	PRINTI	" from the orcs?"
	FSET?	RED-ROCK,DEAD /?CND10
	PRINTI	" I think I had the rocks with me, though I would have had to check my inventory to be sure."
?CND10:	CALL2	UPDATE-REMOVE,HINT-ORC-TRAP
	RSTACK	
?CCL9:	IN?	RED-ROCK,ACTIVE-MINE /?CCL13
	PRINTI	"Did we fail to pay close enough attention to the mine itself; did we examine everything?"
	CALL2	UPDATE-REMOVE,HINT-ORC-TRAP
	RSTACK	
?CCL13:	PRINTI	"The miner surely knew many things. Did we ask him enough questions?"
	CALL2	UPDATE-REMOVE,HINT-ORC-TRAP
	RSTACK	


	.FUNCT	ANONF-380:ANY:0:0
	FSET?	REAGENT,SOLVED \?CCL3
	PRINT	MIXTURE-HELPFUL?
	CALL2	UPDATE-REMOVE,HINT-VAULT
	RSTACK	
?CCL3:	CALL	QSET?,HINT-VAULT,EXAMINED
	ZERO?	STACK \?CCL5
	PRINT	BGR-NOT-FOUND
	RTRUE	
?CCL5:	CALL2	HINT-REAGENT,HINT-VAULT
	RSTACK	


	.FUNCT	ANONF-381:ANY:0:0
	FSET?	REAGENT,SOLVED \?CCL3
	PRINT	MIXTURE-HELPFUL?
	CALL2	UPDATE-REMOVE,HINT-WOUNDS
	RSTACK	
?CCL3:	CALL	QSET?,HINT-WOUNDS,EXAMINED
	ZERO?	STACK \?CCL5
	PRINT	BGR-NOT-FOUND
	RTRUE	
?CCL5:	CALL2	HINT-REAGENT,HINT-WOUNDS
	RSTACK	


	.FUNCT	ANONF-382:ANY:0:0
	FSET?	REAGENT,SOLVED \?CCL3
	CALL	QSET?,HINT-STONES,SEEN
	ZERO?	STACK \?CCL3
	PRINTI	"I don't know for certain, but I suspect that one of the Stones was hidden in the pile Praxix found in the castle dungeon. It would take forever, I suppose, to have looked at every one, and even then, how would it be distinguished? Was there some magic in Praxix' possession that might have revealed it to him?"
	RTRUE	
?CCL3:	FSET?	REAGENT,SOLVED \?CCL7
	PRINT	MIXTURE-HELPFUL?
	CALL2	UPDATE-REMOVE,HINT-STONES
	RSTACK	
?CCL7:	CALL	QSET?,HINT-STONES,EXAMINED
	ZERO?	STACK \?CCL9
	PRINT	BGR-NOT-FOUND
	RTRUE	
?CCL9:	CALL2	HINT-REAGENT,HINT-STONES
	RSTACK	


	.FUNCT	HINT-REAGENT:ANY:1:1,H
	FSET?	HIGH-PLAIN,SCOUTED /?CCL3
	PRINTI	"I think back, trying to piece together what we never explored, what things we might have done. And then I think of that high ridge in the mountains, high above the lake. We left there abruptly; was there more to be seen there?"
	CALL2	REMOVE-HINT-REAGENT,H
	RSTACK	
?CCL3:	CALL	QSET?,HERMIT-HUT,SCOUTED
	ZERO?	STACK \FALSE
	PRINTI	"And what of the hut and the hermit that lived inside? Did we explore it? Did we learn what secrets may lie inside?"
	CALL2	REMOVE-HINT-REAGENT,H
	RSTACK	


	.FUNCT	REMOVE-HINT-REAGENT:ANY:1:1,H
	CALL2	UPDATE-REMOVE,H
	RSTACK	


	.FUNCT	ANONF-383:ANY:0:0
	CALL	QSET?,HINT-GATE-RUNES,BLUE-MIX
	ZERO?	STACK \?CCL3
	PRINTI	"Perhaps Praxix should have paid more attention to the runes above the gate."
	FSET?	GATE-RUNES,SEEN /TRUE
	ICALL2	UPDATE-REMOVE,HINT-GATE-RUNES
	RTRUE	
?CCL3:	PRINTI	"On the other hand, it is possible that Praxix didn't know as much about the Wizards' language as he said he did, having studied only a dictionary."
	CALL2	UPDATE-REMOVE,HINT-GATE-RUNES
	RSTACK	


	.FUNCT	ANONF-384:ANY:0:0
	FSET?	MILL-MACHINERY,EXAMINED /?CCL3
	PRINTI	"Why wasn't the mill examined more closely? Perhaps something would have been revealed."
	JUMP	?CND1
?CCL3:	FSET?	XFER-JCN,SEEN /?CCL5
	PRINTI	"It is unfortunate that Praxix did not explore the area within the mill mechanism, for he might have found something useful there."
	JUMP	?CND1
?CCL5:	FSET?	XFER-MASTER,SEEN \?CTR6
	FSET?	XFER-1,SEEN /?CCL7
?CTR6:	PRINTI	"From what he told us, there was more within the mill's mechanism for Praxix to have explored."
	JUMP	?CND1
?CCL7:	FSET?	XFER-CONTROLS,EXAMINED /?CCL11
	PRINTI	"Praxix may indeed have explored the mill, but I suspect there is more he could have done while inside its mechanism - something, perhaps, that might have helped him get the essences he had seen in the walls of the first pit."
	JUMP	?CND1
?CCL11:	ZERO?	FIDDLED-WITH-DEVICE \?CCL13
	PRINTI	"The device Praxix described was certainly complicated, yet he did not describe any attempt to use or manipulate it."
	JUMP	?CND1
?CCL13:	FSET?	XFER-MASTER,SOLVED /?CCL15
	CALL	QSET?,HINT-MILL,BLUE-MIX
	ZERO?	STACK \?CCL15
	PRINTI	"Praxix found six runes on each of the dials, yet there was no clue as to what, if anything, those runes represented. There were only three pits, of course, yet the passage beside the third was blocked. Might have there been more pits behind the rockslide?"
	RTRUE	
?CCL15:	FSET?	XFER-MASTER,SOLVED /?CCL19
	CALL	QSET?,HINT-MILL,GRAY-MIX
	ZERO?	STACK \?CCL19
	PRINTI	"This is all idle speculation. Even if there were six pits altogether, how could it be possible to identify a particular rune with a particular pit?"
	RTRUE	
?CCL19:	FSET?	XFER-MASTER,SOLVED /?CCL23
	CALL	QSET?,HINT-MILL,BLACK-MIX
	ZERO?	STACK \?CCL23
	PRINTI	"The pits were not marked in any manner, or were they?"
	RTRUE	
?CCL23:	FSET?	XFER-MASTER,SOLVED /?CCL27
	PRINTI	"Praxix noted that the entire area around the pits was covered with a thick layer of grime or dust of some sort. Perhaps there were markings underneath the dirt!"
	JUMP	?CND1
?CCL27:	FSET?	XFER-3,SCOUTED \?CCL29
	CALL	QSET?,HINT-MILL,SCOUTED
	ZERO?	STACK \?CCL29
	PRINTI	"Praxix certainly found an expensive way to escape from the mill's mechanism, and the loss of magical essences was difficult to compensate for. If Praxix had understood the device in the control room better, perhaps he might have reached us without using his magic."
	RTRUE	
?CCL29:	FSET?	XFER-3,TRAPPED \?CCL33
	PRINTI	"Somehow, Praxix would have needed to know which symbol corresponded to that third pit without using himself as the guinea pig. But how?"
	JUMP	?CND1
?CCL33:	PRINTI	"Praxix determined that two of the pits corresponded with two of the runes on the dials in the control room. Perhaps setting the dials to these two runes and pushing the button would have revealed the nature of the device itself."
?CND1:	CALL2	UPDATE-REMOVE,HINT-MILL
	RSTACK	


	.FUNCT	ANONF-385:ANY:0:0
	ZERO?	XFER-TRAP /?CCL3
	CALL	QSET?,HINT-MILL-TRAPPED,BLUE-MIX
	ZERO?	STACK \?CCL3
	PRINTI	"Perhaps Praxix should have learned more about the workings of the device before using it himself."
	RTRUE	
?CCL3:	ZERO?	XFER-TRAP /?CCL7
	GETP	HINT-MILL,P?ACTION
	ICALL	STACK
	JUMP	?CND1
?CCL7:	FSET?	XFER-3-ANTE,SEEN \?CCL9
	CALL	QSET?,HINT-MILL-TRAPPED,GRAY-MIX
	ZERO?	STACK \?CCL9
	PRINTI	"It was clear to Praxix that there was light pouring into the bottom of the third pit. Perhaps that was an exit to the mill's inner mechanism."
	RTRUE	
?CCL9:	FSET?	XFER-3-ANTE,SEEN \?CCL13
	PRINTI	"Since jumping was out of the question, Praxix had few choices. One spell, though, comes to mind, although its use would be somewhat ironic under the circumstances. Otherwise, Praxix had little choice unless he could somehow make the mechanism work to his advantage."
	JUMP	?CND1
?CCL13:	PRINTI	"If Praxix had looked some more before he leaped, perhaps he would not have become trapped beneath the mill."
?CND1:	CALL2	UPDATE-REMOVE,HINT-MILL-TRAPPED
	RSTACK	


	.FUNCT	ANONF-386:ANY:0:0
	FSET?	REAGENT,SOLVED \?CCL3
	PRINTI	"It is a great tragedy that Hurth died in the old mine. Was it worth it? Did we really need more of that magical reagent?"
	CALL2	UPDATE-REMOVE,HINT-OLD-MINE
	RSTACK	
?CCL3:	CALL	QSET?,HINT-OLD-MINE,SEEN
	ZERO?	STACK \?CCL5
	PRINTI	"I do not see how this tragedy could have been avoided. If we were to get the reagent we needed, what alternative did we have?"
	CALL2	UPDATE-REMOVE,HINT-OLD-MINE
	RSTACK	
?CCL5:	CALL2	HINT-REAGENT,HINT-OLD-MINE
	RSTACK	


	.FUNCT	ANONF-387:ANY:0:0
	ICALL2	UPDATE-REMOVE,HINT-TAVERN
	FSET?	TAVERN-OTHER-TABLE,DEAD \?CCL3
	PRINTI	"It is a shame that we ran out of the red rocks that I had found in the mines. Perhaps we used them carelessly."
	RTRUE	
?CCL3:	FSET?	TAVERN-OTHER-TABLE,EXAMINED /?CCL5
	PRINTI	"There was not much going on in the tavern, to be sure. Yet we did not check out the other customers in any way."
	RTRUE	
?CCL5:	FSET?	ZAN-TAVERN,SOLVED /?CCL7
	PRINTI	"If only we knew what the people at the other table were saying - for surely, they were talking about us! It would have been far too dangerous to simply walk up to them, but I wonder...."
	RTRUE	
?CCL7:	PRINTI	"I know it is impolite, yet I wished I had spent more time eavesdropping on the other table in the tavern."
	RTRUE	


	.FUNCT	HINT-MURDER:ANY:0:0
	CALL	QSET?,ACTION-OBJECT,SEEN
	ZERO?	STACK \?CCL3
	PRINTI	"We were warned by Astrix to be careful in Zan; clearly, someone knew we were coming and knew how to find us."
	RTRUE	
?CCL3:	PRINTI	"How did they know we'd be staying at the "
	EQUAL?	ACTION-OBJECT,HINT-INN \?CCL6
	PRINTI	"inn"
	JUMP	?CND4
?CCL6:	PRINTI	"campground"
?CND4:	PRINTI	"? "
	FSET?	INN,SEEN \?CCL9
	PRINTI	"They asked at the inn, of course. We should have known not to trust the innkeeper; knowing now what I did not know then, I'm sure we could have fooled them."
	JUMP	?CND7
?CCL9:	PRINTI	"They may have checked at the inn and found out we were not staying there. I suppose it would not have been hard to figure out that we had camped outside of town."
?CND7:	CALL2	UPDATE-REMOVE,ACTION-OBJECT
	RSTACK	


	.FUNCT	ANONF-388:ANY:0:0
	CALL	QSET?,HINT-JAIL,SEEN
	ZERO?	STACK \?CCL3
	PRINTI	"We were trapped in the jail with no escape possible. There is no one to blame, nothing we could have done."
	RTRUE	
?CCL3:	FSET?	GRAY-STONE,SOLVED \?CCL5
	PRINTI	"I wonder about the gray reagent we had bought. Could some mixture have helped us? If so, we would have done better to experiment before getting caught!"
	JUMP	?CND1
?CCL5:	FSET?	CURIO-SHOP,SCOUTED /?CCL7
	PRINTI	"And yet, we did not explore everywhere in town. Not the curio shop, at any rate."
	JUMP	?CND1
?CCL7:	FSET?	GRAY-STONE,TRAPPED \?CCL9
	PRINTI	"But why was Praxix so ornery; why didn't he ask to see some of the things that were for sale in the curio shop? There might have been something useful there."
	JUMP	?CND1
?CCL9:	FSET?	GRAY-STONE,EXAMINED /?CCL11
	PRINTI	"Alas that we did not try to buy the gray stone. Later, Praxix confided that it was a magical reagent, and its magic could have helped us."
	JUMP	?CND1
?CCL11:	CALL	QSET?,HINT-JAIL,SOLVED
	ZERO?	STACK \?CCL13
	PRINTI	"Alas that we had nothing to trade for the gray stone. It was certainly a magical reagent, and might have helped us escape from jail."
	RTRUE	
?CCL13:	FSET?	STAIR-CHASM,SEEN /?CCL15
	PRINTI	"I think back to all we had accomplished, everything we had seen: was there any place we did not explore? Yes! The left stair in the caverns; but now I will never know what lay along that path."
	JUMP	?CND1
?CCL15:	FSET?	FAR-CHASM,SEEN /?CCL17
	PRINTI	"The chasm between the broken stairs! I don't know why, but it occurs to me that we never found a way across. Could that have helped?"
	JUMP	?CND1
?CCL17:	FSET?	SUNSET-TOWER,SOLVED /?CCL19
	PRINTI	"The Sunset Tower: why do I feel that we have missed simething there? Was there something hidden there?"
	JUMP	?CND1
?CCL19:	PRINTI	"The spyglass! Of course! Praxix said it was a priceless treasure!"
?CND1:	CALL2	UPDATE-REMOVE,HINT-JAIL
	RSTACK	


	.FUNCT	ANONF-389:ANY:0:0
	CALL	QSET?,HINT-MAGIC,BLUE-MIX
	ZERO?	STACK \?CCL3
	PRINTI	"The fearsome demon was our final undoing. If I had only come up with the proper mixture! And yet I am certain that I had seen or heard things that could have helped me discover the relationship between the spells and their colors. But what?"
	RTRUE	
?CCL3:	FSET?	TALE-MAGIC,EXAMINED /?CCL5
	PRINTI	"First of all, I never had Praxix tell me about magic - that certainly would have been useful!"
	CALL2	UPDATE-REMOVE,HINT-MAGIC
	RSTACK	
?CCL5:	CALL	QSET?,HINT-MAGIC,GRAY-MIX
	ZERO?	STACK \?CCL7
	PRINTI	"Yes, I recall having noted the color on Praxix' hands after casting 'Flare' to get us through the snaketrees. And now that I think of it, there were other times as well."
	RTRUE	
?CCL7:	PRINTI	"The solution should be obvious; between what Praxix said to me about magic and the colors I had seen on his fingers, all I needed was a little common sense."
	CALL2	UPDATE-REMOVE,HINT-MAGIC
	RSTACK	


	.FUNCT	ANONF-390:ANY:0:0
	FSET?	BLACK-REAGENT,SEEN /?CCL3
	PRINTI	"It was foolish to attempt to get past the mudwargs. Why didn't we stay with Umber and seek his advice?"
	JUMP	?CND1
?CCL3:	ZERO?	BLACK-COUNT /?CCL5
	PRINTI	"The black reagent frightened Praxix, I am sure. Nevertheless, he might have experimented more with the various combinations of mixtures."
	JUMP	?CND1
?CCL5:	PRINTI	"I will never understand why Praxix never experimented with the black reagent. Perhaps he had his reasons, but I have never understood what they could be."
?CND1:	CALL2	UPDATE-REMOVE,HINT-MUDWARGS
	RSTACK	


	.FUNCT	HAVE-YOU-EVER-TRIED?:ANY:0:0,F
	PRINTI	"At the end of the account of the Journey, the following was written in "
	ICALL1	WPRINTTAG
	PRINTI	"'s hand."
	CRLF	
	CRLF	
	PRINTI	"I wonder what would have happened if..."
	CRLF	
	FIRST?	HAVE-YOU-EVER >F /?BOGUS1
?BOGUS1:	CRLF	
	PRINTI	"... "
	GETP	F,P?SOLUTION
	PRINT	STACK
	REMOVE	F
	FIRST?	HAVE-YOU-EVER \?CCL4
	CALL	CHANGE-TRAVEL-COMMAND,HERE,MUSINGS-COMMAND,MORE-COMMAND
	RSTACK	
?CCL4:	CALL	REMOVE-TRAVEL-COMMAND,HERE,MUSINGS-COMMAND
	RSTACK	


	.FUNCT	V-MORE:ANY:0:0,F
	FIRST?	HAVE-YOU-EVER >F /?BOGUS1
?BOGUS1:	PRINTI	"... "
	GETP	F,P?SOLUTION
	PRINT	STACK
	REMOVE	F
	FIRST?	HAVE-YOU-EVER /TRUE
	ICALL1	REMOVE-TRAVEL-COMMAND
	RTRUE	

	.ENDSEG

	.ENDI
