
	.SEGMENT "CAVERNS"


	.FUNCT	ANONF-242:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" took a moment to look over the carnage; over two dozen orcs were piled on the ground, most of them dispatched single-handedly by Hurth."
	FSET?	ESHER,IN-PARTY \?PRD7
	FSET?	ESHER,BUSY /?CCL5
?PRD7:	FSET?	BERGON,BUSY \TRUE
?CCL5:	PRINTI	" But there was no joy in our victory - we had paid a heavy price!"
	RTRUE	


	.FUNCT	ANONF-243:ANY:0:0,TMP
	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL3
	MOVE	MINE-ORCS,HERE
	SET	'OPPONENT,MINE-ORCS
	ICALL1	PRINT-CHARACTER-COMMANDS
	SET	'UPDATE-FLAG,FALSE-VALUE
	ICALL	CHANGE-CIT,BERGON,1,NUL-COMMAND,FALSE-VALUE
	ICALL	CHANGE-CIT,HURTH,1,NUL-COMMAND
	ZERO?	MIX-DONE /?CND4
	ICALL	CHANGE-CIT,PRAXIX,2,USE-MIX-COMMAND
?CND4:	ICALL2	NUL-PARTY-COMMAND,RETREAT-COMMAND
	ICALL2	NUL-PARTY-COMMAND,PARLEY-COMMAND
	SET	'COMBAT-ROUND,-1
	RETURN	COMBAT-ROUND
?CCL3:	EQUAL?	ACTION,SCENE-END-COMMAND \?CCL7
	FSET?	HERE,SOLVED /FALSE
	ICALL	UPDATE-MOVE,MINE-ORC-BODIES,HERE
	ICALL2	UPDATE-REMOVE,MINE-ORCS
	ICALL	UPDATE-FCLEAR,PRAXIX,BUSY
	CRLF	
	CRLF	
	PRINTI	"The fight was over; Bergon was slumped on the ground, rapidly losing his battle for life."
	FSET?	ESHER,IN-PARTY \?CND11
	PRINTI	" Esher fared worse still, and died in Praxix' arms before the Wizard could begin to help."
	ICALL2	KILLED-OFF,ESHER
?CND11:	ZERO?	COMBAT-SPELL /?CND13
	PRINTI	" Praxix, no longer concerned with the spell he was preparing, tossed the mixed powders to the ground and rushed to Bergon's side."
?CND13:	ICALL	UPDATE-MOVE,BERGON-OBJECT,HERE
	FCLEAR	BERGON-OBJECT,DONT-EXAMINE
	PUTP	HERE,P?TEMP,MOVE-NUMBER
	RTRUE	
?CCL7:	EQUAL?	ACTION,COMBAT-RESULT-COMMAND \?CCL16
	ZERO?	COMBAT-ROUND \?CCL19
	PRINTI	"The first orcs started to come through the hole, and we had an easy time dispatching them as they came. After four were killed, they stopped coming for a time. All was quiet, and yet we felt certain that we had not seen the last of these orcs."
	CRLF	
	CRLF	
	PRINTI	"At once, the quiet was broken as the orcs started a guttural chant, and their harsh footsteps could again be heard just outside of the chamber!"
	CRLF	
	CRLF	
	PRINTI	"""It seems we are trapped,"" Bergon said, gloomily, ""and the orcs come yet again."""
	EQUAL?	COMBAT-SPELL,TREMOR-SPELL \TRUE
	CRLF	
	CRLF	
	PRINTI	"""It seems we are trapped, yes,"" Praxix repeated, ""but things are not always what they seem!"""
	RTRUE	
?CCL19:	EQUAL?	COMBAT-ROUND,1 \?CCL23
	PRINTI	"The orcs, sensing the folly in entering our midst singly, now changed their strategy, and pushed over themselves into the chamber. They paid dearly for the effort, and their bodies soon piled up near the entry. But they were successful, and a few orcs now arrived among us. Hurth was exceedingly strong, and killed a few more orcs with his broadsword. Bergon, too, fought well, but he was soon hit by the side of an orc's axe, and stumbled backward on the ground."
	ICALL	UPDATE-MOVE,BERGON-OBJECT,HERE
	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
	JUMP	?CND17
?CCL23:	EQUAL?	COMBAT-ROUND,2 \?CCL25
	PRINTI	"On and on they came, slowed somewhat by the carnage at the chamber's entrance. I killed two orcs that were threatening Bergon, but he was hit yet again, and soon lay unconscious on the ground. Hurth again bore the brunt of our offense, and soon claimed a dozen orcs with only a few minor wounds."
	EQUAL?	COMBAT-SPELL,TREMOR-SPELL \?CND26
	CRLF	
	CRLF	
	PRINTI	"""If we are not trapped,"" I said, remarking on Praxix' obtuse comment of a few moments ago, ""this would be a good time to show us."""
