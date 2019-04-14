
	.SEGMENT "DWARVES"


	.FUNCT	ANONF-151:ANY:0:0
	EQUAL?	ACTION,BACK-COMMAND \?CCL3
	CALL	MOVE-TO,STAIR-BOTTOM,STR?461
	RSTACK	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL5
	PRINTI	"We continued our march through the long passage. "
	FSET?	HURTH,IN-PARTY \?CCL8
	PRINTI	"""We have come nearly to the eastern extent of the Reth a-Zar, where the Bern i-Fen leads to the Old Forest,"" Hurth said."
	CRLF	
	CRLF	
	JUMP	?CND6
?CCL8:	PRINTI	"""My sense is that we are nearing the Forest Gate,"" Praxix said."
	CRLF	
	CRLF	
?CND6:	CALL	MOVE-TO,DARK-EVIL-CAVERN,STR?462
	RSTACK	
?CCL5:	EQUAL?	ACTION,ENTER-COMMAND \FALSE
	FSET?	HERE,TRAPPED \?CCL13
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"I suggested returning to the prison, but we decided against it. """
	ZERO?	KIDNAPPED /?CCL16
	ICALL2	WPRINTD,KIDNAPPED
	JUMP	?CND14
?CCL16:	PRINTI	"My kinsman"
?CND14:	PRINTI	" is dead,"" Hurth said, gently. ""The orcs do not keep prisoners, except for the sport of torture. In any event, they will expect our return, and lie in wait for us. Let us continue, that his death will not have been in vain."""
	RTRUE	
?CCL13:	CALL2	MOVE-TO,PRISON
	RSTACK	


	.FUNCT	ANONF-152:ANY:0:0
	FSET	DARK-EVIL-CAVERN,SEEN
	CRLF	
	CRLF	
	PRINTI	"Bergon laughed, as did Praxix, but there was another sound also, cold and rumbling, like distant thunder; and it came from before us."
	FSET?	HURTH,IN-PARTY \FALSE
	CRLF	
	CRLF	
	PRINTI	"""I know not what lies before us,"" Hurth said, ""yet I know that many evils, having long inhabited the deepest places of the earth, now boldly tread even on the Dwarves' hallowed halls."""
	RTRUE	


	.FUNCT	ANONF-153:ANY:0:0,TMP
	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL3
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"Bergon sought the group's advice, and the consensus was clearly to turn back. Praxix, however, was uncertain, torn between his desire for further exploration and the danger he felt certain was ahead."
	RTRUE	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND /?CTR4
	EQUAL?	ACTION,BACK-COMMAND \?CCL5
?CTR4:	GETP	HERE,P?TEMP
	ADD	STACK,1 >TMP
	PUTP	HERE,P?TEMP,TMP
	EQUAL?	ACTION,PROCEED-COMMAND \?CCL10
	INC	'DARK-EVIL-LOC
	JUMP	?CND8
?CCL10:	DEC	'DARK-EVIL-LOC
?CND8:	EQUAL?	TMP,1 \?CCL13
	PRINTI	"A cold wind chilled us to the bone as we inched our way "
	EQUAL?	ACTION,BACK-COMMAND \?CND14
	PRINTI	"back "
?CND14:	PRINTI	"through the cavern."
	FSET?	PRAXIX,LIT \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Praxix! Look!"" I cried, pointing at the Wizard's staff. The staff still glowed a pale red, but the light it cast was different; duller, perhaps, or less potent."
	RTRUE	
?CCL13:	EQUAL?	TMP,2 \?CCL19
	EQUAL?	ACTION,BACK-COMMAND \?CCL22
	PRINTI	"Back"
	JUMP	?CND20
?CCL22:	PRINTI	"On"
?CND20:	PRINTI	" we went, as the now frigid air grew colder still with each tentative step."
	FSET?	PRAXIX,LIT \?CND23
	PRINTI	" Praxix' staff was now glowing a dim, dull red, and its light was barely enough to see by."
