import Common (parseIntegralInputFile)
import Data.List (foldl')

findFuel :: Integral a => a -> a
findFuel n = if n > 8 then requiredFuel + findFuel requiredFuel else 0
        where requiredFuel = floor (fromIntegral n / 3) - 2

main :: IO ()
main = do
    values <- parseIntegralInputFile "aoc1.2.txt"
    putStrLn $ show $ foldl' addMass 0 values
        where addMass :: Integral a => a -> a -> a
              addMass acc mass = acc + findFuel mass
