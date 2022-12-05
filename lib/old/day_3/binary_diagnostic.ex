defmodule Advent.Day3.BinaryDiagnostic do
  def power_consumption(input) do
    gamma = get_rate(input, :positive)
    epsilon = get_rate(input, :negative)

    to_decimal(gamma) * to_decimal(epsilon)
  end

  def life_support_rating(input) do
    oxygen_generator_rating = input
      |> get_nested_rate(:positive)

    co2_scrubbing_rating = input
      |> get_nested_rate(:negative)

    to_decimal(oxygen_generator_rating) * to_decimal(co2_scrubbing_rating)
  end

  def get_nested_rate(input, type, carry \\ "") do
    byte = carry
      |> String.length
      |> avarage(input)
      |> get_byte(type)

    filtered = input
      |> Enum.filter(&(String.at(&1, String.length(carry)) == byte))

    case Enum.count(filtered) == 1 do
      false -> get_nested_rate(filtered, type, carry <> byte)
      true -> Enum.at(filtered, 0)
    end
  end

  defp to_decimal(binary) do
    binary
     |> Integer.parse(2)
     |> elem(0)
  end

  defp get_rate(input, type) do
    0..11
      |> Enum.map(&(avarage(&1, input)))
      |> Enum.map(&(get_byte(&1, type)))
      |> Enum.reduce(fn (item, carry) -> carry <> item end)
  end

  defp get_byte(%{zero: zero, one: one}, :negative) do
    case zero > one do
      true -> "1"
      false -> "0"
    end
  end

  defp get_byte(%{zero: zero, one: one}, :positive) do
    case one >= zero do
      true -> "1"
      false -> "0"
    end
  end

  defp avarage(position, input) do
    input
      |> Enum.map(&(String.at(&1, position)))
      |> Enum.map(&(String.to_integer(&1)))
      |> Enum.reduce(%{zero: 0, one: 0}, fn (item, %{zero: zero, one: one}) ->
        case item == 0 do
          true -> %{zero: zero + 1, one: one}
          false -> %{zero: zero, one: one + 1}
        end
      end)
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
  end
end
