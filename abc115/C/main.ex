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


    def solve(n, k, h) do
        h = Enum.sort(h)
        h1 = Enum.slice(h, 0, n-(k-1))
        h2 = Enum.slice(h, k-1, n-(k-1))
        Enum.zip(h1,h2)
        |> Enum.map(fn {a,b} -> (b-a) end)
        |> Enum.min()
        |> IO.puts()
    end

    def main() do
        n = ii()
        k = ii()
        h = for _ <- 1..n, do: input()|> String.to_integer()  # type: "List[int]"
        solve(n, k, h)
    end

end
