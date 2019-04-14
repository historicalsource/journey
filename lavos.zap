
	.SEGMENT "LAVOS"


	.FUNCT	ANONF-57:ANY:0:0
	EQUAL?	ACTION,BACKGROUND-COMMAND \?CCL3
	PRINTI	"Our story began nearly five years ago, at the time of our first crop failures. These things happen, of course, once in a while, but by the third year, we knew something was badly amiss. And then, in the fourth year of our despair, the water, too, failed us; not all at once, mind you, but by the fifth year, there were only a few folks whose water was not foul-tasting and disease-ridden. Many moved away, into the north country, but in fact neither had our neighbors been spared the spreading pestilence."
	CRLF	
	CRLF	
	PRINTI	"Hope was fading as the summer of that fateful year approached, and, with no respite in sight, it was decided to seek aid beyond our borders, from a powerful Wizard who was said to live atop the distant Sunrise Mountain. And so a party of four departed, headed by the elder blacksmith, Garlimon; and they were never seen again."
	CRLF	
	CRLF	
	PRINTI	"But as winter reached its icy hand toward us, another group was formed with the same slim hope of finding answers to our desperate situation. Bergon, the carpenter, was chosen to lead the party; and Bergon chose Praxix, the local Wizard, and Esher, a learned (but irritable) physician, to join him. And the group chose me, "
	ICALL1	WPRINTTAG
	PRINTI	", apprentice food merchant, to watch the supplies and to keep a diary of our journey, which, by the fortunes of the good earth, I recount for you now."
	RTRUE	
?CCL3:	EQUAL?	ACTION,START-COMMAND \FALSE
	RANDOM	64
	SUB	STACK,1
	ADD	STACK,64 >ASTRIX-MAZE-PATH
	ICALL1	CLEAR-SUBGROUP
	PRINTI	"Our journey started on a day bright and clear, and we made quick progress down the gently winding road that leads south, past the boundaries of our valley."
	CRLF	
	CRLF	
	PRINTI	"The air was warm, but the cool north wind at our backs reminded us that winter was near. It seemed that we had only just started out when we arrived at the outpost town of Lavos, shortly past noon."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-LAVOS
	PRINTI	"So this was Lavos! We stood in front of an old wooden storefront, that of a provisioner. Farther down the road, the Lands End tavern beckoned us with the promise of food and drink."
	CALL2	MOVE-TO,LAVOS
	RSTACK	


	.FUNCT	ANONF-58:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"""I suppose,"" Bergon said with a smile, ""that we've come to our first decision. How are we set for supplies?"""
	CRLF	
	CRLF	
	PRINTI	"""I'm sure we're well enough supplied,"" I said meekly. ""But I wouldn't mind looking around the shop, if you wouldn't mind taking the time."
	CRLF	
	CRLF	
	PRINTI	"""Let's not disappoint "
	ICALL1	WPRINTTAG
	PRINTI	","" Praxix said kindly. ""And who knows - maybe we'll find something important there after all."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL5
	FSET?	LANDS-END,SEEN /?CCL8
	PRINTI	"We walked down the dusty road, stopping at the door of the tavern. As we stood there, an unsavory looking man, approaching from the far end of town, brushed past us and entered."
	JUMP	?CND6
?CCL8:	FSET?	LANDS-END-TAVERN,SEEN /?CCL10
	PRINTI	"Once again, we walked down that dusty road and stood at the door of the tavern. Loud conversation could be heard within, and we were sorely tempted to see what lay inside."
?CND6:	CALL2	MOVE-TO,LANDS-END
	RSTACK	
?CCL10:	PRINTI	"We had seen town, such as it was, and it was now time to move on. "
	ICALL2	GRAPHIC,G-FORK
	ICALL	MOVE-TO,NEWHALL-PASS,LEAVE-LAVOS
	RTRUE	
?CCL5:	EQUAL?	ACTION,ENTER-COMMAND \FALSE
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"We entered the provisioner's shop, and introduced ourselves to the proprietor, a portly man named Webba. ""Look around, look around!"" he said, proudly, though (if the truth be told) there was not much to be proud of. Still, this would be our last chance to provision ourselves before moving south to whatever lay beyond."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-WEBBA
	CALL	MOVE-TO,WEBBAS,STR?391
	RSTACK	


	.FUNCT	ANONF-59:ANY:0:0
	IN?	WEBBA-MAP,INVENTORY \?CND1
	FSET	WEBBA-MAP,DONT-EXAMINE
?CND1:	PUTP	HERE,P?TEMP,0
	RTRUE	


	.FUNCT	WEBBAS-F:ANY:0:0
	EQUAL?	ACTION,SELL-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-DROP
	EQUAL?	ACTION-OBJECT,WEBBA-MAP \?CCL6
	PRINTI	"""No, you just keep the map,"" Webba said, returning the money we had paid for it. ""If you're going on from here, you'll be needing whatever help you can get!"""
	RTRUE	
?CCL6:	PRINTI	"""Oh, dear me, no!"" was Webba's reply when we tried to sell him the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	". ""I'm sure I've got a whole shelf of them out back somewhere."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,REPLY-COMMAND \?CCL8
	ICALL2	WPRINTD,ACTOR
	PRINTI	" started to tell of our quest, and Webba shook his head, resigned to having lost a good customer. ""This map will not help you. I sell this item to 'tourists' - those curious enough to visit, but not enough to go on!"" He laughed heartily, and told of the peculiar man who offered him the map in exchange for a few worthless trinkets. Of course, the map appeared equally worthless, though he thought it amusing, especially the faintly flickering, oddly shaped runes that appeared on it. He ran his finger across the map, as if to show us the originals, but none were even vaguely flickering, and he soon gave up."
	CRLF	
	CRLF	
	FSET	WEBBA-MAP,USED-UP
	PRINTI	"""The old man looked harmless enough,"" the shopkeeper continued, ""so I bought it. But the map seemed awfully plain, if you know what I mean, so I added some runes of my own - thought it looked more official that way! But, if I were trying to find my way somewhere, I would sooner trust my brother's blind mule than this map!"""
	CALL1	END-OPTION
	RSTACK	
?CCL8:	EQUAL?	ACTION,IGNORE-COMMAND \?CCL10
	PRINTI	"Fearing to expose our quest, "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" shrugged off the question. Webba didn't pursue the matter, but he now looked at us with grave concern."
	CALL1	END-OPTION
	RSTACK	
