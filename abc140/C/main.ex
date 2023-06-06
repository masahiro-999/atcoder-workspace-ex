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

    def solve(n, b) do
        {prev, sum} = for i <- tl(b), reduce: {hd(b), hd(b)} do
            {prev, sum} -> {i, sum + min(i,prev)}
        end
        IO.puts(sum + prev)
    end

    def main() do
        n = ii()
        b = li()  # type: "List[int]"
        solve(n, b)
    end

end
