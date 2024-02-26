module Main where

import System.IO
import Control.Monad (replicateM)
import Text.Read (readMaybe)
import Data.Maybe (fromMaybe)
import qualified Data.Text as T


import HttpResponse
import Statistics


main :: IO ()
main = do
 -- Define a quantidade de piadas pelo usuário
  hSetBuffering stdout NoBuffering 
  putStr "Digite o número de piadas desejado: \n"
  input <- getLine

  let numberOfJokes = fromMaybe 10 (readMaybe input)


  let url = "https://api.chucknorris.io/jokes/random"
  responses <- replicateM numberOfJokes (getResponse (T.pack url)) --url inicialmente é lida como uma String e a função getResponse espera um Text logo deve ter essa conversão. 

  putStrLn $ show numberOfJokes ++ "  piadas"
  mapM_ print responses

  printStatistics responses

  