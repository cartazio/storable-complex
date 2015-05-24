-----------------------------------------------------------------------------
-- |
-- Module      : Data.Array.CArray.Base
-- Copyright   : (c) 2008 Jed Brown
-- License     : BSD-style
--
-- Maintainer  : jed@59A2.org
-- Stability   : provisional
-- Portability : portable
--
-- This module provides a Storable instance for Complex which is binary
-- compatible with C99, C++ and Fortran complex data types.  It's only purpose
-- is to provide a standard location for this instance so that other packages
-- needing this instance can play nicely together.
--
-----------------------------------------------------------------------------

module Foreign.Storable.Complex () where

import Data.Orphans () -- exports a Storable (Complex a) instance
