{-# LANGUAGE OverloadedStrings #-}
module Statistics where

import Data.Text (Text, unpack, isInfixOf, toLower)
import Data.List (maximumBy, minimumBy)
import Data.Ord (comparing)
import HttpResponse 

jokeLength :: Text -> Int
jokeLength joke = length (unpack joke)

biggestJoke :: [Response] -> Response
biggestJoke responsesList = maximumBy (comparing (jokeLength . value)) responsesList

smallestJoke :: [Response] -> Response
smallestJoke responsesList = minimumBy (comparing (jokeLength . value)) responsesList

countChuckAppearances :: [Response] -> Int
countChuckAppearances responsesList =
  sum $ map (\currentJoke -> occurrencesInJoke currentJoke) responsesList
  where
    chuckWords = ["chuck norris", "chuck norris's", "chuck norris'"]
    toLowerText = toLower . value 

    occurrencesInJoke :: Response -> Int
    occurrencesInJoke joke =
      sum $ map (\word -> fromEnum $ word `isInfixOf` (toLowerText joke)) chuckWords

printStatistics :: [Response] -> IO ()
printStatistics responsesList = do
  putStrLn "\n\nLista de piadinhas:  "
  mapM_ (\currentJoke -> putStrLn $ "- " ++ unpack (value currentJoke) ++ "\n") responsesList -- "desenpacota" o objeto Response e imprime o atributo "value" de cada Response

  let longestJoke = biggestJoke responsesList
  let shortestJoke = smallestJoke responsesList
  let chuckAppearances = countChuckAppearances responsesList
  
  putStrLn $ "Piadinha de maior tamanho: " ++ show (value longestJoke) ++ "\n"
  putStrLn $ "Piadinha de menor tamanho: " ++ show (value shortestJoke) ++ "\n"
  putStrLn $ "Quantas vezes 'Chuck Norris' foi mencionado: " ++ show chuckAppearances