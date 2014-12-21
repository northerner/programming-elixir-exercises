defmodule Stack do
  use Application

  def start(_type, _args) do
    {:ok, _id} = Stack.Supervisor.start_link(["a", "b", "c"])
  end
end
