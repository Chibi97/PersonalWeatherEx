# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :personal_weather,
  ecto_repos: [PersonalWeather.Repo]

config :personal_weather, PersonalWeather.Guardian,
  issuer: "personal_weather",
  secret_key: "a4lUj3EpwbqpfyfGdnP71oOabcP9FvHI4CURwvwJOllqUbKY8fzcZeryVzAVOaFn"

# Configures the endpoint
config :personal_weather, PersonalWeatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k+oVSptoMjIbtfP6CqOTJvRkZMivmV23w2RwYPACfBqvbjElCzW7LSzu1t+PLEQf",
  render_errors: [view: PersonalWeatherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PersonalWeather.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
