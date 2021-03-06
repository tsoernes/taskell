module Flow.Actions.Insert.List (event) where

import Graphics.Vty.Input.Events
import Flow.State

import qualified Flow.Actions.Insert.List.Create as Create
import qualified Flow.Actions.Insert.List.Edit as Edit

event :: Event -> Stateful
event e s = case mode s of
    Insert (CreateList _) -> Create.event e s
    Insert EditList -> Edit.event e s
    _ -> return s
