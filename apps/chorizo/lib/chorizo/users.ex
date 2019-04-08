defmodule Chorizo.Users do
  def authenticate("nobody@example.com", "foobarbaz") do
    {:ok, "token12345"}
  end
  def authenticate(_email, _password) do
    {:error, "Authentication failed"}
  end
end
