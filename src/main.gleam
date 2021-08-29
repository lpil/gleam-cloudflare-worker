import cloudflare/worker.{Request, Response}
import gleam/string

pub fn main() {
  worker.add_fetch_event_listener(handle_fetch)
}

fn handle_fetch(request: Request) -> Response {
  let body =
    string.concat([
      "Hello from Gleam on Cloudflare Workers ✨\n\n",
      "I hope you're having a great time over there in ",
      worker.city(request),
      "!",
    ])
  worker.response(200, [], body)
}
