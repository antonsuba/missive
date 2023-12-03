defmodule MissiveApi.Repo do
  use Ecto.Repo,
    otp_app: :missive_api,
    adapter: Ecto.Adapters.Postgres
end