?CND23:	CRLF	
	CRLF	
	PRINTI	"""Something's here,"" I whispered, as the air grew stale, then acrid. I stumbled backward, tripped, and fell against the ground."
	ICALL2	REMOVE-PARTY-COMMAND,PROCEED-COMMAND
	FSET?	HURTH,IN-PARTY \TRUE
	CRLF	
	CRLF	
	PRINTI	"""This is an evil day,"" said Hurth. ""I hope there is time yet for us to make our escape."""
	RTRUE	
?CCL19:	ICALL2	REMOVE-PARTY-COMMAND,BACK-COMMAND
	PRINTI	"As we moved ever more slowly through the blackness, the evil presence drew closer still. But Praxix stood his ground, saying, ""We must not allow this evil to endanger the other Dwarves. Run now, while I teach this thing a lesson!"" It was sheer bravado, but Praxix was insistent. ""Fly,"" he shouted. ""I shall join you soon!"""
	CRLF	
	CRLF	
	PRINTI	"Bergon agreed that there was nothing we could do but get ourselves into more trouble, so we retreated to the stairs to await Praxix' return."
	CALL2	SCENE,PRAXIX-VS-EVIL
	RSTACK	
?CCL5:	EQUAL?	ACTION,CAST-COMMAND \?CCL28
	EQUAL?	ACTION-OBJECT,LIGHT-SPELL \?CCL28
	EQUAL?	ACTION-PRSI,STAFF \?CCL28
	PRINTI	"Praxix applied some fire and earth essences to the end of his staff, but the light grew dimmer, not brighter. ""Most peculiar,"" he said."
	RTRUE	
?CCL28:	EQUAL?	ACTION,CAST-COMMAND \?CCL33
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL33
	ICALL1	UNUSE-ESSENCES
	PRINTI	"The thought crossed Praxix' mind to cast a tremor spell, isolating this dark presence. But the tremor spell was always unpredictable, and the entire party might be placed in jeopardy."
	RTRUE	
?CCL33:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \FALSE
	ICALL2	CAST-FAR-VISION,FALSE-VALUE
	PRINTI	" But the ball of flame, rather than expelling the darkness before it, was wholly enveloped by it. ""I fear to think what evil can consume the very light,"" Praxix said."
	RTRUE	


	.FUNCT	ANONF-154:ANY:0:0,TMP
	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL3
	FSET	PRAXIX-VS-EVIL,SEEN
	ICALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,EXAMINE-COMMAND
	ICALL2	MAKE-SUBGROUP,PRAXIX
	CALL2	PARTY-PCM,PRAXIX
	CALL	NEW-DEFAULT,STACK,1
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCENE-END-COMMAND \?CCL5
	ZERO?	PART-TWO \?CCL8
	PUSH	TELL-LEGEND-COMMAND
	JUMP	?CND6
?CCL8:	ZERO?	MIX-DONE /?CCL10
	PUSH	USE-MIX-COMMAND
	JUMP	?CND6
?CCL10:	FSET?	REAGENT,SOLVED /?CCL12
	PUSH	NUL-COMMAND
	JUMP	?CND6
?CCL12:	PUSH	MIX-COMMAND
?CND6:	ICALL	TRAVEL-COMMANDS,PRAXIX,CAST-COMMAND,STACK,EXAMINE-COMMAND
	CALL1	CLEAR-SUBGROUP
	RSTACK	
?CCL5:	EQUAL?	ACTION,CAST-COMMAND \FALSE
	GETP	PRAXIX-VS-EVIL,P?TEMP
	ADD	STACK,1 >TMP
	PUTP	PRAXIX-VS-EVIL,P?TEMP,TMP
	EQUAL?	TMP,3 /?CTR16
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CCL17
	EQUAL?	TMP,1 /?CCL17
?CTR16:	PRINTI	"Finally, "
	JUMP	?CND15
?CCL17:	EQUAL?	TMP,1 \?CCL23
	EQUAL?	ACTION-OBJECT,TREMOR-SPELL /?CND15
	PRINTI	"First, "
	JUMP	?CND15
?CCL23:	PRINTI	"Then, "
?CND15:	EQUAL?	ACTION-OBJECT,FIRE-SPELL,LIGHT-SPELL,FAR-VISION-SPELL \?CCL28
	PRINTI	"Praxix pulled out some magic essences and prepared to cast his enchantment. But it was no use! The dark presence negated the spell even as it was cast."
	JUMP	?CND26
?CCL28:	EQUAL?	ACTION-OBJECT,RAIN-SPELL,LIGHTNING-SPELL \?CCL30
	ICALL1	UNDERGROUND-CHECK
	JUMP	?CND26
