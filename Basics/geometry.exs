defmodule Geometry do
  @pi 3.14159
  def area({:rectangle, a, b}) do
    a * b
  end
  def area({:circle, r}) do
    r * r * @pi
  end
  def area({:square, a}) do
    a * a
  end
  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
end

fun = &Geometry.area/1
IO.puts fun.({:circle, 4})
IO.puts Geometry.area({:square, 5})
IO.puts fun.({:rectangle, 4, 2})
IO.puts fun.({:triangle, 1, 2, 3})
