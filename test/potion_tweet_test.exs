defmodule PotionTweetTest do
  use ExUnit.Case
  doctest PotionTweet

  test "greets the world" do
    assert PotionTweet.hello() == :world
  end
end
