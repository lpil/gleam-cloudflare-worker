import gleam/javascript/promise.{Promise}

// request: {
//   "cf": {
//     "clientTcpRtt": 0,
//     "longitude": "0",
//     "httpProtocol": "HTTP/1.1",
//     "tlsCipher": "ECDHE-ECDSA-AES128-GCM-SHA256",
//     "continent": "EU",
//     "asn": 9105,
//     "clientAcceptEncoding": "gzip",
//     "country": "GB",
//     "tlsClientAuth": {
//       "certIssuerDNLegacy": "",
//       "certIssuerSKI": "",
//       "certSubjectDNRFC2253": "",
//       "certSubjectDNLegacy": "",
//       "certFingerprintSHA256": "",
//       "certNotBefore": "",
//       "certSKI": "",
//       "certSerial": "",
//       "certIssuerDN": "",
//       "certVerified": "NONE",
//       "certNotAfter": "",
//       "certSubjectDN": "",
//       "certPresented": "0",
//       "certRevoked": "0",
//       "certIssuerSerial": "",
//       "certIssuerDNRFC2253": "",
//       "certFingerprintSHA1": ""
//     },
//     "tlsExportedAuthenticator": {
//       "clientFinished": "c81fe95f9bca118c571267a8ac34fca5e97d687761b826011990887b869a616f",
//       "clientHandshake": "a4371aac55ca9fecb284202a08fb525a3f0461c1d85d91210efd1a1831a19fe9",
//       "serverHandshake": "b4544fb4ad5de2da8297dc14afe201c2daacd9e047c06bd0d9b654bf6eb5444d",
//       "serverFinished": "5c1e40f421d5013d42d7f78bd886110441f80bcd4884cee79bcae93366dda039"
//     },
//     "tlsVersion": "TLSv1.2",
//     "colo": "LHR",
//     "timezone": "Europe/London",
//     "region": "England",
//     "requestPriority": "",
//     "latitude": "0.60040",
//     "city": "London",
//     "regionCode": "ENG",
//     "postalCode": "LON",
//     "edgeRequestKeepAliveStatus": 1
//   },
//   "fetcher": {},
//   "redirect": "manual",
//   "headers": {},
//   "url": "https://gleam-cloudflare-worker.lpil.workers.dev/",
//   "method": "GET",
//   "bodyUsed": false,
//   "body": null
// }
pub external type Request

pub external type Response

pub external fn add_fetch_event_listener(
  fn(Request) -> Promise(Response),
) -> Nil =
  "../ffi.js" "add_fetch_event_listener"

pub external fn response(
  status: Int,
  headers: List(#(String, String)),
  body: String,
) -> Response =
  "../ffi.js" "response"

pub external fn method(Request) -> String =
  "../ffi.js" "method"

pub external fn url(Request) -> String =
  "../ffi.js" "url"

pub external fn body(Request) -> String =
  "../ffi.js" "body"

pub external fn city(Request) -> String =
  "../ffi.js" "city"
