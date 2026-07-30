import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure AdmissibleClass where
  object : VariationalInequalityProblem
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  VariationalInequalityClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse