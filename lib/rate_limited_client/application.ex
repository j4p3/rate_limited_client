defmodule RateLimitedClient.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias RateLimitedClient.RateLimiter

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: RateLimiter.TaskSupervisor},
      {RateLimiter.get_rate_limiter(),
       %{
         timeframe_max_requests: RateLimiter.get_requests_per_timeframe(),
         timeframe_units: RateLimiter.get_timeframe_unit(),
         timeframe: RateLimiter.get_timeframe()
       }}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RateLimitedClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
