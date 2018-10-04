defmodule Calc_server do
  def init_server(arg1) do
    Task.start_link(fn -> loop(arg1, agr2) end)
  end

  defp loop(state) do
    receive do
      {:add, a} ->
        IO.puts Calculator.sum(state, a)
        loop(state)
      {:sub, a} ->
        IO.puts Calculator.sub(state, a)
        loop(state)
      {:mul, a} ->
        IO.puts Calculator.mul(state, a)
        loop(state)
      {:div, a} ->
        IO.puts Calculator.div(state, a)
        loop(state)
      {:fac} ->
        IO.puts Calculator.factorial(state)
        loop(state)
      {:sqrt} ->
        IO.puts Calculator.sqrt(state)
        loop(state)
      {:another_case, a} ->
        IO.puts "Wrong!"
        loop(state)
      {:another_case} ->
        IO.puts "Wrong!"
        loop(state)
    end
  end
end

defmodule Calculator do
  def sum(a,b) do a + b end
  def sub(a,b) do a - b end
  def mul(a,b) do a * b end
  def div(a,0), do: "invalid argument"
  def div(a,b) do a / b end
  def factorial(0), do: 1
  def factorial(n) when n > 0 do n*factorial(n-1) end
  def sqrt(n) when n>=0 do :math.sqrt(n) end
  #def sqrt(n) when n<0 do
  #  Enum.join([to_string(:math.sqrt(abs(n))), " + i, ", to_string(:math.sqrt(abs(n))), " - i"])
  #end
end

Calc_server.init_server(0)
