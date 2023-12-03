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


    def solve(n, s, m, l) do
        for i <- 0..n, j <- 0..n, k <- 0..n, reduce: 10**18 do
            acc ->
                cond do
                    i*6 + j*8 + k*12 >= n -> min(acc, s*i + m*j + l*k)
                    true -> acc
                end
        end
        |> IO.puts()
    end

    def main() do
        n = ii()
        s = ii()
        m = ii()
        l = ii()
        solve(n, s, m, l)
    end

end
