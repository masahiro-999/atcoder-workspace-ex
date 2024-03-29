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


    def solve(a, b, c, x) do
        cond do
            x <= a ->
                IO.puts(1)
            x > b ->
                IO.puts(0)
            true ->
                IO.puts(c / (b - a))
        end
    end

    def main() do
        a = ii()
        b = ii()
        c = ii()
        x = ii()
        solve(a, b, c, x)
    end

end
