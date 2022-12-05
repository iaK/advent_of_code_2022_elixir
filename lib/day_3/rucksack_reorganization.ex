defmodule Advent.Day3.RucksackReorganization do
  def sum_of_priorities(input) do
    input
      |> Enum.map(&(split_string_in_half(&1)))
      |> Enum.map(&(find_common(&1)))
      |> Enum.map(&(priority(&1)))
      |> Enum.sum()
  end

  def sum_of_badges(input) do
    input
      |> Enum.chunk_every(3)
      |> Enum.map(&(split_into_charstrings(&1)))
      |> Enum.map(&(find_common(&1)))
      |> Enum.map(&(priority(&1)))
      |> Enum.sum()
  end

  defp split_into_charstrings(input) do
    input
      |> Enum.map(&(String.codepoints(&1)))
  end

  defp priority(letter) do
      {index, _} = List.to_string(Enum.to_list(?a..?z)) <> List.to_string(Enum.to_list(?A..?Z))
        |> :binary.match(letter)

      index + 1
  end

  defp find_common([first, second]) do
    MapSet.intersection(Enum.into(first, MapSet.new), Enum.into(second, MapSet.new))
      |> MapSet.to_list
  end

  defp find_common([first, second, third]) do
    MapSet.intersection(Enum.into(find_common([first, second]), MapSet.new), Enum.into(third, MapSet.new))
      |> MapSet.to_list
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
  end

  defp split_string_in_half(string) do
    half_at = trunc(String.length(string) / 2)

    string
      |> String.codepoints()
      |> Enum.chunk_every(half_at)
      # |> Enum.map(&(Enum.join(&1)))
  end
end
