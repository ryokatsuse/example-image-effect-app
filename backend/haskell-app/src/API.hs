{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module API where

import Servant
import Data.ByteString (ByteString)

-- なんかわからんがこういう書き方をしないとAPIを複数定義できないらしい :<|> でつなぐ
type MyAPI = "hello" :> Get '[PlainText] String
       :<|> "image" :> ReqBody '[OctetStream] ByteString
                    :> Post '[OctetStream] ByteString

myAPI :: Proxy MyAPI
myAPI = Proxy
