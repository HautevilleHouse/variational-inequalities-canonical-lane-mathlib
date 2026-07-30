import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VariationalInequalitiesCanonicalLaneLean.VariationalInequalityStructure

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | object.variationalInequality V => VariationalInequalityClosed V
  | _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  match A.object with
  | object.variationalInequality V => 
    have : VariationalInequalityClosed V := by
      exact variational_inequality_closed_from_evidence V A.evidence
    exact this
  | _ => trivial

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse