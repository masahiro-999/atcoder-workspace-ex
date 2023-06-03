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

    def solve(0) do
      2
    end
    def solve(1) do
        1
    end

    def solve(n) do
        {_, ans} =
        for _ <- 2..n, reduce: {2,1} do
          {n2, n1} -> {n1, n2+n1}
        end
        ans
    end

    def main() do
        n = ii()
        solve(n)
        |> IO.puts()

    end

end
