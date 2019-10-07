defmodule HighscoreApi.Repo.Migrations.AddDifficultyToScore do
  use Ecto.Migration

  def change do
      alter table(:scores) do
        add :difficulty, :string
      end
  end
end
