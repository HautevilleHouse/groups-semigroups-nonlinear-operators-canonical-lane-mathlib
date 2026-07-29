import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure SemigroupContractiveMapping (X : Type u) [MetricSpace X] where
  semigroupOp : X → X → X
  contractive : ∃ c < 1, ∀ x y, dist (semigroupOp x) (semigroupOp y) ≤ c * dist x y

def semigroupContractiveMappingClosed (M : SemigroupContractiveMapping X) : Prop :=
  M.contractive

structure SemigroupContractiveEvidence (M : SemigroupContractiveMapping X) where
  contractiveClosed : M.contractive

theorem semigroup_contractive_closed_from_evidence (M : SemigroupContractiveMapping X) (E : SemigroupContractiveEvidence M) : semigroupContractiveMappingClosed M := by
  exact E.contractiveClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse