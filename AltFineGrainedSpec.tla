------------------------------ MODULE AltSpec ------------------------------
EXTENDS Integers

a \oplus b == (a + b) % 2
(***************************************************************************
--algorithm AltFineGrainedSpec {
    variable p = 0, c = 0;
    
    process (Producer = 0)
        variable tp = 0;
        {
            pe: while(TRUE)
            {
                 tp := c;
            pe1: if(p # tp) { goto pe };
            put: skip;
            px:  p := p \oplus 1;   
            }
        }
    
    
    process (Consumer = 1)
        variable tc = 0;
        {
            ce: while(TRUE)
            {
                 tc := p;
            ce1: if(c = tc) { goto ce };
            get: skip;
            cx:  c := c \oplus 1;   
            }
        }
    
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "69ecab4f" /\ chksum(tla) = "dbd6b021")
VARIABLES p, c, pc, tp, tc

vars == << p, c, pc, tp, tc >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ p = 0
        /\ c = 0
        (* Process Producer *)
        /\ tp = 0
        (* Process Consumer *)
        /\ tc = 0
        /\ pc = [self \in ProcSet |-> CASE self = 0 -> "pe"
                                        [] self = 1 -> "ce"]

pe == /\ pc[0] = "pe"
      /\ tp' = c
      /\ pc' = [pc EXCEPT ![0] = "pe1"]
      /\ UNCHANGED << p, c, tc >>

pe1 == /\ pc[0] = "pe1"
       /\ IF p # tp
             THEN /\ pc' = [pc EXCEPT ![0] = "pe"]
             ELSE /\ pc' = [pc EXCEPT ![0] = "put"]
       /\ UNCHANGED << p, c, tp, tc >>

put == /\ pc[0] = "put"
       /\ TRUE
       /\ pc' = [pc EXCEPT ![0] = "px"]
       /\ UNCHANGED << p, c, tp, tc >>

px == /\ pc[0] = "px"
      /\ p' = p \oplus 1
      /\ pc' = [pc EXCEPT ![0] = "pe"]
      /\ UNCHANGED << c, tp, tc >>

Producer == pe \/ pe1 \/ put \/ px

ce == /\ pc[1] = "ce"
      /\ tc' = p
      /\ pc' = [pc EXCEPT ![1] = "ce1"]
      /\ UNCHANGED << p, c, tp >>

ce1 == /\ pc[1] = "ce1"
       /\ IF c = tc
             THEN /\ pc' = [pc EXCEPT ![1] = "ce"]
             ELSE /\ pc' = [pc EXCEPT ![1] = "get"]
       /\ UNCHANGED << p, c, tp, tc >>

get == /\ pc[1] = "get"
       /\ TRUE
       /\ pc' = [pc EXCEPT ![1] = "cx"]
       /\ UNCHANGED << p, c, tp, tc >>

cx == /\ pc[1] = "cx"
      /\ c' = c \oplus 1
      /\ pc' = [pc EXCEPT ![1] = "ce"]
      /\ UNCHANGED << p, tp, tc >>

Consumer == ce \/ ce1 \/ get \/ cx

Next == Producer \/ Consumer

Spec == Init /\ [][Next]_vars

\* END TRANSLATION 
pcBar == [i \in {0,1} |-> CASE i = 0 -> IF pc[0] = "pe1" THEN "pe"
                                                         ELSE "pc[0]"
                          []   i = 1 -> IF pc[1] = "ce1" THEN "ce"
                                                         ELSE "pc[1]"]
=============================================================================
\* Modification History
\* Last modified Mon Oct 04 19:39:15 CST 2021 by wrz
\* Created Mon Oct 04 19:16:42 CST 2021 by wrz
