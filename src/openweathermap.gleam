//// Getting the temperature of a given location using
//// https://openweathermap.org/. Thanks openweathermap!

import gleam/javascript/promise.{Promise}
import gleam/dynamic.{DecodeError, Dynamic}
import gleam/http.{Get}
import gleam/result
import gleam/fetch

pub fn get_temperature(lat: String, lon: String) -> Promise(Result(Float, Nil)) {
  let query = [
    #("lat", lat),
    #("lon", lon),
    #("units", "metric"),
    #("appid", api_key()),
  ]
  http.default_req()
  |> http.set_method(Get)
  |> http.set_host("api.openweathermap.org")
  |> http.set_path("/data/2.5/weather")
  |> http.set_query(query)
  |> fetch.send
  |> promise.then_try(fetch.read_json_body)
  |> promise.map(result.nil_error)
  |> promise.then_try(fn(response: http.Response(Dynamic)) {
    response.body
    |> decode_temperature
    |> result.nil_error
    |> promise.resolve
  })
}

fn decode_temperature(json: Dynamic) -> Result(Float, DecodeError) {
  try main = dynamic.field(json, "main")
  try temp = dynamic.field(main, "temp")
  dynamic.float(temp)
}

external fn api_key() -> String =
  "./ffi.js" "open_weather_api_key"
