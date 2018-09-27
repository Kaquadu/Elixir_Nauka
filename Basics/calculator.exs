defmodule Calculator do
  def sum(a,b) do
    a + b
  end
  def sub(a,b) do
    a - b
  end
  def mul(a, b) do
    a * b
  end
  def div(a, 0), do: "incorrect"
  def div(a, b) do
    a / b
  end
  def factorial(0), do: 1
  def factorial(n) do
    n * (n - 1)
  end
  def sqrt(n) do
    :math.sqrt(n)
  end
end

IO.puts (Calculator.sqrt(6))
