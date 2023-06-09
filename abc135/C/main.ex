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

    def get_ans(prev, [], [], sum) do
        sum
    end

    def get_ans(prev, [ah|at], [bh|bt], sum) do
        b = max(0, bh - prev)
        next_prev = max(0, ah - b)
        sum = sum + (bh - b) + (ah - next_prev)
        get_ans(next_prev, at, bt, sum)
    end

    def solve(n, a, b) do
        [ah|at] = a
        ans = get_ans(ah, at, b, 0)
        IO.puts(ans)
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        b = li()  # type: "List[int]"
        solve(n, a, b)
    end

end
