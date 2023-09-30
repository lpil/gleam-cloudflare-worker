import gleam/javascript/promise.{Promise}

pub type Request

pub type Response

@external(javascript, "../ffi.js", "add_fetch_event_listener")
pub fn add_fetch_event_listener(
  listener: fn(Request) -> Promise(Response),
) -> Nil

@external(javascript, "../ffi.js", "response")
pub fn response(
  status: Int,
  headers: List(#(String, String)),
  body: String,
) -> Response

@external(javascript, "../ffi.js", "method")
pub fn method(req: Request) -> String

@external(javascript, "../ffi.js", "url")
pub fn url(req: Request) -> String

@external(javascript, "../ffi.js", "body")
pub fn body(req: Request) -> String

@external(javascript, "../ffi.js", "city")
pub fn city(req: Request) -> String

@external(javascript, "../ffi.js", "country")
pub fn country(req: Request) -> String

@external(javascript, "../ffi.js", "latitude")
pub fn latitude(req: Request) -> String

@external(javascript, "../ffi.js", "longitude")
pub fn longitude(req: Request) -> String
