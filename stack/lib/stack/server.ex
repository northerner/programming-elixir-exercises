defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, [h|t]) do
    { :reply, h, t } 
  end
end
