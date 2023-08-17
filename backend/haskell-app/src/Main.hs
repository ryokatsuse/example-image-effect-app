{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import Network.Wai.Handler.Warp (run)
import Servant

type MyAPI = Get '[PlainText] String

myAPI :: Proxy MyAPI
myAPI = Proxy

server :: Server MyAPI
server = return "Hello, World!"

app :: Application
app = serve myAPI server

main :: IO ()
main = run 8080 app