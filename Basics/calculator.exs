defmodule Calculator do
  #sum
  def sum(a,b) do
    (a + b)
  end
  #substraction
  def sub(a,b) do
    (a - b)
  end
  #multiplication
  def mul(a, b) do
    (a * b)
  end
  #div
  def div(a, 0), do: "incorrect"
  def div(a, b) do
    (a / b)
  end
  #factorial
  def factorial(0), do:  (1)
  def factorial(n) do
    n * (n - 1)
  end
  #square root
  def sqrt(n) when n >= 0 do
      :math.sqrt(n)
  end
  def sqrt(n) when n < 0 do
      Enum.join([to_string(:math.sqrt(abs(n))), " + i, ", to_string(:math.sqrt(abs(n))), " - i"])
  end

end

IO.puts Calculator.sqrt(-5)
IO.puts Calculator.div(5, 0)
IO.puts Calculator.sub(6, 2)
