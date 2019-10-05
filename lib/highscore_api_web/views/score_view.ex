defmodule HighscoreApiWeb.ScoreView do
  use HighscoreApiWeb, :view
  alias HighscoreApiWeb.ScoreView

  def render("index.json", %{scores: scores}) do
    %{data: render_many(scores, ScoreView, "score.json")}
  end

  def render("show.json", %{score: score}) do
    %{data: render_one(score, ScoreView, "score.json")}
  end

  def render("score.json", %{score: score}) do
    %{id: score.id,
      name: score.name,
      score: score.score}
  end
end
