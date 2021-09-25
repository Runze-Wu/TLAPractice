---- MODULE MC ----
EXTENDS OneBitClock, TLC

\* INIT definition @modelBehaviorInit:0
init_163245217638649000 ==
(b=0) \/ (b=1)
----
\* NEXT definition @modelBehaviorNext:0
next_163245217638650000 ==
\/ /\ b=0
   /\ b'=1
\/ /\ b=1
   /\ b'=2
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163245217638651000 ==
b \in {0,1}
----
=============================================================================
\* Modification History
\* Created Fri Sep 24 10:56:16 CST 2021 by wrz
