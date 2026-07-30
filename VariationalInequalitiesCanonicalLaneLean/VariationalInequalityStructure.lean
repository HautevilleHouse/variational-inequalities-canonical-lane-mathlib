import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure VariationalInequalityProblem where
  HilbertSpace : Type u
  innerProduct : HilbertSpace → HilbertSpace → ℝ
  norm : HilbertSpace → ℝ
  convexSet : Set HilbertSpace
  operator : HilbertSpace → HilbertSpace
  monotone : ∀ x y, innerProduct (operator x - operator y) (x - y) ≥ 0
  solutionSet : Set HilbertSpace
  nonemptySolution : ∃ x, x ∈ solutionSet

structure VariationalInequalityEvidence (V : VariationalInequalityProblem) where
  feasibleSetClosed : V.solutionSet ⊆ V.convexSet
  existenceProved : V.nonemptySolution
  monotonicityApplied : V.monotone

def VariationalInequalityClosed (V : VariationalInequalityProblem) : Prop :=
  V.solutionSet ⊆ V.convexSet ∧ V.nonemptySolution ∧ V.monotone

theorem variational_inequality_closed_from_evidence (V : VariationalInequalityProblem)
    (E : VariationalInequalityEvidence V) : VariationalInequalityClosed V :=
  And.intro E.feasibleSetClosed (And.intro E.existenceProved E.monotonicityApplied)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse