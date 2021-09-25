---------------------------- MODULE OneBitClock ----------------------------
VARIABLE b
TypeOK == b \in {0,1}
Init1 == (b=0) \/ (b=1)
Next1 == \/ /\ b=0
            /\ b'=1
         \/ /\ b=1
            /\ b'=0
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 11:18:06 CST 2021 by wrz
\* Created Fri Sep 24 10:34:01 CST 2021 by wrz
