defmodule ParticleServerTest do
  use ExUnit.Case
  doctest ParticleServer

  test "greets the world" do
    assert ParticleServer.hello() == :world
  end
end
