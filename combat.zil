"COMBAT for
		      		JOURNEY
	(c) Copyright 1988, 1989 Infocom, Inc.  All Rights Reserved."

<BEGIN-SEGMENT 0>

;"Attack: offensive/defensive strength
  Status: relative strength
  Threshold: when retreat will occur"

<OBJECT DWARVES
	(SDESC "Dwarves")
	(KBD %<ASCII !\D>)
	(ATTACK 200 200)
	(STATUS 100)
	(RETREAT 0)>

<GLOBAL OPPONENT BANDITS>

<CONSTANT COMBAT-COS 0>
<CONSTANT COMBAT-CDS 1>

;<CONSTANT NUL-COMBAT-TBL <TABLE 100>>

<GLOBAL COMBAT-DAMAGE <LTABLE 0 0 0 0 0 0 0 0 0 0 0>>

<GLOBAL COMBAT-ROUND -1>

<ROUTINE STRENGTH (CHR TBL OFF)
	 </ <* <GETB .TBL .OFF> <GETP .CHR ,P?STATUS>> 100>>

<ROUTINE END-COMBAT ("OPTIONAL" (DAMAGE T))
	 <COND (.DAMAGE
		<TELL CR CR>
		<DAMAGE-REPORT>)>
	 <SCENE <>>
	 <MODE ,TRAVEL-MODE>
	 <SETG UPDATE-FLAG T>>

<COMMAND STRENGTH>

<COMMAND CLIMB>
<COMMAND DOWN>
<COMMAND UP>

<ROUTINE SURPRISE-COMBAT ()
	 <V-COMBAT>> 

<COMMAND COMBAT <> ("AUX" (OFF 0) CMD CHR (TOS 0) (TDS 0) OOS ODS TBL)
	 <SETG COMBAT-ROUND <+ ,COMBAT-ROUND 1>>
	 <SET TBL <GETPT ,OPPONENT ,P?ATTACK>>
	 <SET OOS <STRENGTH ,OPPONENT .TBL ,COMBAT-COS>>
	 <SET ODS <STRENGTH ,OPPONENT .TBL ,COMBAT-CDS>>
	 ;"Calculate total offensive/defensive strength"
	 <SET OFF 0>
	 <REPEAT ()
		 <COND (<G? <SET OFF <+ .OFF 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<SET CHR <GET ,PARTY .OFF>>
			<SET TBL <GETPT .CHR ,P?ATTACK>>
			<SET TOS <+ .TOS <STRENGTH .CHR .TBL ,COMBAT-COS>>>
			<SET TDS <+ .TDS <STRENGTH .CHR .TBL ,COMBAT-CDS>>>)>>
	 <PUT ,COMBAT-STRENGTHS ,CS-PARTY-OFFENSE .TOS>
	 <PUT ,COMBAT-STRENGTHS ,CS-PARTY-DEFENSE .TDS>
	 <PUT ,COMBAT-STRENGTHS ,CS-OPPONENT-OFFENSE .OOS>
	 <PUT ,COMBAT-STRENGTHS ,CS-OPPONENT-DEFENSE .ODS>
	 <SCENE-ACTION ,STRENGTH-COMMAND>
	 <DESCRIBE-COMBAT>
	 <RTRUE>>

<COMMAND COMBAT-RESULT>

<ROUTINE SCENE-ACTION (CMD)
	 <SETG ACTION .CMD>
	 <APPLY <GETP ,SCENE-OBJECT ,P?ACTION>>>

<GLOBAL COMBAT-STRENGTHS <TABLE 0 0 0 0>>

<CONSTANT CS-PARTY-OFFENSE 0>
<CONSTANT CS-PARTY-DEFENSE 1>
<CONSTANT CS-OPPONENT-OFFENSE 2>
<CONSTANT CS-OPPONENT-DEFENSE 3>

<ROUTINE ADD-PARTY-DEFENSE (NUM)
	 <PUT ,COMBAT-STRENGTHS
	      ,CS-PARTY-DEFENSE
	      <+ <GET ,COMBAT-STRENGTHS ,CS-PARTY-DEFENSE> .NUM>>>

