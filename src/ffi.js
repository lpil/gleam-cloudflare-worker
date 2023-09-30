import { Ok, Error as Err } from "./gleam.mjs";

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

export function country(request) {
  return request.cf.country;
}

export function latitude(request) {
  return request.cf.latitude;
}

export function longitude(request) {
  return request.cf.longitude;
}

export function open_weather_map_api_key() {
  return; // Injected by CloudFlare Workers secrets
}

export function read_environment(env, key) {
  const value = env[key];
  return value ? new Ok(value) : new Err(undefined);
}
