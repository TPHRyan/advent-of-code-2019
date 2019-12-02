import Common (parseIntegralInputFile)
import Data.List (foldl')

findFuel :: Integral a => a -> a
findFuel n = floor (fromIntegral n / 3) - 2

main :: IO ()
main = do
    values <- parseIntegralInputFile "aoc1.1.txt"
    putStrLn $ show $ foldl' addMass 0 values
        where addMass :: Integral a => a -> a -> a
              addMass acc mass = acc + findFuel mass
