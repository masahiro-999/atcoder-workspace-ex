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

    def is_good(table, i) do
      table[table[i]] == i
    end

    def solve(n, a) do
        table =
        Enum.with_index(a)
        |> Enum.map(fn {val, index} -> {index, val-1} end)
        |> Enum.into(%{})

        ans =
        for i <- 0..n-1, reduce: 0 do
          sum -> sum + if(is_good(table,i), do: 1, else: 0)
        end
        IO.puts(div(ans,2))
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
