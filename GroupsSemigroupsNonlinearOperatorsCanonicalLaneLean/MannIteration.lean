import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure MannIterationPackage where
  space : Type u
  norm : space → ℝ
  convex : Prop
  mapping : space → space
  nonexpansive : ∀ x y, dist (mapping x) (mapping y) ≤ dist x y
  sequence : ℕ → space
  iterationRule : ∀ n, sequence (n+1) = (1 - α n) • sequence n + α n • mapping (sequence n)
  alphaSequence : ℕ → ℝ
  alphaIn01 : ∀ n, 0 ≤ α n ∧ α n ≤ 1
  alphaDivergent : ∑ n, α n = ∞ ∧ α n → 0
  weakConvergence : ∃ x, FixedPoint mapping x ∧ ∀ y, WeakLimit sequence = x

structure MannIterationEvidence (M : MannIterationPackage) where
  nonexpansiveClosed : M.nonexpansive
  iterationRuleClosed : M.iterationRule
  alphaIn01Closed : M.alphaIn01
  alphaDivergentClosed : M.alphaDivergent
  weakConvergenceClosed : M.weakConvergence

def MannIterationClosed (M : MannIterationPackage) : Prop :=
  M.nonexpansive ∧ M.iterationRule ∧ M.alphaIn01 ∧ M.alphaDivergent ∧ M.weakConvergence

theorem mann_iteration_closed_from_evidence (M : MannIterationPackage) (E : MannIterationEvidence M) : MannIterationClosed M := by
  exact And.intro E.nonexpansiveClosed (And.intro E.iterationRuleClosed (And.intro E.alphaIn01Closed (And.intro E.alphaDivergentClosed E.weakConvergenceClosed)))

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse