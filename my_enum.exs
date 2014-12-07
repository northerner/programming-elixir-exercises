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

  def split(list, count), do: split(list, count, [])
  defp split(remaining_list, 0, new_list), do: {new_list, remaining_list}
  defp split([h|t], count, new_list), do: split(t, count-1, [h|new_list])

  def take(list, count), do: take(list, count, [])
  defp take(_, 0, new_list), do: new_list
  defp take([h|t], count, new_list), do: take(t, count-1, [h|new_list])
end
