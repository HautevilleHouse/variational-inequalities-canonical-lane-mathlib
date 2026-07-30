import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure ProjectionMethodsPackage where
  convexSet : Type u
  projectionOperator : convexSet → convexSet
  nonexpansiveness : Prop
  fixedPointCharacterization : Prop
  projectionExists : Prop

structure ProjectionMethodsEvidence (P : ProjectionMethodsPackage) where
  nonexpansivenessClosed : P.nonexpansiveness
  fixedPointCharacterizationClosed : P.fixedPointCharacterization
  projectionExistsClosed : P.projectionExists

def ProjectionMethodsClosed (P : ProjectionMethodsPackage) : Prop :=
  P.nonexpansiveness ∧ P.fixedPointCharacterization ∧ P.projectionExists

theorem projection_methods_closed_from_evidence (P : ProjectionMethodsPackage) (E : ProjectionMethodsEvidence P) :
    ProjectionMethodsClosed P := by
  exact And.intro E.nonexpansivenessClosed (And.intro E.fixedPointCharacterizationClosed E.projectionExistsClosed)

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse