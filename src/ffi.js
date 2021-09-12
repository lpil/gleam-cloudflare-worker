export function add_fetch_event_listener(handleRequest) {
  addEventListener("fetch", (event) => {
    event.respondWith(handleRequest(event.request));
  });
}

export function response(status, headersList, body) {
  let headers = new Headers();
  for (let [k, v] of headersList) headers.append(k, v);
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
