defmodule AdventTest do
  use ExUnit.Case
  alias Advent.FileReader

  test "Day 1 - Calorie counting - part 1" do
    assert Advent.Day1.CalorieCounting.most_calories(
      Advent.Day1.CalorieCounting.parse_input(FileReader.get_input("lib/day_1/input.txt"))
    ) == 69310
  end

  test "Day 1 - Calorie counting - part 2" do
    assert Advent.Day1.CalorieCounting.top_three_calories(
      Advent.Day1.CalorieCounting.parse_input(FileReader.get_input("lib/day_1/input.txt"))
    ) == 206104
  end

  test "Day 2 - Rock paper scissors - part 1" do
    assert Advent.Day2.RockPaperScissors.total_score(
      Advent.Day2.RockPaperScissors.parse_input(FileReader.get_input("lib/day_2/input.txt"))
    ) == 12586
  end

  test "Day 2 - Rock paper scissors - part 2" do
    assert Advent.Day2.RockPaperScissors.do_strategy(
      Advent.Day2.RockPaperScissors.parse_input(FileReader.get_input("lib/day_2/input.txt"))
    ) == 13193
  end

  test "Day 3 - Rucksack reorganization - part 1" do
    assert Advent.Day3.RucksackReorganization.sum_of_priorities(
      Advent.Day3.RucksackReorganization.parse_input(FileReader.get_input("lib/day_3/input.txt"))
    ) == 8243
  end

  test "Day 3 - Rucksack reorganization - part 2" do
    assert Advent.Day3.RucksackReorganization.sum_of_badges(
      Advent.Day3.RucksackReorganization.parse_input(FileReader.get_input("lib/day_3/input.txt"))
    ) == 2631
  end

  test "Day 4 - Camp Cleanup - part 1" do
    assert Advent.Day4.CampCleanup.overlapping_fully(
      Advent.Day4.CampCleanup.parse_input(FileReader.get_input("lib/day_4/input.txt"))
    ) == 530
  end

  test "Day 4 - Camp Cleanup - part 2" do
    assert Advent.Day4.CampCleanup.overlapping_partly(
      Advent.Day4.CampCleanup.parse_input(FileReader.get_input("lib/day_4/input.txt"))
    ) == 903
  end
end
