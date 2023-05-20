defmodule Main do
    import Bitwise
    def next_token(acc \\ "") do
        case IO.getn(:stdio, "", 1) do
          " " -> acc
          "\n" -> acc
          x -> next_token(acc <> x)
        end
    end
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: next_token() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)


    def solve(s) do
        s
        |> String.to_charlist()
        |> Enum.map(fn x -> x in 'ACGT' end)
        |> Enum.chunk_by(&(&1))
        |> Enum.map(fn x -> Enum.count(x, &(&1)) end)
        |> Enum.max()
        |> IO.puts()
    end

    def main() do
        s = input()
        solve(s)
    end

end
