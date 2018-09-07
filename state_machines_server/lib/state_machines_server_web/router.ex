defmodule StateMachines.ServerWeb.Router do
  use StateMachines.ServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StateMachines.ServerWeb do
    pipe_through :api
  end
end
