defmodule StateMachines.Core.StateMachine do

  defstruct [
    :name, # name of this state machine
    edges: [], # blank state machine has no transitions
    state: :initial_state # default initial state for all state machines
  ]

  @type state :: String.t | :initial_state
  @type transition :: String.t
  @type edge :: {state, transition, state}

  @type t :: %__MODULE__{
    name: String.t,
    edges: [edge],
    state: state
  }

  def list_all_states(state_machine) do
    state_machine.edges
    |> Enum.flat_map(fn {s_state, _, t_state} -> [s_state, t_state] end)
    |> Enum.uniq
  end

  def get_state(%__MODULE__{state: state}), do: state

  def do_transition(state_machine, transition) do
    with {_state, _tranistion, new_state} <- find_edge(state_machine, transition),
    do: {:ok, %{state_machine | state: new_state}}
  end

  @bad_transition_tuple {:error, :no_matching_transition_edge}
  defp find_edge(state_machine, transition) do
    Enum.find(state_machine.edges, @bad_transition_tuple, fn({edge_state, edge_transition, _}) ->
      edge_state == state_machine.state && edge_transition == transition
    end)
  end
end
