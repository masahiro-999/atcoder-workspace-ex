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

    def shiritoricheck(w) do
        {ans, _} =
        for x <- tl(w), reduce: {:true, hd(w)} do
            {ans, prev} -> {ans and (String.ends_with?(prev, String.slice(x,0,1))), x}
        end
        ans
    end
    def solve(n, w) do
        s = MapSet.new(w)
        MapSet.size(s) == n and shiritoricheck(w)
    end

    def main() do
        n = ii()
        w = for _ <- 1..n, do: input()  # type: "List[str]"
        solve(n, w)
        |> fn
            :true -> "Yes"
            :false -> "No"
        end.()
        |> IO.puts()
    end

end
