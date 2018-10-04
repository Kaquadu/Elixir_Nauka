defmodule Circle do
  @moduledoc "Calculates area and circumference of a circle."

  @pi 3.14159

  @spec area(number) :: number
  @doc "Calculates area of a circle."
  def area(r), do: r*r*@pi

  @spec circumference(number) :: number
  @doc "Calculates circumference of a circle."
  def circumference(r), do: r*r*@pi*2

end
