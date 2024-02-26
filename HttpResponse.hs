{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module HttpResponse where

import Network.HTTP.Simple (httpJSON, getResponseBody, setRequestHeader, parseRequest)
import Data.Aeson (FromJSON, parseJSON, withObject, (.:), (.:?))
import Data.Text (Text, unpack)
import GHC.Generics

data Response = Response  
  { icon_url :: Text
  , identifier :: Text --id é palavra reservada :/
  , url :: Text
  , value :: Text
  } deriving (Show, Generic)


instance FromJSON Response where
    parseJSON = withObject "Response" $ \v -> Response
        <$> v .: "icon_url"
        <*> v .: "id" 
        <*> v .: "url"
        <*> v .: "value"


getResponse :: Text -> IO (Response)
getResponse url = do
    initialRequest <- parseRequest (unpack url)
    let request = setRequestHeader "User-Agent" ["MyHaskellApp/0.1"] initialRequest
    response <- httpJSON request
    return (getResponseBody response :: Response)
    -- let url = "https://api.chucknorris.io/jokes/random"
-- initialRequest <- parseRequest url
-- let request = setRequestHeader "User-Agent" ["MyHaskellApp/0.1"] initialRequest
-- response <- httpJSON request
-- let jokes = getResponseBody response :: Response
-- print jokes