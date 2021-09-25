
-------------------------- MODULE PCalOneBitClock --------------------------
EXTENDS Integers
(***************************************************************************
--algorithm Clock {
    variable b \in {0, 1};
    { while(TRUE) { b:= (b+1)%2;
                  }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "47b5dcdd" /\ chksum(tla) = "66628552")
VARIABLE b

vars == << b >>

Init == (* Global variables *)
        /\ b \in {0, 1}

Next == b' = (b+1)%2

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 15:34:47 CST 2021 by wrz
\* Created Fri Sep 24 14:23:12 CST 2021 by wrz
