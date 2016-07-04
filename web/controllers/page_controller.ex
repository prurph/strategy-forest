defmodule StrategyForest.PageController do
  use StrategyForest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
