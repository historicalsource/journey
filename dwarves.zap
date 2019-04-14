
	.SEGMENT "DWARVES"


	.FUNCT	ANONF-86:ANY:0:0
	CRLF	
	CRLF	
	CALL2	SCENE,DWARF-MEETING
	RSTACK	


	.FUNCT	ANONF-87:ANY:0:0
	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	ICALL	UPDATE-MOVE,STORY-TOWERS,HURTH-STORIES
	CALL	MOVE-TO,STAIR-BOTTOM,STR?410
	RSTACK	


	.FUNCT	ANONF-88:ANY:0:0,DF,BK
	EQUAL?	ACTION,BACK-COMMAND \?CND1
	SET	'BK,TRUE-VALUE
	ZERO?	DWM-FACING /?PRT3
	SET	'DWM-FACING,0
	JUMP	?PRE5
?PRT3:	SET	'DWM-FACING,1
?PRE5:	SET	'ACTION,PROCEED-COMMAND
	PRINTI	"We turned around and started slowly back in the opposite direction."
	CRLF	
	CRLF	
?CND1:	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL8
	PRINTI	"As we slowly made our way down the forbidding passageway, Bergon signalled us to stop."
	CRLF	
	CRLF	
	PRINTI	"""Do you hear that?"" he asked, indicating some faint sound from the gloom that lay before us."
	EQUAL?	KIDNAPPED,MINAR \TRUE
	FSET?	ESHER,IN-PARTY \TRUE
	ZERO?	2ND-PASS \TRUE
	CRLF	
	CRLF	
	PRINTI	"""Yes, and it's a trap, no doubt set for us by our friend Minar!"" scowled Esher."
	RTRUE	
?CCL8:	EQUAL?	ACTION,STAND-COMMAND \?CCL15
	DEC	'DWM-LOC1
	INC	'DWM-LOC2
	EQUAL?	DWM-HERE,DWM-LOC1,DWM-LOC2 /?CCL18
	GETP	HERE,P?TEMP
	ZERO?	STACK \?CCL21
	PRINTI	"As we stood our ground, it seemed that sounds could be heard behind us as well as in front of us."
	CALL1	DWM-TRAPPED
	RSTACK	
?CCL21:	SET	'DWM-LOC1,DWM-HERE
	CALL1	DWM-HEAR
	RSTACK	
?CCL18:	CALL1	DWM-HEAR
	RSTACK	
?CCL15:	EQUAL?	ACTION,PROCEED-COMMAND \?CCL23
	ZERO?	BK \?CND24
	CALL	QSET?,HERE,TRAPPED
	ZERO?	STACK \?CCL28
	PRINTI	"Increasingly apprehensive, we made our way slowly down the passage."
	CRLF	
	CRLF	
	JUMP	?CND24
?CCL28:	PRINTI	"Reaching toward our weapons, we moved forward at a snail's pace; the sounds grew louder and seemed to come from all around us!"
	CRLF	
	CRLF	
?CND24:	ZERO?	DWM-FACING /?CCL31
	INC	'DWM-HERE
	INC	'DWM-LOC2
	JUMP	?CND29
?CCL31:	DEC	'DWM-HERE
	DEC	'DWM-LOC1
?CND29:	CALL1	DWM-HEAR
	RSTACK	
?CCL23:	EQUAL?	ACTION,CAST-COMMAND \?CCL33
	EQUAL?	ACTION-OBJECT,FAR-VISION-SPELL \?CCL33
	ZERO?	DWM-FACING \?CCL38
	CALL	DIFF,DWM-LOC2,DWM-HERE >DF
	JUMP	?CND36
