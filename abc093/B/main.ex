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


    def solve(a, b, k) when b-a+1 >= 2*k do
        for i <- 0..k-1, do: IO.puts(a+i)
        for i <- 0..k-1, do: IO.puts(b-k+i+1)
    end

    def solve(a, b, k) do
        for i <- a..b, do: IO.puts(i)
    end

    def main() do
        a = ii()
        b = ii()
        k = ii()
        solve(a, b, k)
    end

end