?CCL30:	EQUAL?	ACTION-OBJECT,WIND-SPELL \?CCL32
	PRINTI	"pulling out some air essence, he cast that spell toward the unseen evil, but this barely slowed its inexorable approach."
	JUMP	?CND26
?CCL32:	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL /?CTR33
	EQUAL?	ACTION-OBJECT,MUD-SPELL \?CCL34
?CTR33:	ICALL1	PRAXIX-NO-CAST
?CND26:	EQUAL?	TMP,3 \TRUE
	CRLF	
	CRLF	
	PRINTI	"The core of the evil itself was upon Praxix, and it took all of his strength to escape it. He fled back to the stairs, where he joined with the rest of the party."
	CRLF	
	CRLF	
	PRINTI	"""I cannot stop this thing,"" he said, breathlessly. ""We must flee these halls!"""
	CRLF	
	CRLF	
	ICALL2	SCENE,FALSE-VALUE
	FSET?	HURTH,IN-PARTY \?CCL64
	PRINTI	"Hurth"
	JUMP	?CND62
?CCL34:	EQUAL?	ACTION-OBJECT,TREMOR-SPELL \?CND26
	PRINTI	"Praxix removed some earth essence and cast it upon the stone before his feet. At once, the earth began to shake, and Praxix slowly backed away. An instant later, the roof of the cavern collapsed before him, knocking him off his feet. "
	EQUAL?	DARK-EVIL-LOC,1 \?CND38
	ICALL	FIND-ESSENCE,ESSENCE-WATER,2
	FSET	ESSENCE-WATER,SCOUTED
	FSET	DARK-EVIL-CAVERN,SOLVED
	PRINTI	"Exhausted, he started to return when he noticed a strange rock-like substance coursing through the cavern walls. ""Well, well,"" he said, pleased at his discovery, ""Water essence!"" The cavern continued to shake, and he carefully removed as much of the magical rock as he could before it became to dangerous to delay any further. "
?CND38:	PRINTI	"Carefully, he retreated to the "
	ZERO?	PART-TWO \?CND40
	PRINTI	"bottom of the "
?CND40:	PRINTI	"stairs, where we were anxiously awaiting his return."
	ZERO?	PART-TWO \?CND42
	CRLF	
	CRLF	
	PRINTI	"""I believe we are safe, at least for the moment. "
	FSET?	MINAR,DONT-DROP \?CND44
	PRINTI	"Minar was right; we are beset by dangers. "
?CND44:	PRINTI	"And now, I must rest."" And with that, Praxix lowered himself to the floor, and fell into a deep sleep."
?CND42:	FSET?	ESHER,IN-PARTY \?CND46
	ZERO?	PART-TWO \?CND46
	CRLF	
	CRLF	
	PRINTI	"""He is a fine Wizard,"" Esher admitted, ""though he knows more than he speaks."""
?CND46:	ZERO?	PART-TWO \?CND50
	CRLF	
	CRLF	
	PRINTI	"It was now late, and we were all hungry and tired. I took out some provisions and we ate a small meal before retiring for the night. We woke early the next morning, well rested for another day in the caverns."
	ICALL1	NEXT-DAY
?CND50:	ICALL2	SCENE,FALSE-VALUE
	FSET	HERE,ENCHANTED
	ZERO?	PART-TWO /?CCL54
	ICALL	TRAVEL-COMMANDS,MINE-STAIR,DOWN-COMMAND
	ICALL2	MOVE-TO,MINE-STAIR
	JUMP	?CND52
?CCL54:	FSET?	PRISON-RUNES,EXAMINED \?CCL57
	FSET?	PRISON,SEEN /?CCL57
	PUSH	ENTER-COMMAND
	JUMP	?CND55
?CCL57:	PUSH	NUL-COMMAND
?CND55:	ICALL	TRAVEL-COMMANDS,OUTSIDE-PRISON,BACK-COMMAND,STACK
	ICALL2	MOVE-TO,STAIR-BOTTOM
?CND52:	FSET	HERE,DANGEROUS
	RTRUE	
?CCL64:	PRINTI	"Bergon"
?CND62:	PRINTI	" shepherded us "
	ZERO?	PART-TWO /?CCL67
	PRINTI	"down the stairs. ""It may be safer below, though I fear we there is no safety in these halls anymore."""
	CRLF	
	CRLF	
	ICALL1	MOVE-TO-2-W
	RTRUE	
