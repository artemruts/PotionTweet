defmodule PotionTweet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    import Crontab.CronExpression

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: PotionTweet.Worker.start_link(arg)
      # {PotionTweet.Worker, arg},
      worker(PotionTweet.Scheduler, []),
      worker(PotionTweet.Server, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PotionTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    PotionTweet.Scheduler.schedule_file(
      ~e[* * * * *],
      Path.join(:code.priv_dir(:potion_tweet), "tweets.txt")
    )

    process

  end
end
