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

    def ans([],n,_) do
      n
    end

    def ans([a,a],n,_) do
      n+1
    end

    def ans([h|t], n, prev) when [h] == prev do
        ans(tl(t),n+1,prev++[h])
    end

    def ans([h|t] = s, n, prev) do
        ans(t, n+1, [h])
    end

    def ans([h|t] = s) do
        ans(t, 1, [h])
    end

    def solve(s) do
        s
        |> String.to_charlist()
        |> ans()
        |> IO.puts()
    end

    def main() do
        s = input()
        solve(s)
    end

end
