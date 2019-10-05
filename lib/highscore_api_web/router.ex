defmodule HighscoreApiWeb.Router do
  use HighscoreApiWeb, :router
  alias HighscoreApiWeb.PageController
  alias HighscoreApiWeb.ScoreController

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    resources "/game/scores", ScoreController, only: [:index, :show, :create]
  end

  scope "/", HighscoreApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HighscoreApiWeb do
  #   pipe_through :api
  # end
end
