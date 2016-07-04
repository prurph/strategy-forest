defmodule StrategyForest.Router do
  use StrategyForest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/", StrategyForest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "api/v1", StrategyForest do
    pipe_through :api
  end

  # Other scopes may use custom stacks.
  # scope "/api", StrategyForest do
  #   pipe_through :api
  # end
end