?CCL10:	EQUAL?	ACTION,LOOK-AROUND-COMMAND \?CCL12
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	PRINTI	"""I think I'll just have a look around,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, as he wandered off to explore the shop. ""Perhaps there's something more here than meets the eye."""
	PUTP	HERE,P?TEMP,ACTOR
	ICALL	MAKE-BUSY,ACTOR,GONE-COMMAND
	RTRUE	
?CCL12:	EQUAL?	ACTION,EXIT-COMMAND \FALSE
	ICALL	TRAVEL-COMMANDS,LAVOS,PROCEED-COMMAND
	CALL	MOVE-TO,LAVOS,STR?392
	RSTACK	


	.FUNCT	ANONF-61:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \?CCL3
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	ICALL2	WPRINTD,ACTOR
	PRINTI	", who was by no means an expert on fine foods, browsed through the food selection, though he could not find anything that he particularly liked."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps we should buy some of these things,"" he said, turning in my general direction. I agreed to take a look around, though we were not short of supplies."
	RTRUE	
?CCL3:	EQUAL?	ACTION,BUY-COMMAND \FALSE
	PRINTI	"I selected the most appetizing of the dry foodstuffs and placed them in my pack; at least we wouldn't be worrying about food for a few weeks, which was longer than we hoped to be gone."
	CALL2	UPDATE-MOVE,WEBBA-FOOD
	RSTACK	


	.FUNCT	ANONF-62:ANY:0:0
	FSET	HERE,SEEN
	FSET?	WEBBAS,SEEN \FALSE
	CALL	REMOVE-TRAVEL-COMMAND,HERE,BACK-COMMAND
	RSTACK	


	.FUNCT	ANONF-63:ANY:0:0
	EQUAL?	ACTION,ENTER-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	CALL	MOVE-TO,LANDS-END-TAVERN,STR?394
	RSTACK	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL5
	CALL	MOVE-TO,NEWHALL-PASS,LEAVE-LAVOS
	RSTACK	
?CCL5:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	PRINTI	"""So, this is all there is,"" Esher said, shaking his head scornfully. ""Perhaps we were hasty in passing over the provisioner's shop."""
	CRLF	
	CRLF	
	PRINTI	"""It could not hurt to check it out,"" Bergon replied, and we were soon retracing our steps to the provisioner's door."
	ICALL1	REMOVE-TRAVEL-COMMAND
	CALL2	MOVE-TO,LAVOS
	RSTACK	


	.FUNCT	ANONF-64:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL	UPDATE-FSET,ACTION-OBJECT,DONT-EXAMINE
	GETP	HERE,P?TEMP
	ZERO?	STACK /?CCL6
	FSET	ACTION-OBJECT,EXAMINED
	PRINTI	"Praxix motioned toward a particularly dark corner of the tavern, where Esher was now conversing with someone whose face was obscured in shadow."
	CRLF	
	CRLF	
	PRINTI	"""Perhaps we shall learn something of value from our friend Esher,"" he said."
	RTRUE	
?CCL6:	FSET	HERE,INCAPACITATED
	PRINTI	"Praxix slowly scanned the faces of the customers, but none returned his gaze. Indeed, although everyone here appeared to know who we were, none  would acknowledge our presence."
	CRLF	
	CRLF	
	PRINTI	"The almost palpable tension inside the tavern made me ill at ease, and I believe Praxix felt this as well, though he was not nearly as alarmed as I. ""We have barely left home and already you see danger everywhere you turn,"" he said, reassuringly. ""Have a"
	FSET?	LANDS-END-DRINKS,SEEN \?CND7
	PRINTI	"nother"
?CND7:	PRINTI	" drink! Do not despair!"""
	RTRUE	


	.FUNCT	ANONF-65:ANY:0:0
	EQUAL?	ACTION,BUY-COMMAND \FALSE
	FSET?	LANDS-END-DRINKS,SEEN \?CCL6
	REMOVE	HYE-DRINKS
	PRINTI	"I suggested that another drink might not hurt, but Bergon suggested that I had had quite enough."
	CRLF	
	CRLF	
	PRINTI	"""We wouldn't want you walking over any cliffs, or falling into chasms,"" he said."
	FSET?	HERE,INCAPACITATED \?CND7
	CRLF	
	CRLF	
	PRINTI	"The Wizard looked over his shoulder toward me and shrugged, then emptied his tankard of ale in a single gulp."
?CND7:	CALL2	UPDATE-MOVE,LANDS-END-DRINKS
	RSTACK	
?CCL6:	FSET	LANDS-END-DRINKS,SEEN
	PRINTI	"Stepping up to the bar, we ordered ourselves a few tankards of ale. Though bitter by our standards, it was nevertheless refreshing, and we passed some time there with idle talk about the journey that was to come."
	RTRUE	


	.FUNCT	ANONF-66:ANY:0:0
	PUTP	HERE,P?TEMP,0
	RTRUE	


	.FUNCT	ANONF-67:ANY:0:0
	EQUAL?	ACTION,LOOK-AROUND-COMMAND \?CCL3
	PRINTI	"It took Esher just a few moments to become restless, and he soon slipped away from us to mingle with the crowd."
	CRLF	
	CRLF	
	PRINTI	"""Who knows?"" he said, all but disappearing into the tavern's smoke-filled air, ""I may even learn something useful."""
	FSET?	LANDS-END-PEOPLE,EXAMINED /?CND4
	ICALL	UPDATE-MOVE,LANDS-END-PEOPLE,HERE
?CND4:	PUTP	HERE,P?TEMP,ACTOR
	ICALL	MAKE-BUSY,ACTOR,GONE-COMMAND
	RTRUE	
?CCL3:	EQUAL?	ACTION,EXIT-COMMAND \?CCL7
	GETP	HERE,P?TEMP
	ZERO?	STACK /?CCL10
	CALL	QSET?,MINAR,SEEN
	ZERO?	STACK \?CCL10
	ICALL2	GRAPHIC,G-MINAR
	PRINTI	"On our way out, Esher rejoined us, telling of an intriguing conversation he had just had with one of the locals. Before he could go on, the unsavory man we had seen before stepped outside and pushed his way into our midst. Bergon, flushed with anger, grabbed his sword, but Esher held him back. ""This is the man I was telling you about,"" he said with no particular enthusiasm."
	CRLF	
	CRLF	
	ICALL1	CLEAR-BUSY
	PRINT	MINAR-INTRO
	ICALL	OPTION,LEADER,ACCEPT-COMMAND,DECLINE-COMMAND,GET-ADVICE-COMMAND
	FSET	HERE,ADVISE
	SET	'UPDATE-FLAG,TRUE-VALUE
	RTRUE	
