---- MODULE MC ----
EXTENDS Euclid, TLC

\* CONSTANT definitions @modelParameterConstants:0M
const_163248369413328000 == 
30
----

\* CONSTANT definitions @modelParameterConstants:1N
const_163248369413329000 == 
18
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163248369413330000 ==
(pc = "Done") => (x = y) /\ (x = GCD(M,N))
----
=============================================================================
\* Modification History
\* Created Fri Sep 24 19:41:34 CST 2021 by wrz
