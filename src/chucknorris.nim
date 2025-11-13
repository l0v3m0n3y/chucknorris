import asyncdispatch, httpclient, json, strutils
const api = "https://api.chucknorris.io"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "api.chucknorris.io",
    "accept": "application/json"
})

proc random_jokes*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/jokes/random")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc jokes_categories*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/jokes/categories")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc jokes_by_category*(category:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/jokes/random?category=" & category)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc search_jokes*(query:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/jokes/search?query=" & query)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
