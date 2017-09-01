defmodule PotionTweet.FileReader do
  @doc """
  This function will take path to the file and find a string
  that can be tweeted out.

  It will trim all string, and eliminate any strings
  larger than 140 characters.

  iex> PotionTweet.FileReader.get_strings_to_tweet("priv/test/tweets.txt")
  "Valid string"
  """
  def get_strings_to_tweet(path) do
    File.read!(path)
    |> PotionTweet.StringEnum.pick_string
  end
end