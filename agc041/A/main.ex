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

    def get_ans(n, a, b) when a > b do
      get_ans(n, b, a)
    end

    def get_ans(n, a, b) when rem(b-a, 2) == 0 do
        div(b-a,2)
    end

    def get_ans(n, a, b) when a-1 <= n-b do
        # aの方がはしに近い
        get_ans(n, 1, b-a) + a
    end

    def get_ans(n, a, b) when a-1 > n-b do
        # bの方がはしに近い
        get_ans(n, a+(n-b)+1, n) + n-b+1
    end


    def solve(n, a, b) do
        get_ans(n,a,b)
        |> IO.puts()

    end

    def main() do
        n = ii()
        a = ii()
        b = ii()
        solve(n, a, b)
    end

end
