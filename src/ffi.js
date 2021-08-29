export function add_fetch_event_listener(handleRequest) {
  addEventListener("fetch", (event) => {
    event.respondWith(handleRequest(event.request));
  });
}

export function response(status, headersList, body) {
  let headers = headersList
    .toArray()
    .reduce((h, [k, v]) => h.append(k, v), new Headers());
  return new Response(body, {
    status,
    headers,
  });
}

export function method(request) {
  return request.method;
}

export function url(request) {
  return request.url;
}

export function body(request) {
  return request.body;
}

export function city(request) {
  return request.cf.city;
}
