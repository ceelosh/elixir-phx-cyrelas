defmodule Cyrelas.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Cyrelas.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Cyrelas.PubSub}
      # Start a worker by calling: Cyrelas.Worker.start_link(arg)
      # {Cyrelas.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Cyrelas.Supervisor)
  end
end
