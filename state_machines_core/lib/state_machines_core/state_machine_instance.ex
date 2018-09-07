defmodule StateMachines.Core.StateMachine.Instance do
  alias StateMachines.Core.StateMachine

  use GenServer

  def new(name, edges) do
    GenServer.start_link(__MODULE__, %StateMachine{name: name, edges: edges})
  end

  def get_state(state_machine_instance) do
    GenServer.call(state_machine_instance, :get_state)
  end

  def do_transition(state_machine_instance, transition) do
    GenServer.cast(state_machine_instance, {:do_transition, transition})
  end

  @impl true
  def init(state_machine) do
    {:ok, state_machine}
  end

  @impl true
  def handle_call(:get_state, _from, state_machine) do
    {:reply, StateMachine.get_state(state_machine), state_machine}
  end

  @iml true
  def handle_cast({:do_transition, transition}, state_machine) do
    with {:ok, transitioned_state_machine} <- StateMachine.do_transition(state_machine, transition)
    do
      {:noreply, transitioned_state_machine}
    else
      _ -> {:noreply, state_machine} # on error, do not change state.
    end
  end
end
