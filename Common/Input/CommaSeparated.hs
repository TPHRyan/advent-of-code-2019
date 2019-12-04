module Common.Input.CommaSeparated
( parseIntegralInputFile
, parseIntInputFile
, parseStringInputFile
) where

import Common.Input.Parsing (foldRead, splitFileOn)
import Data.List (foldl')

parseIntegralInputFile :: (Integral a, Read a) => FilePath -> IO [a]
parseIntegralInputFile path = (parseStringInputFile path) >>= return . foldRead

parseIntInputFile :: FilePath -> IO [Int]
parseIntInputFile path = (parseStringInputFile path) >>= return . foldRead

parseStringInputFile :: FilePath -> IO [String]
parseStringInputFile = splitFileOn ","
