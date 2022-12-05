defmodule AdventOfCode.Day04 do
  def part1(args) do
    args
    |> parse_input()
    |> Enum.filter(&check_subset/1)
    |> length()
  end

  def part2(args) do
    args
    |> parse_input()
    |> Enum.filter(&check_intersect/1)
    |> length()
  end

  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_pairing/1)
  end

  def parse_pairing(pairing) do
    pairing
    |> String.split(",")
    |> Enum.map(&parse_elf/1)
  end

  def parse_elf(elf) do
    elf
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
    |> (fn [s, e] -> Range.new(s, e) end).()
    |> MapSet.new()
  end

  def check_subset(pairing) do
    pairing
    |> Enum.sort_by(&MapSet.size/1)
    |> (fn [x, y] -> MapSet.subset?(x, y) end).()
  end

  def check_intersect([x, y]), do: !MapSet.disjoint?(x, y)
end
