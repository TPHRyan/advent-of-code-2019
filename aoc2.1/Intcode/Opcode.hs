module Intcode.Opcode 
( runOpcode
) where

import Intcode.Types

pcOffset :: IntcodeMachine -> Int -> Int
pcOffset machine offset = getValueAt currentMemory (currentPc + offset)
    where currentMemory = memory machine
          currentPc = pc machine

getArg :: IntcodeMachine -> Int -> Int
getArg machine argNo = pcOffset machine argNo

destinationOffset :: Int
destinationOffset = instructionLength - 1

getDestination :: IntcodeMachine -> Int
getDestination machine = pcOffset machine destinationOffset

setAtDestination :: IntcodeMachine -> Int -> IntcodeMachine
setAtDestination machine value = machine { memory = newMemory }
    where newMemory = setValueAt (memory machine) (getDestination machine) value

runOpcode :: Int -> IntcodeMachine -> MachineState IntcodeMachine
runOpcode 1 machine = return $ setAtDestination machine result
    where result = arg1 + arg2
          arg1 = getArg machine 1
          arg2 = getArg machine 2
runOpcode 2 machine = return $ setAtDestination machine result
    where result = arg1 * arg2
          arg1 = getArg machine 1
          arg2 = getArg machine 2
runOpcode 99 machine = Halted
runOpcode c _ = error $ "Unexpected opcode: " ++ (show c)
