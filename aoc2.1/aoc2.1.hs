import Common.Input.CommaSeparated (parseIntegralInputFile)

main :: IO ()
main = do
    initialRamState <- parseIntegralInputFile "aoc2.1.txt"
    putStrLn $ show $ initialRamState
