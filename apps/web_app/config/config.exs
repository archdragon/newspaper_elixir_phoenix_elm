# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :web_app,
  ecto_repos: [WebApp.Repo]

# Configures the endpoint
config :web_app, WebApp.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Y11hsC7JCXpOJiAqL4jgPAwLRMxFJ6WFqsXuZZpuoRhNicbpyvy3xYNq5ITRMjhf",
  render_errors: [view: WebApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WebApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
