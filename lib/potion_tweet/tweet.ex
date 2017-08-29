defmodule PotionTweet.Tweet do
  def send(str) do
    ExTwitter.update(str)
  end

  def send_random(file) do
    PotionTweet.FileReader.get_strings_to_tweet(file)
    |> send
  end
end