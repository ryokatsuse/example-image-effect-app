module Main where

import Network.Wai.Handler.Warp (run)
import Servant

import API
import Server

main :: IO ()
main = do
    putStrLn "Starting server on port 8080"
    run 8080 (serve myAPI server)