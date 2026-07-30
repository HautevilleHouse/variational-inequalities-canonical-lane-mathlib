import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure VariationalInequalityProblem where
  carrier : Type u
  innerProduct : carrier → carrier → ℝ
  convexSet : Set carrier
  operator : carrier → carrier
  operatorMonotone : Prop
  convexSetClosed : Prop
  convexSetNonempty : Prop

structure VariationalInequalityEvidence (P : VariationalInequalityProblem) where
  operatorMonotoneClosed : P.operatorMonotone
  convexSetClosedClosed : P.convexSetClosed
  convexSetNonemptyClosed : P.convexSetNonempty

def VariationalInequalityProblemClosed (P : VariationalInequalityProblem) : Prop :=
  P.operatorMonotone ∧ P.convexSetClosed ∧ P.convexSetNonempty

theorem variational_inequality_problem_closed_from_evidence
    (P : VariationalInequalityProblem) (E : VariationalInequalityEvidence P) :
    VariationalInequalityProblemClosed P := by
  exact And.intro E.operatorMonotoneClosed
    (And.intro E.convexSetClosedClosed E.convexSetNonemptyClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse