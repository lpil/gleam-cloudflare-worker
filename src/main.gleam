import cloudflare/worker.{Request, Response}
import gleam/javascript/promise.{Promise}
import gleam/string
import gleam/float
import openweathermap

pub fn main() {
  worker.add_fetch_event_listener(handle_fetch)
}

fn handle_fetch(request: Request) -> Promise(Response) {
  let lat = worker.latitude(request)
  let lon = worker.longitude(request)
  openweathermap.get_temperature(lat, lon)
  |> promise.map(fn(temp) {
    let body = make_body(worker.city(request), temp)
    worker.response(200, [#("x-powered-by", "Gleam")], body)
  })
}

fn make_body(city: String, temp: Result(Float, Nil)) -> String {
  let message = case temp {
    Ok(temp) -> {
      let temp = float.to_string(temp)
      string.concat(["It's ", temp, " degrees celsius in ", city, " right now."])
    }
    Error(Nil) -> string.concat(["I think you're currently in ", city, "."])
  }
  let body =
    string.concat([
      "Hello from Gleam on Cloudflare Workers ✨\n\n",
      message,
      "\nI hope you're having a great time over there!",
    ])
}
