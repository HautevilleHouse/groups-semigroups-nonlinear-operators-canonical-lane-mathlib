import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.MonotoneOperator

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure FixedPointTheoremPackage {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} where
  fixedPoint : N.carrier
  idempotent : N.op fixedPoint fixedPoint = fixedPoint
  fixedPointDomain : M.domain fixedPoint
  fixedPointTerm : idempotent
  fixedPointDomainTerm : fixedPointDomain

structure FixedPointTheoremEvidence {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} (F : FixedPointTheoremPackage N M) where
  idempotentClosed : F.idempotent
  fixedPointDomainClosed : F.fixedPointDomain

def FixedPointTheoremClosed {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} (F : FixedPointTheoremPackage N M) : Prop :=
  F.idempotent ∧ F.fixedPointDomain

theorem fixed_point_theorem_closed_from_evidence
    {N : NonLinearSemigroupPackage} {M : MonotoneOperatorPackage N} (F : FixedPointTheoremPackage N M) (E : FixedPointTheoremEvidence F) :
    FixedPointTheoremClosed F := by
  exact And.intro E.idempotentClosed E.fixedPointDomainClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse