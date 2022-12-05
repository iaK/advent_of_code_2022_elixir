defmodule Advent.Day2.RockPaperScissors do
  def total_score(input) do
    input
      |> Enum.map(&(points_of_game(&1)))
      |> Enum.sum()
  end

  def do_strategy(input) do
    input
      |> Enum.map(&(win_or_loose(&1)))
      |> total_score()
  end

  def win_or_loose(hand) do
    [opponent, win_or_loose] = hand
      |> String.split(" ")
      |> Enum.filter(&(&1 != ""))

    case (win_or_loose) do
      "X" -> opponent <> " " <> loose(opponent)
      "Y" -> opponent <> " " <> draw(opponent)
      "Z" -> opponent <> " " <> win(opponent)
    end
  end

  def points_of_game(game) do
    case (game) do
      "A X" -> 4
      "A Y" -> 8
      "A Z" -> 3
      "B X" -> 1
      "B Y" -> 5
      "B Z" -> 9
      "C X" -> 7
      "C Y" -> 2
      "C Z" -> 6
    end
  end

  def win(hand) do
    case hand do
      "A" -> "Y"
      "B" -> "Z"
      "C" -> "X"
    end
  end

  def loose(hand) do
    case hand do
      "A" -> "Z"
      "B" -> "X"
      "C" -> "Y"
    end
  end

  def draw(hand) do
    case hand do
      "A" -> "X"
      "B" -> "Y"
      "C" -> "Z"
    end
  end

  def parse_input(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
  end
end
