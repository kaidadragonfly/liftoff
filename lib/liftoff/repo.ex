defmodule Liftoff.Repo do
  use Ecto.Repo,
    otp_app: :liftoff,
    adapter: Ecto.Adapters.Postgres
end
