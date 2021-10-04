---------------------------- MODULE Alternation ----------------------------
EXTENDS Sequences, Integers
Put(s) == Append(s, "widget")
Get(s) == Tail(s)

VARIABLES b, box

vars == << b, box >>

Init == /\ b = 0
        /\ box = <<>>

Producer == /\ b = 0
            /\ box' = Put(box)
            /\ b' = 1
Consumer == /\ b = 1
            /\ box' = Get(box)
            /\ b' = 0
            
Next == Producer \/ Consumer
           
Spec == Init /\ [][Next]_vars

Invariant == Len(box) <= 1

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
    
    process (Consumer = 1)
    { c1: while (TRUE)
        { await b = 1;
          box := Get(box);
          b := 0;
        }
    }
}
 ***************************************************************************)
\*\* BEGIN TRANSLATION (chksum(pcal) = "ba581e72" /\ chksum(tla) = "cde0f531")
\*VARIABLES b, box
\*
\*vars == << b, box >>
\*
\*ProcSet == {0} \cup {"s"}
\*
\*Init == (* Global variables *)
\*        /\ b = 0
\*        /\ box = <<>>
\*
\*Producer == /\ b = 0
\*            /\ box' = Put(box)
\*            /\ b' = 1
\*
\*Consumer == /\ b = 1
\*            /\ box' = Get(box)
\*            /\ b' = 0
\*
\*Next == Producer \/ Consumer
\*
\*Spec == Init /\ [][Next]_vars
\*
\*\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Wed Sep 29 10:55:43 CST 2021 by wrz
\* Created Wed Sep 29 10:18:30 CST 2021 by wrz