?CCL38:	CALL	DIFF,DWM-LOC1,DWM-HERE >DF
?CND36:	ICALL2	CAST-FAR-VISION,FALSE-VALUE
	CRLF	
	CRLF	
	PRINTI	"""There!"" said Bergon, as the fireball cast its eerie light on a group of shadowy figures not "
	EQUAL?	DF,2 \?CCL41
	PRINTI	"fifty"
	JUMP	?CND39
?CCL41:	EQUAL?	DF,1 \?CND39
	PRINTI	"twenty"
?CND39:	PRINTI	" paces away."
	RTRUE	
?CCL33:	EQUAL?	ACTION,COMBAT-COMMAND \?CCL44
	ZERO?	2ND-PASS /?CND45
	PRINTI	"Bergon, surprised by the aggressiveness of the Dwarves, drew his sword, but we stayed his hand. ""Astrix said the Dwarves were our allies,"" Praxix reminded him."
	ICALL2	REMOVE-PARTY-COMMAND,COMBAT-COMMAND
	ICALL2	REMOVE-PARTY-COMMAND,RETREAT-COMMAND
	RTRUE	
?CND45:	PRINTI	"At Bergon's signal, we started to fight, but we were surrounded and hopelessly outnumbered. We were at the Dwarves mercy, but their leader spared our lives. Instead, he ordered us bound and blindfolded, and had us marched us back to the gate at which we entered the cavern. The heavy stone door closed behind us with a crash."
	ICALL2	HINT,HINT-DWARVES
	FSET	DWARF-MEETING,TRIED
	ICALL	TRAVEL-COMMANDS,CANYON-GATE,PROCEED-COMMAND
	CALL2	DWM-END,CANYON-GATE
	RSTACK	
?CCL44:	EQUAL?	ACTION,RETREAT-COMMAND \?CCL48
	ICALL2	REMOVE-PARTY-COMMAND,RETREAT-COMMAND
	PRINTI	"We thought of trying to escape, but were completely surrounded. We would either have to fight these Dwarves or parley with them."
	RTRUE	
?CCL48:	EQUAL?	ACTION,PARLEY-COMMAND \?CCL50
	PRINTI	"Bergon sheathed his sword, and took a few small steps toward the Dwarf leader."
	CALL	OPTION,BERGON,TELL-TRUTH-COMMAND,LIE-COMMAND
	RSTACK	
?CCL50:	EQUAL?	ACTION,TELL-TRUTH-COMMAND \?CCL52
	ZERO?	2ND-PASS /?CCL55
	PRINTI	"""We have journeyed here from the Sunrise Tower of Astrix, the Wizard. He believes we may benefit in our struggle with the "
	PRINT	BAD-GUY
	PRINTI	" by exploring these caverns."
	ZERO?	KIDNAPPED /?CND56
	PRINTI	" We have faced many dangers on our journey, and just now one of our party has disappeared near the gate at Bern i-Lav."
?CND56:	PRINTC	34
	CRLF	
	CRLF	
	JUMP	?CND53
?CCL55:	PRINTI	"""We journey eastward to the Tower of the Sunrise, in search of the Wizard Astrix."""
	CRLF	
	CRLF	
	PRINTI	"""You choose a most unusual route...."""
	CRLF	
	CRLF	
	PRINTI	"""We chose not this path. One of our party disappeared near the gate by which we entered these caverns, and we have followed his trail to this spot."""
	CRLF	
	CRLF	
?CND53:	ZERO?	KIDNAPPED /?CND58
	PRINTI	"There was a murmur in the ranks of the Dwarves, and their leader at last held out a bloodied garment that belonged to "
	ICALL2	WPRINTD,KIDNAPPED
	PRINTI	". ""We found this a short while ago. If your friend has been taken by Orcs, your best hope is that he is dead!"" He paused for a long moment."
	CRLF	
	CRLF	
?CND58:	CALL1	DWM-ESCORT-OPTION
	RSTACK	
?CCL52:	EQUAL?	ACTION,LIE-COMMAND \?CCL61
	PRINTI	"""We travel east to meet our friends at the port of Zan."""
	CRLF	
	CRLF	
	PRINTI	"""If you have friends in Zan, the worse for you!"" the Dwarves' leader spat. ""It is an evil place, a den of thieves and assassins."" His voice had taken on an alarmingly belligerent tone, but he quickly regained his composure and now spoke in a quieter, more thoughtful voice. ""Yet,"" he said, ""you are not of Orcish blood, and it is possible that you are not enemies of the Dwarves."
	CRLF	
	CRLF	
	PRINTI	"""We do not kill in haste, as is now the fashion, but we cannot allow you and your party to walk the halls of Reth a-Zar unescorted."" His eyes slowly passed over each of us, then he spoke as a judge passing sentence."
	CRLF	
	CRLF	
	FSET	DWARF-MEETING,TRAPPED
	CALL2	DWM-ESCORT-OPTION,TRUE-VALUE
	RSTACK	
?CCL61:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL63
	FCLEAR	HERE,ADVISE
	FSET?	DWARF-MEETING,SEEN \?CCL66
	PRINTI	"We conferred briefly to consider Agrith's offer. "
	FSET?	ESHER,IN-PARTY \?CCL69
	EQUAL?	MINAR,KIDNAPPED \?CCL69
	ZERO?	2ND-PASS \?CCL69
	PRINTI	"With the exception of Esher, who remained convinced that this was all a part of some sinister plan concocted by Minar,"
	JUMP	?CND67
?CCL69:	PRINTI	"There was no dissention:"
?CND67:	PRINTI	" the group was united in favoring acceptance."
	JUMP	?CND64
?CCL66:	FSET?	ESHER,IN-PARTY \?CND64
	PRINTI	"Bergon asked the group for advice, but only Esher answered. ""If anyone cared about my advice, we wouldn't be on this 'adventure' in this first place."" He was in fine form, clearly demonstrating why nobody cared about his advice."
?CND64:	CALL	OPTION,BERGON,ACCEPT-COMMAND,DECLINE-COMMAND
	RSTACK	
?CCL63:	EQUAL?	ACTION,DECLINE-COMMAND \?PRD77
	ZERO?	2ND-PASS \?CTR74
