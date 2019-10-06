defmodule HighscoreApiWeb.ScoreController do
  use HighscoreApiWeb, :controller

  alias HighscoreApi.Game
  alias HighscoreApi.Game.Score

  action_fallback HighscoreApiWeb.FallbackController

  def index(conn, _params) do
    scores = Game.list_scores()
    render(conn, "index.json", scores: scores)
  end

  def create(conn, %{"score" => score_params}) do
    with {:ok, %Score{} = score} <- Game.create_score(score_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.score_path(conn, :show, score))
      |> render("show.json", score: score)
    end
  end

  def show(conn, %{"id" => id}) do
    score = Game.get_score!(id)
    render(conn, "show.json", score: score)
  end

  def update(conn, %{"id" => id, "score" => score_params}) do
    score = Game.get_score!(id)

    with {:ok, %Score{} = score} <- Game.update_score(score, score_params) do
      render(conn, "show.json", score: score)
    end
  end

  def delete(conn, %{"id" => id}) do
    score = Game.get_score!(id)

    with {:ok, %Score{}} <- Game.delete_score(score) do
      send_resp(conn, :no_content, "")
    end
  end

  def top(conn, params) do
    limit = params["limit"] || 20
    scores = Game.list_scores_top(limit)
    render(conn, "index.json", scores: scores)
  end
end
