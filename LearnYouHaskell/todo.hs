module Main where
  import System.Environment   
  import System.Directory  
  import System.IO  
  import Data.List

  type TodoList = [String]
  type TodoAction = ([String] -> IO ())

  editTasks :: String -> (TodoList -> TodoList) -> IO ()
  editTasks fileName f = do
    handle <- openFile fileName ReadMode  
    (tempName, tempHandle) <- openTempFile "." "temp"  
    contents <- hGetContents handle  
    let todoTasks = lines contents
        updatedTasks = f todoTasks
    hPutStr tempHandle $ unlines updatedTasks
    hClose handle  
    hClose tempHandle  
    removeFile fileName  
    renameFile tempName fileName  

  add :: [String] -> IO ()
  add [fileName, todoItem]  = appendFile fileName (todoItem ++ "\n")

  view :: [String] -> IO ()  
  view [fileName] = do  
    contents <- readFile fileName  
    let todoTasks = lines contents  
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks  
    putStr $ unlines numberedTasks 

  remove :: Int -> TodoList -> TodoList
  remove number list = delete (list !! number) list

  removeCommand :: [String] -> IO ()  
  removeCommand [fileName, numberString] = editTasks fileName (remove $ read numberString)

  bump :: Int -> TodoList -> TodoList
  bump number list = let bumpingTask = (list !! number) in bumpingTask:(delete bumpingTask list)

  bumpCommand :: [String] -> IO ()
  bumpCommand [fileName, numberString] = editTasks fileName (bump $ read numberString)

  dispatch :: [(String, TodoAction)]  
  dispatch =  [ ("add", add)  
              , ("view", view)  
              , ("remove", removeCommand)  
              , ("bump", bumpCommand)
              ]  

  dispatchCommand :: Maybe TodoAction -> String -> [String] -> IO ()
  dispatchCommand Nothing command _ = putStrLn $ "Unknown command: " ++ command
  dispatchCommand (Just action) _ args = action args

  main = do  
      (command:args) <- getArgs  
      let maybeAction = lookup command dispatch  
      dispatchCommand maybeAction command args
