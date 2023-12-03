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

    def create_sorted_value_index_list(a) do
        a
        |> Enum.with_index()
        |> Enum.sort(:desc)
    end

    def solve(n, m, l, a, b, cd) do

        cd_set =
        for [c,d] <- cd, reduce: MapSet.new() do
            acc -> MapSet.put(acc, {c-1,d-1})
        end

        sa = create_sorted_value_index_list(a)
        sb = create_sorted_value_index_list(b)

        # IO.inspect(sa)
        # IO.inspect(sb)
        # IO.inspect(cd_set)

        for {av,ai} <- sa, reduce: 0 do
            acc ->
                Enum.reduce_while(sb, acc, fn {bv,bi}, acc ->
                    cond do
                        MapSet.member?(cd_set, {ai,bi}) -> {:cont, acc}
                        true -> {:halt, max(acc,av+bv)}
                    end
                end)
        end
        |> IO.puts()
    end

    def main() do
        n = ii()
        m = ii()
        l = ii()
        a = li()  # type: "List[int]"
        b = li()  # type: "List[int]"
        cd =
        if l >0 do
            for _ <- 1..l, do: li()
        else
            []
        end
        solve(n, m, l, a, b, cd)
    end

end
