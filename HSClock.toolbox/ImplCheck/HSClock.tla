------------------------------ MODULE HSClock ------------------------------
EXTENDS Integers
CONSTANT N
ASSUME (N \in Nat) /\ (N > 1)
a \oplus b == (a + b) %2
(***************************************************************************
--algorithm HSClock {
    variables ca = [i \in 0..(N-1) |-> 0];
    
    process (Proc0 = 0)
    {
    t:  while(TRUE)
        {
            await ca[0] = ca[N-1];
            ca[0] := ca[0] \oplus 1;
        }
    }
    
    process (Proc \in 1..(N - 1))
    {
    t:  while(TRUE)
        {
            await ca[self] # ca[self-1];
            ca[self] := ca[self] \oplus 1;
        }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "1d63b331" /\ chksum(tla) = "d732ffe1")
\* Label t of process Proc0 at line 12 col 9 changed to t_
VARIABLE ca

vars == << ca >>

ProcSet == {0} \cup (1..(N - 1))

Init == (* Global variables *)
        /\ ca = [i \in 0..(N-1) |-> 0]

Proc0 == /\ ca[0] = ca[N-1]
         /\ ca' = [ca EXCEPT ![0] = ca[0] \oplus 1]

Proc(self) == /\ ca[self] # ca[self-1]
              /\ ca' = [ca EXCEPT ![self] = ca[self] \oplus 1]

Next == Proc0
           \/ (\E self \in 1..(N - 1): Proc(self))

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 
Type == ca \in [0..(N-1) -> {0, 1}]

b == IF \E i \in 1..(N - 1): ca[i] # ca[i - 1]
        THEN CHOOSE i \in 1..(N - 1): ca[i] # ca[i - 1]
        ELSE 0
A == INSTANCE TickTock2 WITH b <- b
=============================================================================
\* Modification History
\* Last modified Mon Oct 04 19:57:42 CST 2021 by wrz
\* Created Mon Oct 04 19:50:27 CST 2021 by wrz
