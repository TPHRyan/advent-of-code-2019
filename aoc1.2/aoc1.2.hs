import Data.List (foldl')
import Data.List.Split (splitOn)
import Data.Maybe (maybeToList)
import Text.Read (readMaybe)

inputFileName :: String
inputFileName = "aoc1.2.txt"

readValues :: (Integral a, Read a) => FilePath -> IO [a]
readValues path = (readStrings path) >>= return . foldRead
            where readStrings :: FilePath -> IO [String]
                  readStrings path = (readFile path) >>= return . (splitOn "\n")
                  foldRead :: (Integral a, Read a) => [String] -> [a]
                  foldRead valuesToRead = foldl' addValue [] valuesToRead
                        where addValue :: (Integral a, Read a) => [a] -> String -> [a]
                              addValue acc toRead = (++) acc $ maybeToList $ readMaybe toRead

findFuel :: Integral a => a -> a
findFuel n = if n > 8 then requiredFuel + findFuel requiredFuel else 0
        where requiredFuel = floor (fromIntegral n / 3) - 2

main :: IO ()
main = do
    values <- readValues inputFileName
    putStrLn $ show $ foldl' addMass 0 values
        where addMass :: Integral a => a -> a -> a
              addMass acc mass = acc + findFuel mass
