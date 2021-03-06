module Flow.Actions.Insert.Task (event) where

import Graphics.Vty.Input.Events
import Flow.State

import qualified Flow.Actions.Insert.Task.Create as Create
import qualified Flow.Actions.Insert.Task.Edit as Edit

event :: Event -> Stateful
event (EvKey KEsc _) s = write =<< removeBlank =<< normalMode s
event (EvKey KBS _) s = insertBS s
event (EvKey (KChar char) _) s = insertCurrent char s

event e s = case mode s of
    Insert CreateTask -> Create.event e s
    Insert EditTask -> Edit.event e s
    _ -> return s
