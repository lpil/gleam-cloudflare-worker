import gleam/javascript/promise.{Promise}
import gleam/dynamic.{DecodeError, Dynamic}
import gleam/http.{Get}
import gleam/result
import gleam/fetch

pub fn get_temperature(lat: String, lon: String) -> Promise(Result(Int, Nil)) {
  http.default_req()
  |> http.set_method(Get)
  |> http.set_host("api.openweathermap.org")
  |> http.set_path("/data/2.5/weather")
  |> http.set_query([
    #("lat", lat),
    #("lon", lon),
    #("units", "metric"),
    #("appid", api_key()),
  ])
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

fn decode_temperature(json: Dynamic) -> Result(Int, DecodeError) {
  try main = dynamic.field(json, "main")
  try temp = dynamic.field(main, "temp")
  dynamic.int(temp)
}

external fn api_key() -> String =
  "./ffi.js" "open_weather_api_key"