?CCL67:	PRINTI	"up the stairs"
	FSET?	HURTH,IN-PARTY \?CCL70
	PRINTI	". ""I did not say so before, but there is Dwarvish door here."" And then, speaking a word of command, an unseen door sealed off the stairs. ""We have long dreaded this day, but we are not unprepared. The lower chambers are now sealed; I fear that we shall never see them again."" He held back tears as he guided us up the stairs to a nearby landing."
	JUMP	?CND68
?CCL70:	ICALL2	HINT,HINT-DARK-PRESENCE
	PRINTI	" and to a nearby landing."
	CRLF	
	CRLF	
	PRINTI	"""We will not be safe at the lower levels,"" he said. ""Our best hope is to leave these caverns through the High Gate. I pray the Dwarves are safe from whatever it is that pursues us!"""
?CND68:	CRLF	
	CRLF	
	PRINTI	"From the landing, it was another four or five hours to the junction of two stairs"
	FSET?	STAIR-JUNCTION,SEEN /?CND71
	FSET?	HURTH,IN-PARTY \?CCL75
	PRINTI	". ""The stair to the left leads to the Tower of the Sunset; the stair to the right leads to the High Gate,"" Hurth said. ""If we intend to reach the Tower, we should start now. It is a much longer climb."""
	JUMP	?CND71
?CCL75:	PRINTI	"; neither was marked."
?CND71:	ICALL	REMOVE-TRAVEL-COMMAND,STAIR-JUNCTION,DOWN-COMMAND
	ICALL2	MOVE-TO,STAIR-JUNCTION
	RTRUE	


	.FUNCT	ANONF-155:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	CLEAR-EXBIT
	FSET	ACTION-OBJECT,EXAMINED
	EQUAL?	ACTOR,PRAXIX \?CCL6
	ICALL2	WPRINTD,ACTOR
	PRINTI	" examined the runes, but found he had no memory of such symbols."
	RTRUE	
?CCL6:	ICALL2	UPDATE-REMOVE,PRISON-RUNES
	ICALL	ADD-TRAVEL-COMMAND,HERE,ENTER-COMMAND
	ICALL2	WPRINTD,ACTOR
	PRINTI	" glanced at the runes and said, ""The runes say 'prison'. And now that I look more closely, I can see a door here as well."" We tried to find the door, but Hurth interrupted. ""It is a Dwarvish door; you will not find it."""
	RTRUE	


	.FUNCT	ANONF-156:ANY:0:0
	FSET	HERE,SEEN
	PRINTI	"Hurth approached the door and spoke a Dwarvish command of opening. The massive door obliged without a sound, and we entered a large vestibule; the door closed behind us, becoming invisible."
	CRLF	
	CRLF	
	PRINTI	"""These Dwarvish doors take some getting used to!"" I said, thinking of the gate through which we entered these caverns."
	CRLF	
	CRLF	
	PRINTI	"""Do not be alarmed,"" said Hurth. ""Watch!"" Hurth called out a command, but no door appeared. He laughed nervously, then called out a few dozen more foreign words the last few of which sounded rather more like expletives than commands."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CND1
	PRINTI	"""Well?"" Esher prompted, but Hurth was deep in thought. "
?CND1:	PRINTI	"Bergon, trying his best to control his temper, paced to the center of the vestibule, and looked down the dark corridors which led off to our left and right."
	RTRUE	


	.FUNCT	ANONF-157:ANY:0:0,TMP,F
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL3
	ICALL2	CAST-FAR-VISION,FALSE-VALUE
	ICALL1	PRISON-SOLVED
	FSET	HERE,BLACK-MIX
	ICALL2	GRAPHIC,G-PRISON-FV
	FSET?	ESHER,IN-PARTY \?CCL8
	CRLF	
	CRLF	
	PRINTI	"""Well, that was useful!"" Esher said, in his most sarcastic voice. I was sure that Praxix would respond with some clever retort"
	JUMP	?CND6
?CCL8:	CRLF	
	CRLF	
	PRINTI	"The ball of flame was soon out of sight, and nothing had been learned. Praxix was about to make another suggestion"
