import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityFormulation

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure RegularizedSmoothing (X : Type u) [TopologicalSpace X] [AddCommGroup X] where
  epsilon : ℝ
  regularizedVI : VariationalInequality X
  stability : Prop
  convergence : Prop

structure RegularizedSmoothingEvidence (RS : RegularizedSmoothing X) where
  epsilonPositive : RS.epsilon > 0
  regularizedVIClosed : VariationalInequalityClosed RS.regularizedVI
  stabilityClosed : RS.stability
  convergenceClosed : RS.convergence

def RegularizedSmoothingClosed (RS : RegularizedSmoothing X) : Prop :=
  RS.epsilon > 0 ∧ VariationalInequalityClosed RS.regularizedVI ∧ RS.stability ∧ RS.convergence

theorem regularized_smoothing_closed_from_evidence (RS : RegularizedSmoothing X) (E : RegularizedSmoothingEvidence RS) :
    RegularizedSmoothingClosed RS := by
  exact And.intro E.epsilonPositive (And.intro E.regularizedVIClosed (And.intro E.stabilityClosed E.convergenceClosed))

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse