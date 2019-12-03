module Common.Input.Parsing
( foldRead
, splitFileOn
) where

import Data.List (foldl')
import Data.List.Split (splitOn)
import Data.Maybe (maybeToList)
import Text.Read (readMaybe)

splitFileOn :: String -> FilePath -> IO [String]
splitFileOn splitChar path = (readFile path) >>= return . (splitOn splitChar)

foldRead :: (Read a) => [String] -> [a]
foldRead valuesToRead = foldl' addValue [] valuesToRead
        where addValue :: (Read a) => [a] -> String -> [a]
              addValue acc toRead = (++) acc $ maybeToList $ readMaybe toRead
