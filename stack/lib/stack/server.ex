defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, [h|t]) do
    { :reply, h, t } 
  end

  def handle_cast({:push, new_value}, current_list) do
    { :noreply, [new_value | current_list] } 
  end
end
