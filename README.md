# workers-gleam-template ✨

A batteries included template for kick starting a Gleam Cloudflare worker project.

## 🔋 Getting Started

This template uses Wrangler, the CloudFlare Workers CLI. If you are not already
familiar with the tool then I recommend that you get familiar with it, and
configure it to work with your [Cloudflare account](https://dash.cloudflare.com).
Documentation can be found [here][wrangler-docs].

[wrangler-docs]: https://developers.cloudflare.com/workers/tooling/wrangler/

To generate using Wrangler, run this command:

```sh
npx wrangler generate my-gleam-project https://github.com/lpil/gleam-cloudflare-worker
```

This example uses the OpenWeatherMap API, so create a file at `.dev.vars` with
an API key, and add it to CloudFlare Secrets if you wish to publish to
CloudFlare.

```sh
# Local development secret
echo "OPEN_WEATHER_MAP_API_KEY=your api key goes here" >> .dev.vars

# Cloudflare production secret
npx wrangler secret put OPEN_WEATHER_MAP_API_KEY
```

## 📝 Usage

```sh
# Run a local development server
npm run dev

# Deploy to Cloudflare
npm run deploy
```
