defmodule Thousand.Repo do
  use Ecto.Repo,
    otp_app: :thousand,
    adapter: Ecto.Adapters.Postgres
end
