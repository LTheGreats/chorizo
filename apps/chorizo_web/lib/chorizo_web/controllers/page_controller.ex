defmodule ChorizoWeb.PageController do
  use ChorizoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", layout: {ChorizoWeb.LayoutView, "page.html"})
  end

  def app(conn, _params) do
    render(conn, "app.html")
  end
end
