import Config

config :disc_golf, DiscGolfWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: "dic.golf", port: 443],
  secret_key_base: {:system, "SECRET_KEY_BASE"},
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  live_view: [signing_salt: {:system, "LIVEVIEW_SIGNING_SALT"}]
