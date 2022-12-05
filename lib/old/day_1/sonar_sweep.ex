defmodule Advent.Day1.SonarSweep do

  def number_of_increases([head | tail]) do
    [head | tail]
      |> Enum.reduce([head,0], fn (item, [prev, sum]) ->
        case item > prev do
          true -> [item, sum + 1]
          _ -> [item, sum]
        end
      end)
      |> Enum.at(1)
  end

  def number_of_triad_increases(input) do
    starting_values = {Enum.at(input, 0), Enum.at(input, 1), Enum.at(input, 2)}

    input
      |> Enum.reduce({starting_values, 0}, fn (item, {{first, second, third}, increases}) ->
        case Enum.sum([second, third, item]) > Enum.sum([first, second, third]) do
          true -> {{second, third, item}, increases + 1}
          _ -> {{second, third, item}, increases}
        end
      end)
      |> (fn ({_items, increases}) -> increases end).()
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.map(&(Integer.parse(&1)))
      |> Enum.map(&(elem(&1, 0)))
  end
end
