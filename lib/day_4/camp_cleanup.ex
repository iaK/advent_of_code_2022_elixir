defmodule Advent.Day4.CampCleanup do
  def overlapping_fully(input) do
    input
      |> Enum.filter(&(overlaps_fully?(&1)))
      |> Enum.count()
  end

  def overlapping_partly(input) do
    input
      |> Enum.filter(&(overlaps_partly?(&1)))
      |> Enum.count()
  end

  defp overlaps_partly?([first, second]) do
    intersection = MapSet.intersection(Enum.into(first, MapSet.new), Enum.into(second, MapSet.new))

    MapSet.size(intersection) > 0
  end

  defp overlaps_fully?([first, second]) do
    first_map_set = MapSet.new(first)
    second_map_set = MapSet.new(second)

    shortest = case (MapSet.size(first_map_set) < MapSet.size(second_map_set)) do
      true -> first_map_set
      _ -> second_map_set
    end

    MapSet.size(shortest) == MapSet.size(MapSet.intersection(first_map_set, second_map_set))
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.map(&(String.split(&1, ",")))
      |> Enum.map(&(make_ranges(&1)))
  end

  defp make_ranges([first, second]) do
    [
      make_range(String.split(first, "-")),
      make_range(String.split(second, "-"))
    ]
  end

  defp make_range([starting, ending]) do
    Range.new(String.to_integer(starting), String.to_integer(ending))
  end
end
