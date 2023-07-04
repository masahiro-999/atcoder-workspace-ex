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

    def range(s,e,step) do
        for x <- 0..div(e-s,2), do: x * 2 + s
    end

    def cost(a, l, r) when r-l == 1 do
        abs(elem(a,l) - elem(a,r))
    end

    def cost(a, l, r) when rem(r-l,2)==1 do
        case get({l,r}) do
            nil ->
                cost1 = cost(a,l+1,r-1) + abs(elem(a,l) - elem(a,r))
                cost2 =
                    range(l+1, r-2, 2)
                    |> Enum.map(fn x -> cost(a,l,x)+cost(a,x+1,r)end)
                    |> Enum.min()
                ret = min(cost1, cost2)
                put({l,r}, ret)
                ret
            x -> x
        end
    end

    def new() do
        :ets.new(:memo, [:set, :protected, :named_table])
    end

    def put(k,v) do
        :ets.insert(:memo, {k,v})
    end

    def get(k) do
        case :ets.lookup(:memo, k) do
            [{_,v}|_] -> v
            [] -> nil
        end
    end

    def solve(n, a) do
        new()
        ans = cost(List.to_tuple(a),0,2*n-1)
        IO.puts(ans)
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
