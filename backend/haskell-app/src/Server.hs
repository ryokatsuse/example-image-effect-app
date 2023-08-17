module Server where

import Servant
import API

server :: Server MyAPI
server = return "Hello, World!"
