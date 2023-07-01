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


    def get_ans(_, m) when m <= 0,  do: 0
    def get_ans([[a,b]|tail], m),  do: min(m,b)*a + get_ans(tail, m-b)

    def solve(n, m, ab) do
        ab
        |> Enum.sort(fn [a1,_],[a2,_] -> a1 <= a2 end )
        |> get_ans(m)
        |> IO.puts()
    end

    def main() do
        n = ii()
        m = ii()
        ab = (for _ <- 1..n, do: li())
        solve(n, m, ab)
    end

end