?CND26:	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
?CND17:	ZERO?	COMBAT-SPELL /TRUE
	SUB	COMBAT-ROUND,COMBAT-SPELL-ROUND
	GRTR?	STACK,1 \TRUE
	EQUAL?	COMBAT-SPELL,TREMOR-SPELL \?CCL36
	CRLF	
	CRLF	
	PRINTI	"At last, Praxix was ready to cast his spell. ""Back! This way!"" he shouted, leading us to the farthest spot from the entrance. But I would not leave Bergon behind, and I managed to avoid injury as I dragged him out of harm's way. And then, with our party a safe distance from the orcs, the spell was cast, and the ground shook mightily."
	CRLF	
	CRLF	
	FSET	HERE,SOLVED
	ICALL	SCENE,FALSE-VALUE,TRAVEL-MODE
	ICALL2	FLUME-TREMOR,TRUE-VALUE
	RTRUE	
?CCL25:	PRINTI	"The last few orcs in the raiding party were now here, but we were strong enough to defeat them."
	FSET?	ESHER,IN-PARTY \?CND28
	ICALL	MAKE-BUSY,ESHER,ILL-COMMAND
	PRINTI	" As the last of them went down, he slashed Esher in the chest. Bleeding badly, Esher slumped to the floor, as Hurth killed the last of the living attackers."
?CND28:	ICALL2	HINT,HINT-TREMOR
	ICALL	TRAVEL-COMMANDS,HERE,BACK-COMMAND
	ICALL2	END-COMBAT,FALSE-VALUE
	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
	RTRUE	
?CCL36:	ICALL	CHANGE-CIT,PRAXIX,1,NUL-COMMAND
	SET	'COMBAT-SPELL,FALSE-VALUE
	CRLF	
	CRLF	
	PRINTI	"Praxix' spell was now prepared, but he reluctantly concluded that it would do no good in the midst of this pandemonium."
	RTRUE	
?CCL16:	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL38
	EQUAL?	MIXTURE,ANIMATE-SPELL \?CCL38
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT \?CCL38
	PRINTI	"Praxix tried to reach Bergon with his mixture, but there were orcs between their positions, and would have faced certain death in the attempt."
	ICALL	CHANGE-CIT,PRAXIX,2,NUL-COMMAND
	SET	'MIX-DONE,FALSE-VALUE
	RTRUE	
?CCL38:	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL43
	EQUAL?	MIXTURE,ANIMATE-SPELL \?CCL43
	EQUAL?	ACTION-OBJECT,MINE-ORCS \?CCL43
	PRINTI	"Praxix cast his mixture on the orcs, but the only effect was that of making the orcs somewhat stronger than they had been previously."
	ICALL	CHANGE-CIT,PRAXIX,2,NUL-COMMAND
	SET	'MIX-DONE,FALSE-VALUE
	RTRUE	
?CCL43:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	ZERO?	COMBAT-SPELL \FALSE
	SET	'COMBAT-SPELL,ACTION-OBJECT
	SET	'COMBAT-SPELL-ROUND,COMBAT-ROUND
	ICALL2	MAKE-BUSY,PRAXIX
	PRINTI	"Praxix, meanwhile, was attempting to cast his "
	ICALL2	WPRINTD,COMBAT-SPELL
	PRINTI	" spell. But these things take time, and we weren't counting on any quick results."
	RTRUE	


	.FUNCT	ANONF-244:ANY:0:0
	CALL	QSET?,MINE-FIGHT,SEEN
	ZERO?	STACK \FALSE
	GETPT	BERGON,P?FIGHT-COMMANDS
	PUT	STACK,0,NUL-COMMAND
	GETPT	HURTH,P?FIGHT-COMMANDS
	PUT	STACK,0,NUL-COMMAND
	CRLF	
	CRLF	
	PRINTI	"Drawing our weapons, we prepared for battle. It was clear that we had one obvious advantage and one obvious disadvantage. What's more, they were one and the same - the narrow entry into our chamber."
	CRLF	
	CRLF	
	PRINTI	"On the one hand, it would be a simple matter to dispatch the orcs one at a time as they stumbled into our midst. On the other hand, they might not oblige us, in which case we were trapped."
	CALL	SCENE,MINE-FIGHT,FIGHT-MODE
	RSTACK	


	.FUNCT	ANONF-245:ANY:0:0
	FSET?	BERGON,BUSY \?CCL3
	EQUAL?	PARTY-MODE,TRAVEL-MODE \?CCL3
	GETP	HERE,P?TEMP
	ADD	STACK,2
	GRTR?	MOVE-NUMBER,STACK \?CCL3
	PRINTI	"It mattered little what we chose to do next. Bergon was dead, and our mission a failure! We retreated as we had come, fortunate indeed to have escaped another group of orcs that had been approaching, and appeared finally before Astrix. His face was grim and determined."
	CRLF	
	CRLF	
	ICALL2	HINT,HINT-WOUNDS
	CALL1	PART-ONE-BAD-ENDING
	RSTACK	
?CCL3:	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL8
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT \?CCL8
	ICALL	UPDATE-FSET,BERGON-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" was badly hurt, as "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" was quick to recognize. He would die soon unless we acted; but what could we do?"
	RTRUE	
?CCL8:	FSET?	BERGON,BUSY \?CCL12
	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL12
	EQUAL?	MIXTURE,ANIMATE-SPELL \?CCL12
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT \?CCL12
	ICALL	UPDATE-MOVE,BERGON-OBJECT,RANDOM-OBJECTS
	PRINTI	"Praxix cast his mixture at Bergon; for a moment, it appeared that nothing would happen. But then, as we watched, his wounds began to heal and in a matter of minutes he was as strong as on the day we had embarked on our journey."
	CRLF	
	CRLF	
	PRINTI	"""A powerful enchantment!"" said Praxix"
	FSET?	HERMIT-POWDER,SEEN \?CCL19
	PRINTI	", ""I wonder if old Garlimon knew the power his gift possessed!"""
	JUMP	?CND17
?CCL19:	PRINTC	46
?CND17:	ICALL1	MIXTURE-CAST
	SET	'UPDATE-FLAG,TRUE-VALUE
	ICALL	TRAVEL-COMMANDS,HERE,BACK-COMMAND
	FSET	HERE,BLUE-MIX
	CALL1	CLEAR-BUSY
	RSTACK	
?CCL12:	EQUAL?	ACTION,BACK-COMMAND \?CCL21
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET?	BERGON,BUSY \?CCL24
	ICALL2	REMOVE-PARTY-COMMAND,BACK-COMMAND
	PRINTI	"Nearly panicked, I started to run from the chamber, but was held back by Praxix. ""We must not leave our friend while he lays alive,"" he said."
	RTRUE	
?CCL24:	FSET?	HERE,BLUE-MIX \?CCL26
	PRINTI	"We were trapped now, or nearly so; more orcs were nearby, perhaps alerted by the ones we had just narrowly defeated. We retreated as we had come, fortunate indeed to have escaped another group of orcs that had been approaching, and appeared finally before Astrix. His face was grim and determined."
	CRLF	
	CRLF	
	CALL1	PART-ONE-BAD-ENDING
	RSTACK	
?CCL26:	PRINTI	"We started back toward the junction, but more orcs could be heard there as well. It appeared we were trapped!"
	RTRUE	
?CCL21:	EQUAL?	SCENE-OBJECT,MINE-FIGHT /FALSE
	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \FALSE
	CALL1	FLUME-TREMOR
	RSTACK	


	.FUNCT	FLUME-TREMOR:ANY:0:1,FIGHT?,BI
	FSET?	BERGON,BUSY \?CND1
	SET	'BI,TRUE-VALUE
?CND1:	ZERO?	FIGHT? \?CND3
	PRINTI	"Praxix now began to concentrate on the fact that we were trapped. On a hunch, he took some earth essence from his pouch and cast it upon the ground beneath our feet."
	CRLF	
	CRLF	
?CND3:	PRINTI	"""What do you think...,"" was as far as "
	ZERO?	BI /?CCL7
	PRINTI	"Hurth"
	JUMP	?CND5
?CCL7:	PRINTI	"Bergon"
?CND5:	PRINTI	" got before the rock beneath our feet gave way, sending us plunging into a frigid river some dozen feet below."
	CRLF	
	CRLF	
	PRINTI	"The water ran swiftly through this underground flume, and we were tossed and buffeted mercilessly as we tumbled our way down the tortuous gorge. Finally, we were thrown over a ten-foot waterfall and landed in a deep, wide pool, from which it was a short swim to the water's edge."
	CRLF	
	CRLF	
	PRINTI	"""What do you think you're doing?"" yelled "
	ZERO?	BI /?CCL10
	PRINTI	"Hurth"
	JUMP	?CND8
?CCL10:	PRINTI	"Bergon"
?CND8:	PRINTI	", finally finishing his previous thought."
	CRLF	
	CRLF	
	PRINTI	"""As I recall, we were all curious about the source of the water sounds. Also, it seems we were in need of some means of escape. I believe I have found both,"" Praxix said proudly."
	ZERO?	BI /?CND11
	PRINTI	" ""Now help me here with Bergon."" And Bergon was clearly in need of help; bleeding profusely, he would not survive long!"
?CND11:	ZERO?	FIGHT? /?CND13
	CRLF	
	CRLF	
	PRINTI	"""At least we seem to be rid of those orcs,"" I offered, ""I suppose they are afraid of water."""
	CRLF	
	CRLF	
	PRINTI	"""More likely they suppose us to have died in the fall,"" Praxix replied."
?CND13:	ZERO?	BI /?CND15
	ICALL	UPDATE-MOVE,BERGON-OBJECT,FLUME-POOL
	FCLEAR	BERGON-OBJECT,DONT-EXAMINE
?CND15:	ICALL2	MOVE-TO,FLUME-POOL
	ZERO?	BI /TRUE
	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
	RTRUE	

	.ENDSEG

	.SEGMENT "MINES"


	.FUNCT	ANONF-246:ANY:0:0
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK /TRUE
	FSET	HERE,TRAPPED
	ICALL2	PARTY-ADD,BERGON
	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
	CRLF	
	CRLF	
	PRINTI	"Bergon was here, slumped against a wall; he was dying, that was certain."
	RTRUE	


	.FUNCT	ANONF-247:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT \?CCL3
	ICALL	UPDATE-FSET,BERGON-OBJECT,DONT-EXAMINE
	FSET?	HERE,TRAPPED \?CCL8
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went over to look at Bergon; his pulse was slow, his breathing irregular. Shaking his head sadly, he returned to the group."
	RTRUE	
?CCL8:	ICALL2	WPRINTD,ACTOR
	PRINTI	" examined Bergon briefly. ""He's got a punctured lung, and a good deal of other internal damage from his wounds,"" he reported. ""He's also lost a great deal of blood. Unless we do something quickly, I'm afraid he's going to die."" He then did what he could to stop Bergon's bleeding, but his actions were merely palliative."
	RTRUE	
?CCL3:	EQUAL?	ACTION,USE-MIX-COMMAND \?CCL10
	EQUAL?	ACTION-OBJECT,BERGON-OBJECT \?CCL10
	EQUAL?	MIXTURE,ANIMATE-SPELL \?CCL10
	FSET?	BERGON,BUSY \?CCL10
	ICALL1	MIXTURE-CAST
	ICALL	TRAVEL-COMMANDS,HERE,PROCEED-COMMAND
	PRINTI	"Praxix cast this strange enchantment at "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	"; for a moment, it appeared that nothing would happen. But then, as we watched, his wounds began to heal and in a matter of minutes he was as strong as on the day we had embarked on our journey."
	CRLF	
	CRLF	
	PRINTI	"""A powerful enchantment!"" said Praxix"
	FSET?	HERMIT-POWDER,SEEN \?CCL17
	PRINTI	", ""I wonder if old Garlimon knew the power his gift possessed!"""
	JUMP	?CND15
?CCL17:	PRINTC	46
?CND15:	SET	'LEADER,BERGON
	SET	'UPDATE-FLAG,TRUE-VALUE
	ICALL	UPDATE-MOVE,BERGON-OBJECT,RANDOM-OBJECTS
	ICALL1	CLEAR-BUSY
	FSET?	MINE-LOWER-STAIR,SEEN \TRUE
	CRLF	
	CRLF	
	ICALL1	END-PART-TWO-A
	RTRUE	
?CCL10:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL21
	FSET?	HERE,TRAPPED /?CCL21
	FSET?	BERGON,BUSY \?CND24
	ICALL2	PARTY-REMOVE,BERGON
	PRINTI	"It was undesirable to leave Bergon here, unattended, but we agreed there was no alternative. And so, making him as comfortable as we could, we left his side."
	CRLF	
	CRLF	
?CND24:	PRINTI	"A wide path followed the raging river upstream, and we followed it until we came to a tunnel leading back into what we supposed were the main chambers at this level."
	CALL2	MOVE-TO,ALONG-FLUME
	RSTACK	
?CCL21:	FSET?	HERE,TRAPPED \FALSE
	EQUAL?	ACTION,USE-MIX-COMMAND /FALSE
	EQUAL?	ACTION,MIX-COMMAND /FALSE
	CALL1	GAME-COMMAND?
	ZERO?	STACK \FALSE
	PRINTI	"Just then, Bergon's body heaved and his eyes opened. Praxix and I moved closer to him, and "
	IN?	SPIRIT-STONE,INVENTORY \?CCL34
	PRINTI	"Praxix held up the white stone to his view."
	CRLF	
	CRLF	
	PRINTI	"Bergon smiled faintly. ""It is very beautiful,"
	JUMP	?CND32
?CCL34:	PRINTI	"tried our best to comfort him."
	CRLF	
	CRLF	
	PRINTI	"Bergon winced in pain. ""The Stone... You have found it?"
?CND32:	PRINTI	""" he whispered, and taking one last raspy breath, he expired in our arms."
	CRLF	
	CRLF	
	PRINTI	"We were silent a long while. What could we say about this brave man who had led us through so many dangers? We knew it would be impossible to bury him here and so, after a short ritual, we wrapped him in his cloak and cast him into the waters, watching him as he was carried out of sight into the very depths of the earth."
	CRLF	
	CRLF	
	ICALL2	HINT,HINT-WOUNDS
	FCLEAR	BERGON,BUSY
	ICALL2	KILLED-OFF,BERGON
	ICALL1	END-PART-TWO-A
	RTRUE	


	.FUNCT	END-PART-TWO-A:ANY:0:0,TMP
	PRINTI	"We returned to the side of the river"
	FSET?	GATE-JUNCTION,SEEN /?CCL3
	PRINTI	", and decided to continue our explorations in these lower regions of the caverns. This time, we took the right-hand path from the bottom of the stairs, and soon came to a wide vestibule with paths leading both left and right; but while the right path was wide and ornate, the one to the left was crudely constructed."
	ICALL2	MOVE-TO,GATE-JUNCTION
	RTRUE	
?CCL3:	FSET?	TOMB,SEEN /?CCL5
	FSET?	TOMB-ANTE,SEEN \?CCL5
	ICALL2	HINT,HINT-DOOR
	JUMP	?CND1
?CCL5:	FSET?	TOMB,SEEN \?CND1
	IN?	TOMB-COFFIN,TOMB /?CND1
	ICALL2	HINT,HINT-VAULT
?CND1:	IN?	SPIRIT-STONE,INVENTORY \?CCL13
	PRINTI	" with our goal accomplished"
	JUMP	?CND11
?CCL13:	PRINTI	" in low spirits. We had explored these regions as best we could, but had not found the Stone that Astrix had said could be found here"
?CND11:	GET	KILLED-TBL,0 >TMP
	GRTR?	TMP,0 \?CND14
	PRINTI	". Sadly, we had lost our friend"
	GRTR?	TMP,1 \?CND16
	PRINTC	115
?CND16:	ICALL2	TELL-WITH-COMMAS,KILLED-TBL
?CND14:	PRINTI	". The path here continued to run along the river's edge, and we followed it for many hours, as it wound its way upward, finally rising out of the caverns and into the open air."
	CRLF	
	CRLF	
	ZERO?	A-B-FLAG \?CCL20
	PRINTI	"""We are not far below the falls,"" I said, ""It should be a simple matter to find Astrix again from here."""
	CRLF	
	CRLF	
	PRINTI	"It was, in fact, only a few miles to the falls, and by the end of the day we had reached Astrix' tower on the Sunrise Mountain."
	CALL1	PART-TWO-ENDING
	RSTACK	
?CCL20:	LESS?	PARTY-MAX,3 \?CCL22
	CALL1	PART-TWO-TOO-FEW
	RSTACK	
?CCL22:	PRINTI	"We had emerged from the caverns only a few miles south of the falls we had just barely escaped earlier in our journey. Before us lay a forest that was quite a bit older and darker than the one in which the Elves lived."
	ICALL2	SCENE,TANGLESCENE
	CALL2	MOVE-TO,TANGLEWOOD-1
	RSTACK	


	.FUNCT	ANONF-248:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	", moving out ahead of us, brought back the report that the path ahead climbed as it followed the underground river."
	EQUAL?	ACTOR,HURTH \TRUE
	CRLF	
	CRLF	
	PRINTI	"""If these caverns are laid out as I surmise, we can follow it to reach the forest above,"" he remarked."
	RTRUE	
?CCL3:	EQUAL?	ACTION,FOLLOW-RIVER-COMMAND \?CCL7
	ICALL1	REMOVE-TRAVEL-COMMAND
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	PRINTI	"We started ahead, climbing along the side of the raging river; a dim light from up ahead grew brighter as we continued; this path would surely lead out of the caverns. Not wishing to forego the exploration of the lower regions, we retraced our steps, returning to the entrance to the tunnel."
	RTRUE	
?CCL7:	EQUAL?	ACTION,ENTER-TUNNEL-COMMAND \FALSE
	PRINTI	"The tunnel ran straight for a few hundred paces, ending finally at the bottom of a wide stair. To our right, another path led through a tall archway and to our left, a crudely made hole entered the rock."
	CRLF	
	CRLF	
	PRINTI	"""Praxix, you have done well,"" said Hurth, smiling broadly. ""This would be the bottom of the stairs that start up high at the Bern i-Fen. I had nearly lost hope of arriving here."""
	FSET?	ESHER,IN-PARTY \?CCL11
	FSET?	BERGON,IN-PARTY /?CND10
?CCL11:	CRLF	
	CRLF	
	PRINTI	"""Indeed, though I regret we are not all here to see it,"" Praxix replied quietly. ""There is great evil within the earth; let us hope there is great good also."""
?CND10:	CRLF	
	CRLF	
	PRINTI	"""Am I the only one that hears something peculiar?"" I asked."
	CRLF	
	CRLF	
	PRINTI	"""I was about to say the same thing,"" answered Hurth. ""It sounds to me like someone chipping away at rock somewhere down the passage to the left."""
	CALL2	MOVE-TO,MINE-LOWER-STAIR
	RSTACK	


	.FUNCT	ANONF-249:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	CALL	QSET?,HERE,SCOUTED
	ZERO?	STACK \?CCL3
	FSET?	MINER-PASSAGE,SEEN /?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	PRINTI	"We sent "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" off to find the source of the tapping sound. Indeed, it was coming from the path on the left, inside some sort of mine."
	RTRUE	
?CCL3:	EQUAL?	ACTION,UP-COMMAND \?CCL8
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"It took only a short walk up the stairs to "
	FSET?	MINE-2-W,TRAPPED \?CCL11
	PRINTI	"confirm what we already knew:"
	JUMP	?CND9
?CCL11:	PRINTI	"discover that"
?CND9:	PRINTI	" the stairs were almost utterly destroyed, by what tremendous force, we would never know."
	IN?	SPIRIT-STONE,INVENTORY /TRUE
	CRLF	
	CRLF	
	PRINTI	"""Someone, or something, preferred that this region be sealed off, and did quite a fine job of it,"" Praxix commented. ""It would seem likely, then, that the Stone which we seek lies close at hand. But in which direction?"""
	RTRUE	
?CCL8:	EQUAL?	ACTION,BACK-COMMAND \?CCL15
	FSET?	BERGON,BUSY \?CCL18
	PRINTI	"In a short time, we were back at the side of the underground river, and we rushed back to the shore of the pool hoping that Bergon was still alive."
	CALL2	MOVE-TO,FLUME-POOL
	RSTACK	
?CCL18:	ICALL1	END-PART-TWO-A
	RTRUE	
?CCL15:	EQUAL?	ACTION,RIGHT-COMMAND \?CCL20
	FSET?	GATE-JUNCTION,SEEN \?CCL23
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,RIGHT-COMMAND
	PRINTI	"Again, we tried the right-hand path, finding ourselves back in the vestibule that we had explored earlier."
	JUMP	?CND21
?CCL23:	PRINTI	"The right-hand path led to a wide vestibule with paths leading both left and right, but while the right path was wide and ornate, the one to the left was crudely constructed."
?CND21:	CALL2	MOVE-TO,GATE-JUNCTION
	RSTACK	
?CCL20:	EQUAL?	ACTION,LEFT-COMMAND \?CCL25
	ICALL	CHANGE-TRAVEL-COMMAND,HERE,LEFT-COMMAND,MINES-COMMAND
	PRINTI	"The passage twisted and wound its way through the rock until we came to a small, open chamber from which two passages led. One, supported by old wooden beams, appeared to be an abandoned mine of some sort. The other appeared to be a more recent excavation, and the tapping sound was coming from that direction."
	CRLF	
	CRLF	
	PRINTI	"""It would appear we have company,"" Praxix said, motioning to the newer mine."
	CALL2	MOVE-TO,MINE-JUNCTION
	RSTACK	
?CCL25:	EQUAL?	ACTION,MINES-COMMAND \FALSE
	CALL	QSET?,HERE,BLACK-MIX
	ZERO?	STACK /?CND28
	ICALL1	REMOVE-TRAVEL-COMMAND
?CND28:	PRINTI	"Once again, our party followed the twisting passage that led to the entrance of the two mines. As it had before, a tapping sound issued from the newer of them"
	FSET?	ACTIVE-MINE,SOLVED \?CND30
	PRINTI	"; the miner was a tireless worker indeed"
?CND30:	PRINTC	46
	CALL2	MOVE-TO,MINE-JUNCTION
	RSTACK	


	.FUNCT	ANONF-250:ANY:0:0
	ICALL2	GRAPHIC,G-MINE-JUNCTION
	FSET?	OLD-MINE,SEEN /?CND1
	FSET?	MINER-PASSAGE,SEEN /?CND1
	CALL	QSET?,HERE,BLACK-MIX
	ZERO?	STACK \?CND1
	ICALL	ADD-TRAVEL-COMMAND,HERE,BACK-COMMAND
?CND1:	FSET?	OLD-MINE,GRAY-MIX \?CND6
	ICALL	GRAPHIC,FALSE-VALUE,G-MINE-JUNCTION-2,BOTTOM-LEFT
?CND6:	FSET	HERE,SEEN
	FSET?	OLD-MINE,SEEN /?CCL10
	FSET?	MINER-PASSAGE,SEEN \FALSE
?CCL10:	CALL	UPDATE-FSET,HERE,DONT-SCOUT
	RSTACK	


	.FUNCT	ANONF-251:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went off into both mines to check them out. ""The older mine is in bad shape,"" he reported, ""I fear it is nearly ready to collapse."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \?CCL5
	PRINTI	"Having done all the exploring we could in the mines, we returned to the bottom of the stairs."
	ICALL	REMOVE-TRAVEL-COMMAND,MINE-LOWER-STAIR,LEFT-COMMAND
	CALL2	MOVE-TO,MINE-LOWER-STAIR
	RSTACK	
?CCL5:	EQUAL?	ACTION,NEW-MINE-COMMAND \?CCL7
	PRINTI	"We made our way through the passage until we came to a small round chamber. At the far end, a cleft in the rock opened up a narrow passage"
	CALL	QSET?,MINER-PASSAGE,SEEN
	ZERO?	STACK \?CND8
	PRINTI	" through which a loud, tapping noise could be heard."
	CRLF	
	CRLF	
	PRINTI	"Praxix motioned toward the cleft. ""Shall we see who it is?"" he asked"
?CND8:	CALL	MOVE-TO,MINER-PASSAGE,STR?606
	RSTACK	
?CCL7:	EQUAL?	ACTION,OLD-MINE-COMMAND \FALSE
	FSET?	OLD-MINE,SEEN \?CCL14
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,OLD-MINE-COMMAND
	PRINTI	"Again, I expressed my reservations about entering the old mine, but I was assured by "
	CALL	FIRST-IN-PARTY,BERGON,PRAXIX
	ICALL2	WPRINTD,STACK
	PRINTI	" that we would not enter the mine again after having one last look. Reluctantly, I agreed. The wall boards groaned and creaked with our every step, and it appeared that a loud sneeze could bring the whole mine down on top of us."
	JUMP	?CND12
?CCL14:	PRINTI	"I was not very comfortable about the decision to enter this old mine. The ancient wooden beams which were intended to hold up the walls and roof appeared barely able to help even themselves. As we moved, small pieces of rock fell from above, and a disturbing sound, like a sick groan, came from all around us."
?CND12:	CALL2	MOVE-TO,OLD-MINE
	RSTACK	


	.FUNCT	ANONF-252:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	EQUAL?	ACTOR,HURTH \?CCL6
	PRINTI	"Hurth surveyed the walls of the old mine, and reported only that the excavations here were not of recent origin. He also expressed doubts as to our safety."
	RTRUE	
?CCL6:	ICALL2	UPDATE-REMOVE,OLD-MINE-WALLS
	GETP	OLD-MINE-WALLS,P?EXBITS
	ZERO?	STACK \?CCL9
	PRINTI	"Unlike Hurth, Praxix"
	JUMP	?CND7
?CCL9:	PRINTI	"Praxix, carefully examining the excavations,"
?CND7:	PRINTI	" found something quite remarkable in the walls: a vein of blue-green rock coursing through the granite and marble. Excited by his discovery, he chipped away a small piece with his staff. The rock crumbled easily in his fingers, and its taste was indeed bitter. "
	FSET?	REAGENT,SOLVED \?CCL12
	PRINTI	"""This is the same reagent we were given by Garlimon,"" he said. ""I would suggest taking some more, as we may need it later."""
	JUMP	?CND10
?CCL12:	PRINTI	"""This is the reagent Astrix told us about,"" he said. ""Let us take some while we have the chance!"""
?CND10:	FSET?	REAGENT,SOLVED \?CND13
	FSET?	HURTH,IN-PARTY \?CND13
	CRLF	
	CRLF	
	PRINTI	"Hurth, who had been carefully surveying the mine structure, was concerned. ""We already have some of this magical rock, or whatever you call it. The roof seems near to collapse, and I fear to disturb the mine even a little,"" he said urgently. ""Let us leave while it is still possible!"""
?CND13:	FSET	HERE,ADVISE
	CALL	TRAVEL-COMMANDS,HERE,MINE-ROCK-COMMAND,BACK-COMMAND
	RSTACK	


	.FUNCT	ANONF-253:ANY:0:0
	FSET	HERE,SEEN
	CALL	GRAPHIC,G-ACTIVE-MINE,G-OLD-MINE,TOP-LEFT
	RSTACK	


	.FUNCT	ANONF-254:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"""Well, what do you think?"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" asked the assembled group."
	CRLF	
	CRLF	
	IN?	REAGENT,INVENTORY \?CCL6
	PRINTI	"""I am certain this is a magical reagent,"" Praxix replied, ""It may be powerful and an aid in time of crisis. I vote for mining the rock."""
	RTRUE	
?CCL6:	PRINTI	"The consensus was that it would be too dangerous to do so, yet Praxix, understanding the value of things magical, appeared to favor gaining some more."
	RTRUE	
?CCL3:	EQUAL?	ACTION,MINE-ROCK-COMMAND \?CCL8
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET	HERE,DANGEROUS
	PRINTI	"Using our primitive tools, we hammered at the rock until we had taken enough of the magical reagent. And although we were pleased at our discovery, we were also aware that the groaning noises we had heard earlier were now louder and more ominous."
	CRLF	
	CRLF	
	FSET	HERE,SOLVED
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	CALL	QSET?,REAGENT,SOLVED
	ZERO?	STACK \?CND9
	ICALL1	FIXUP-PRAXIX-COMMANDS
?CND9:	IN?	REAGENT,REAGENTS /?CCL13
	MOVE	REAGENT,REAGENTS
	JUMP	?CND11
?CCL13:	GET	ESSENCE-TBL,BLUEOFF
	ADD	STACK,5
	PUT	ESSENCE-TBL,BLUEOFF,STACK
?CND11:	PRINTI	"""Let's get out of here!"" I shouted. ""The mine's about to collapse!"""
	RTRUE	
?CCL8:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	FSET?	HERE,SOLVED \?CCL18
	ICALL	REMOVE-TRAVEL-COMMAND,MINE-JUNCTION,OLD-MINE-COMMAND
	FSET	OLD-MINE,GRAY-MIX
	FSET?	HURTH,IN-PARTY \?CCL21
	ICALL2	KILLED-OFF,HURTH
	ICALL2	HINT,HINT-OLD-MINE
	PRINTI	"The mine trembled violently as we made our way out, and large pieces of roofing were starting to come down upon us. One hit poor Hurth in the head, knocking him unconscious. We tried to go back, but more of the mine collapsed. Incredibly, the rest of us made it to safety, but Hurth was lost to us!"
	JUMP	?CND16
?CCL21:	PRINTI	"The mine trembled violently as we made our escape, as walls and roofing collapsed at our heels. We were all safe, but this had been a narrow escape, and the old mine was now completely inaccessible."
	JUMP	?CND16
?CCL18:	PRINTI	"We returned to the junction of the two mines. The tapping noise was again coming from the newer mine."
	FSET?	ACTIVE-MINE,SOLVED \?CND16
	CRLF	
	CRLF	
	PRINTI	"""Hard at work again,"" said Praxix, nodding toward the newer mine. ""Quite a character!"""
?CND16:	CALL2	MOVE-TO,MINE-JUNCTION
	RSTACK	


	.FUNCT	ANONF-255:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET?	TOMB-ANTE,SEEN /?CCL6
	FSET?	MINE-HOLE,SEEN /?CCL6
	EQUAL?	ACTOR,HURTH \?CCL11
	PRINTI	"""Both paths are fascinating,"" Hurth said, having quickly explored our two alternatives. ""Come, have a look."""
	RTRUE	
?CCL11:	ICALL2	WPRINTD,ACTOR
	PRINTI	" checked out both paths. ""You'll have to see this for yourself,"" he said, bewildered. ""Each path is more bizarre than the other!"""
	RTRUE	
?CCL6:	EQUAL?	ACTOR,HURTH \?CCL13
	ICALL2	WPRINTD,ACTOR
	PRINTI	" was excited by what he discovered upon scouting out the path we had not yet taken. ""Let me show you,"" he said."
	RTRUE	
?CCL13:	ICALL2	WPRINTD,ACTOR
	PRINTI	" took the path we had not yet taken, and reported that we had better take a look for ourselves."
	RTRUE	
