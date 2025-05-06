defmodule Main do
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

    def count_combinations(a, b, c, x) do
        for i <- 0..a,
            j <- 0..b,
            k <- 0..c,
            500 * i + 100 * j + 50 * k == x,
            reduce: 0 do
          acc -> acc + 1
        end
    end

      def main() do
        a = ii()
        b = ii()
        c = ii()
        x = ii()
        count_combinations(a, b, c, x)
        |> IO.puts()
    end

end
