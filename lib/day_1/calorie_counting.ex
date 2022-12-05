defmodule Advent.Day1.CalorieCounting do

  def most_calories(input) do
    input
      |> calculate_most_calories()
  end

  def top_three_calories(input) do
    input
      |> calculate_top_three_calories()
  end

  def calculate_most_calories(input) do
    input
      |> Enum.map(&Enum.sum(&1))
      |> Enum.max()
  end

  def calculate_top_three_calories(input) do
    input
      |> Enum.map(&Enum.sum(&1))
      |> Enum.sort(:desc)
      |> Enum.take(3)
      |> Enum.sum()
  end

  def parse_input(input) do
    input
      |> String.split("\n\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.map(&(String.split(&1)))
      |> Enum.map(&(Enum.map(&1, fn (s) -> string_to_int(s) end)))
  end

  def string_to_int(input) do
    integer = input
      |> Integer.parse()

    elem(integer, 0)
  end
end