?PRD77:	EQUAL?	ACTION,ACCEPT-COMMAND \?CCL75
?CTR74:	EQUAL?	ACTION,DECLINE-COMMAND \?CND80
	PRINTI	"Bergon thought to decline, feeling some distrust toward this unknown people. Yet, Astrix felt certain that we should come here, and Bergon was loath to disappoint him."
	CRLF	
	CRLF	
?CND80:	PRINTI	"Bergon replied, ""You are most gracious, Agrith, and we would be foolish indeed to decline your offer."" Agrith bowed slightly, then motioned to one of his men, who stepped forward. ""This is Hurth, one of my sons. He shall be your guide through Reth a-Zar!"""
	CRLF	
	CRLF	
	PRINTI	"Agrith handed Hurth a flaming torch to help guide our way, and then the two Dwarves embraced in their fashion. With a motion of his arm, Agrith signalled the others to follow, and quietly he led them away into the gloom of the cavern's depths."
	ICALL2	DWM-END,CAVERN-1
	ICALL2	PARTY-ADD,HURTH
	REMOVE	TALE-DWARVES
	RTRUE	
?CCL75:	EQUAL?	ACTION,DECLINE-COMMAND \FALSE
	PRINTI	"Bergon declined Agrith's offer, saying ""Our concerns and yours are not yet joined. We shall make our way alone."""
	CRLF	
	CRLF	
	PRINTI	"And with that, Agrith's men escorted us out of the caverns; we never saw the Dwarves again."
	ICALL	TRAVEL-COMMANDS,CANYON-GATE,PROCEED-COMMAND
	CALL2	DWM-END,CANYON-GATE
	RSTACK	


	.FUNCT	DWM-ESCORT-OPTION:ANY:0:1,FOO
	ZERO?	2ND-PASS /?CCL3
	ZERO?	FOO \?CCL3
	PRINTI	"""I do not know what purpose Astrix has in mind, but I grant you this option,"" Agrith said. ""Continue freely through these halls with our chosen escort, or leave at once! Choose now!"""
	JUMP	?CND1
?CCL3:	PRINTI	"""I, Agrith, speaking for the Dwarves, grant you this option: to continue on your way with our chosen escort, or to leave these halls at once. Choose now!"""
?CND1:	ICALL	OPTION,BERGON,ACCEPT-COMMAND,DECLINE-COMMAND,GET-ADVICE-COMMAND
	RTRUE	


	.FUNCT	DWM-END:ANY:1:1,RM
	ICALL1	END-OPTION
	ICALL2	SCENE,FALSE-VALUE
	CALL2	MOVE-TO,RM
	RSTACK	


	.FUNCT	DIFF:ANY:2:2,N1,N2
	GRTR?	N1,N2 \?CCL3
	SUB	N1,N2
	RSTACK	
?CCL3:	SUB	N2,N1
	RSTACK	


	.FUNCT	DWM-HEAR:ANY:0:0,DL,DIF,DF1,DF2,SURR
	CALL	DIFF,DWM-LOC1,DWM-HERE >DF1
	CALL	DIFF,DWM-LOC2,DWM-HERE >DF2
	GRTR?	DF2,DF1 \?CCL3
	SET	'DL,DWM-LOC1
	SET	'DIF,DF1
	JUMP	?CND1
?CCL3:	SET	'DL,DWM-LOC2
	SET	'DIF,DF2
	SET	'SURR,TRUE-VALUE
?CND1:	ZERO?	DIF \?CND4
	ICALL2	GRAPHIC,G-DWARVES
	FSET	DWARF-MEETING,SEEN
	ICALL	UPDATE-FSET,DWARF-MEETING,DONT-CAST
	PRINTI	"Our assailants had finally arrived; Dwarves they were, and heavily armed. We joined in a tight circle, weapons drawn, and waited for the onslaught. But they did not attack; rather, their leader, somewhat taller and having about him an air of superiority, strode forward."
	CRLF	
	CRLF	
	PRINTI	"""What business have you here in Reth a-Zar?"" he demanded. ""Come, speak quickly, for we have no patience with strangers!"""
	FSET?	TALE-RETH-A-ZAR,EXAMINED /?CND6
	PRINTI	" Under his breath, Praxix repeated the strange words - 'Reth a-Zar'; they held some great meaning for our Wizard-friend, but for us they spoke only of hopelessness and despair."
?CND6:	FSET?	TALE-RETH-A-ZAR,EXAMINED /?CND8
	ICALL	UPDATE-MOVE,TALE-RETH-A-ZAR,PRAXIX-TALES
?CND8:	ICALL2	MODE,FIGHT-MODE
	ICALL1	PRINT-CHARACTER-COMMANDS
	ICALL	CHANGE-CIT,BERGON,1,NUL-COMMAND
	SET	'OPPONENT,DWARVES
	SET	'COMBAT-ROUND,-1
	RTRUE	
?CND4:	GRTR?	DL,DWM-HERE \?PRD14
	ZERO?	DWM-FACING \?CTR11
?PRD14:	LESS?	DL,DWM-HERE \?CCL12
	ZERO?	DWM-FACING \?CCL12
