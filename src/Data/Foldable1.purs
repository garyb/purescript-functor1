module Data.Foldable1 where

import Prelude

import Data.Monoid.Dual (Dual(..))
import Data.Monoid.Endo (Endo(..))
import Data.Newtype (unwrap)

class Foldable1 ∷ ∀ k. ((k → Type) → Type) → Constraint
class Foldable1 t where
  foldMap1 ∷ ∀ f m. Monoid m ⇒ (∀ a. f a → m) → t f → m

foldr1 ∷ ∀ t f b. Foldable1 t ⇒ (∀ a. f a → b → b) → b → t f → b
foldr1 c u xs = unwrap (foldMap1 (Endo <<< c) xs) u

foldl1 ∷ ∀ t f b. Foldable1 t ⇒ (∀ a. b → f a → b) → b → t f → b
foldl1 c u xs = unwrap (unwrap (foldMap1 (Dual <<< Endo <<< flip c) xs)) u
