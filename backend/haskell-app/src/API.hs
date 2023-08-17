{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module API where

import Servant

type MyAPI = "hello" :> Get '[PlainText] String

myAPI :: Proxy MyAPI
myAPI = Proxy
