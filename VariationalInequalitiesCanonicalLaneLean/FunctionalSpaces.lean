import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalInequalitiesCanonicalLaneLean

structure FunctionalSpacesPackage where
  hilbertSpace : Type u
  innerProduct : hilbertSpace → hilbertSpace → ℝ
  inducedNorm : hilbertSpace → ℝ
  complete : Prop
  innerProductContinuous : Prop

structure FunctionalSpacesEvidence (F : FunctionalSpacesPackage) where
  completeClosed : F.complete
  innerProductContinuousClosed : F.innerProductContinuous

def FunctionalSpacesClosed (F : FunctionalSpacesPackage) : Prop :=
  F.complete ∧ F.innerProductContinuous

theorem functional_spaces_closed_from_evidence (F : FunctionalSpacesPackage) (E : FunctionalSpacesEvidence F) :
    FunctionalSpacesClosed F := by
  exact And.intro E.completeClosed E.innerProductContinuousClosed

end VariationalInequalitiesCanonicalLaneLean
end HautevilleHouse