?CCL3:	EQUAL?	ACTION,BACK-COMMAND \?CCL15
	PRINTI	"Retracing our steps, we returned to the bottom of the stairs."
	CALL2	MOVE-TO,MINE-LOWER-STAIR
	RSTACK	
?CCL15:	EQUAL?	ACTION,CRUDE-PATH-COMMAND \?CCL17
	FSET?	TOMB-ANTE,SEEN \?CND18
	FSET	HERE,DONT-SCOUT
?CND18:	FSET?	MINE-HOLE,SEEN \?CCL22
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,CRUDE-PATH-COMMAND
	FSET	HERE,TRAPPED
	PRINTI	"For the second and last time, we entered the crudely formed chamber with the crack in the center."
	ZERO?	HOLE-VICTIM /?CND20
	CRLF	
	CRLF	
	PRINTI	"We had left our friend "
	ICALL2	WPRINTD,HOLE-VICTIM
	PRINTI	" for dead not long before, and still there was no response when we called down to him."
	JUMP	?CND20
?CCL22:	PRINTI	"We followed the winding path to a dead-end chamber, in the middle of which a crack in the earth led into darkness."
?CND20:	CALL2	MOVE-TO,MINE-HOLE
	RSTACK	
?CCL17:	EQUAL?	ACTION,ORNATE-PATH-COMMAND \FALSE
	FSET?	MINE-HOLE,SEEN \?CND27
	FSET	HERE,DONT-SCOUT
?CND27:	PRINTI	"Our chosen path led through a richly carved vestibule, at the end of which sat a formidable wooden door. "
	FSET?	BERGON,IN-PARTY \?CCL31
	PRINTI	"""I hope it is open,"" Bergon said wistfully, ""for I fear even an army would be hard put to break through this!"""
	JUMP	?CND29
?CCL31:	PRINTI	"""It had better be open,"" Praxix offered, ""for I have not the magic to open this formidable a door."""
?CND29:	CALL2	MOVE-TO,TOMB-ANTE
	RSTACK	


	.FUNCT	ANONF-256:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	PRINTI	"It was "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" who finally approached the door, and attempted to open it. ""I am sorry, "
	FSET?	BERGON,IN-PARTY \?CCL6
	PRINTI	"Bergon,"" he started, ""but we shall be needing your army after all!"
	JUMP	?CND4
?CCL6:	EQUAL?	ACTOR,PRAXIX \?CCL8
	PRINTI	"but we shall need a miracle to get through this door."
	JUMP	?CND4
?CCL8:	PRINTI	"Praxix,"" he started, ""but it is magic that we need!"""
?CND4:	PRINTC	34
	CRLF	
	CRLF	
	PRINTI	"""Or the key,"" I added, pointing to the keyhole that lay in the door's center."
	IN?	IRON-KEY,INVENTORY \TRUE
	PRINTI	" Fumbling through my pack, I pulled out the key we had found at the bottom of the nearby hole and held it out to "
	ICALL2	WPRINTD,ACTOR
	PRINTI	". ""The key,"" I said, and bowed as gracefully as I could."
	RTRUE	


	.FUNCT	ANONF-257:ANY:0:0
	FSET	HERE,SEEN
	IN?	IRON-KEY,INVENTORY \FALSE
	CALL	FORCE-TRAVEL-COMMAND,HERE,OPEN-DOOR-COMMAND
	RSTACK	


	.FUNCT	ANONF-258:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	FSET?	MINE-HOLE,SEEN /?CCL6
	PRINTI	"""Why don't we see what's down the crude path?"" I suggested, and this was met with a murmur of agreement."
	RTRUE	
?CCL6:	PRINTI	"""There's no use standing here by the door,"" Praxix said. ""I don't believe it will open merely from force of will. Let us look elsewhere for the solution."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,OPEN-DOOR-COMMAND \?CCL8
	IN?	IRON-KEY,INVENTORY \?CCL11
	FCLEAR	HERE,ADVISE
	ICALL	UPDATE-FSET,IRON-KEY,DONT-EXAMINE
	PRINTI	"The iron key was a perfect fit for the lock. We were soon inside a tall, rounded chamber. A beam of light from high above illuminated a metallic vault inset into the floor of the chamber. Inscribed in the stone around the vault were runes which looked to be Dwarvish."
	ICALL	UPDATE-FCLEAR,IRON-KEY,DONT-DROP
	CALL2	MOVE-TO,TOMB
	RSTACK	
?CCL11:	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"Trying to force the door open would be fruitless; another way would have to be found if we were to get inside."
	ICALL2	REMOVE-PARTY-COMMAND,ENTER-COMMAND
	CALL	UPDATE-FSET,HERE,ADVISE
	RSTACK	
?CCL8:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	FSET?	GATE-JUNCTION,TRAPPED \?CCL16
	PRINTI	"We had failed in our attempts to pass through the door, and decided to return to the bottom of the stairs and consider whether there were any other options left open to us in these caverns."
	ICALL	REMOVE-TRAVEL-COMMAND,MINE-LOWER-STAIR,RIGHT-COMMAND
	CALL2	MOVE-TO,MINE-LOWER-STAIR
	RSTACK	
?CCL16:	CALL	MOVE-TO,GATE-JUNCTION,STR?616
	RSTACK	

	.ENDSEG

	.ENDI
