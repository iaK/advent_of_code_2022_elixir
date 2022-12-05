defmodule Advent.Day4.Board do
  defstruct number: -1, picked: false

  def parse(input) do
    input
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.flat_map(&(String.split(&1, " ")))
      |> Enum.reject(&(&1 == " "))
      |> Enum.reject(&(&1 == ""))
      |> Enum.map(&(%__MODULE__{number: &1, picked: false}))
  end

  def mark_as_picked(board, picked_number) do
    board
      |> Enum.map(fn (%__MODULE__{number: number, picked: picked}) ->
        case number == picked_number do
          true -> %__MODULE__{number: number, picked: true}
          false -> %__MODULE__{number: number, picked: picked}
        end
      end)
  end

  def is_bingo?(boards) do
    bingo_boards = boards
      |> Enum.filter(&(is_bingo(&1)))

    case Enum.empty?(bingo_boards) do
      false -> bingo_boards
      true -> false
    end
  end

  def is_not_bingo?(boards) do
    bingo_boards = boards
      |> Enum.reject(&(is_bingo(&1)))

    case Enum.count(bingo_boards) == 1 do
      true -> bingo_boards
      false -> false
    end
  end

  def is_bingo(board) do
    bingo = [0..4, 5..9, 10..14, 15..19, 20..24, [0,5,10,15,20], [1,6,11,16,21], [2,7,12,17,22], [3,8,13,18,23], [4,9,18,19,24]]
      |> Enum.map(fn (range) ->
        range
          |> Enum.all?(&(Enum.at(board, &1).picked))
      end)

    bingo |> Enum.any?
  end

  def sum_board(board) do
    board
      |> Enum.reject(&(&1.picked))
      |> Enum.reduce(0, fn (item, carry) ->
        String.to_integer(item.number) + carry
      end)
  end
end

defmodule Advent.Day4.GiantSquid do
  alias Advent.Day4.Board
  def winning_board(%{picked_numbers: [first | _rest], boards: _boards} = input) do
    updated = input
      |> mark_as_picked

    case Board.is_bingo?(updated.boards) do
      false -> winning_board(updated)
      boards -> boards
        |> Enum.at(0)
        |> (fn (board) -> Board.sum_board(board) * String.to_integer(first) end).()
    end
  end

  def loosing_board(%{picked_numbers: [_first | rest], boards: _boards} = input) do
    updated = input
      |> mark_as_picked

    case Board.is_not_bingo?(updated.boards) do
      false -> loosing_board(updated)
      [board] -> winning_board(%{picked_numbers: rest, boards: [board]})
    end
  end

  defp mark_as_picked(%{picked_numbers: [first | rest], boards: boards}) do
    %{
      picked_numbers: rest,
      boards: boards
        |> Enum.map(&(Board.mark_as_picked(&1, first)))
    }
  end

  def parse_input(input) do
    [picked_numbers | boards] = input
      |> String.split("\n\n")
      |> Enum.reject(&(&1 == ""))

    %{
      picked_numbers: picked_numbers
        |> String.split(",")
        |> Enum.reject(&(&1 == "")),
      boards: boards
        |> Enum.map(&(Board.parse(&1)))
      }
  end
end
