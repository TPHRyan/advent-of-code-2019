import Common.Input.CommaSeparated (parseIntInputFile)
import Intcode.Machine
import Intcode.Opcode
import Intcode.Types

showMachine :: MachineState IntcodeMachine -> String
showMachine (Running machine) = "Machine running\nState: " ++ (show machine)
showMachine Halted = "Machine halted"

main :: IO ()
main = do
    initialRamState <- parseIntInputFile "aoc2.1.txt"
    let machine = loadProgram initialRamState (return newMachine)
    putStrLn $ showMachine $ execute machine 

