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
        result = (for x <- String.to_charlist(s), reduce: %{} do
          map -> Map.put(map, x, Map.get(map, x, 0)+1)
        end)
        |> Enum.count(fn {_, count} -> count > 1 end)

        IO.puts(if result == 0, do: "yes", else: "no")
    end

    def main() do
        s = input()
        solve(s)
    end

end
