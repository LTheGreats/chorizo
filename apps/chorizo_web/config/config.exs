# Since configuration is shared in umbrella projects, this file
# should only configure the :chorizo_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :chorizo_web,
  ecto_repos: [Chorizo.Repo],
  generators: [context_app: :chorizo, binary_id: true]

# Configures the endpoint
config :chorizo_web, ChorizoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6CXfENGdGzbuRI5LiAU492+be4cEoIZV1AWP658TtpK2sXFVFNnX3Pg+V2yL2yjt",
  render_errors: [view: ChorizoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ChorizoWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
