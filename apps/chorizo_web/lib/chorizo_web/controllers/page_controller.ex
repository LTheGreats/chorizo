defmodule ChorizoWeb.PageController do
  use ChorizoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
