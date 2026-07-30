import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityFormulation

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure GapFunction (X : Type u) [TopologicalSpace X] [AddCommGroup X] where
  g : X → ℝ
  nonnegativity : ∀ x : X, g x ≥ 0
  zeroCharacterization : ∀ x : X, g x = 0 ↔ VariationalInequality.solution x
  continuity : Continuous g

structure GapFunctionEvidence (G : GapFunction X) where
  nonnegativityClosed : ∀ x : X, G.g x ≥ 0
  zeroCharacterizationClosed : ∀ x : X, G.g x = 0 ↔ VariationalInequality.solution x
  continuityClosed : Continuous G.g

def GapFunctionClosed (G : GapFunction X) : Prop :=
  (∀ x : X, G.g x ≥ 0) ∧ (∀ x : X, G.g x = 0 ↔ VariationalInequality.solution x) ∧ Continuous G.g

theorem gap_function_closed_from_evidence (G : GapFunction X) (E : GapFunctionEvidence G) :
    GapFunctionClosed G := by
  exact And.intro E.nonnegativityClosed (And.intro E.zeroCharacterizationClosed E.continuityClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse