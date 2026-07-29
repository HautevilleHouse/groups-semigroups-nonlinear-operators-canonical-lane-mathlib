import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.FixedPointTheorem
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.NonlinearSemigroupAction

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure IteratedFixedPointPackage {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} (F : FixedPointTheoremPackage N M) where
  iterationCount : ℕ
  iteratedAction : N.carrier → N.carrier
  convergesToFixedPoint : Prop
  convergenceRate : ℝ
  iterationCountTerm : iterationCount
  iteratedActionTerm : iteratedAction
  convergesToFixedPointTerm : convergesToFixedPoint
  convergenceRateTerm : convergenceRate

structure IteratedFixedPointEvidence {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} {F : FixedPointTheoremPackage N M} (I : IteratedFixedPointPackage N M F) where
  convergesToFixedPointClosed : I.convergesToFixedPoint

def IteratedFixedPointClosed {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} {F : FixedPointTheoremPackage N M} (I : IteratedFixedPointPackage N M F) : Prop :=
  I.convergesToFixedPoint

theorem iterated_fixed_point_closed_from_evidence
    {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} {F : FixedPointTheoremPackage N M} (I : IteratedFixedPointPackage N M F) (E : IteratedFixedPointEvidence I) :
    IteratedFixedPointClosed I := by
  exact E.convergesToFixedPointClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse