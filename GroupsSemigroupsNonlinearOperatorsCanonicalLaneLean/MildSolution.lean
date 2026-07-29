import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.FixedPointIteration

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure MildSolutionPackage (P : NonlinearOperatorSemigroupPackage) (F : FixedPointIterationPackage P) where
  semigroup : Type u
  semigroupOp : semigroup → semigroup → semigroup
  semigroupAssoc : ∀ a b c : semigroup, semigroupOp (semigroupOp a b) c = semigroupOp a (semigroupOp b c)
  evolution : ℝ → P.space → P.space
  evolutionFamily : ∀ t s : ℝ, ∀ x : P.space,
    evolution (t + s) x = evolution t (evolution s x)
  mildSolution : ∀ (x : P.space), ∀ t : ℝ,
    P.metric (evolution t x) (F.fixedPoint) ≤ P.metric x (F.fixedPoint)

structure MildSolutionEvidence {P : NonlinearOperatorSemigroupPackage}
    {F : FixedPointIterationPackage P}
    (M : MildSolutionPackage P F) where
  semigroupAssocClosed : M.semigroupAssoc
  evolutionFamilyClosed : M.evolutionFamily
  mildSolutionClosed : M.mildSolution

def MildSolutionClosed {P : NonlinearOperatorSemigroupPackage}
    {F : FixedPointIterationPackage P}
    (M : MildSolutionPackage P F) : Prop :=
  M.semigroupAssoc ∧ M.evolutionFamily ∧ M.mildSolution

theorem mild_solution_closed_from_evidence
    {P : NonlinearOperatorSemigroupPackage}
    {F : FixedPointIterationPackage P}
    (M : MildSolutionPackage P F)
    (E : MildSolutionEvidence M) :
    MildSolutionClosed M := by
  exact And.intro E.semigroupAssocClosed
    (And.intro E.evolutionFamilyClosed E.mildSolutionClosed)

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse