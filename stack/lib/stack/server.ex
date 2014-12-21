defmodule Stack.Server do
  use GenServer

  #####
  # External API

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(new_value) do
    GenServer.cast __MODULE__, {:push, new_value}
  end

  ###
  # GenServer implementation
  def handle_call(:pop, _from, [h|t]) do
    { :reply, h, t } 
  end

  def handle_cast({:push, new_value}, current_list) do
    { :noreply, [new_value | current_list] } 
  end

  def init(stash_pid) do
    current_stack = Stack.Stash.get_value stash_pid
    { :ok, {:current_stack, stash_pid} }
  end

  def terminate(_reason, {current_stack, stash_pid}) do
    Stack.Stash.save_value stash_pid, current_stack
  end
end
