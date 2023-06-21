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


    def solve(n, l, s) do
        s
        |> Enum.sort()
        |> Enum.join("")
        |> IO.puts()

    end

    def main() do
        n = ii()
        l = ii()
        s = for _ <- 1..n, do: input()  # type: "List[str]"
        solve(n, l, s)
    end

end
