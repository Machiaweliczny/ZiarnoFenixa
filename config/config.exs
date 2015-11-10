# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :ziarno_fenixa, ZiarnoFenixa.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "ziarno_fenixa_repo",
  url: System.get_env("DATABASE_URL"),
  size: 20

# Configures the endpoint
config :ziarno_fenixa, ZiarnoFenixa.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "+GrLlezPLAExi7quEBoBgsQ3+v5VDcehqVyRalkdzp/+rM5nyziZ/ii7NVIudtqf",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ZiarnoFenixa.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :phoenix, :template_engines,
  slim: PhoenixSlim.Engine
