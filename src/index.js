import { handle_request } from "./worker.mjs";

export default {
  async fetch(request, env, ctx) {
    console.log("request", request);
    console.log("env", env);
    console.log("ctx", ctx);

    return handle_request(request, env, ctx);
  },
};
