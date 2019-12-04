module Intcode.Types
( instructionLength
, Memory
, Opcode
, ProgramCounter
, MachineState (Halted, Running)
, IntcodeMachine (IntcodeMachine)
, pc
, memory
, getValueAt
, setValueAt
) where

import Safe (atMay)

instructionLength :: Int
instructionLength = 4

type Memory = [Int]
type Opcode = Int
type ProgramCounter = Int
data IntcodeMachine = IntcodeMachine { pc :: ProgramCounter
                                     , memory :: Memory
                                     } deriving (Show)
data MachineState a = Halted | Running a

instance Functor MachineState where
    fmap f (Running a) = Running (f a)
    fmap f Halted = Halted

instance Applicative MachineState where
    pure = Running
    Halted <*> _ = Halted
    (Running f) <*> a = fmap f a

instance Monad MachineState where
    return = Running
    Halted >>= f = Halted
    (Running a) >>= f = f a

getValueAt :: Memory -> Int -> Int
getValueAt mem i = checkExists $ atMay mem i 
    where checkExists (Just x) = x
          checkExists Nothing = error $ (++) "Invalid memory read: @" $ show i

setValueAt :: Memory -> Int -> Int -> Memory
setValueAt mem i x 
    | i >= length mem = error $ (++) "Invalid memory write: @" $ show i
    | otherwise = take i mem ++ [x] ++ drop (i + 1) mem
