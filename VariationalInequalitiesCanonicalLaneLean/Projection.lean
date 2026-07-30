import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def variationalProjection : Projection (AdmissibleClass) := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem variational_projection_idempotent (x : AdmissibleClass) :
    variationalProjection.toFun (variationalProjection.toFun x) = variationalProjection.toFun x := by
  exact variationalProjection.idempotent x

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse