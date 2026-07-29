import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.NonlinearOperatorSemigroup

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure FixedPointIterationPackage (P : NonlinearOperatorSemigroupPackage) where
  metric : P.space → P.space → ℝ
  contractive : ∃ c < 1, ∀ x y : P.space,
    P.metric (P.operator x y) (P.operator y x) ≤ c * P.metric x y
  fixedPoint : P.space
  fixedPointProperty : ∀ x : P.space, P.operator fixedPoint x = fixedPoint

structure FixedPointIterationEvidence {P : NonlinearOperatorSemigroupPackage}
    (F : FixedPointIterationPackage P) where
  contractiveClosed : F.contractive
  fixedPointPropertyClosed : F.fixedPointProperty

def FixedPointIterationClosed {P : NonlinearOperatorSemigroupPackage}
    (F : FixedPointIterationPackage P) : Prop :=
  F.contractive ∧ F.fixedPointProperty

theorem fixed_point_iteration_closed_from_evidence
    {P : NonlinearOperatorSemigroupPackage}
    (F : FixedPointIterationPackage P)
    (E : FixedPointIterationEvidence F) :
    FixedPointIterationClosed F := by
  exact And.intro E.contractiveClosed E.fixedPointPropertyClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse