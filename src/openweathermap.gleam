//// Getting the temperature of a given location using
//// https://openweathermap.org/. Thanks openweathermap!

import gleam/javascript/promise.{Promise}
import gleam/dynamic.{DecodeError, Dynamic}
import gleam/http.{Get}
import gleam/http/request
import gleam/result
import gleam/fetch

pub fn get_temperature(
  lat: String,
  lon: String,
  api_key: String,
) -> Promise(Result(Float, Nil)) {
  let query = [
    #("lat", lat),
    #("lon", lon),
    #("units", "metric"),
    #("appid", api_key),
  ]
  let assert Ok(req) =
    request.to("https://api.openweathermap.org/data/2.5/weather")

  let req =
    req
    |> request.set_method(Get)
    |> request.set_query(query)

  use resp <- promise.try_await(
    fetch.send(req)
    |> promise.try_await(fetch.read_json_body)
    |> promise.map(result.nil_error),
  )

  resp.body
  |> decode_temperature
  |> result.nil_error
  |> promise.resolve
}

fn decode_temperature(json: Dynamic) -> Result(Float, List(DecodeError)) {
  dynamic.field("main", dynamic.field("temp", dynamic.float))(json)
}
