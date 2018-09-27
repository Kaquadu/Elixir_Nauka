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
  def factorial(0), do: (1)
  def factorial(n) do
    n * factorial(n - 1)
  end
  #square root
  def sqrt(n) when n >= 0 do
      :math.sqrt(n)
  end
  def sqrt(n) when n < 0 do
      Enum.join([to_string(:math.sqrt(abs(n))), " + i, ", to_string(:math.sqrt(abs(n))), " - i"])
  end

end


send(self(), {:fac, 5})

receive do
  {:add, [a, b]} -> IO.puts Calculator.sum(a,b)
  {:sub, [a, b]} -> IO.puts Calculator.sub(a,b)
  {:mul, [a, b]} -> IO.puts Calculator.mul(a,b)
  {:div, [a, b]} -> IO.puts Calculator.div(a,b)
  {:fac, a} -> IO.puts Calculator.factorial(a)
  {:sqrt, a} -> IO.puts Calculator.sqrt(a)
  {:another_case, a} -> IO.puts "Wrong!"
  {:another_case, [a,b]} -> IO.puts "Wrong!"
end