?CCL10:	PRINTI	"It was Bergon's opinion that we had tarried here long enough, so we left the tavern, returning to the road"
	FSET?	LANDS-END-DRINKS,SEEN \?CND13
	PRINTI	" refreshed, and, if I might say, with a good, warm feeling in our bellies"
?CND13:	PRINTC	46
	CALL2	MOVE-TO,LANDS-END
	RSTACK	
?CCL7:	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL16
	ICALL2	WPRINTD,LEADER
	PRINTI	" appeared troubled, but agreed to Minar's request. ""It is against the wishes of our Elders, yet we know little of the world that lies beyond Lavos. We shall take the stranger!"""
	ICALL2	PARTY-ADD,MINAR
	ICALL2	END-OPTION,FALSE-VALUE
	CALL2	MOVE-TO,LANDS-END
	RSTACK	
?CCL16:	EQUAL?	ACTION,DECLINE-COMMAND \?CCL18
	ICALL2	WPRINTD,LEADER
	PRINTI	" thought for a moment, then spoke. ""Wiser men than ourselves have set our number at four. Though our perils be unknown to us, we must not lightly bend the wishes of those who have set us upon our way."" And with that, he dismissed Minar, who slinked back into the tavern."
	FSET	MINAR,SEEN
	ICALL2	END-OPTION,FALSE-VALUE
	CALL2	MOVE-TO,LANDS-END
	RSTACK	
?CCL18:	EQUAL?	ACTION,GET-ADVICE-COMMAND \FALSE
	EQUAL?	PARTY-MODE,OPTION-MODE \FALSE
	FCLEAR	HERE,ADVISE
	PRINTI	"None spoke, yet all frowned, if only a little, at the prospect of bringing this stranger into our group."
	CALL	OPTION,LEADER,ACCEPT-COMMAND,DECLINE-COMMAND
	RSTACK	


	.FUNCT	ANONF-68:ANY:0:0
	FCLEAR	WEBBA-MAP,DONT-EXAMINE
	CALL	ADD-TRAVEL-COMMAND,PRAXIX,TELL-LEGEND-COMMAND
	RSTACK	


	.FUNCT	ANONF-69:ANY:0:0
	FSET	WEBBA-MAP,DONT-EXAMINE
	RTRUE	


	.FUNCT	ANONF-70:ANY:0:0
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	FSET?	HERE,SCOUTED \?CCL6
	PRINTI	"Having considered Minar's report, Bergon asked each of us for our advice. Esher, Minar, and I favored taking the righthand path and avoiding the bandits altogether. Praxix, however, was intensely curious as to the meaning of the bloodstained clothing, feeling that it might relate to the mystery surrounding the disappearance of Garlimon's party. Bergon listened carefully, though he kept his thoughts to himself."
	RTRUE	
?CCL6:	FSET?	MINAR,IN-PARTY \?CCL8
	PRINTI	"Bergon asked for our advice, but only Minar spoke. ""If our goal is the Sunrise Mountain,"" he said, ""we should have better luck keeping to the left."""
	RTRUE	
?CCL8:	PRINTI	"It felt like hours had passed while we stood at the fork, looking this way and that, not knowing which would lead more quickly to our destination. Perhaps it would not matter, yet we feared that time was critial and that our decision here would be crucial to our success."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	EQUAL?	ACTOR,ESHER \?CCL13
	ICALL2	WPRINTD,ACTOR
	PRINTI	" grudgingly agreed to run on ahead and check out both paths; when he arrived back, breathless, he was reticent."
	CRLF	
	CRLF	
	PRINTI	"""Well,"" Bergon prompted, expecting some sort of information to be forthcoming."
	CRLF	
	CRLF	
	PRINTI	"""How should I know?"" Esher replied, ""I've never been here before, and they just look like paths to me. If it's advice you're after, I say let's go left - there's less climbing that way."""
	CALL	UPDATE-FCLEAR,HERE,ADVISE
	RSTACK	
?CCL13:	PRINTI	"Bergon asked Minar to scout out the paths before us, but Minar, sensing an insult, was initially disinclined to do so."
	CRLF	
	CRLF	
	RANDOM	2 >FORK-BANDITS
	PRINTI	"""I have no need to scout these paths,"" he said harshly, ""for I have travelled them many times. If we seek the Sunrise Mountain, our best path is to the left."""
	CRLF	
	CRLF	
	PRINTI	"But then, Minar's voice softened. ""However, these are dangerous times, and we may have been followed."" And with that, he quietly disappeared down the lefthand path. When he returned, he shook his head knowingly."
	CRLF	
	CRLF	
	SET	'FORK-BANDITS,1
	PRINTI	"""It is as I feared. Not long after I left, I discovered this."" He held up a shredded piece of clothing, similar to our own, stained heavily with dried blood. ""There is more - there are fresh tracks in the ground - three or four, I would say. No doubt they are bandits, and they lie in wait for us. Also, sunset is near. We must hope to do better down the other path."""
	FSET	HERE,SCOUTED
	RTRUE	
?CCL10:	EQUAL?	ACTION,LEFT-COMMAND \?CCL15
	EQUAL?	FORK-BANDITS,1 \?CCL18
	FSET?	HERE,SCOUTED \?CCL18
	FSET?	MINAR,IN-PARTY \?CCL18
	PRINTI	"Although Minar had cautioned us against taking this route, Bergon chose to "
	FSET?	HERE,ADVISE /?CND22
	PRINTI	"take Praxix' advice and "
?CND22:	PRINTI	"proceed "
	JUMP	?CND16
?CCL18:	PRINTI	"We chose to remain north of the mountains, following the path which led"
?CND16:	CALL	MOVE-TO,CANYON-COUNTRY,STR?398
	RSTACK	
