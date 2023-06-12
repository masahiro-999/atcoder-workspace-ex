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

    def shift(s,i) do
        {a,b} = String.split_at(s, i)
        b <> a
    end
    def solve(s, t) do
        ans =
        for i <- 0..String.length(s)-1, reduce: :false do
          acc -> acc or (shift(s,i)==t)
        end
        IO.puts(if ans, do: "Yes", else: "No")
    end

    def main() do
        s = input()
        t = input()
        solve(s, t)
    end

end
