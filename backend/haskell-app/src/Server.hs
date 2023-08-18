module Server
    ( server
    , helloHandler
    , imageHandler
    ) where

import Servant
import Codec.Picture
import Data.ByteString.Char8 as B
import API

-- なんかわからんがこういう書き方をしないとAPIを複数定義できないらしい :<|> でつなぐ
server :: Server MyAPI
server = helloHandler
   :<|> imageHandler

-- ただHello, World!を返すだけのAPI
helloHandler :: Handler String
helloHandler = return "Hello, World!"

-- 画像を受け取ってグレースケールに変換して返すAPI
imageHandler :: ByteString -> Handler ByteString

imageHandler imgData =
    case decodeImage imgData of
        Left err -> throwError err500 { errBody = fromStrict . B.pack $ "Failed to decode image: " ++ err }
        Right dynamicImg -> return . toStrict . encodePng . imageToGrayScale $ dynamicImg

-- 画像をグレースケールに変換する処理
imageToGrayScale :: DynamicImage -> Image Pixel8
imageToGrayScale img = pixelMap computeLuma (convertRGB8 img)
  where
    computeLuma (PixelRGB8 r g b) = round (fromIntegral r * 0.3 + fromIntegral g * 0.59 + fromIntegral b * 0.11)
