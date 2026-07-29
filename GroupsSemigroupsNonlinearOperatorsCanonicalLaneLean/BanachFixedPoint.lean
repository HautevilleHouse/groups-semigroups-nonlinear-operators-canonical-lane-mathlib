import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure BanachFixedPointPackage where
  space : Type u
  norm : space → ℝ
  complete : Prop
  contractiveMap : space → space
  contractionConstant : ℝ
  contractionBound : ∀ x y, dist (contractiveMap x) (contractiveMap y) ≤ contractionConstant * dist x y
  contractionConstantLTOne : contractionConstant < 1
  fixedPoint : space
  fixedPointProperty : contractiveMap fixedPoint = fixedPoint
  uniqueness : ∀ x, contractiveMap x = x → x = fixedPoint

structure BanachFixedPointEvidence (B : BanachFixedPointPackage) where
  completeClosed : B.complete
  contractionBoundClosed : B.contractionBound
  contractionConstantLTOneClosed : B.contractionConstantLTOne
  fixedPointPropertyClosed : B.fixedPointProperty
  uniquenessClosed : B.uniqueness

def BanachFixedPointClosed (B : BanachFixedPointPackage) : Prop :=
  B.complete ∧ B.contractionBound ∧ B.contractionConstantLTOne ∧ B.fixedPointProperty ∧ B.uniqueness

theorem banach_fixed_point_closed_from_evidence (B : BanachFixedPointPackage) (E : BanachFixedPointEvidence B) : BanachFixedPointClosed B := by
  exact And.intro E.completeClosed (And.intro E.contractionBoundClosed (And.intro E.contractionConstantLTOneClosed (And.intro E.fixedPointPropertyClosed E.uniquenessClosed)))

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse