defmodule MyEnum do
  def all?(list, func), do: all?(list, func, true)
  defp all?(_, _, false), do: false 
  defp all?([], _, true), do: true
  defp all?([h|t], func, true), do: all?(t, func, func.(h)) 

  def each([], _), do: :ok
  def each([h|t], func) do
    func.(h)
    each(t, func)
  end

  def filter(list, func), do: filter(list, func, [])
  def filter([h|t], func, new_list) do
    if func.(h) do
      filter(t, func, [h|new_list])
    else
      filter(t, func, new_list)
    end
  end
  def filter([], _, new_list), do: new_list
end
