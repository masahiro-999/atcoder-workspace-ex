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


    def solve(n, s) do
        {x, ans} =
        for str <- String.graphemes(s), reduce: {0,0} do
          {x, ans} -> {(if str=="I", do: x+1, else: x-1), max(ans, x)}
        end
        ans = max(ans, x)
        IO.puts(ans)
    end

    def main() do
        n = ii()
        s = input()
        solve(n, s)
    end

end
