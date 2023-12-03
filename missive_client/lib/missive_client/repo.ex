defmodule MissiveClient.Repo do
  use Ecto.Repo,
    otp_app: :missive_client,
    adapter: Ecto.Adapters.Postgres
end
