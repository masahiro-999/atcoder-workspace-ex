defmodule Main do
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

    def solve(w) do
        w
        |> String.to_charlist()
        |> Enum.reduce(%{}, fn elem, acc ->
            Map.update(acc, elem, 1, fn x-> x+1 end)
        end)
        # |> IO.inspect()
        |> Enum.all?(fn {k,v} -> rem(v,2)==0 end)
        |> then(fn
            :true -> "Yes"
            :false -> "No"
        end)
        |>IO.puts()
    end

    def main() do
        w = input()
        solve(w)
    end

end
