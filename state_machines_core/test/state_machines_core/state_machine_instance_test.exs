defmodule StateMachines.Core.StateMachine.InstanceTest do
  use ExUnit.Case
  doctest StateMachines.Core

  alias StateMachines.Core.StateMachine.Instance

  test "creates a new instance and transitions state" do
    {:ok, instance} = Instance.new( "test", [{:initial_state, "transition_1", "success"}])
    Instance.do_transition(instance, "transition_1")
    assert "success" == Instance.get_state(instance)
  end

  test "creates a new instance and does not transition by way of bad state" do
    {:ok, instance} = Instance.new("test", [{:initial_state, "foo", "impossible"}])
    Instance.do_transition(instance, "bad_transition")
    assert :initial_state = Instance.get_state(instance)
  end
end
