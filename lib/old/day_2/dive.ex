defmodule Advent.Day2.SimpleDive do
  defstruct horizontal: 0, depth: 0

  def determine_position(input) do
    input
      |> Enum.reduce(%__MODULE__{}, fn (item, carry) -> alter_position(item, carry) end)
      |> (fn(%__MODULE__{horizontal: horizontal, depth: depth}) -> horizontal * depth end).()
  end

  def alter_position(row, %__MODULE__{horizontal: horizontal, depth: depth}) do
    [instruction, length] = row
      |> String.split(" ")
      |> (fn ([instruction, length]) -> [instruction, elem(Integer.parse(length), 0)] end).()

    case instruction do
      "down" ->  %__MODULE__{horizontal: horizontal, depth: depth + length}
      "up" ->  %__MODULE__{horizontal: horizontal, depth: depth - length}
      "forward" ->  %__MODULE__{horizontal: horizontal + length, depth: depth}
    end
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
  end
end

defmodule Advent.Day2.ComplicatedDive do
  defstruct horizontal: 0, depth: 0, aim: 0

  def determine_position(input) do
    input
      |> Enum.reduce(%__MODULE__{}, fn (item, carry) -> alter_position(item, carry) end)
      |> (fn(%__MODULE__{horizontal: horizontal, depth: depth}) -> horizontal * depth end).()
  end

  def alter_position(row, %__MODULE__{horizontal: horizontal, depth: depth, aim: aim}) do
    [instruction, length] = row
      |> String.split(" ")
      |> (fn ([instruction, length]) -> [instruction, elem(Integer.parse(length), 0)] end).()

    case instruction do
      "down" ->  %__MODULE__{horizontal: horizontal, depth: depth, aim: aim + length}
      "up" ->  %__MODULE__{horizontal: horizontal, depth: depth, aim: aim - length}
      "forward" ->  %__MODULE__{horizontal: horizontal + length, depth: depth + (aim * length), aim: aim}
    end
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
  end
end
