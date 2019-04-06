# Since configuration is shared in umbrella projects, this file
# should only configure the :chorizo application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :chorizo, Chorizo.Repo,
  url: "ecto://localhost/chorizo_test",
  pool: Ecto.Adapters.SQL.Sandbox
