defmodule Chorizo.Repo do
  use Ecto.Repo,
    otp_app: :chorizo,
    adapter: Ecto.Adapters.Postgres
end
