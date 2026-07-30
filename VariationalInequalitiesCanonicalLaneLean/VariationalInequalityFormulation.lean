import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure VariationalInequality (X : Type u) [TopologicalSpace X] [AddCommMonoid X] where
  K : Set X
  F : X → X
  solution : X → Prop
  solutionCondition : ∀ x : X, solution x ↔ x ∈ K ∧ ∀ y ∈ K, Inner (F x) (y - x) ≥ 0

structure VariationalInequalityEvidence (VI : VariationalInequality X) where
  KNonempty : VI.K.Nonempty
  KClosed : IsClosed VI.K
  KConvex : Convex ℝ VI.K
  FContinuous : Continuous VI.F
  solutionConditionClosed : ∀ x : X, VI.solution x ↔ x ∈ VI.K ∧ ∀ y ∈ VI.K, Inner (VI.F x) (y - x) ≥ 0

def VariationalInequalityClosed (VI : VariationalInequality X) : Prop :=
  VI.K.Nonempty ∧ IsClosed VI.K ∧ Convex ℝ VI.K ∧ Continuous VI.F ∧
  (∀ x : X, VI.solution x ↔ x ∈ VI.K ∧ ∀ y ∈ VI.K, Inner (VI.F x) (y - x) ≥ 0)

theorem variational_inequality_closed_from_evidence (VI : VariationalInequality X) (E : VariationalInequalityEvidence VI) :
    VariationalInequalityClosed VI := by
  exact And.intro E.KNonempty (And.intro E.KClosed (And.intro E.KConvex (And.intro E.FContinuous E.solutionConditionClosed)))

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse