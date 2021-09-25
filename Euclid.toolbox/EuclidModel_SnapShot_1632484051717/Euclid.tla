------------------------------- MODULE Euclid -------------------------------
EXTENDS Integers, GCD
CONSTANTS M, N
(***************************************************************************
--algorithm Euclid {
    variables x = M, y = N;
    { while (x # y) { if (x < y) {y := y - x}
                      else {x := x - y}
                    };
      print <<x, y>>;
    }
}
 ***************************************************************************)
\* BEGIN TRANSLATION (chksum(pcal) = "2025ec2a" /\ chksum(tla) = "2a38868a")
VARIABLES x, y, pc

vars == << x, y, pc >>

Init == (* Global variables *)
        /\ x = M
        /\ y = N
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

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 
Safety == (pc = "Done") => (x = y) /\ (x = GCD(M,N))
=============================================================================
\* Modification History
\* Last modified Fri Sep 24 19:46:28 CST 2021 by wrz
\* Created Fri Sep 24 16:52:34 CST 2021 by wrz
