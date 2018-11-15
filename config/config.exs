# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tracer,
  ecto_repos: [Tracer.Repo]

# Configures the endpoint
config :tracer, Tracer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wo9td0euAMBoWjQWQVgx58wBtIpnZyrN2Sxha/qE2kadshLVqbpqt4ZJjEiwQm9Q",
  render_errors: [view: Tracer.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tracer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
