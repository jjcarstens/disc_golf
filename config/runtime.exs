import Config

config :disc_golf, DiscGolfWeb.Endpoint,
  server: true,
  http: [port: {:system, "PORT"}],
  url: [host: "dic.golf", port: 443],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  live_view: [signing_salt: System.get_env("LIVEVIEW_SIGNING_SALT")]
