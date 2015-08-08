module OILR3.Instructions where

type Tid = Int -- Trav id


data Dim = Equ Int | GtE Int deriving (Show, Eq)
type Pred = (Dim, Dim, Dim, Dim)

-- ☠☠☠ DANGER WARNING DANGER WARNING DANGER WARNING DANGER ☠☠☠
-- before adding new instructions search for unsafeCoerce in 
-- HostCompile and read the attached warning
data Instr a b = 
      OILR Int
    -- Trav stack management
    -- ☠☠☠ DANGER: see warning above
    | DROT                  -- Drop Trav
    | CLRT                  -- Clear Trav stack
    -- Graph manipulation
    -- ☠☠☠ DANGER: see warning above
    | ADN a                 -- Add Node without Trav
    | ADE b a a             -- Add Edge between Nodes
    | DEN a                 -- Delete Node with id
    | DEE b                 -- Delete Edge with id
    | RTN a                 -- Set root flag on node
    | URN a                 -- unset root flag on node

    -- ☠☠☠ DANGER: see warning above
    | ANT                   -- Add Node and push Trav
    | AET                   -- Add Edge between top two Travs
    | DNT                   -- Delete Node in Trav
    | DET                   -- Delete Edge in Trav
    | DNE                   -- Delete Node and Edge in Trav
    -- Stack machine prims
    -- ☠☠☠ DANGER: see warning above
    | LIT Int               -- push literal on data stack
    | ADD                   -- add top two values on ds
    | SUB                   -- subtract top of stack from next on stack
    | SHL                   -- shift NoS left by ToS bits
    -- Definition
    -- ☠☠☠ DANGER: see warning above
    | DEF String
    | END
    -- Graph search
    -- ☠☠☠ DANGER: see warning above
    | LUN a Pred
    | LUE b a a
    -- flow control
    -- ☠☠☠ DANGER: see warning above
    | CAL String | ALP String -- call rule or proc once or as-long-as-possible
    | RET                   -- unconditinoal return from current rule or proc
    -- logical operators
    -- ☠☠☠ DANGER: see warning above
    | TRU  | FLS            -- set status register to true or false respectively
    deriving (Show, Eq)