defmodule ThousandTest do
  use ExUnit.Case
  doctest Thousand

  test "greets the world" do
    assert Thousand.hello() == :world
  end
end
