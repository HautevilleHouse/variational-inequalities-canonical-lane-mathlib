import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure DualApproximationAlgorithmsPackage where
  dualProblem : Type u
  gapFunction : Type v
  descentAlgorithm : Type w
  convergence : Prop
  rateOfConvergence : Prop

structure DualApproximationAlgorithmsEvidence (D : DualApproximationAlgorithmsPackage) where
  convergenceClosed : D.convergence
  rateOfConvergenceClosed : D.rateOfConvergence

def DualApproximationAlgorithmsClosed (D : DualApproximationAlgorithmsPackage) : Prop :=
  D.convergence ∧ D.rateOfConvergence

theorem dual_approximation_algorithms_closed_from_evidence (D : DualApproximationAlgorithmsPackage) (E : DualApproximationAlgorithmsEvidence D) :
    DualApproximationAlgorithmsClosed D := by
  exact And.intro E.convergenceClosed E.rateOfConvergenceClosed

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse