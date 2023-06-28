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

    def count_div2(x,n) when rem(x,2)==0, do: count_div2(div(x,2), n+1)
    def count_div2(x,n), do: n

    def solve(n, a) do
        a
        |> Enum.map(&count_div2(&1, 0))
        |> Enum.sum()
        |> IO.puts()
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
