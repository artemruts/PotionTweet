defmodule FileReaderTest do
  use ExUnit.Case
  import PotionTweet.FileReader
  import Mock

  doctest PotionTweet.FileReader

  test "Passing a file should return a string" do
    file_path = Path.join(:code.priv_dir(:potion_tweet), "tweets.txt")
    str = get_strings_to_tweet(file_path)
    assert str != nil
  end

  test "Will not return a line longer than 140 characters" do
    file_path = Path.join(:code.priv_dir(:potion_tweet), "test/tweets.txt")
    str = get_strings_to_tweet(file_path)
    assert str == "Valid string"
  end

  test "String should be trimmed" do
    with_mock File, [read!: fn(_) -> " trimmed string  " end] do
      str = get_strings_to_tweet("_")
      assert str == "trimmed string"
    end
  end
end