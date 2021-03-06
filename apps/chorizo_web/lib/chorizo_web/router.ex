defmodule ChorizoWeb.Router do
  use ChorizoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChorizoWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/app", PageController, :app
  end

  scope "/api", ChorizoWeb do
    pipe_through :api

    post "/authenticate", ApiController, :authenticate
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChorizoWeb do
  #   pipe_through :api
  # end
end
