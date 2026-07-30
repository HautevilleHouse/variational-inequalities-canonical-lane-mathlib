import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  VariationalInequalityClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse