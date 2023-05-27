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

    def ans(_count, i) when i == ?z+1, do: "None"
    def ans(count, i) when is_map_key(count, i), do: ans(count, i+1)
    def ans(_count, i), do: List.to_string([i])

    def solve(s) do
        String.to_charlist(s)
        |> Enum.reduce(%{}, fn value, m -> Map.update(m, value, 0, &(&1+1))end)
        |> ans(?a)
        |> IO.puts()
    end

    def main() do
        s = input()
        solve(s)
    end

end
