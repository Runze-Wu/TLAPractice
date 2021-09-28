---- MODULE MC ----
EXTENDS GeneralDieHard, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_163281838744532000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_163281838744533000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_163281838744534000 == 
(big :> 5) @@ (small :> 3)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163281838744535000 ==
\A j \in Jugs : injug[j] # Goal
----
=============================================================================
\* Modification History
\* Created Tue Sep 28 16:39:47 CST 2021 by wrz
