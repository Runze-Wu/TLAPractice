---- MODULE MC ----
EXTENDS OneBitClock, TLC

\* INIT definition @modelBehaviorInit:0
init_163245215042243000 ==
(b=0) \/ (b=2)
----
\* NEXT definition @modelBehaviorNext:0
next_163245215042244000 ==
\/ /\ b=0
   /\ b'=1
\/ /\ b=1
   /\ b'=0
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163245215042245000 ==
b \in {0,1}
----
=============================================================================
\* Modification History
\* Created Fri Sep 24 10:55:50 CST 2021 by wrz
