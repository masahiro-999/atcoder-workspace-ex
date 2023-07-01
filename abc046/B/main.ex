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


    def pow(n,0), do: 1
    def pow(n,k), do: n * pow(n, k-1)

    def solve(n, k) do
        ans = k * pow(k-1,n-1)
        IO.puts(ans)
    end

    def main() do
        n = ii()
        k = ii()
        solve(n, k)
    end

end
