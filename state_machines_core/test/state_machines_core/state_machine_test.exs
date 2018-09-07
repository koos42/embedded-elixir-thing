defmodule StateMachines.Core.StateMachineTest do
  use ExUnit.Case

  alias StateMachines.Core.StateMachine
  import StateMachine
  doctest StateMachine

  @state_machine %StateMachine{
    name: "test",
    edges: [
      {:initial_state, "init", "off"},
      {"off", "toggle", "on"},
      {"on", "toggle", "off"}
    ],
    state: :initial_state
  }

  describe "do_transition/2" do
    test "sending the init transition, tranistions the state machine to a new state" do
      {:ok, state_machine} = do_transition(@state_machine, "init")
      assert state_machine.state == "off"
    end

    test "calling for an unknown transition on a state machine returns an error tuple" do
      assert {:error, :no_matching_transition_edge} == do_transition(@state_machine, "foo")
    end
  end

  describe "list_all_states/1" do
    test "lists all unique states" do
      all_states = list_all_states(@state_machine) |> Enum.sort
      expected_states = [:initial_state, "on", "off"] |> Enum.sort
      assert all_states == expected_states
    end
  end
end