?CTR11:	PRINTI	"Ahead of"
	JUMP	?CND10
?CCL12:	PRINTI	"From somewhere behind"
?CND10:	PRINTI	" us, we could "
	EQUAL?	DIF,2 \?CND19
	PRINTI	"barely "
?CND19:	PRINTI	"make out muffled noises which were coming nearer with each passing moment."
	ZERO?	SURR /TRUE
	GETP	HERE,P?TEMP
	ZERO?	STACK \TRUE
	ICALL1	DWM-TRAPPED
	RTRUE	


	.FUNCT	DWM-TRAPPED:ANY:0:0
	PUTP	HERE,P?TEMP,TRUE-VALUE
	CRLF	
	CRLF	
	PRINTI	"""They come from both sides. We are trapped!"" said Bergon, verbalizing that which we had long since feared. Each of us reached for his weapon, knowing battle to be near at hand."
	RTRUE	


	.FUNCT	ANONF-89:ANY:0:0
	EQUAL?	ACTION,UP-COMMAND \?CCL3
	PRINTI	"We climbed for hours as we made our way up the gently winding stair, then paused for refreshment. It seemed the stairs would go on forever"
	FSET?	HURTH,IN-PARTY \?CCL6
	PRINTI	", but Hurth reassured us, saying, ""We are now at the half-way point to the High Gate and the Tower of the Sunset!"""
	JUMP	?CND4
?CCL6:	PRINTC	46
?CND4:	CRLF	
	CRLF	
	FSET?	HERE,TRAPPED \?CND7
	ICALL	REMOVE-TRAVEL-COMMAND,STAIR-JUNCTION,DOWN-COMMAND
?CND7:	FSET?	HURTH,IN-PARTY \?CCL11
	PRINTI	"Hurth was right: a few hours later, we arrived at a junction of two stairways. ""The stair to the left leads to the Tower of the Sunset; the stair to the right leads to the High Gate,"" Hurth said. ""If we intend to reach the Tower, we should start now. It is a much longer climb."""
	JUMP	?CND9
?CCL11:	PRINTI	"After climbing for a few hours more, we arrived at the junction of two stairways; neither was marked."
?CND9:	CALL2	MOVE-TO,STAIR-JUNCTION
	RSTACK	
?CCL3:	EQUAL?	ACTION,PROCEED-COMMAND \FALSE
	FSET?	HURTH,IN-PARTY \?CCL16
	PRINTI	"With Hurth"
	JUMP	?CND14
?CCL16:	PRINTI	"With "
	ICALL2	WPRINTD,LEADER
?CND14:	ZERO?	STAIR-TO-PRISON? \?CCL19
	SET	'STAIR-TO-PRISON?,TRUE-VALUE
	JUMP	?CND17
?CCL19:	FSET	HERE,TRAPPED
	ICALL1	REMOVE-TRAVEL-COMMAND
?CND17:	FSET?	OUTSIDE-PRISON,SEEN /?CCL22
	PRINTI	" in the lead, we continued into the dark caverns. After an hour's march, we came to a place in which a single word, in runes, was carved into the stone."
	JUMP	?CND20
?CCL22:	PRINTI	" leading the way, we again marched to the spot at which runes were carved into the stone."
?CND20:	CALL2	MOVE-TO,OUTSIDE-PRISON
	RSTACK	

	.SEGMENT "ORC-FIGHT"


	.FUNCT	ANONF-90:ANY:0:0
	EQUAL?	ACTION,LEFT-COMMAND \?CCL3
	ICALL1	REMOVE-TRAVEL-COMMAND
	PRINTI	"As we moved down the left passage, we could hear sounds ahead. Hurth waved for us to stop; then, he continued alone and reported that he was certain that a gang of orcs were just beyond our sight."
	CRLF	
	CRLF	
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	PRINTI	"""The passage narrows ahead,"" he whispered. ""Perhaps one of us could get through without being seen, but not more. Perhaps we should explore the right-hand passage."" We agreed, and silently returned to the fork."
	RTRUE	
?CCL3:	EQUAL?	ACTION,SCOUT-COMMAND \?CCL5
	ICALL	UPDATE-FSET,HERE,DONT-SCOUT
	FSET	HERE,SCOUTED
	ICALL	REMOVE-TRAVEL-COMMAND,HERE,LEFT-COMMAND
	ICALL2	WPRINTD,ACTOR
	PRINTI	" made his way down both corridors, then returned. ""Both passages lead to the same place and the same group of orcs,"" he said, ""but the right path is wider and will protect our movements longer."""
	RTRUE	
?CCL5:	EQUAL?	ACTION,RIGHT-COMMAND \FALSE
	CALL	QSET?,HERE,BLACK-MIX
	ZERO?	STACK \?CCL10
	PRINTI	"We moved silently down the passage, and found the meaning of the glowing cavern wall. Not ten paces away, the cavern opened into a vestibule, in the middle of which stood nine grotesque figures huddling around an open fire. Bound and gagged on the floor nearby, unmoving, was "
	ZERO?	KIDNAPPED /?CCL13
	ICALL2	WPRINTD,KIDNAPPED
	PRINTC	33
	CRLF	
	CRLF	
	JUMP	?CND11
