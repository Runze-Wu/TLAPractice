----------------------------- MODULE Handshake -----------------------------
EXTENDS Integers, Sequences

Put(s) == Append(s, "widget")
Get(s) == Tail(s)

a \oplus b == (a + b) % 2
(***************************************************************************
--algorithm Handshake {
    variable p = 0, c = 0, box = << >>;
    
    process (Producer = 0 )
    {
        c0: while(TRUE)
            {
                await p = c;
            s0: box := Put(box);
                p := p \oplus 1;
            }
    }
    
    fair process (Consumer = 1 )
    {
        c1: while(TRUE)
            {
                await p # c;
            s1: box := Get(box);
                c := c \oplus 1;
            }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "bf3f094" /\ chksum(tla) = "317d617b")
VARIABLES p, c, box, pc

vars == << p, c, box, pc >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ p = 0
        /\ c = 0
        /\ box = << >>
        /\ pc = [self \in ProcSet |-> CASE self = 0 -> "c0"
                                        [] self = 1 -> "c1"]

c0 == /\ pc[0] = "c0"
      /\ p = c
      /\ pc' = [pc EXCEPT ![0] = "s0"]
      /\ UNCHANGED << p, c, box >>

s0 == /\ pc[0] = "s0"
      /\ box' = Put(box)
      /\ p' = p \oplus 1
      /\ pc' = [pc EXCEPT ![0] = "c0"]
      /\ c' = c

Producer == c0 \/ s0

c1 == /\ pc[1] = "c1"
      /\ p # c
      /\ pc' = [pc EXCEPT ![1] = "s1"]
      /\ UNCHANGED << p, c, box >>

s1 == /\ pc[1] = "s1"
      /\ box' = Get(box)
      /\ c' = c \oplus 1
      /\ pc' = [pc EXCEPT ![1] = "c1"]
      /\ p' = p

Consumer == c1 \/ s1

Next == Producer \/ Consumer

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Consumer)

\* END TRANSLATION 

A == INSTANCE Alternation WITH b <- p \oplus c, box <- box, b2 <- p \oplus c, box2 <- box
=============================================================================
\* Modification History
\* Last modified Mon Oct 04 11:40:23 CST 2021 by wrz
\* Created Mon Oct 04 11:17:49 CST 2021 by wrz
