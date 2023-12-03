defmodule MissiveClient.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MissiveClientWeb.Telemetry,
      # Start the Ecto repository
      # MissiveClient.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MissiveClient.PubSub},
      # Start Finch
      {Finch, name: MissiveClient.Finch},
      # Start the Endpoint (http/https)
      MissiveClientWeb.Endpoint
      # Start a worker by calling: MissiveClient.Worker.start_link(arg)
      # {MissiveClient.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MissiveClient.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MissiveClientWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
