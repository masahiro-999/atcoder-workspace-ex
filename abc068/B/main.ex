defmodule Main do

    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def ans(x,n) when x > n, do: div(x,2)
    def ans(x,n), do: ans(x*2,n)

    def solve(n) do
        ans(1,n)
        |>IO.puts()
    end

    def main() do
        n = ii()
        solve(n)
    end

end
