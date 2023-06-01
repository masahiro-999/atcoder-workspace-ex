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


    def solve(n, p) do
        {_, ans} = for x <- p, reduce: {hd(p), 0} do
          {mi, co} when mi>=x -> {x, co + 1}
          {mi, co} -> {mi, co}
        end
        IO.puts(ans)
    end

    def main() do
        n = ii()
        p = li()  # type: "List[int]"
        solve(n, p)
    end

end
