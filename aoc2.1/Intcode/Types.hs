module Intcode.Types
( Memory
, ProgramCounter
, Program (Halted, Running)
, IntcodeProgram (IntcodeProgram)
) where

type Memory = [Int]
type ProgramCounter = Int
data IntcodeProgram = IntcodeProgram { pc :: ProgramCounter
                                     , memory :: Memory
                                     } deriving (Show)
data Program a = Halted | Running a

instance Functor Program where
    fmap f Halted = Halted
    fmap f (Running a) = Running (f a)

instance Applicative Program where
    pure = Running
    Halted <*> _ = Halted
    (Running f) <*> a = fmap f a

instance Monad Program where
    return = Running
    Halted >>= f = Halted
    (Running a) >>= f = f a