?CCL13:	PRINTI	"a badly beaten Dwarf!"
	CRLF	
	CRLF	
?CND11:	PRINTI	"""Cursed orcs!"" Hurth spat. ""Kirth en-Gilan!"""
	JUMP	?CND8
?CCL10:	PRINTI	"Again, we made our way to the edge of the orcs' cavern. This time, we knew we had no alternative but to fight!"
	ICALL	REMOVE-TRAVEL-COMMAND,ORC-ANTE,BACK-COMMAND
?CND8:	CALL2	MOVE-TO,ORC-ANTE
	RSTACK	


	.FUNCT	ANONF-91:ANY:0:0
	EQUAL?	ACTION,RETURN-COMMAND \FALSE
	ICALL	REMOVE-TRAVEL-COMMAND,OUTSIDE-PRISON,ENTER-COMMAND
	ZERO?	KIDNAPPED /?CCL6
	ICALL2	WPRINTD,KIDNAPPED
	PRINTI	" was safe"
	JUMP	?CND4
?CCL6:	PRINTI	"We had saved the Dwarf"
?CND4:	PRINTI	", but at what cost? I shuddered at our bad fortune and dreaded the trials that were yet to come."
	CRLF	
	CRLF	
	PRINTI	"Bergon approached, and laid his hand on my shoulder. ""We must put this behind us, "
	ICALL1	WPRINTTAG
	PRINTI	". Agrith grieves for Hurth and also for his besieged people; we must not let either down."" And taking me by the arm, we left the field of battle."
	CRLF	
	CRLF	
	PRINTI	"As we passed the fork, Bergon noticed a device of some kind mounted on the wall. ""Let's hope this opens the prison door,"" he said, and pressed it. Moving quickly, we lowered ourselves back down into the prison, where, indeed, the door stood open. And as we left, the door closed silently behind us."
	CALL2	MOVE-TO,OUTSIDE-PRISON
	RSTACK	


	.FUNCT	ANONF-92:ANY:0:0
	EQUAL?	ACTION,CAST-COMMAND \?CCL3
	ICALL	UPDATE-FSET,HERE,DONT-CAST
	ICALL1	UNUSE-ESSENCES
	PRINTI	"Praxix then got the screwy notion of casting some sort of spell, but Bergon held him back."
	CRLF	
	CRLF	
	PRINTI	"""Wait just a moment, Praxix,"" he said. ""We may yet have need for magic here, but we have not yet determined how best to handle these orcs. Any premature magical display would only serve to lessen our chances of surprising them later."""
	RTRUE	
?CCL3:	EQUAL?	ACTION,GET-ADVICE-COMMAND \?CCL5
	ICALL	UPDATE-FCLEAR,HERE,ADVISE
	PRINTI	"There was little discussion; we would have to fight these orcs if we were to save their captive. Hurth felt the most strongly, and I suppose this was only natural."
	CRLF	
	CRLF	
	PRINTI	"""We must fight, but we must be careful; the orcs are fierce fighters and we are outnumbered,"" he said."
	RTRUE	
?CCL5:	EQUAL?	ACTION,FIGHT-COMMAND \?CCL7
	SET	'OPPONENT,ORCS
	ICALL	SCENE,ORC-FIGHT,FIGHT-MODE
	ICALL2	NUL-PARTY-COMMAND,PARLEY-COMMAND
	PRINTI	"Determined to rescue "
	ZERO?	KIDNAPPED /?CCL10
	ICALL2	WPRINTD,KIDNAPPED
	JUMP	?CND8
?CCL10:	PRINTI	"the Dwarf"
?CND8:	PRINTI	", we huddled to formulate a strategy."
	RTRUE	
?CCL7:	EQUAL?	ACTION,BACK-COMMAND \FALSE
	ICALL1	REMOVE-TRAVEL-COMMAND
	FSET?	ORC-FORK,DONT-SCOUT /?CCL15
	PRINTI	"Uncertain of whether to risk attacking the orcs just then, we retreated back to the fork."
	CALL2	MOVE-TO,ORC-FORK
	RSTACK	
?CCL15:	PRINTI	"I suggested trying to save the orcs' captive by other means, but the others resisted. ""I fear we must fight these orcs,"" Bergon said, reluctantly. ""There is no other way."""
	RTRUE	


	.FUNCT	ANONF-93:ANY:0:0
	CRLF	
	PRINTI	"The orcs, overwhelmed, now tried to withdraw, but we killed them all save two who ran from the area, with Hurth in hot pursuit. We freed "
	ZERO?	KIDNAPPED /?CCL3
	ICALL2	WPRINTD,KIDNAPPED
	ICALL	PARTY-CHANGE,HURTH,KIDNAPPED
	JUMP	?CND1
