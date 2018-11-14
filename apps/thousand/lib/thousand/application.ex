defmodule Thousand.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Thousand.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Thousand.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
