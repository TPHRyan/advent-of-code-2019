module Intcode.Machine 
( newMachine
, rebootMachine
, executeInstruction
, loadProgram
, execute
) where

import Data.List (foldl')
import Intcode.Opcode
import Intcode.Types

incrementPc :: IntcodeMachine -> MachineState IntcodeMachine
incrementPc machine = return $ IntcodeMachine { pc = newPc
                                               , memory = (memory machine)
                                               }
    where newPc = pc machine + instructionLength

readProgramCounter :: IntcodeMachine -> Int
readProgramCounter machine = getValueAt (memory machine) (pc machine)

newMachine :: IntcodeMachine
newMachine = IntcodeMachine { pc = 0
                            , memory = []
                            }

rebootMachine :: MachineState IntcodeMachine -> IntcodeMachine
rebootMachine (Running machine) = machine { pc = 0 }
rebootMachine Halted = newMachine

runInstruction :: Opcode -> IntcodeMachine -> MachineState IntcodeMachine
runInstruction opcode machine = runOpcode opcode machine >>= incrementPc

executeInstruction :: IntcodeMachine -> MachineState IntcodeMachine
executeInstruction machine = runInstruction opcode machine
    where opcode = readProgramCounter machine

loadProgram :: Memory -> MachineState IntcodeMachine -> IntcodeMachine
loadProgram prog machine = (rebootMachine machine) { memory = prog }

execute :: IntcodeMachine -> MachineState IntcodeMachine
execute machine = executeInstruction machine >>= execute
