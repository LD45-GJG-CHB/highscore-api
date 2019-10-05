defmodule HighscoreApi.Repo do
  use Ecto.Repo,
    otp_app: :highscore_api,
    adapter: Ecto.Adapters.Postgres
end
