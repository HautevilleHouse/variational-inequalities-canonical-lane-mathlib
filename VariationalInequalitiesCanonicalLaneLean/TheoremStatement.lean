import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure VariationalInequalityAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  closedConvexSet : Set space
  monotoneOperator : space → space
  solutionExists : Prop
  conclusion : solutionExists

def VariationalInequalityWitnessClosed (O : VariationalInequalityAdmittedObject) : Prop :=
  O.solutionExists

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse