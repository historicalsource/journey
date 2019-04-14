
	.SEGMENT "0"


	.FUNCT	COUNT:ANY:1:1,OBJ,CNT
	FIRST?	OBJ >OBJ /?PRG2
?PRG2:	ZERO?	OBJ \?CCL6
	RETURN	CNT
?CCL6:	INC	'CNT
	NEXT?	OBJ >OBJ /?PRG2
	JUMP	?PRG2


	.FUNCT	TELL-TALE:ANY:1:1,TL
	GETP	TL,P?TEXT
	ICALL	STACK
	FSET?	TL,SEEN /FALSE
	CALL2	UPDATE-MOVE,TL
	RSTACK	


	.FUNCT	ANONF-42:ANY:0:0
	PRINTI	"When asked about the Tower of the Sunset, Hurth told of the Dwarves' building of two great towers on opposite sides of the Hedras River. One, the Sunset Tower, was the pride of the Dwarves; the other, the Sunrise Tower was the last home of the Wizards, of whom only Astrix remains."
	RTRUE	


	.FUNCT	REMOVE-ALL:ANY:1:3,OBJ,OBJ2,PCH?,F,N
	FIRST?	OBJ >F /?PRG2
?PRG2:	ZERO?	F /TRUE
	NEXT?	F >N /?BOGUS7
?BOGUS7:	ZERO?	OBJ2 /?CCL10
	MOVE	F,OBJ2
	JUMP	?CND8
?CCL10:	ZERO?	PCH? /?CCL11
	EQUAL?	F,POUCH /?CND8
?CCL11:	REMOVE	F
?CND8:	SET	'F,N
	JUMP	?PRG2


	.FUNCT	MOVE-ALL:ANY:2:2,OBJ1,OBJ2
	CALL	REMOVE-ALL,OBJ1,OBJ2
	RSTACK	


	.FUNCT	ANONF-43:ANY:0:0
	PRINTI	"""You've come here often, then?"" Praxix asked, feebly attempting to make conversation."
	CRLF	
	CRLF	
	PRINTI	"""Often enough,"" Umber replied, ""A profitable spot in so many ways!"" Umber was now making himself obscure again. No matter; Praxix was getting used to it. Umber paused briefly, then continued."
	CRLF	
	CRLF	
	PRINTI	"""From what I gather, this place has been here for quite a while. Some say it was the Elves' home, before they disappeared from the earth - that is, if you believe they existed at all, which I frequently do."""
	RTRUE	


	.FUNCT	ANONF-44:ANY:0:0
	PRINTI	"The question was on all of our minds, but it was finally Praxix that asked Hurth to explain his cryptic comment about his father, Agrith, and what had happened after our fight with the orcs. He replied, but we could not help but feel his pain in the telling of the tale."
	CRLF	
	CRLF	
	PRINTI	"""The Dwarves are more than meet the eye,"" he began, ""Far more. Descended from the oldest of races, we remain close to the earth, and know it well. Through the long ages, much great learning has been passed from father to son, but the greatest perhaps is that of Klar'ama - I suppose you would call it 'Life Passage,' and consider it a form of magic."
	CRLF	
	CRLF	
	PRINTI	"""It is a gift, however, passed down from the Wizards who, with our ancestors, delved in the earth in search of the essences of our world. But this gift of life is bittersweet, for it takes the life of he that gives it. This my father did for me as I lay slain by the escaping orcs. It is a kindness that came unasked for, and that can never be repaid."""
	RTRUE	


	.FUNCT	ANONF-45:ANY:0:0
	PRINTI	"""There is a poem written about Cedrith, one which all Dwarves know by heart. Here is how the story is told:"
	CRLF	
	CRLF	
	FSET	STORY-CEDRITH,EXAMINED
	PRINTI	"Long time ago in caverns old,
The Dwarf-lord Cedrith sought for gold,
In mountains deep, in Dwarvish lands,
Where Targh, the lonely Tower, stands,"
	CRLF	
	CRLF	
	PRINTI	"While digging there, in miner's guise,
A stone appeared before his eyes,
That in the gloom of deepest night,
Could fill the air with dreamy light,"
	CRLF	
	CRLF	
	PRINTI	"So took he then the prize he'd found,
And climbed the mines with ne'er a sound,
And rested there his weary men,
Near Dwarvish gate, at Bern i-Fen."
	CRLF	
	CRLF	
	PRINTI	"But unbeknownst, the demons crept,
And ambushed Cedrith where he slept.
And as they circled round their prey,
Did Cedrith bow his head and pray,"
	CRLF	
	CRLF	
	PRINTI	"A chasm there was opened wide
Below his feet. The Dwarf-lord cried,
""Vendeli Breth,"" and fell he far,
Beneath the earth, in Reth a-Zar."
	CRLF	
	CRLF	
	PRINTI	"Far darker than the blackest crow,
Where even light doth fear to go,
'Tween Hell and earth in deepest hole,
Is buried there his living soul."
	RTRUE	


	.FUNCT	ANONF-46:ANY:0:0
	PRINTI	"I asked Hurth about the Orcs, and he told us this story. ""There are many names for these evil denizens of the earth - goblins, grues, orcs; perhaps you have heard one of them. They have lived in the earth many ages, and it is said they worked hand in hand with our forefathers when these caves were first built."
	CRLF	
	CRLF	
	PRINTI	"""But they were twisted and warped with the passing ages, much as we have been saddened by them. There was no problem at first, for the orcs had moved to the deeper caverns where we have long feared to go. But now they become more brazen, and attack our people unprovoked, seemingly only for amusement. We have sought to destroy them, but our ranks are small. We grow weaker by the day, and the orcs grow stronger."""
	RTRUE	


	.FUNCT	ANONF-47:ANY:0:0
	PRINTI	"I asked Hurth whether he knew of the legendary Elves of the Old Forest, and smiled broadly."
	CRLF	
	CRLF	
	PRINTI	"""I have not thought of the Elves in many years,"" he said. ""We - the Dwarves, I mean - have always considered the Elves a kindred race. But it seems the years have turned them inward, and now they venture little outside their own lands, suspicious of all who come near. Indeed, I have not seen them since I was a child."""
	CRLF	
	CRLF	
	PRINTI	"""I remember, as a boy, Agrith taking me before the throne of the Elvish leader, N'dar. The friendship of the two was, and is, very close, yet Elvish introductions were quite formal, so Agrith taught me the Elvish words of greeting."
	CRLF	
	CRLF	
	PRINTI	"""Hurth-la,"" I sputtered, ""Av-Agrith,"" which means 'Hurth is here, the son of Agrith.'"
	CRLF	
	CRLF	
	PRINTI	"""Well, N'dar laughed aloud, and my face turned a very bright crimson. Then N'dar said, 'Va'len, b'ran!', 'Come, friend!' and led us to a great feast. I shall not forget that day. I wonder what has become of N'dar, and of all Elves. Perhaps Agrith knows, for the Elves still count him among their few non-Elvish friends."""
	RTRUE	


	.FUNCT	ANONF-48:ANY:0:0
	PRINTI	"In a quiet moment, I asked Hurth about this place, the home of the Dwarves."
	CRLF	
	CRLF	
	PRINTI	"""We Dwarves have lived in these halls for all of history,"" he replied. ""But now, the caverns, especially the deeper ones, have been largely overrun by orcs and things more evil yet. We do what we can to keep the orcs at bay, but we now live only in the higher levels, in forgotten caverns that remain unknown to our enemies. And yet, we know that this sanctuary will be discovered in time. There is great beauty to be found in these halls, but I regret that I cannot take you there. Perhaps in happier times it shall be possible."
	RTRUE	


	.FUNCT	ANONF-49:ANY:0:0
	PRINTI	"Hurth was asked by Praxix about the true story of the Dwarf Gates. Hurth replied eagerly, pleased to give us a taste of Dwarvish history."
	CRLF	
	CRLF	
	ICALL	UPDATE-MOVE,TALE-BERN-I-ELAN,PRAXIX-TALES
	PRINTI	"""Our fathers built four gates, each leading to one of the outposts of the world. The Bern i-Lav, where you entered, was our link to the plains of Lavos. The Bern i-Fen, at the opposite end of the Long Road, leads to the forests of the Elves. And the Bern i-Zar leads upwards to the high mountains of Thur."""
	CRLF	
	CRLF	
	PRINTI	"""And what of the fourth gate?"" Bergon asked."
	CRLF	
	CRLF	
	PRINTI	"""Of the fourth gate, the Bern i-Lan,"" Hurth replied gravely, ""it is not spoken. Perhaps it no longer exists; this is what we Dwarves fear most."""
	RTRUE	


	.FUNCT	ANONF-50:ANY:0:0,CNT
	FSET	TALE-MAGIC,EXAMINED
	PRINTI	"I have always been curious about the workings of magic, and I took this opportunity to ask Praxix about it."
	CRLF	
	CRLF	
	PRINTI	"""Well, well,"" he replied, ""that would be a long tale indeed."""
	CRLF	
	CRLF	
	PRINTI	"Then, smiling, he took out his pouch of magical powders and held them before my eyes. Each of the "
	CALL2	COUNT,ESSENCES >CNT
	GET	INT-STR,CNT
	PRINT	STACK
	PRINTI	" was a different color, and each glowed faintly, almost imperceptibly."
	CRLF	
	CRLF	
	PRINTI	"""There are four magical essences,"" he began, ""and I suppose you could say that they represent the four elemental substances of our world: earth, air, fire, and water."
	LESS?	CNT,4 \?CND1
	PRINTI	" Alas, that I have only "
	GET	INT-STR,CNT
	PRINT	STACK
	PRINTC	33
?CND1:	PRINTI	" The Wizards have long understood the nature of the essences and how two essences could be combined to produce effects that are now called 'magic.' Sometimes, in fact, we add just a pinch of a third essence to make a spell even more powerful."
	CRLF	
	CRLF	
	PRINTI	"""The Wizards, with the help of the Dwarves, mined the few places where pure essences could be found; few of these places are now known, and none by me. Much lore and learning has been lost, and I am but a distant relative of the Wizards of old; but the spells I know are useful enough and I hope they will serve us well."""
	CALL2	CHECK-ESSENCES,LEVITATE-SPELL
	ZERO?	STACK /TRUE
	ICALL2	USE-ESSENCES,LEVITATE-SPELL
	CRLF	
	CRLF	
	PRINTI	"""Here,"" he said, placing a mixture of air and earth essences in my hand, ""Place some of this on your cloak."""
	CRLF	
	CRLF	
	PRINTI	"I did so, and soon I began to rise gently into the air. A short moment later, I descended to the solid ground. ""Good lad!"" he said, ""Perhaps, someday, you shall be an apprentice Wizard yourself! But for now, get some water and clean off your hands!"""
	CRLF	
	CRLF	
	PRINTI	"I could not imagine what Praxix meant until I looked down at my fingers and saw they were covered with a burnt, "
	ICALL	TELL-COLOR,ESSENCE-AIR,ESSENCE-EARTH
	PRINTI	" residue; it took a good deal of scrubbing, but I finally did remove the essences. And that was my first lesson in magic!"
	RTRUE	


	.FUNCT	ANONF-51:ANY:0:0
	PRINTI	"Praxix took a moment to speak of the Elves. ""The Elves are among the four races which first populated the lands. Preferring to live among the verdant forests, they were known in the ancient tongue as El-fen, meaning 'from the forest.'  It is said that they have lived so long with the trees that they have grown quite a bit alike. But few have survived the long years, and happy is the day we should meet them."""
	RTRUE	


	.FUNCT	ANONF-52:ANY:0:0
	PRINTI	"Bergon looked to Praxix, and asked the question that was on our minds ever since Hurth had first mentioned it. ""What do you know about the Bern i-Lan?"""
	CRLF	
	CRLF	
	PRINTI	"Praxix replied, ""The legend says that the Bern i-Lan is the gateway through which the Dwarves might someday leave this world for a better one. The Dwarves are immortal; yet deep in their hearts they yearn to leave this world for the world of their fathers, who had known the way and are long since gone."""
	FSET?	HURTH,IN-PARTY \FALSE
	CRLF	
	CRLF	
	PRINTI	"Hurth lowered his head and wept."
	RTRUE	


	.FUNCT	ANONF-53:ANY:0:0
	PRINTI	"Out of curiosity, I asked Praxix about other Wizards like himself."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CND1
	PRINTI	"""Don't tell me there are more like him!"" Esher said, wincing. Praxix did not acknowledge Esher's words, but simply started his story."
	CRLF	
	CRLF	
?CND1:	PRINTI	"""Like me...,"" Praxix said, thoughtfully. ""Yes, I suppose there are more like me. But there are few like the Wizards of old, a race whose bloodline ran pure for three long ages, and whose like shall not be seen again. For they have gone, I do not know where; all, it is said, but Astrix, who lives alone atop the Sunrise Mountain."""
	CRLF	
	CRLF	
	PRINTI	"""Oh, we have learned from the ancient texts, and understand the essence of many things. Enough, anyway, to start a fire or a rainstorm; or shake the earth and cause the winds to blow. But much is forgotten, or lost...."" His voice faded to a hollow whisper and his face became dark and clouded."
	CRLF	
	CRLF	
	PRINTI	"But his visage soon brightened, and his voice took on a cheerier tone. ""We shall learn much "
	ZERO?	2ND-PASS /?CCL5
	PRINTI	"when we return to"
	JUMP	?CND3
