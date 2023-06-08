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

    def find_ans(a,b,101) do
        -1
    end

    def find_ans(a,b,c) when floor(c*0.08)==a and floor(c*0.1)==b do
        c
    end

    def find_ans(a,b,c) do
        find_ans(a,b,c+1)
    end

    def solve(a, b) do
        ans = find_ans(a,b,1)
        IO.puts(ans)
    end

    def main() do
        a = ii()
        b = ii()
        solve(a, b)
    end

end
