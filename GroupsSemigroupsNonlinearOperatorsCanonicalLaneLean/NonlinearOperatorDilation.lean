import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.NonlinearOperatorSemigroup

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure DilationPackage (N : NonLinearSemigroupPackage) where
  scaling : N.carrier → ℝ → N.carrier
  semigroupCompatibility : ∀ x y t, N.op (scaling x t) (scaling y t) = scaling (N.op x y) t
  identityAtZero : ∀ x, scaling x 0 = x
  scalingContinuity : Prop
  semigroupCompatibilityTerm : semigroupCompatibility
  identityAtZeroTerm : identityAtZero
  scalingContinuityTerm : scalingContinuity

structure DilationEvidence {N : NonLinearSemigroupPackage} (D : DilationPackage N) where
  semigroupCompatibilityClosed : D.semigroupCompatibility
  identityAtZeroClosed : D.identityAtZero
  scalingContinuityClosed : D.scalingContinuity

def DilationClosed {N : NonLinearSemigroupPackage} (D : DilationPackage N) : Prop :=
  D.semigroupCompatibility ∧ D.identityAtZero ∧ D.scalingContinuity

theorem dilation_closed_from_evidence
    {N : NonLinearSemigroupPackage} (D : DilationPackage N) (E : DilationEvidence D) :
    DilationClosed D := by
  exact And.intro E.semigroupCompatibilityClosed (And.intro E.identityAtZeroClosed E.scalingContinuityClosed)

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse