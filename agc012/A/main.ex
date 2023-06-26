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


    def solve(n, a) do
        a_sort = Enum.sort(a)
        a_low = Enum.slice(a_sort,0,n)
        a_high = Enum.slice(a_sort, n,2*n)

        a_high
        |> Enum.chunk_every(2)
        |> Enum.map(fn [a,b] -> a end)
        |> Enum.sum()
        |> IO.puts()
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
