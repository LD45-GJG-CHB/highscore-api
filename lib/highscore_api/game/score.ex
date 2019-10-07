defmodule HighscoreApi.Game.Score do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scores" do
    field :name, :string
    field :score, :integer
    field :difficulty, :string

    timestamps()

    field :place, :integer, virtual: true
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [:name, :score, :difficulty])
    |> validate_required([:name, :score])
  end
end