?CND6:	PRINTI	", when his face became contorted with fear. ""Down!"" he shouted, pushing us to the ground."
	CRLF	
	CRLF	
	PRINTI	"""What the...?"" started Bergon, catching sight of the ball of flame that raced toward us. As it continued down the far corridor, we pulled ourselves to our feet. ""It would seem,"" Praxix said blankly, wiping the "
	ICALL	TELL-COLOR,ESSENCE-FIRE,ESSENCE-AIR
	PRINTI	" residue from his fingers, ""that following these corridors will be a tiring proposition!"""
	CRLF	
	CRLF	
	PRINTI	"Then, casting his gaze upward, he saw, in the dim afterglow of the fireball, a narrow ledge not two dozen feet above us. ""I suggest we march that way!"", he said, and raised his crooked forefinger toward the darkening image."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL10
	FSET?	HERE,SOLVED /?CCL10
	ICALL2	WPRINTD,ACTOR
	PRINTI	" walked down the passage, turning a corner. A few minutes later, he returned, reporting only that the passage did quite a lot of twisting and turning. ""As to where it leads,"" he said, ""your guess is as good as mine."""
	CALL	UPDATE-FSET,HERE,DONT-SCOUT
	RSTACK	
?CCL10:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL14
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	GETP	HERE,P?TEMP
	LESS?	STACK,2 \?CCL17
	PRINTI	"We huddled among ourselves and agreed that it would be best to "
	ZERO?	TMP \?CCL20
	PRINTI	"explore"
	JUMP	?CND18
?CCL20:	PRINTI	"continue exploring"
?CND18:	PRINTI	" the caverns."
	RTRUE	
