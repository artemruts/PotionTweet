defmodule PotionTweet.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    import Crontab.CronExpression

    children = [
      worker(PotionTweet.Scheduler, []),
      worker(PotionTweet.Server, [])
    ]

    opts = [strategy: :one_for_one, name: PotionTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    PotionTweet.Scheduler.schedule_file(
      ~e[* * * * *],
      Path.join(:code.priv_dir(:potion_tweet), "tweets.txt")
    )

    process

  end
end
