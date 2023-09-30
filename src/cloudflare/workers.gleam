pub type Request

pub type Response

pub type Environment

@external(javascript, "../ffi.js", "read_environment")
pub fn read_environment(env: Environment, name: String) -> Result(String, Nil)

pub type ExecutionContext

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
