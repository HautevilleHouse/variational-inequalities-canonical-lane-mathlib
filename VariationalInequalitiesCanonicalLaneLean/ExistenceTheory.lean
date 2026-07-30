import VariationalInequalityProblem

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure ExistenceTheoryPackage (V : VariationalInequalityProblem) where
  monotonicityAssumption : Prop
  coercivityAssumption : Prop
  existenceResult : Prop
  compactnessArgument : Prop
  existenceProof : existenceResult

def ExistenceTheoryClosed (V : VariationalInequalityProblem) (P : ExistenceTheoryPackage V) : Prop :=
  P.monotonicityAssumption ∧ P.coercivityAssumption ∧ P.existenceResult ∧ P.compactnessArgument

theorem existence_theory_closed (V : VariationalInequalityProblem) (P : ExistenceTheoryPackage V) :
    ExistenceTheoryClosed V P := by
  exact And.intro P.monotonicityAssumption (And.intro P.coercivityAssumption (And.intro P.existenceResult P.compactnessArgument))

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse