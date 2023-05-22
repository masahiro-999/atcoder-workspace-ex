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


    def solve(n, x, a) do
        sort_a = Enum.sort(a)
        b = Enum.slice(sort_a, 0, length(sort_a)-1)
        end_a = Enum.at(sort_a, length(sort_a)-1)

        {x, c} = for i <- b, reduce: {x,0} do
            {x, c} -> if x >= i, do: {x-i, c+1}, else: {x, c}
        end
        ans = cond do
            x == end_a -> c + 1
            :true -> c
        end
        IO.puts(ans)
    end

    def main() do
        [n,x] = li()
        a = li()  # type: "List[int]"
        solve(n, x, a)
    end

end
