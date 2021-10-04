---------------------------- MODULE Alternation ----------------------------
EXTENDS Sequences, Integers
Put(s) == Append(s, "widget")
Get(s) == Tail(s)

VARIABLES b2, box2

vars2 == << b2, box2 >>

Init2 == /\ b2 = 0
        /\ box2 = <<>>

Producer2 == /\ b2 = 0
            /\ box2' = Put(box2)
            /\ b2' = 1
Consumer2 == /\ b2 = 1
            /\ box2' = Get(box2)
            /\ b2' = 0
            
Next2 == Producer2 \/ Consumer2
           
Spec2 == Init2 /\ [][Next2]_vars2

Invariant2 == Len(box2) <= 1

(***************************************************************************
--algorithm Alternate {
    variable b = 0, box = <<>>;
    process (Producer = 0)
    { p1: while (TRUE)
        { await b = 0;
          box := Put(box);
          b := 1;
        }
    }
    
   fair process (Consumer = 1)
    { c1: while (TRUE)
        { await b = 1;
          box := Get(box);
          b := 0;
        }
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "451b1bc7" /\ chksum(tla) = "e9960233")
VARIABLES b, box

vars == << b, box >>

ProcSet == {0} \cup {1}

Init == (* Global variables *)
        /\ b = 0
        /\ box = <<>>

Producer == /\ b = 0
            /\ box' = Put(box)
            /\ b' = 1

Consumer == /\ b = 1
            /\ box' = Get(box)
            /\ b' = 0

Next == Producer \/ Consumer

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(Consumer)

\* END TRANSLATION 
=============================================================================
\* Modification History
\* Last modified Mon Oct 04 11:36:31 CST 2021 by wrz
\* Created Wed Sep 29 10:18:30 CST 2021 by wrz
