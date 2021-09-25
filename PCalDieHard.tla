---------------------------- MODULE PCalDieHard ----------------------------
EXTENDS Integers
Min(m, n) == IF m < n THEN m ELSE n
(***************************************************************************
--algorithm DieHard {
    variables big = 0, small = 0; {
        while(TRUE) {
            either big := 0
            or small := 0
            or big := 5
            or small := 3
            or with (poured = Min(big + small, 5) - big)
                { small := small - poured;
                  big := big + poured}
            or with (poured = Min(big + small, 3) - small)
                { big := big - poured;
                  small := small + poured}
        }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "8b71ac6a" /\ chksum(tla) = "ee622ff0")
VARIABLES big, small

vars == << big, small >>

Init == (* Global variables *)
        /\ big = 0
        /\ small = 0

Next == \/ /\ big' = 0
           /\ small' = small
        \/ /\ small' = 0
           /\ big' = big
        \/ /\ big' = 5
           /\ small' = small
        \/ /\ small' = 3
           /\ big' = big
        \/ /\ LET poured == Min(big + small, 5) - big IN
                /\ small' = small - poured
                /\ big' = big + poured
        \/ /\ LET poured == Min(big + small, 3) - small IN
                /\ big' = big - poured
                /\ small' = small + poured

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Fri Sep 24 15:45:15 CST 2021 by wrz
\* Created Fri Sep 24 15:36:11 CST 2021 by wrz
