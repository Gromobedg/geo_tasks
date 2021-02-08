# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :geo_tasks,
  ecto_repos: [GeoTasks.Repo]

# Configures the endpoint
config :geo_tasks, GeoTasksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BRcoHS8mtSny/ubz1cofmEywuDs6TKldAakhW/sqY68KhvawlvHj7XoBhpC0MW/X",
  render_errors: [view: GeoTasksWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GeoTasks.PubSub,
  live_view: [signing_salt: "noWLZbI0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :geo_tasks, GeoTasksWeb.Auth.Guardian,
  issuer: "geo_tasks",
  secret_key: "Y9JMhX0kB5LHjfdt71oT1zYszxe6w2RlDcfUixkIWzLa3JgTOaX7URFAlNf+qGCA"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