?CCL17:	CALL	QSET?,HERE,EXAMINED
	ZERO?	STACK \FALSE
	PRINTI	"""I don't think we're making much progress."" I said, looking at our familiar surroundings."
	RTRUE	
?CCL14:	EQUAL?	ACTION,DROP-COMMAND \?CCL24
	FSET?	HERE,SOLVED /?CCL24
	ICALL	UPDATE-MOVE,ACTION-OBJECT,HERE
	FSET	HERE,DONT-DROP
	PRINTI	"The caverns looked suspiciously like a maze of some kind to me, so I surreptitiously dropped the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" on the ground to help mark our location."
	RTRUE	
?CCL24:	EQUAL?	ACTION,PICK-UP-COMMAND \?CCL28
	PRINTI	"Reconsidering my decision to leave the "
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	" on the ground, I bent down and picked it up again, putting it back in my pack for safekeeping."
	FCLEAR	HERE,DONT-DROP
	CALL	UPDATE-MOVE,ACTION-OBJECT,INVENTORY
	RSTACK	
?CCL28:	EQUAL?	ACTION,UP-COMMAND \?CCL30
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"We looked up into the darkness, but could discern nothing. 'Up' may have been our only alternative, as Praxix said, but getting there would be another matter."
	CALL2	CHECK-ESSENCES,LEVITATE-SPELL
	ZERO?	STACK \TRUE
	PRINTI	" Praxix pulled his pouch from inside of his cloak, and spoke dejectedly. ""I haven't the essences to prepare an elevation spell. It would seem that we shall be staying here indefinitely."
	ICALL1	FORCE-PRISON-EXIT
	RTRUE	
?CCL30:	EQUAL?	ACTION,CAST-COMMAND \?CCL34
	EQUAL?	ACTION-OBJECT,LEVITATE-SPELL \?CCL34
	FSET?	HERE,SOLVED /?CCL39
	PRINTI	"It may be that Praxix knew something we didn't, because he reached into his cloak and started to put together one of his magical preparations. Next thing I knew, "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" was rising into the air! His ascent, exhilarating as it was, was cut short as he bumped his head into the rock that lay above us. A few moments later, he descended to the ground."
	RTRUE	
?CCL39:	FSET?	HERE,BLACK-MIX /?CCL41
	PRINTI	"Praxix now drew some air and earth essences from his pouch and tried to levitate "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" to whatever lay above. But, sadly, we had no indication of where to attempt this, and "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" merely bumped his head into the prison's upper regions and descended back to the ground. ""This will never work,"" Praxix said, ""I haven't enough of my powders to map out the upper galleries this way."""
	CRLF	
	CRLF	
	PRINTI	"""And a good thing, too,"" "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" said, rubbing the bruise on his head."
	CALL1	FORCE-PRISON-EXIT
	RSTACK	
?CCL41:	PRINTI	"Praxix now drew some magical powder from his cloak, motioned "
	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" a few steps to his left, then cast the preparation onto him. He climbed into the air, coming finally to a landing which he grabbed tightly onto (for fear of going even higher!) Once the elevation spell had worn off, he released his grip on the rock slab and pulled himself to his feet. Lowering the rope which I had thrown up to him, "
	IN?	ROPE,HERE \?CND42
	ICALL	UPDATE-MOVE,ROPE,INVENTORY
?CND42:	ICALL2	WPRINTD,ACTION-PRSI
	PRINTI	" brought the others up to the landing where he stood."
	CRLF	
	CRLF	
	CALL	MOVE-TO,ORC-FORK,STR?464
	RSTACK	
?CCL34:	EQUAL?	ACTION,PROCEED-COMMAND /?CCL45
	EQUAL?	ACTION,BACK-COMMAND /?CCL45
	EQUAL?	ACTION,LEFT-COMMAND /?CCL45
	EQUAL?	ACTION,RIGHT-COMMAND \FALSE
?CCL45:	GETP	HERE,P?TEMP >TMP
	ADD	TMP,1
	PUTP	HERE,P?TEMP,STACK
	ZERO?	TMP \?CCL52
	PRINTI	"It was pointless to remain here, so we started down the long and winding corridor. I felt almost dizzy from the turning by the time we arrived at another vestibule about five minutes later. It looked much the same as the previous one; and the passage continued farther into the darkness."
	ICALL	TRAVEL-COMMANDS,HERE,PROCEED-COMMAND,BACK-COMMAND
	JUMP	?CND50
?CCL52:	EQUAL?	TMP,1 \?CCL54
	PRINTI	"Again, we marched down the corridor, twisting and turning, turning and twisting, and again coming to a vestibule, beyond which the passage continued."
	FSET?	ESHER,IN-PARTY \?CND50
	PRINTI	" ""Brother Hurth, do you think we are making any progress?"" Esher asked. Hurth, embarrassed, did not respond."
	JUMP	?CND50
?CCL54:	PRINTI	"Once again, we marched through the passage, and once again we arrived at a similar vestibule."
?CND50:	FIRST?	HERE >F \TRUE
	CRLF	
	CRLF	
	PRINTI	"Just then, I noticed that the "
	ICALL2	WPRINTD,F
	PRINTI	" I had dropped earlier was sitting on the ground beside my feet! Excitedly, I replaced it in my pack and told the others of my discovery."
	ICALL	UPDATE-MOVE,F,INVENTORY
	CRLF	
	CRLF	
	PRINTI	"Praxix shook his head slowly. ""As I had suspected - we are in a prison after all."
	CALL2	CHECK-ESSENCES,FAR-VISION-SPELL
	ZERO?	STACK /?CCL61
	PRINTI	" Perhaps this will shed more light on our predicament!"""
	CRLF	
	ICALL	PERFORM,CAST-COMMAND,FAR-VISION-SPELL
	RTRUE	
?CCL61:	ICALL1	PRISON-SOLVED
	PRINTI	" And it would appear that the only way to go is up!"""
	RTRUE	


	.FUNCT	FORCE-PRISON-EXIT:ANY:0:0
	CRLF	
	CRLF	
	PRINTI	"An hour or so later, hope of finding a way out fading, Hurth announced a rather belated discovery. ""It is strange that I did not discover the runes earlier,"" he said, ""but I believe I have found the exit mechanism. Stand back!"""
	CRLF	
	CRLF	
	PRINTI	"Indeed he had, and a moment later the invisible prison door winked open and we hurried back outside."
	ICALL2	UPDATE-REMOVE,PRISON-RUNES
	ICALL	REMOVE-TRAVEL-COMMAND,OUTSIDE-PRISON,ENTER-COMMAND
	FSET	OUTSIDE-PRISON,TRAPPED
	CALL2	MOVE-TO,OUTSIDE-PRISON
	RSTACK	


	.FUNCT	PRISON-SOLVED:ANY:0:0
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	FSET	HERE,SOLVED
	CALL	TRAVEL-COMMANDS,HERE,UP-COMMAND
	RSTACK	

	.ENDSEG

	.ENDI
