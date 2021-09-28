---- MODULE MC ----
EXTENDS GeneralDieHard, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
big, small
----

\* MV CONSTANT definitions Jugs
const_163281816527320000 == 
{big, small}
----

\* CONSTANT definitions @modelParameterConstants:1Goal
const_163281816527321000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:2Capacity
const_163281816527322000 == 
(big :> 6) @@ (small :> 3)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163281816527323000 ==
\A j \in Jugs : injug[j] # Goal
----
=============================================================================
\* Modification History
\* Created Tue Sep 28 16:36:05 CST 2021 by wrz
