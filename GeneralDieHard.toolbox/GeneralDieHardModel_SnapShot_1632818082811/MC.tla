---- MODULE MC ----
EXTENDS GeneralDieHard, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_163281808056812000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_163281808056813000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_163281808056814000 == 
(big :> 5) @@ (small :> 3)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163281808056815000 ==
\A j \in Jugs : injug[j] # Goal
----
=============================================================================
\* Modification History
\* Created Tue Sep 28 16:34:40 CST 2021 by wrz
