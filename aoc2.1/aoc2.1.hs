import Common.Input.CommaSeparated (parseIntInputFile)
import Intcode.Types (Memory, ProgramCounter, Program, IntcodeProgram)

main :: IO ()
main = do
    initialRamState <- parseIntInputFile "aoc2.1.txt"
    putStrLn $ show $ initialRamState 
