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

    def get_ans(n,i,ans) when i > div(n,i), do: ans

    def get_ans(n,i,ans) when rem(n,i) != 0, do: get_ans(n,i+1,ans)

    def get_ans(n,i,ans), do: get_ans(n,i+1,min(ans, i+div(n,i)-2))

    def solve(n) do
        get_ans(n,1,n)
        |> IO.puts()
    end

    def main() do
        n = ii()
        solve(n)
    end

end
