defmodule RateLimitedClientTest do
  use ExUnit.Case
  doctest RateLimitedClient

  test "greets the world" do
    assert RateLimitedClient.hello() == :world
  end
end