?CCL15:	EQUAL?	ACTION,RIGHT-COMMAND \FALSE
	EQUAL?	FORK-BANDITS,2 \?CCL28
	PRINTI	"Although Minar had cautioned us against taking this route, Bergon chose to proceed southward, following a steeply winding path that led down through a narrow canyon."
	JUMP	?CND26
?CCL28:	PRINTI	"Choosing the southern route, we descended through a steeply winding canyon."
?CND26:	CALL	MOVE-TO,SYLMAR,STR?399
	RSTACK	


	.FUNCT	ANONF-71:ANY:0:0
	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL3
	ICALL	UPDATE-MOVE,BANDITS,HERE
	CRLF	
	CRLF	
	PRINTI	"Not a minute after locating a campsite, we were suddenly attacked by a small gang of bandits."
	CRLF	
	CRLF	
	SET	'COMBAT-ROUND,-1
	CALL1	SURPRISE-COMBAT
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCENE-END-COMMAND \?CCL5
	ICALL2	UPDATE-REMOVE,BANDITS
	GETP	HERE,P?GRAPHIC
	ICALL2	GRAPHIC,STACK
	ZERO?	BANDITS-SPELL /?CND6
	CRLF	
	CRLF	
	PRINTI	"It was about this time that Praxix was ready to cast his """
	ICALL2	WPRINTD,BANDITS-SPELL
	PRINTI	""" spell. But looking around for the first time since he had started, he came to the belated realization that it was no longer necessary."
	FSET?	ESHER,IN-PARTY \?CND8
	CRLF	
	CRLF	
	PRINTI	"""Would that we had a medal for valor,"" Esher said, patting Praxix on the back and pouring on the sarcasm. ""I feel safer in battle just knowing that you are with us."""
?CND8:	ICALL1	CLEAR-BUSY
?CND6:	FSET?	ESHER,IN-PARTY /?CCL12
	CRLF	
	CRLF	
	PRINTI	"The battle was now over, and we would have to go on without the services of our physician. Praxix performed a brief ceremony, after which we laid our friend to rest in a deep grave in the shade of a sycamore tree, and marked the spot with a rock cairn."
	JUMP	?CND10
?CCL12:	ICALL2	MAKE-UNBUSY,MINAR
?CND10:	CRLF	
	CRLF	
	PRINTI	"It was now late, so we set up camp, taking turns on guard through the night. Later, I dreamed that we stood on a high precipice, far above the clouds; storms surrounded us, and violent gusts of wind nearly swept us off our feet and down into a dark abyss. And then, the wind changed, and a gentle breeze blew, and we were carried off that precipice. But we were not afraid as we glided and soared through the ocean of still, clear air."
	CRLF	
	CRLF	
	PRINTI	"When morning came, misty and still, we packed silently and prepared to move onward. But the dream stayed with me, and in later days I would think of it often, sensing in it a foreshadowing of things to come - but when, or in what manner, I could not know."
	RTRUE	
?CCL5:	EQUAL?	ACTION,COMBAT-RESULT-COMMAND \?CCL14
	ZERO?	COMBAT-ROUND \?CCL17
	EQUAL?	FORK-BANDITS,1,2 \?CCL20
	PRINTI	"Having been warned of our danger, we reacted quickly and surely. I had never been in battle before, but it was clear that Bergon was our strongest fighter, wielding a heavy broadsword. Esher, surprisingly, was also a good fighter, and he easily handled the sword thrusts of his opponent. Praxix and I, however, were new to this sort of thing, and were satisfied with merely staving off injury."
	RTRUE	
?CCL20:	PRINTI	"Caught completely unawares, w"
	ICALL2	HINT,HINT-BANDITS
	ICALL1	BANDITS-KILL-ESHER
	RTRUE	
?CCL17:	FSET?	ESHER,IN-PARTY \?CND21
	PRINTI	"Just then, a previously unseen attacker approached Esher from behind with a large club. Not a moment before he"
	FSET?	HERE,TRIED \?CCL25
	PRINTI	" would have been hit, a sword ripped through the attacker's chest. Placing his foot on the attacker's back, Minar kicked the mortally wounded attacker to the ground and smiled. Clearly, Minar had done this sort of thing before, and what's more, he seemed to enjoy it. But the grotesque look on his victim's face filled me with dread and revulsion."
	JUMP	?CND23
?CCL25:	PRINTI	" was hit, I screamed a warning, but it was too late. W"
	ICALL2	HINT,HINT-BANDITS-FLANK
	ICALL1	BANDITS-KILL-ESHER
?CND23:	CRLF	
	CRLF	
?CND21:	FSET?	ESHER,IN-PARTY /?CCL28
	PRINTI	"Our fortunes were finally improving"
	JUMP	?CND26
?CCL28:	PRINTI	"The battle was "
	ZERO?	FORK-BANDITS \?CND29
	PRINTI	"finally "
?CND29:	PRINTI	"going well"
?CND26:	PRINTI	"; Bergon"
	FSET?	ESHER,IN-PARTY \?CND31
	PRINTI	", Esher,"
?CND31:	FSET?	MINAR,IN-PARTY \?CND33
	PRINTI	" and Minar"
?CND33:	FSET?	MINAR,IN-PARTY /?CTR36
	FSET?	ESHER,IN-PARTY \?CCL37
?CTR36:	PRINTI	" were"
	JUMP	?CND35
?CCL37:	PRINTI	" was"
?CND35:	PRINTI	" making some deadly hits with "
	FSET?	MINAR,IN-PARTY /?CTR41
	FSET?	ESHER,IN-PARTY \?CCL42
?CTR41:	PRINTI	"their weapons"
	JUMP	?CND40
?CCL42:	PRINTI	"his sword"
?CND40:	PRINTI	", and the bandits appeared weaker in their resolve to fight, taking ever more to the defensive."
	RTRUE	
?CCL14:	EQUAL?	ACTION,CAST-COMMAND \?CCL46
	SET	'BANDITS-SPELL,ACTION-OBJECT
	PRINTI	"In the midst of the fighting, Praxix started preparing a spell of some sort. It wasn't easy, though, and it appeared we would not be seeing the spell's effects for some time."
	ICALL2	MAKE-BUSY,PRAXIX
	ICALL1	NEW-DEFAULT
	RTRUE	
?CCL46:	EQUAL?	ACTION,COMBAT-COMMAND \?CCL48
	FSET?	BANDITS-FIGHT,SEEN /?CCL48
	FSET?	MINAR,IN-PARTY /?CCL48
	ZERO?	COMBAT-ROUND \?CCL48
	FSET	BANDITS-FIGHT,SEEN
	PRINTI	"As we prepared to continue the fight, it was clear that something was wrong in the ranks of the bandits; one dropped dead in his tracks before we had commenced."
	CRLF	
	CRLF	
	GETP	BANDITS,P?STATUS
	MUL	STACK,3
	DIV	STACK,4
	PUTP	BANDITS,P?STATUS,STACK
	RFALSE	
?CCL48:	EQUAL?	ACTION,FLANK-COMMAND \?CCL54
	EQUAL?	ACTOR,MINAR \?CCL57
	ICALL	MAKE-BUSY,MINAR,GONE-COMMAND
	FSET	HERE,TRIED
	PRINTI	"We almost didn't notice that Minar had quietly slipped away, snaking his way through the brush to take up a position behind that of the bandits."
	JUMP	?CND55
?CCL57:	ICALL	CHANGE-CIT,MINAR,1,NUL-COMMAND
	ICALL2	WPRINTD,ACTOR
	PRINTI	" thought there would be some advantage to sneaking around the bandits' flank, but he was too large a man and too involved in the battle itself to do this without attracting notice."
?CND55:	ICALL	CHANGE-CIT,BERGON,1,NUL-COMMAND
	CALL1	NEW-DEFAULT
	RSTACK	
?CCL54:	EQUAL?	ACTION,STRENGTH-COMMAND \?CCL59
	FSET?	BANDITS-FIGHT,SEEN \?CCL59
	ICALL2	ADD-PARTY-OFFENSE,40
	ICALL2	ADD-PARTY-DEFENSE,10
	RFALSE	
?CCL59:	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL63
	ICALL2	WPRINTD,LEADER
	PRINTI	", still troubled, agreed. "
	FSET?	MINAR,SEEN \?CND64
	PRINTI	"""It seems we cannot be rid of you, so you may as well join us."" "