?CCL5:	PRINTI	"if we can find"
?CND3:	PRINTI	" Astrix,"" he said, ""and there is great hope in that!"""
	RTRUE	


	.FUNCT	ANONF-54:ANY:0:0
	PRINTI	"In a quiet moment, Praxix told us about the Dwarves."
	CRLF	
	CRLF	
	PRINTI	"""It is told that the Dwarves were one of the four races that first roamed the earth. Preferring cold stone to warm air and clear waters, they lived in caves, perfecting their stone-working skills. Before long, they had built enormous caves and labyrinths under the earth, connecting virtually all of our lands. In that time, our forefathers called them D'ru-ar-Fen, or Diggers-in-the-Earth."""
	CRLF	
	CRLF	
	PRINTI	"Praxix paused for a moment and smiled, as though at some private joke. ""Of course, nobody believes in the Dwarves anymore, except the few"
	FSET?	DWARF-MEETING,SEEN \?CND1
	PRINTI	", like us,"
?CND1:	PRINTI	" who claim to have seen them."""
	RTRUE	


	.FUNCT	ANONF-55:ANY:0:0
	PRINTI	"I asked Praxix about the gate leading to the caverns."
	CRLF	
	CRLF	
	FSET?	TALE-RETH-A-ZAR,EXAMINED /?CND1
	ICALL	UPDATE-MOVE,TALE-RETH-A-ZAR,PRAXIX-TALES
?CND1:	PRINTI	"""It is said that the Dwarves built their Reth a-Zar, their Road Under the Mountains, many long ages ago. Four gates there were, each linking the Dwarves' kingdom with the lands above. If memory serves, they were the Bern i-Lav, gateway to the plains; Bern i-Fen, gateway to the forests; Bern i-Zar, gateway to the mountains; and Bern i-Lan, the Gate to Heaven."""
	RTRUE	


	.FUNCT	ANONF-56:ANY:0:0
	IN?	TALE-DWARVES,PRAXIX-TALES \?CND1
	ICALL2	TELL-TALE,TALE-DWARVES
	CRLF	
	CRLF	
?CND1:	FSET	TALE-RETH-A-ZAR,EXAMINED
	PRINTI	"Asked about the meaning of Reth a-Zar, Praxix shook his head, ridding himself of the last shreds of disbelief. ""Seemingly more far-fetched than the tale of the Dwarves is the tale of Reth a-Zar, the Road Under the Mountains, stretching from the plains of Lavos to the high forest at Zar a-Lan. I believe we are the first of our kind to witness this miracle in many a long age!"""
	RTRUE	

	.ENDSEG

	.ENDI
