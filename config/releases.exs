import Config

config :disc_golf, DiscGolfWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: "dic.golf", port: 443],
  live_view: [signing_salt: {:system, "LIVEVIEW_SIGNING_SALT"}],
  secret_key_base: {:system, "SECRET_KEY_BASE"}