?CND64:	PRINTI	"Praxix appeared uneasy with Bergon's decision, but, as for me, I was happy to take any help we were offered."
	ICALL	TRAVEL-COMMANDS,ESHER,EXAMINE-COMMAND
	ICALL1	END-OPTION
	ICALL2	END-COMBAT,FALSE-VALUE
	ICALL2	PARTY-ADD,MINAR
	RTRUE	
?CCL63:	EQUAL?	ACTION,RETREAT-COMMAND \?CCL67
	ICALL2	REMOVE-PARTY-COMMAND,RETREAT-COMMAND
	PRINTI	"Any thought of retreating from these bandits would soon be forgotten, as it became clear that we were far stronger than they."
	RTRUE	
?CCL67:	EQUAL?	ACTION,PARLEY-COMMAND \?CCL69
	ICALL2	REMOVE-PARTY-COMMAND,PARLEY-COMMAND
	ICALL	CHANGE-CIT,BERGON,1,NUL-COMMAND
	FSET?	MINAR,IN-PARTY \?CND70
	ICALL	CHANGE-CIT,MINAR,1,NUL-COMMAND
?CND70:	PRINTI	"Hoping to avoid a bloody battle, we attempted to parley with the bandits, but they declined with words hardly fit to print. The attempt, however, cost us precious time in battle and made it virtually impossible for us to make any surprise moves."
	RTRUE	
?CCL69:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL73
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"The group, grateful for Minar's help, was quiet, yet none came out against taking in this inscrutable stranger."
	CALL	OPTION,LEADER,ACCEPT-COMMAND,DECLINE-COMMAND
	RSTACK	
?CCL73:	EQUAL?	ACTION,DECLINE-COMMAND \FALSE
	ICALL2	WPRINTD,LEADER
	PRINTI	" was firm. ""We are thankful for your help, but we must "
	FSET?	MINAR,SEEN \?CND76
	PRINTI	"again "
?CND76:	PRINTI	"refuse your offer. Good luck be with you!"" And, "
	FSET?	MINAR,SEEN \?CCL80
	PRINTI	"as before"
	JUMP	?CND78
?CCL80:	PRINTI	"without further ado"
?CND78:	PRINTI	", Minar left, disappearing into the shadows."
	ICALL2	HINT,HINT-MINAR
	ICALL1	END-OPTION
	ICALL2	END-COMBAT,FALSE-VALUE
	RTRUE	


	.FUNCT	BANDITS-KILL-ESHER:ANY:0:0
	ICALL2	PARTY-REMOVE,ESHER
	PRINTI	"e watched in horror as Esher was felled by a single blow of his attacker's club. The rest of our group, weapons drawn, began to take the initiative and scored some deadly hits of our own."
	RTRUE	


	.FUNCT	ANONF-72:ANY:0:0
	CRLF	
	PRINTI	"The bandits, finding the fight more than they had bargained for, retreated out of sight."
	FSET?	BANDITS-FIGHT,SEEN \?CCL3
	ZERO?	BANDITS-SPELL /?CND4
	ICALL2	UNUSE-ESSENCES,BANDITS-SPELL
	SET	'BANDITS-SPELL,FALSE-VALUE
	PRINTI	" Praxix, seeing that there was no need for his magic, put away his pouch."
?CND4:	ICALL1	CLEAR-BUSY
	PRINTI	" A moment later, "
	FSET?	MINAR,SEEN \?CCL8
	PRINTI	"Minar"
	JUMP	?CND6