<ROUTINE ADD-PARTY-OFFENSE (NUM)
	 <PUT ,COMBAT-STRENGTHS
	      ,CS-PARTY-OFFENSE
	      <+ <GET ,COMBAT-STRENGTHS ,CS-PARTY-OFFENSE> .NUM>>>

<CONSTANT COMBAT-RESULT-TBL
	  <TABLE "no" "trivial" "minor" "significant" "major" "grave">>

<ROUTINE COMBAT-RESULT (OS DS)
	 <MIN </ </ <* .OS 10> .DS> 4> 5>>

<ROUTINE MIN (M N)
	 <COND (<G? .N .M> .M) (T .N)>>

<ROUTINE DESCRIBE-COMBAT ("AUX" NOTELL? TOS TDS OOS ODS ORES DRES TMP)
	 <SET TOS <GET ,COMBAT-STRENGTHS ,CS-PARTY-OFFENSE>>
	 <SET TDS <GET ,COMBAT-STRENGTHS ,CS-PARTY-DEFENSE>>
	 <SET OOS <GET ,COMBAT-STRENGTHS ,CS-OPPONENT-OFFENSE>>
	 <SET ODS <GET ,COMBAT-STRENGTHS ,CS-OPPONENT-DEFENSE>>
	 <COND (,DEBUG
		<TELL "Off: " N .TOS "/" N .ODS>
		<TELL "  Def: " N .TDS "/" N .OOS>)>
	 <SETG OFFENSIVE-RESULT <COMBAT-RESULT .TOS .ODS>>
	 <SETG DEFENSIVE-RESULT <COMBAT-RESULT .OOS .TDS>>
	 <SET NOTELL? <SCENE-ACTION ,COMBAT-RESULT-COMMAND>>
	 <COND (<NOT .NOTELL?>
		<COND (<ZERO? ,COMBAT-ROUND>
		       <TELL "Our party initially took an aggressive"
			     " stance against the " D ,OPPONENT
			     ", who themselves were in "
			     <GET ,AGGRESSION-TBL <MIN </ </ <* .OOS 10>
							     .ODS> 4> 8>>
			     " posture.">)
		      (T
		       <TELL "We maintained our stance, as did the "
			     D ,OPPONENT ".">)>
		<TELL " The fighting was fierce, with ">
		<COND (<ZERO? <+ ,OFFENSIVE-RESULT ,DEFENSIVE-RESULT>>
		       <TELL "neither side hurt in the slightest">)
		      (<EQUAL? ,OFFENSIVE-RESULT ,DEFENSIVE-RESULT>
		       <TELL "both sides suffering "
			     <GET ,COMBAT-RESULT-TBL ,OFFENSIVE-RESULT>
			     " injuries in what was, at best, a stand-off">)
		      (<G? ,OFFENSIVE-RESULT ,DEFENSIVE-RESULT>
		       <TELL "the " D ,OPPONENT " ">
		       <COND (<G? ,DEFENSIVE-RESULT 3>
			      <TELL
"getting the worse beating, though we ourselves were bloodied considerably">)
			     (<G? ,OFFENSIVE-RESULT 3>
			      <TELL
"taking a beating at our hands, while we escaped with minor injury">)
			     (T
			      <TELL
"and ourselves each scoring a few hits, though we clearly had
the upper hand">)>)
		      (T
		       <TELL "our party ">
		       <COND (<G? ,OFFENSIVE-RESULT 3>
			      <TELL
"suffering major injury; I suppose it was some consolation that we did a
good deal of damage ourselves">)
			     (<G? ,DEFENSIVE-RESULT 3>
			      <TELL
"taking some major hits, and giving not as many back">)
			     (T
			      <TELL
"faring a bit worse than our opponent, though neither side had clearly
gained the upper hand">)>)>
		<TELL ".">)>
	 <COND (<G? ,DEFENSIVE-RESULT 0>
		<DAMAGE-PARTY ,DEFENSIVE-RESULT .NOTELL?>)>
	 <COND (<G? ,OFFENSIVE-RESULT 0>
		<DAMAGE-OPPONENT ,OFFENSIVE-RESULT .NOTELL?>)>
	 <RTRUE>> 
	 
<CONSTANT D-MAJOR 60>
<CONSTANT D-MODERATE 80>
<CONSTANT D-MINOR 90>

<GLOBAL OFFENSIVE-RESULT 0>
<GLOBAL DEFENSIVE-RESULT 0>

<CONSTANT DAMAGE-TBL
	  <LTABLE <LTABLE D-MINOR>
		  <LTABLE D-MINOR D-MINOR>
		  <LTABLE D-MODERATE D-MINOR D-MINOR>
		  <LTABLE D-MODERATE D-MODERATE D-MINOR D-MINOR>
		  <LTABLE D-MAJOR D-MODERATE D-MODERATE D-MINOR>>>  

<CONSTANT OPPONENT-DAMAGE-TBL
	  <LTABLE 95 90 80 75 70>>

<ROUTINE DAMAGE-OPPONENT (ORES NOTELL? "AUX" NST TT)
	 <PUTP ,OPPONENT
	       ,P?STATUS
	       <SET NST </ <* <GETP ,OPPONENT ,P?STATUS>
			      <GET ,OPPONENT-DAMAGE-TBL .ORES>>
			   100>>>
	 <COND (<L? .NST <GETP ,OPPONENT ,P?RETREAT>>
		<TELL CR>
		<COND (<APPLY <GETP ,OPPONENT ,P?SPECIAL-ACTION>>)
		      (T
		       <TELL CR
"The " D ,OPPONENT ", badly hurt, retreated out of sight. We had
won the battle!">
		       <END-COMBAT>)>)>>

<ROUTINE DAMAGE-PARTY (DRES NOTELL? "AUX" (OFF 0) (DOFF 1) DTBL DMAX)
	 ;"Get your sitting ducks in a row"
	 <DAMAGE-ORDER>
	 ;"Go through table, assigning damage."
	 <SET DTBL <GET ,DAMAGE-TBL .DRES>>
	 <SET DMAX <GET .DTBL 0>>
	 <REPEAT ()
		 <COND (<OR <G? .DOFF .DMAX>
			    <G? .DOFF ,PARTY-MAX>> <RETURN>)
		       (T
			<DAMAGE-CHARACTER <GET ,COMBAT-DAMAGE .OFF>
					  <GET .DTBL .DOFF>>
			<SET OFF <+ .OFF 2>>
			<SET DOFF <+ .DOFF 1>>)>>
	 <SET DOFF 0>
	 <SET OFF 100>
	 <SET DMAX 0>
	 <REPEAT ()
		 <COND (<G? <SET DOFF <+ .DOFF 1>> ,PARTY-MAX>
			<RETURN>)
		       (<L? <SET DTBL <GETP <GET ,PARTY .DOFF> ,P?STATUS>>
			    .OFF>
			<SET DMAX .DOFF>
			<SET OFF .DTBL>)>>
	 <COND (.NOTELL? T)
	       (<L? <SET DOFF <PARTY-STATUS>> 60>
		<TELL CR CR
"Our party was badly wounded, though still able to fight. \"Let's
get out of here,\" I cried, \"before we're killed!\"">)
	       ;(<L? .OFF 50>
		<TELL CR CR D <GET ,PARTY .DMAX>>
		<TELL " was faring the least well of our party,
being ">
		<TELL <DAMAGE-STATUS <GET ,PARTY .DMAX>>>
		<TELL ".">)>>

<ROUTINE DAMAGE-STATUS (CHR)
	 <GET ,DAMAGE-STATUS-TBL </ <GETP .CHR ,P?STATUS> 20>>>

<CONSTANT DAMAGE-STATUS-TBL
	  <TABLE "critically wounded" "severely wounded" "badly wounded"
		 "wounded, but strong" "slightly wounded" "unscathed">>

<ROUTINE DAMAGE-REPORT ("AUX" (OFF 0) CHR)
	 <TELL
"The battle concluded, we took a moment to check on our condition. It
appeared that ">
	 <REPEAT ()
		 <COND (<G? <SET OFF <+ .OFF 1>> ,PARTY-MAX>
			<TELL ".">
			<RETURN>)
		       (T
			<SET CHR <GET ,PARTY .OFF>>
			<COND (<EQUAL? .CHR ,TAG>
			       <TELL "I">)
			      (T
			       <TELL D .CHR>)>
			<TELL " was ">
			<TELL <DAMAGE-STATUS .CHR>>
			<COND (<EQUAL? .OFF <- ,PARTY-MAX 1>>
			       <TELL ", and ">)
			      (<NOT <EQUAL? .OFF ,PARTY-MAX>>
			       <TELL ", ">)>)>>>

<ROUTINE DAMAGE-CHARACTER (CHR TYP "AUX" NST)
	 <PUTP .CHR
	       ,P?STATUS
	       <SET NST </ <* .TYP <GETP .CHR ,P?STATUS>> 100>>>
	 <COND (,DEBUG
		<TELL CR "Damage to " D .CHR ", status:" N .NST>)>>

<ROUTINE PARTY-STATUS ("AUX" (CNT 0) (SUM 0))
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<SET SUM
			     <+ .SUM <GETP <GET ,PARTY .CNT> ,P?STATUS>>>)>>
	 </ .SUM ,PARTY-MAX>>

<ROUTINE DAMAGE-ORDER ("AUX" (POFF 0) (DOFF 0) CHR TBL TMP)
	 ;"Set up table initially"
	 <REPEAT ()
		 <COND (<G? <SET POFF <+ .POFF 1>> ,PARTY-MAX>
			<RETURN>)
		       (T
			<PUT ,COMBAT-DAMAGE
			     .DOFF
			     <SET CHR <GET ,PARTY .POFF>>>
			<SET TBL <GETPT .CHR ,P?ATTACK>>
			<PUT ,COMBAT-DAMAGE
			     <+ .DOFF 1>
			     <STRENGTH .CHR .TBL ,COMBAT-CDS>>
			<SET DOFF <+ .DOFF 2>>)>>
	 ;"Sort so that weakest character comes first"
	 <PAIR-SORT ,COMBAT-DAMAGE <* ,PARTY-MAX 2>>>

<ROUTINE PAIR-SORT (TBL MAX "AUX" (OFF 0) T1 T2 TT (FLG <>))
	 ;"Simple bubble sort"
	 <REPEAT ()
		 <COND (<G? <+ .OFF 3> .MAX>
			<COND (<NOT .FLG> <RTRUE>)
			      (T
			       <SET OFF 0>
			       <SET FLG <>>)>)>
		 <COND (<G? <GET .TBL <+ .OFF 1>>
			    <GET .TBL <+ .OFF 3>>>
			<SET FLG T>
			<SET TT <REST .TBL <* .OFF 2>>>
			<SET T1 <GET .TT 0>>
			<SET T2 <GET .TT 1>>
			<PUT .TT 0 <GET .TT 2>>
			<PUT .TT 1 <GET .TT 3>>
			<PUT .TT 2 .T1>
			<PUT .TT 3 .T2>)>
		 <SET OFF <+ .OFF 2>>>>

<CONSTANT AGGRESSION-TBL
	  <TABLE "a decidedly defensive" "a defensive" "a somewhat defensive"
		 "a balanced" "an aggressive" "an agressive"
		 "a boldly aggressive" "an all-out aggressive"
		 "an almost suicidally aggressive">>

;<CONSTANT CARNAGE-TBL
	  <TABLE "extremely subdued" "extremely subdued"
		 "very subdued" "very subdued"
		 "quite even" "quite even"
		 "quite fierce" "fierce"
		 "fierce" "extremely fierce and damaging"
		 "debilitating to both sides">>
		
;"To Do:

*1) Damage to parties
*2) Description of damage
*3) How quickly opponent will retreat/scatter (i.e. at what strength)
 4) Retreating; what happens?
 5) Parlay, etc.
 6) # of opponents (multiply, etc.)
"