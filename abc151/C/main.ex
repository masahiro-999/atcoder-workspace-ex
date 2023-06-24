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

    def is_ac(p, ac_table) do
        {ac,wa} = Map.get(ac_table, p, {0,0})
        ac > 0
    end

    def get_ans([], ac_table) do
      ac_table
    end

    def get_ans([{p,s}|t], ac_table) do
        next_ac_table =
        cond do
            is_ac(p, ac_table) -> ac_table
            s == "WA" -> Map.update(ac_table, p, {0,1}, fn {0,wa} -> {0, wa+1}end)
            s == "AC" -> Map.update(ac_table, p, {1,0}, fn {_,wa} -> {1, wa}end)
        end
        get_ans(t, next_ac_table)
    end

    def solve(_n, _m, ps) do
        ac_table = get_ans(ps, %{})
        ac2 = Enum.count(ac_table)
        ac = Enum.count(ac_table, fn {_, {ac, _}} -> ac >0 end)
        wa =
            ac_table
            |> Enum.map(fn {_, {ac, wa}} -> if ac>0, do: wa, else: 0 end)
            |> Enum.sum()

        IO.puts('#{ac} #{wa}')
    end

    def main() do
        n = ii()
        m = ii()
        ps =
        cond do
            m == 0 -> []
            :true ->
                    (for _ <- 1..m, do: (input()|> String.split(" ")))
                    |> Enum.map(fn [a,b] -> {String.to_integer(a), b} end)
        end

        solve(n, m, ps)
    end

end
