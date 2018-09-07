defmodule StateMachines.CoreTest do
  use ExUnit.Case
  doctest StateMachines.Core

  test "greets the world" do
    assert StateMachines.Core.hello() == :world
  end
end
