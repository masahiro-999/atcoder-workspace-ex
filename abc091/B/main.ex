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


    def solve(n, s, m, t) do
        count=
        for x <- s, reduce: %{} do
          acc -> Map.update(acc, x, 1, &(&1 + 1))
        end

        count =
        for x <- t, reduce: count do
            acc -> Map.update(acc, x, -1, &(&1 - 1))
        end

        count
        |> Enum.map(fn {k,v}->v end)
        |> Enum.max()
        |> max(0)
        |> IO.puts()


    end

    def main() do
        n = ii()
        s = for _ <- 1..n, do: input()  # type: "List[str]"
        m = ii()
        t = for _ <- 1..m, do: input()  # type: "List[str]"
        solve(n, s, m, t)
    end

end