?CCL8:	PRINTI	"the man we had seen entering the tavern"
?CND6:	PRINTI	" appeared, bow in hand. ""I thought you might be needing some help,"" he said, grinning."
	CRLF	
	CRLF	
	FSET?	MINAR,SEEN \?CCL11
	PRINTI	"""My previous offer stands, and this time I would advise you to accept it."" He stood there, grinning all the time, waiting for our answer."
	JUMP	?CND9
?CCL11:	PRINT	MINAR-INTRO
?CND9:	ICALL	OPTION,LEADER,ACCEPT-COMMAND,DECLINE-COMMAND,GET-ADVICE-COMMAND
	RTRUE	
?CCL3:	ICALL2	END-COMBAT,FALSE-VALUE
	RTRUE	


	.FUNCT	ANONF-73:ANY:0:0
	EQUAL?	FORK-BANDITS,2,0 \FALSE
	SET	'OPPONENT,BANDITS
	CALL	SCENE,BANDITS-FIGHT,FIGHT-MODE
	RSTACK	


	.FUNCT	ANONF-74:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"The path curved toward the east along the foothills of the mountains, and we were soon forced to choose between climbing higher or veering off and into the southern valley. But there was no choice, really, since our goal was to the east; it would be impossible to avoid the mountains, so we started our ascent."
	CRLF	
	CRLF	
	PRINTI	"The climb was long and arduous, and it was not until late in the second day that we reached a plateau high in the mountains. But it was dark, and little could be seen. And so we camped there under a starry sky."
	CRLF	
	CRLF	
	IN?	ESSENCE-FIRE,ESSENCES /?CND4
	FSET?	NEWHALL-PASS,SCOUTED \?CND4
	IN?	HINT-MINAR,HINTS /?CND4
	ICALL2	HINT,HINT-NO-FIRE
?CND4:	ICALL2	NEXT-DAY,2
	CALL1	GATE-TO-HIGH-PLAIN
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL1	CAIRN-SCOUT
	RTRUE	
?CCL10:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"I suggested returning to Lavos, but the idea was immediately quashed by the group."
	CRLF	
	CRLF	
	PRINTI	"""Our destiny lies ahead, not behind,"" Praxix said. ""Try to remember that."""
	RTRUE	


	.FUNCT	ANONF-75:ANY:0:0
	EQUAL?	FORK-BANDITS,1,0 \FALSE
	SET	'OPPONENT,BANDITS
	CALL	SCENE,BANDITS-FIGHT,FIGHT-MODE
	RSTACK	


	.FUNCT	ANONF-76:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	IN?	ESSENCE-FIRE,ESSENCES /?CND4
	FSET?	NEWHALL-PASS,SCOUTED \?CND4
	IN?	HINT-MINAR,HINTS /?CND4
	ICALL2	HINT,HINT-NO-FIRE
?CND4:	CALL	MOVE-TO,TUJUNGA-PATH,STR?402
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL1	CAIRN-SCOUT
	RTRUE	
?CCL10:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET?	ESHER,IN-PARTY \?CCL15
	PRINTI	"Esher, dismayed by our confrontation with the bandits,"
	JUMP	?CND13
?CCL15:	PRINTI	"Disheartened by the loss of Esher, I"
?CND13:	PRINTI	" suggested backtracking toward Lavos, but the idea was quickly quashed by the others who felt that we would make good progress along the path we had chosen."
	RTRUE	


	.FUNCT	ANONF-77:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	ICALL2	WPRINTD,ACTOR
	PRINTI	" examined the bodies"
	EQUAL?	ACTOR,ESHER \?CCL6
	PRINTI	" carefully. ""They were killed with sharp objects of some kind - swords and knives, I would guess. Whatever weapons they may have carried are gone - in fact, only their cloaks remain. I'd be willing to bet that they were waylaid and robbed."""
	RTRUE	
?CCL6:	ICALL	FIND-ESSENCE,ESSENCE-FIRE,2
	ICALL	FIND-ESSENCE,ESSENCE-WATER,1
	PRINTI	", discovering two small pouches of powders hidden within a seam of one of the cloaks that had been used as a burial shroud. ""Fire essence,"" he beamed, opening the first and holding it up for my inspection. ""Or I'm an apprentice food merchant!"" And then, examining the second pouch, he found a far smaller amount of a different powder. He dipped a finger into the powder, and touched it to his lips. ""And this would be water essence, though barely enough for a single spell. And yet, all such powders are nigh impossible to obtain these days, and much can be done with them."""
	RTRUE	


	.FUNCT	ANONF-78:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	EQUAL?	ACTOR,PRAXIX \?CCL6
	PRINTI	"At Bergon's request, Praxix looked over the cairn. ""The cairn was made by our people and not by the locals from Lavos,"" he said."
	RTRUE	
?CCL6:	PRINTI	"""This cairn looks like one of ours,"" "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" said, looking over the mound of carefully piled rocks. ""Not at all like those we passed on the outskirts of Lavos."""
	RTRUE	


	.FUNCT	ANONF-79:ANY:0:0
	FCLEAR	WEBBA-MAP,DONT-EXAMINE
	RTRUE	


	.FUNCT	ANONF-80:ANY:0:0
	FSET	WEBBA-MAP,DONT-EXAMINE
	RTRUE	


	.FUNCT	ANONF-81:ANY:0:0
	EQUAL?	ACTION,SCOUT-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL2	WPRINTD,ACTOR
	PRINTI	" scouted out the climbing path, and reported that it wound its way out of sight, high in the mountains."
	CRLF	
	CRLF	
	PRINTI	"""The shortest path to the Sunrise Mountain lies ahead, unless, of course, you feel the urge to explore the high country,"" he said."
	RTRUE	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL5
	ICALL1	NEXT-DAY
	CALL	MOVE-TO,CANYON-GATE,STR?405
	RSTACK	
?CCL5:	EQUAL?	ACTION,CLIMB-COMMAND \FALSE
	PRINTI	"Opting for the high road, we started to climb into the southern mountains. The path was narrow, and frequently choked with low brush, making progress slow. By midday however, we had climbed more than half of the distance to the ridge which hung above us. It took the rest of the afternoon, but we finally arrived at the ridge. We were all tired after our day of climbing, and so we camped there for the night."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-HIGH-PLAIN
	ICALL1	NEXT-DAY
	CALL	MOVE-TO,HIGH-PLAIN,STR?406
	RSTACK	


	.FUNCT	CAIRN-SCOUT:ANY:0:0
	EQUAL?	ACTOR,MINAR \?CCL3
	ICALL	UPDATE-MOVE,CANYON-CAIRN,HERE
	MOVE	CANYON-BODIES,HERE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" was sent out to explore the area around us. What he found brought little cheer."
	CRLF	
	CRLF	
	PRINTI	"""A rock cairn,"" he said, leading us to a shaded spot beneath a grove of stately oaks, ""I am certain this was not here last summer, when I camped in this same spot."""
	CRLF	
	CRLF	
	PRINTI	"Minar's words were ominous - whatever was buried here had not lain long in the earth. Fearful over what we might find, we decided to dig up whatever remains lay there. It was not long before we found what we were after - three sets of human remains, their bodies mangled and bloodied, yet covered with their own cloaks."
	CRLF	
	CRLF	
	PRINTI	"""Garlimon's party!"" cried Bergon. ""But there are only three, not four...."""
	CRLF	
	CRLF	
	PRINTI	"""And that is but part of the mystery,"" replied Praxix, ""Who, I wonder, took the time to bury them? Surely not the assassins that tortured and killed them."""
	RTRUE	
