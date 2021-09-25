------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD
CONSTANTS M, N
(***************************************************************************
--algorithm Euclid {
    variables x \in 1..N, y \in 1..N, x0 = x, y0 = y;
    { while (x # y) { if (x < y) {y := y - x}
                      else {x := x - y}
                    };
      print <<x, y>>;
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "b85baaa7" /\ chksum(tla) = "1f02222b")
VARIABLES x, y, x0, y0, pc

vars == << x, y, x0, y0, pc >>

Init == (* Global variables *)
        /\ x \in 1..N
        /\ y \in 1..N
        /\ x0 = x
        /\ y0 = y
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF x # y
               THEN /\ IF x < y
                          THEN /\ y' = y - x
                               /\ x' = x
                          ELSE /\ x' = x - y
                               /\ y' = y
                    /\ pc' = "Lbl_1"
               ELSE /\ PrintT(<<x, y>>)
                    /\ pc' = "Done"
                    /\ UNCHANGED << x, y >>
         /\ UNCHANGED << x0, y0 >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 
Safety == (pc = "Done") => (x = y) /\ (x = GCD(x0,y0))
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 19:49:57 CST 2021 by wrz
\* Created Fri Sep 24 16:52:34 CST 2021 by wrz
