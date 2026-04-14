defmodule TinfoilDemoTest do
  use ExUnit.Case
  doctest TinfoilDemo

  test "greets the world" do
    assert TinfoilDemo.hello() == :world
  end
end