?CCL3:	PRINTI	"Esher took a few moments to scout out the immediate area, but nothing of interest caught his eye, excepting the few rabbits he suggested might make a nice dinner."
	RTRUE	


	.FUNCT	ANONF-82:ANY:0:0
	ZERO?	2ND-PASS /FALSE
	FSET?	MINAR,IN-PARTY /FALSE
	FSET?	ESHER,IN-PARTY /FALSE
	FSET?	DWARF-MEETING,TRIED /FALSE
	CALL2	ADD-PARTY-COMMAND,COMB-AREA-COMMAND
	RSTACK	


	.FUNCT	ANONF-83:ANY:0:0
?FCN:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	CALL	MOVE-TO,ANGELES-PATH,STR?407
	RSTACK	
?CCL3:	EQUAL?	ACTION,COMB-AREA-COMMAND \?CCL5
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We split up into two groups in search of the Dwarves' gate; Praxix and I went toward the hills, and "
	EQUAL?	PARTY-MAX,3 \?CCL8
	PRINTI	"Bergon"
	JUMP	?CND6
?CCL8:	PRINTI	"the others"
?CND6:	PRINTI	" followed the canyon floor. Before long, I found that I had wandered out of sight of Praxix."
	CALL	OPTION,TAG,LOOK-AROUND-COMMAND,GET-HELP-COMMAND
	RSTACK	
?CCL5:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	FSET	HERE,SCOUTED
	SET	'KIDNAPPED,ACTOR
	ICALL2	PARTY-REMOVE,ACTOR
	FSET?	ESHER,IN-PARTY /?CND11
	FSET?	MINAR,IN-PARTY /?CND11
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
?CND11:	ICALL2	WPRINTD,LEADER
	PRINTI	" sent "
	ICALL2	WPRINTD,ACTOR
	PRINTI	" off to scout around the area, which he did. After an hour, though, he had not returned and "
	ICALL2	WPRINTD,LEADER
	PRINTI	" was alarmed enough to set us out searching for him. We split up into two groups; Praxix and I went toward the hills, and "
	EQUAL?	PARTY-MAX,3 \?CCL17
	PRINTI	"Bergon"
	JUMP	?CND15
?CCL17:	PRINTI	"the others"
?CND15:	PRINTI	" followed the canyon floor. Before long, I found that I had wandered out of sight of Praxix."
	ICALL2	MAKE-SUBGROUP,TAG
	CALL	OPTION,TAG,LOOK-AROUND-COMMAND,GET-HELP-COMMAND
	RSTACK	
?CCL10:	EQUAL?	ACTION,LOOK-AROUND-COMMAND \?CCL19
	CALL	QSET?,HERE,SEEN
	ZERO?	STACK /?CCL22
	ICALL	OPTION,TAG,GET-HELP-COMMAND,RETURN-COMMAND
	PRINTI	"Having found these peculiar runes, I explored further in hopes of discovering more artifacts. But my search was fruitless, and I had soon wandered back to where I had started my explorations."
	RTRUE	
?CCL22:	ICALL2	GRAPHIC,G-GATE-RUNES
	PRINTI	"Ambling aimlessly along the base of a rock cliff, something scurried by in the tall brush. When I looked, nothing was there, but my eye caught some strange lettering chiselled in the stone."
	CALL	OPTION,TAG,LOOK-AROUND-COMMAND,GET-HELP-COMMAND,RETURN-COMMAND
	RSTACK	
?CCL19:	EQUAL?	ACTION,GET-HELP-COMMAND \?CCL24
	FSET?	HERE,SEEN /?CCL27
	ZERO?	2ND-PASS \?CCL27
	PRINTI	"Unhappy at exploring alone, I called out for Praxix, who soon appeared. ""What is it?"" he asked."
	CRLF	
	CRLF	
	PRINTI	"When I told him of my uneasiness in exploring alone, he acted annoyed. ""Return to our camp, then,"" he said, indicating the direction. ""I shall continue to look for "
	ICALL2	WPRINTD,KIDNAPPED
	PRINTI	"."""
	CRLF	
	CRLF	
	SET	'ACTION,RETURN-COMMAND
	JUMP	?FCN
?CCL27:	ZERO?	2ND-PASS /?CCL32
	PRINTI	"Unhappy at exploring alone"
	JUMP	?CND30
?CCL32:	PRINTI	"Eager to share my discovery with the others"
?CND30:	PRINTI	", I called out, and Praxix, following the sound of my voice, appeared within moments. ""Well, what now?"" he began, but as if by instinct, his eyes slowly wandered to "
	FSET?	HERE,SEEN \?CCL35
	PRINTI	"the runes that I had discovered."
	JUMP	?CND33
?CCL35:	ICALL2	GRAPHIC,G-GATE-RUNES
	PRINTI	"some runes that I hadn't noticed before, chiselled into the stone."
?CND33:	CRLF	
	CRLF	
	PRINTI	"Praxix then called for "
	EQUAL?	PARTY-MAX,3 \?CCL38
	PRINTI	"Bergon"
	JUMP	?CND36
?CCL38:	PRINTI	"the others"
?CND36:	PRINTI	", who hurried to our side."
	CRLF	
	CRLF	
	CALL1	CANYON-GATE-OPENS
	RSTACK	
?CCL24:	EQUAL?	ACTION,ENTER-COMMAND \?CCL40
	PRINTI	"Slowly and cautiously, we passed through the gate and into the darkness. As if on some malicious cue, the gate crashed shut behind us."
	CRLF	
	CRLF	
	FSET?	PRAXIX,LIT \?CCL43
	PRINTI	"We were fortunate indeed that Praxix had magically caused his staff to glow, for the cavern itself was black as pitch."
	JUMP	?CND41
