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

    def find(s,c) do
        s
        |> String.to_charlist()
        |> Enum.find_index(fn v -> v == c end)
    end

    def solve(s) do
        start_pos = find(s,?A)
        end_pos =String.length(s) - 1 - find(String.reverse(s), ?Z)
        ans = end_pos - start_pos + 1
        IO.puts(ans)
    end

    def main() do
        s = input()
        solve(s)
    end

end
