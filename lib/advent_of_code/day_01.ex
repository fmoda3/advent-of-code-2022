defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> parse_input()
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  def part2(args) do
    args
    |> parse_input()
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end

  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(fn x -> String.split(x, "\n") end)
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
  end
end
