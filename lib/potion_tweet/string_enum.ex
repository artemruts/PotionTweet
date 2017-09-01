defmodule PotionTweet.StringEnum do
  def pick_string(list) do
    list
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&String.length(&1) <= 140)
    |> Enum.random()
  end
end