import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityStructure

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure SplittingMethod (V : VariationalInequalityProblem) where
  forwardStep : V.HilbertSpace → V.HilbertSpace
  backwardStep : V.HilbertSpace → V.HilbertSpace
  iteration : ℕ → V.HilbertSpace
  convergence : ∃ x, x ∈ V.solutionSet ∧ 
    Filter.Tendsto (λ n : ℕ => iteration n) Filter.atTop (nhds x)

structure SplittingMethodEvidence {V : VariationalInequalityProblem}
    (S : SplittingMethod V) where
  convergenceClosed : ∃ x, x ∈ V.solutionSet ∧ 
    Filter.Tendsto (λ n : ℕ => S.iteration n) Filter.atTop (nhds x)

def SplittingMethodClosed {V : VariationalInequalityProblem}
    (S : SplittingMethod V) : Prop :=
  ∃ x, x ∈ V.solutionSet ∧ 
    Filter.Tendsto (λ n : ℕ => S.iteration n) Filter.atTop (nhds x)

theorem splitting_method_closed_from_evidence {V : VariationalInequalityProblem}
    (S : SplittingMethod V) (E : SplittingMethodEvidence S) :
    SplittingMethodClosed S :=
  E.convergenceClosed

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse