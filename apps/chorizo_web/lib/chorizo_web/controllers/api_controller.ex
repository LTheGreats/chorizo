defmodule ChorizoWeb.ApiController do
  use ChorizoWeb, :controller

  def authenticate(conn, %{"email" => email, "password" => password}) do
    case Chorizo.Users.authenticate(email, password) do
      {:ok, token} -> render_token(conn, token)
      {:error, _} -> render_authentication_failed(conn)
    end
  end

  defp render_token(conn, token) do
    json(conn, %{result: "success", message: "", token: token})
  end

  defp render_authentication_failed(conn) do
    json(conn, %{result: "error", message: "Authentication Failed", token: ""})
  end
end