?CCL43:	FSET?	ESHER,IN-PARTY \?CND44
	PRINTI	"""I don't suppose we have a torch anywhere,"" said Esher, knowing fully well that we didn't. "
?CND44:	PRINTI	"It was dark as pitch, the outline of the gate as invisible now as it had been earlier."
?CND41:	CALL2	MOVE-TO,BERN-I-LAV
	RSTACK	
?CCL40:	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	PRINTI	"Filled with apprehension, I returned to our camp. Before long the others had also returned; there was no trace of "
	ZERO?	KIDNAPPED /?CCL50
	ICALL2	WPRINTD,KIDNAPPED
	PRINTC	33
	JUMP	?CND48
?CCL50:	PRINTI	"a gate."
?CND48:	FSET?	HERE,SEEN /?CND51
	CRLF	
	CRLF	
	PRINTI	"""We must face the fact that "
	ICALL2	WPRINTD,KIDNAPPED
	PRINTI	" is gone,"" Praxix said. ""Let us continue on our way."""
	ICALL1	END-OPTION
	ICALL1	CLEAR-SUBGROUP
	ICALL	FORCE-TRAVEL-COMMAND,HERE,PROCEED-COMMAND
	RTRUE	
?CND51:	CRLF	
	CRLF	
	PRINTI	"Later, questioned by Praxix, I told of my explorations. He listened without interest until I came to the part about finding the runes, when he startled me by jumping to his feet. ""Take me!"" he commanded, and I did."
	CRLF	
	CRLF	
	PRINTI	"The old Wizard studied the runes, then called for the others. "
	CALL1	CANYON-GATE-OPENS
	RSTACK	


	.FUNCT	CANYON-GATE-OPENS:ANY:0:0
	ICALL	UPDATE-MOVE,TALE-DWARF-GATES,PRAXIX-TALES
	MOVE	TALE-DWARVES,PRAXIX-TALES
	PRINTI	"""The runes here are very old, and ancient languages are not my specialty. But the runes are Dwarvish, and long ago I learned some of their words. This first rune, 'Bern,' means a 'gate', and this second one, 'Lav,' refers to 'the plains'."""
	CRLF	
	CRLF	
	PRINTI	"""The gate to the plains,"" I said, putting two and two together. ""But from where?"""
	CRLF	
	CRLF	
	PRINTI	"""That is a simple question,"" Praxix replied, ""A more interesting one would be 'How shall we get it to open?'"""
	FSET?	ESHER,IN-PARTY \?CCL3
	CRLF	
	CRLF	
	PRINTI	"""Or better still, 'What do we do now?'"" snarled Esher as, to everyone's surprise, a round gate appeared, yawning wide before us."
	JUMP	?CND1
?CCL3:	CRLF	
	CRLF	
	PRINTI	"This was not to be a problem, for a round gate then appeared from nowhere and opened."
?CND1:	ZERO?	2ND-PASS \?CND4
	CRLF	
	CRLF	
	PRINTI	"Of the group, only Praxix was genuinely pleased by our discovery, though he was mystified as to just how it had happened. ""Perhaps it was something I said,"" he offered, shrugging."
?CND4:	PUTP	CANYON-GATE,P?GRAPHIC,G-GATE-RUNES
	ICALL	GRAPHIC,FALSE-VALUE,G-GATE-OPENS,BOTTOM-RIGHT
	ICALL1	END-OPTION
	ICALL1	CLEAR-SUBGROUP
	ICALL	ADD-TRAVEL-COMMAND,HERE,ENTER-COMMAND
	ICALL	UPDATE-FSET,HERE,NEAR-DARK
	RTRUE	


	.FUNCT	CAVERN-GRAPHIC:ANY:0:0
	FSET?	PRAXIX,LIT \?CCL3
	CALL2	GRAPHIC,G-DARK-CAVERN
	RSTACK	
?CCL3:	ZERO?	BLACK-PICTURE-BORDER /?CCL6
	CLEAR	GRAPHICS-WINDOW
	JUMP	?CND4
?CCL6:	ICALL2	GRAPHIC,G-BLACK
?CND4:	SET	'CURRENT-GRAPHIC,-1
	RETURN	CURRENT-GRAPHIC


	.FUNCT	ANONF-84:ANY:0:0
	EQUAL?	ACTION,EXIT-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We groped for the gate itself, or for some device that would open it, but to no avail."
	RTRUE	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL5
	FSET?	PRAXIX,LIT /?CND6
	PRINTI	"I meekly suggested trying to feel our way through what ever passage we were in, and Bergon reluctantly agreed. ""We seem to have no other choice,"" he said."
	CRLF	
	CRLF	
?CND6:	CALL	MOVE-TO,DWARF-MEETING-LOC,STR?408
	RSTACK	
?CCL5:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,LIGHT-SPELL \FALSE
	ICALL1	CAVERN-GRAPHIC
	CALL1	CAST-LIGHT
	RSTACK	


	.FUNCT	ANONF-85:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL3
	PRINTI	"The sun peeked behind some high clouds as we wound our way along the floor of the canyon. Ahead, the path climbed up a tall ridge, and we arrived there as dusk approached and stood in awe of the world that surrounded us."
	CRLF	
	CRLF	
	CALL1	MOVE-TO-FOREST-RIDGE
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL5
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	EQUAL?	ACTOR,MINAR \?CCL8
	ICALL2	WPRINTD,ACTOR
	PRINTI	" went ahead, paying close attention to the trail that climbed into the mountains. ""It is a good trail,"" he said. ""As I recall, we can follow it to a high ridge no more than a day's climb from here."""
	RTRUE	
?CCL8:	ICALL2	WPRINTD,ACTOR
	PRINTI	" went ahead, reporting back that the trail appeared to be passable as far as he could see, though it might well be more than a day's climb to the top of the ridge."""
	RTRUE	
?CCL5:	EQUAL?	ACTION,CLIMB-COMMAND \FALSE
	PRINTI	"The trail was steep, winding its way high into the hills. At times, the trail disappeared completely, and it was necessary to scout ahead to find the proper path. But we pressed on, ever climbing, until we reached a spot about halfway toward the top of the ridge."
	CRLF	
	CRLF	
	ICALL1	NEXT-DAY
	CALL	MOVE-TO,HIGH-PLAIN,STR?409
	RSTACK	

	.ENDSEG

	.ENDI
