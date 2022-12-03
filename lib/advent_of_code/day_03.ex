defmodule AdventOfCode.Day03 do
  def part1(args) do
    args
    |> parse_input()
    |> Enum.map(fn [x, y] -> List.first(MapSet.to_list(MapSet.intersection(x, y))) end)
    |> Enum.map(fn x -> :binary.first(x) end)
    |> Enum.map(&to_priority/1)
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> parse_input_2()
    |> Enum.map(fn [a, b, c] -> MapSet.intersection(a, MapSet.intersection(b, c)) end)
    |> Enum.map(fn x -> List.first(MapSet.to_list(x)) end)
    |> Enum.map(fn x -> :binary.first(x) end)
    |> Enum.map(&to_priority/1)
    |> Enum.sum()
  end

  def parse_input(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_rucksack/1)
  end

  def parse_rucksack(rucksack) do
    len = round(String.length(rucksack)/2)
    rucksack
    |> String.graphemes()
    |> Enum.chunk_every(len)
    |> Enum.map(&parse_compartment/1)
  end

  def parse_compartment(compartment) do
    compartment
    |> MapSet.new()
  end

  def parse_input_2(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.chunk_every(3)
    |> Enum.map(&parse_team/1)
  end

  def parse_team([a, b, c]), do: [MapSet.new(String.graphemes(a)), MapSet.new(String.graphemes(b)), MapSet.new(String.graphemes(c))]

  def to_priority(c) when c >= 97 and c <= 122, do: c - 96
  def to_priority(c) when c >= 65 and c <= 90, do: c - 38

end
