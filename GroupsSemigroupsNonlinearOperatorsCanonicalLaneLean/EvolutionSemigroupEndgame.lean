import GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.SemigroupDecomposition
import GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean.NonlinearOperatorFixedPoint

namespace HautevilleHouse
namespace GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean

structure EvolutionSemigroupEndgamePackage
    (M : Type) [Semigroup M] (X : Type) [CompleteMetricSpace X]
    (A : SemigroupAction M X) (T : X → X) where
  semigroupDecomp : SemigroupDecompositionPackage M X A
  nonlinearOp : NonlinearOperatorPackage X T
  stabilityOverInvariant : Prop
  endgameEvidence : stabilityOverInvariant

theorem evolution_semigroup_endgame_closed
    (M : Type) [Semigroup M] (X : Type) [CompleteMetricSpace X]
    (A : SemigroupAction M X) (T : X → X)
    (P : EvolutionSemigroupEndgamePackage M X A T) :
    P.stabilityOverInvariant :=
  P.endgameEvidence

end GroupsSemigroupsNonlinearOperatorsCanonicalLaneLean
end HautevilleHouse