defmodule PotionTweet.Scheduler do
  use Quantum.Scheduler,
    otp_app: :potion_tweet

  def schedule_file(schedule, file) do
    PotionTweet.Scheduler.add_job({
      schedule,
      fn -> PotionTweet.FileReader.get_strings_to_tweet(file) |> PotionTweet.Server.tweet end
    })
  end
end
