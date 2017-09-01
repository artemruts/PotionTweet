defmodule StringEnum do
  use ExUnit.Case
  import PotionTweet.StringEnum

  test "Will not fail on an empty string" do
    str = pick_string("")
    assert str == ""
  end
end