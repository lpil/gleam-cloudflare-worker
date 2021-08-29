const path = require("path");
const build = path.join(__dirname, "_build");

module.exports = {
  entry: path.join(build, "lib", "gleam_cloudflare_worker", "index.js"),
  output: {
    filename: "index.js",
    path: path.join(build, "dist"),
  },
  devtool: "cheap-module-source-map",
  mode: "development",
};
