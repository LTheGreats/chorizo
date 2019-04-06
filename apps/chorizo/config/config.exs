# Since configuration is shared in umbrella projects, this file
# should only configure the :chorizo application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :chorizo,
  ecto_repos: [Chorizo.Repo]

import_config "#{Mix.env()}.exs"
