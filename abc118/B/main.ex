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

    def everyonelike(j,a_list) do
        for a <- a_list, reduce: :true do
          acc -> if j not in a, do: :false, else: acc
        end
    end

    def solve(n,m,a) do
        ans = 0
        for j <- 1..m, reduce: 0 do
            ans -> if everyonelike(j,a), do: ans + 1, else: ans
        end
        |> IO.puts()
    end

    def main() do
        [n,m] = li()
        a = for _ <- 1..n, do: tl(li())
        solve(n,m,a)
    end

end
