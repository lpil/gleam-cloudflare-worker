import cloudflare/workers.{Environment, ExecutionContext, Request, Response}
import gleam/javascript/promise.{Promise}
import gleam/string
import gleam/float
import openweathermap

pub fn handle_request(
  request: Request,
  env: Environment,
  _ctx: ExecutionContext,
) -> Promise(Response) {
  let assert Ok(api_key) =
    workers.read_environment(env, "OPEN_WEATHER_MAP_API_KEY")

  let lat = workers.latitude(request)
  let lon = workers.longitude(request)
  use temp <- promise.map(openweathermap.get_temperature(lat, lon, api_key))

  let body = make_body(workers.city(request), temp)
  workers.response(200, [#("x-powered-by", "Gleam")], body)
}

fn make_body(city: String, temp: Result(Float, Nil)) -> String {
  let message = case temp {
    Ok(temp) -> {
      let temp = float.to_string(temp)
      "It's " <> temp <> " degrees celsius in " <> city <> " right now."
    }
    Error(Nil) -> "I think you're currently in " <> city <> "."
  }
  string.concat([
    "Hello from Gleam on Cloudflare Workers ✨\n\n",
    message,
    "\nI hope you're having a great time over there!",
  ])
}