?CCL3:	ICALL2	PARTY-REMOVE,HURTH
	PRINTI	"the Dwarf"
?CND1:	PRINTI	" from his bonds, and he told us how he was caught at unawares by the orcs who, having easily subdued him, brought him here."
	CRLF	
	CRLF	
	PRINTI	"As we stood, tending to our wounds, a low, rumbling scream issued forth from the passage used by the surviving orcs. We rushed down the passage and found Hurth, slumped against the cold stone, bleeding from his chest and head, surrounded by the bodies of the orcs who had waited in ambush."
	CRLF	
	CRLF	
	FSET?	ESHER,IN-PARTY \?CND4
	PRINTI	"Esher rushed to help, but finding Hurth's wounds beyond his talents, he turned away dejectedly. "
?CND4:	PRINTI	"From down the cavern, we heard the sounds of running feet; we had barely reached for our weapons when Agrith and his party arrived."
	CRLF	
	CRLF	
	ICALL2	GRAPHIC,G-HURTH-DIES
	PRINTI	"""The story here speaks for itself,"" he said gravely, and knelt beside the broken body of Hurth, raising that proud head into his arms. And then, as impossible as it sounds, the two Dwarves seemed to speak. For a long moment, Agrith was silent, then he rose from the ground and motioned to his men, who carried the lifeless body away."
	CRLF	
	CRLF	
	FSET?	DWARF-MEETING,TRAPPED \?CCL8
	ICALL2	HINT,HINT-DWARF-LIE
	PRINTI	"""I believe you may be trusted,"" he said, ""but only so far. You are free to walk these halls, but I must return to my people and prepare for the onslaught that is to come."""
	JUMP	?CND6
?CCL8:	ICALL	UPDATE-MOVE,DWARF-STONE,INVENTORY
	PRINTI	"""We have suffered enough in Azhur na-Brem. Tell Astrix this when you see him, and show him this token. He will know what to do."" Agrith took a brown stone amulet from around his neck, and gave it to Praxix. ""I must leave you now. May the earth give you speed."""
?CND6:	PRINTI	" He strode away, and we never saw him again."
	ICALL	REMOVE-TRAVEL-COMMAND,OUTSIDE-PRISON,ENTER-COMMAND
	REMOVE	PRISON-RUNES
	ICALL2	MOVE-TO,ORC-VESTIBULE
	ICALL2	SCENE,FALSE-VALUE
	RTRUE	


	.FUNCT	ANONF-94:ANY:0:0
	EQUAL?	ACTION,EXAMINE-COMMAND \FALSE
	ICALL1	UPDATE-MOVE
	ICALL2	WPRINTD,ACTOR
	PRINTI	" counted nine orcs, each carrying brutal weapons. We were clearly outnumbered, though we had the element of surprise."
	RTRUE	


	.FUNCT	ANONF-95:ANY:0:0,ACT
	EQUAL?	ACTION,SCENE-START-COMMAND \?CCL3
	SET	'COMBAT-ROUND,-1
	CALL2	REMOVE-PARTY-COMMAND,RETREAT-COMMAND
	RSTACK	
?CCL3:	EQUAL?	ACTION,SCENE-END-COMMAND \?CCL5
	ICALL1	CLEAR-BUSY
	FSET?	HURTH,IN-PARTY /FALSE
	FSET	OUTSIDE-PRISON,TRAPPED
	RTRUE	
?CCL5:	EQUAL?	ACTION,COMBAT-RESULT-COMMAND \?CCL10
	ZERO?	COMBAT-ROUND \?CCL13
	FSET?	ORC-FIGHT,SEEN \?CND14
	FSET	HERE,BLUE-MIX
?CND14:	CALL1	WINNING-OF?
	ZERO?	STACK /?CCL18
	PRINTI	"The orcs, badly confused, started to fight in both directions. One fell to the ground, head severed by a fierce blow from Bergon's sword."
	RTRUE	
?CCL18:	ICALL2	ADD-PARTY-COMMAND,RETREAT-COMMAND
	ICALL	CHANGE-CIT,BERGON,1,NUL-COMMAND
	ICALL1	CHECK-ORC-FIGHT-SPELL
	FSET?	ORC-FIGHT,DEAD \?CND19
	CRLF	
	CRLF	
?CND19:	PRINTI	"It was clear from the outset that our chances were not good; the orcs were powerful fighters, and utterly fearless. Bergon was hit almost at once by the side of a battle axe, but continued to fight in spite of his wounds."
	ICALL	MAKE-BUSY,BERGON,ILL-COMMAND
	FSET?	ORC-FIGHT,DEAD /?CCL22
	FSET?	HERE,BLUE-MIX \TRUE
?CCL22:	CRLF	
	CRLF	
	PRINTI	"No doubt, "
	FSET?	ORC-FIGHT,DEAD \?CCL27
	PRINTI	"the mud had slowed down"
	JUMP	?CND25
?CCL27:	PRINTI	"our two-pronged attack confused"
?CND25:	PRINTI	" the orcs somewhat, or the result would have been even worse than appeared likely."
	FSET?	HERE,BLUE-MIX \TRUE
	PRINTI	" But the orcs, whose movements were quicker and more agile than we had expected, recovered swiftly, and several of them now moved toward our flanking comrade."
	RTRUE	
?CCL13:	EQUAL?	COMBAT-ROUND,1 \?CCL31
	CALL1	WINNING-OF?
	ZERO?	STACK /?CCL34
	PRINTI	"Try as they might, the orcs could not recover from our two-pronged attack, especially considering the sloppy impediment that Praxix had thrown in their way. Another two were down, and except for a few scratches, our party was unscathed and greatly emboldened by our success."
	RTRUE	
?CCL34:	FSET?	ORC-FIGHT,SEEN \?CCL36
	FSET?	HERE,BLUE-MIX /?CCL36
	ICALL	MAKE-BUSY,PRAXIX,ILL-COMMAND
	PRINTI	"Our change in tactics turned out only partially successful, for Praxix was now slightly wounded, and it became more difficult to take proper advantage of the confusion we had caused. One orc was down, slashed in the throat by a deadly thrust from Hurth's sword, but the others fought with undiminished zeal."
	RTRUE	
?CCL36:	ICALL	MAKE-BUSY,PRAXIX,ILL-COMMAND
	PRINTI	"Our attempts to parry the orcs' blows were failing, and soon each of us was at least slightly wounded, making the orcs' weapons ever more punishing. In our exasperation, we were barely able to do any damage ourselves; the fight would soon be lost!"
	RTRUE	
?CCL31:	PUTP	ORCS,P?RETREAT,100
	PRINTI	"The victory would soon be ours; the remaining orcs were badly hurt and, slowed down by the muck beneath their feet, their confidence was wavering. Hurth struck down yet another with a mighty blow of his sword as those remaining began to retreat toward the far side of the chamber."
	RTRUE	
?CCL10:	EQUAL?	ACTION,CAST-COMMAND \?CCL40
	ICALL2	MAKE-BUSY,PRAXIX
	GRTR?	COMBAT-ROUND,-1 \?CCL43
	PRINTI	"Praxix, between blows, hoped to prepare a """
	ICALL2	WPRINTD,ACTION-OBJECT
	PRINTI	""" spell, but it didn't appear he would get the chance to complete it."
	RTRUE	
?CCL43:	SET	'ORC-FIGHT-SPELL,ACTION-OBJECT
	FSET?	ORC-FIGHT,SEEN \?CCL46
	PRINTI	"Now that the fight had begun, Praxix hastily grabbed for his pouch and started to prepare some sort of spell. As he fumbled with his powders for an excruciatingly long moment, I felt sure he would never complete it in time to be of any usefulness."
	ICALL2	CHECK-ORC-FIGHT-SPELL,TRUE-VALUE
	RTRUE	
?CCL46:	PRINTI	"With the thought of using magic in our fight with the orcs, Praxix started removing some of his magical powders in the preparation of some sort of spell."
	RTRUE	
?CCL40:	EQUAL?	ACTION,RETREAT-COMMAND /?CTR47
	EQUAL?	ACTION,COMBAT-COMMAND \?CCL48
	EQUAL?	COMBAT-ROUND,1 \?CCL48
	CALL1	WINNING-OF?
	ZERO?	STACK \?CCL48
?CTR47:	ZERO?	KIDNAPPED /?CND54
	ICALL2	HINT,HINT-ORC-FIGHT
?CND54:	ICALL2	END-COMBAT,FALSE-VALUE
	PRINTI	"We tried to continue the fight, but we were losing badly. Bergon, fearing our complete destruction at the hands of the orcs, led us into a retreat."
	CRLF	
	CRLF	
	PRINTI	"As we passed the fork, Hurth noticed a device of some kind mounted on the wall with some runes above it. ""Opens the prison door, but only for a brief time,"" he said, and pressed it. Using the rope to lower ourselves back down into the prison, we hurried through the closing door."
	CRLF	
	CRLF	
	PRINTI	"And as the door of cold stone slammed shut behind us, a terrifying scream could be heard from inside the prison."
	ZERO?	KIDNAPPED /?CCL58
	PRINTI	" I turned to Bergon and mouthed the name """
	ICALL2	WPRINTD,KIDNAPPED
	PRINTI	"""; we stood there in silence, but heard no more."
	JUMP	?CND56
?CCL58:	CRLF	
	CRLF	
	PRINTI	"""The orcs do not keep prisoners,"" Hurth said, ""Let us hurry."""
?CND56:	FSET	OUTSIDE-PRISON,TRAPPED
	CALL2	MOVE-TO,OUTSIDE-PRISON
	RSTACK	
?CCL48:	EQUAL?	ACTION,FLANK-COMMAND \?CCL60
	FSET?	ORC-FIGHT,SEEN /?CCL60
	EQUAL?	ACTOR,BERGON \?CCL65
	SET	'FLANK-ACTOR,BERGON
	ICALL	CHANGE-CIT,HURTH,1,NUL-COMMAND
	JUMP	?CND63
?CCL65:	SET	'FLANK-ACTOR,HURTH
	FSET?	BERGON,BUSY /?CND63
	ICALL	CHANGE-CIT,BERGON,1,NUL-COMMAND
?CND63:	SET	'SMART-DEFAULT-FLAG,TRUE-VALUE
	ICALL	MAKE-BUSY,FLANK-ACTOR,GONE-COMMAND
	FSET	ORC-FIGHT,SEEN
	EQUAL?	COMBAT-ROUND,-1 \?CCL70
	PRINTI	"Our best chance was to surprise the orcs, so "
	ICALL2	WPRINTD,FLANK-ACTOR
	PRINTI	" slipped away to find a spot behind their lines. We waited a seeming eternity, and then, with a heart-stopping scream, "
	ICALL2	WPRINTD,FLANK-ACTOR
	PRINTI	" charged at them; we held back long enough to take the orcs entirely by surprise."
	CALL2	CHECK-ORC-FIGHT-SPELL,TRUE-VALUE
	RSTACK	
?CCL70:	CALL	QSET?,ORC-FIGHT,BUSY
	ZERO?	STACK \FALSE
	PRINTI	"The fight was not going well, and "
	ICALL2	WPRINTD,FLANK-ACTOR
	PRINTI	" decided to try to flank the orcs. But in the meantime, we were now fighting outnumbered, outclassed, and badly hurt!"
	RTRUE	
?CCL60:	EQUAL?	ACTION,COMBAT-COMMAND \FALSE
	FSET?	ORC-FIGHT,BUSY \FALSE
	FSET	ORC-FIGHT,BLUE-MIX
	FCLEAR	ORC-FIGHT,BUSY
	PRINTI	"With a heart-stopping scream, "
	ICALL2	WPRINTD,FLANK-ACTOR
	PRINTI	" charged the orcs from behind, momentarily taking them by surprise."
	RTRUE	


	.FUNCT	WINNING-OF?:ANY:0:0
	FSET?	HERE,BLUE-MIX \FALSE
	FSET?	ORC-FIGHT,DEAD /TRUE
	RFALSE	


	.FUNCT	CHECK-ORC-FIGHT-SPELL:ANY:0:1,CRF
	FSET?	HERE,NEVER-DROP /FALSE
	EQUAL?	ORC-FIGHT-SPELL,MUD-SPELL \?CCL5
	ICALL	CHANGE-CIT,PRAXIX,1,CAST-COMMAND
	FSET	ORC-FIGHT,DEAD
	ZERO?	CRF /?CND6
	CRLF	
	CRLF	
?CND6:	PRINTI	"Just then, Praxix finished preparing his mud spell, and cast it at the feet of our enemy, leaving his hands covered with a "
	ICALL	TELL-COLOR,ESSENCE-WATER,ESSENCE-EARTH
	PRINTI	" residue. As he did, pools of water rose from the rock-hard earth, mixing with the overlying dirt and creating a large pool of soft and sticky mud. Within moments, the orcs were stomping and trudging where just seconds before they had been stomping and charging."
	FSET?	ORC-FIGHT,SEEN \FALSE
	PRINTI	" The net effect was that the orcs were only slowly able to recover from the shock of "
	ICALL2	WPRINTD,FLANK-ACTOR
	PRINTI	"'s surprise attack."
	RTRUE	
?CCL5:	ZERO?	ORC-FIGHT-SPELL /FALSE
	ICALL	CHANGE-CIT,PRAXIX,1,NUL-COMMAND
	ICALL	UPDATE-FSET,HERE,NEVER-DROP
	ZERO?	CRF /?CND13
	CRLF	
	CRLF	
?CND13:	PRINTI	"Just then, Praxix finished preparing his spell"
	EQUAL?	ORC-FIGHT-SPELL,WIND-SPELL \?CCL17
	PRINTI	" and a fierce wind blew through the caverns. But in these cramped caverns, the wind's effect was decidedly mixed, wreaking havoc not only with the orcs' fighting, but with our own as well. When the wind finally died down, it can honestly be said that we had gained no advantage."
	RTRUE	
?CCL17:	EQUAL?	ORC-FIGHT-SPELL,FAR-VISION-SPELL \?CCL19
	PRINTI	", and the ball of flame raced toward the astonished orcs. But the fireball faded quickly and the element of surprise was too short-lived to give us any lasting advantage in our fight."
	RTRUE	
?CCL19:	EQUAL?	ORC-FIGHT-SPELL,LIGHTNING-SPELL,RAIN-SPELL \?CCL21
	PRINTI	", but realized that this spell was entirely useless underground, having its effect only in the open air."
	RTRUE	
?CCL21:	PRINTI	". And then, he appeared to waver in his resolve. Afterward, he admitted that the spell would have been entirely useless in fighting the orcs anyway."
	RTRUE	

	.ENDSEG

	.ENDI
