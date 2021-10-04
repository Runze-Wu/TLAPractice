----------------------------- MODULE TickTock2 -----------------------------
EXTENDS Integers
CONSTANTS N
ASSUME (N \in Nat) /\ (N > 1)
(***************************************************************************
--algorithm TickTock2 {
    variable b = 0;
    process (TickTock \in 0..N-1)
    {
    t:  while(TRUE)
        {
            await b = self;
            b := (self + N - 1) %2;
        }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "abde796" /\ chksum(tla) = "70fec9ff")
VARIABLE b

vars == << b >>

ProcSet == (0..N-1)

Init == (* Global variables *)
        /\ b = 0

TickTock(self) == /\ b = self
                  /\ b' = (self + N - 1) %2

Next == (\E self \in 0..N-1: TickTock(self))

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Mon Oct 04 19:46:33 CST 2021 by wrz
\* Created Mon Oct 04 19:42:11 CST 2021 by wrz
