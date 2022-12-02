defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> parse_input()
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> parse_input()
    |> Enum.map(&score_round_2/1)
    |> Enum.sum()
  end

  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_round/1)
  end

  def parse_round(line) do
    line
    |> String.split(" ")
  end

  def score_round([them, you]) do
    score_choice(you) + score_win_2([them, you])
  end

  def score_choice("X"), do: 1
  def score_choice("Y"), do: 2
  def score_choice("Z"), do: 3

  def score_win(["A", "X"]), do: 3
  def score_win(["A", "Y"]), do: 6
  def score_win(["A", "Z"]), do: 0
  def score_win(["B", "X"]), do: 0
  def score_win(["B", "Y"]), do: 3
  def score_win(["B", "Z"]), do: 6
  def score_win(["C", "X"]), do: 6
  def score_win(["C", "Y"]), do: 0
  def score_win(["C", "Z"]), do: 3

  def score_round_2([them, you]) do
    score_choice_2([them, you]) + score_win_2([them, you])
  end

  def score_choice_2(["A", "X"]), do: 3
  def score_choice_2(["A", "Y"]), do: 1
  def score_choice_2(["A", "Z"]), do: 2
  def score_choice_2(["B", "X"]), do: 1
  def score_choice_2(["B", "Y"]), do: 2
  def score_choice_2(["B", "Z"]), do: 3
  def score_choice_2(["C", "X"]), do: 2
  def score_choice_2(["C", "Y"]), do: 3
  def score_choice_2(["C", "Z"]), do: 1

  def score_win_2(["A", "X"]), do: 0
  def score_win_2(["A", "Y"]), do: 3
  def score_win_2(["A", "Z"]), do: 6
  def score_win_2(["B", "X"]), do: 0
  def score_win_2(["B", "Y"]), do: 3
  def score_win_2(["B", "Z"]), do: 6
  def score_win_2(["C", "X"]), do: 0
  def score_win_2(["C", "Y"]), do: 3
  def score_win_2(["C", "Z"]), do: 6

end
