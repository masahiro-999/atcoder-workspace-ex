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

    def ans(1,n_mon,hit) do
        n_mon+hit
    end

    def ans(h,n_mon,hit) do
        ans(div(h,2),n_mon*2,hit+n_mon)
    end

    def solve(h) do
        ans(h,1,0)
        |> IO.puts()
    end

    def main() do
        h = ii()
        solve(h)
    end

end
