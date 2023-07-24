defmodule Liftoff.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiftoffWeb.Telemetry,
      # Start the Ecto repository
      Liftoff.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Liftoff.PubSub},
      # Start Finch
      {Finch, name: Liftoff.Finch},
      # Start the Endpoint (http/https)
      LiftoffWeb.Endpoint
      # Start a worker by calling: Liftoff.Worker.start_link(arg)
      # {Liftoff.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Liftoff.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiftoffWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
