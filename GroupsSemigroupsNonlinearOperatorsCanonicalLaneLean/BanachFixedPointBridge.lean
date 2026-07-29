import NonlinearOperatorAdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure BanachContractionPackage (X : Type u) [MetricSpace X] where
  isComplete : CompleteSpace X
  contractionMap : X → X
  contractionFactor : ℝ
  factorPos : 0 < contractionFactor
  factorLessOne : contractionFactor < 1
  lipschitzCondition : ∀ x y : X, dist (contractionMap x) (contractionMap y) ≤ contractionFactor * dist x y

def BridgeClosedFromBanachContraction (X : Type u) [MetricSpace X] (pkg : BanachContractionPackage X) : Prop :=
  ∃ (x : X), contractionMap pkg x = x

theorem banach_fixed_point_bridge (X : Type u) [MetricSpace X] (pkg : BanachContractionPackage X) :
  BridgeClosedFromBanachContraction X pkg := by
  let f := pkg.contractionMap
  have hcomplete : CompleteSpace X := pkg.isComplete
  have hfactorpos : 0 < pkg.contractionFactor := pkg.factorPos
  have hfactorless : pkg.contractionFactor < 1 := pkg.factorLessOne
  have hlipschitz : ∀ x y : X, dist (f x) (f y) ≤ pkg.contractionFactor * dist x y := pkg.lipschitzCondition
  have hcontraction : ContractingWith pkg.contractionFactor f := by
    intro x y; exact hlipschitz x y
  have hfixed : ∃ (x : X), f x = x := by
    refine ContractingWith.exists_fixedPoint hcontraction
    exact hcomplete
  exact hfixed

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse
