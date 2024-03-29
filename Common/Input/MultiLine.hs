module Common.Input.MultiLine 
( parseIntegralInputFile
, parseStringInputFile
) where

import Common.Input.Parsing (foldRead, splitFileOn)
import Data.List (foldl')

parseIntegralInputFile :: (Integral a, Read a) => FilePath -> IO [a]
parseIntegralInputFile path = (parseStringInputFile path) >>= return . foldRead

parseStringInputFile :: FilePath -> IO [String]
parseStringInputFile = splitFileOn "\n"
