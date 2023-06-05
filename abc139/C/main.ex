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


    def solve(n, h) do
        {ans,count,_}=
        for x <- h++[nil], reduce: {0, 0, -1} do
          {max, count, prev} when x == nil or prev < x -> {max(max, count), 0, x}
          {max, count, prev} -> {max, count+1, x}
        end
        IO.puts(ans)
    end

    def main() do
        n = ii()
        h = li()  # type: "List[int]"
        solve(n, h)
    end

end
