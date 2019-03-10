module Data.Traversable1 where

import Prelude

import Data.Foldable1 (class Foldable1)
import Data.Functor1 (class Functor1)

class (Functor1 t, Foldable1 t) ⇐ Traversable1 t where
  traverse1 ∷ ∀ m f g. Applicative m ⇒ (∀ a. f a → m (g a)) → t f → m (t g)
