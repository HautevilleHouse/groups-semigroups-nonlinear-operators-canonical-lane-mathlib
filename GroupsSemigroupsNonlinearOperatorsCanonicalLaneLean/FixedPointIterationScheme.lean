import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure FixedPointIterationScheme (X : Type u) [MetricSpace X] where
  operator : X → X
  initialGuess : X
  fixedPointExists : Prop
  convergenceGuaranteed : Prop

def fixedPointIterationSchemeClosed (F : FixedPointIterationScheme X) : Prop :=
  F.fixedPointExists ∧ F.convergenceGuaranteed

structure FixedPointIterationEvidence (F : FixedPointIterationScheme X) where
  fixedPointExistsClosed : F.fixedPointExists
  convergenceGuaranteedClosed : F.convergenceGuaranteed

theorem fixed_point_iteration_closed_from_evidence (F : FixedPointIterationScheme X) (E : FixedPointIterationEvidence F) : fixedPointIterationSchemeClosed F := by
  exact And.intro E.fixedPointExistsClosed E.convergenceGuaranteedClosed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse