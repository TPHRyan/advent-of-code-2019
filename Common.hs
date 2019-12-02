module Common 
( parseIntegralInputFile
, parseStringInputFile
) where

import Data.List (foldl')
import Data.List.Split (splitOn)
import Data.Maybe (maybeToList)
import Text.Read (readMaybe)

parseIntegralInputFile :: (Integral a, Read a) => FilePath -> IO [a]
parseIntegralInputFile path = (parseStringInputFile path) >>= return . foldRead

parseStringInputFile :: FilePath -> IO [String]
parseStringInputFile path = (readFile path) >>= return . (splitOn "\n")

foldRead :: (Read a) => [String] -> [a]
foldRead valuesToRead = foldl' addValue [] valuesToRead
        where addValue :: (Read a) => [a] -> String -> [a]
              addValue acc toRead = (++) acc $ maybeToList $ readMaybe toRead
