defmodule Main do
    def next_token(acc \\ "") do
        case IO.getn(:stdio, "", 1) do
          " " -> acc
          "\n" -> acc
          x -> next_token(acc <> x)
        end
    end
    def input(), do: IO.binread(:line) |> String.trim()
    def ii(), do: next_token() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def new() do
        :ets.new(:memo, [:set, :protected, :named_table])
    end

    def put(v, k) do
        :ets.insert(:memo, {k,v})
        v
    end

    def get(k) do
        case :ets.lookup(:memo, k) do
            [{_,v}|_] -> v
            [] -> nil
        end
    end

    def lookup_g(g, i) do
        Map.get(g, i, 0)
    end

    def insurance_generations(g, _parent, i=1) do
        lookup_g(g, i)
    end

    def insurance_generations(g, parent, i) do
        case get(i) do
          nil ->
            max(
                lookup_g(g, i),
                insurance_generations(g, parent, parent[i])-1
            )
            |> put(i)
          x-> x
        end
    end

    def solve(n, _m, p, xy) do
        g = for [x,y] <- xy, reduce: %{} do
            g -> Map.update(g, x, y+1, fn prev_y -> max(prev_y, y + 1) end)
        end
        parent =
            Enum.zip(2..n,p)
            |> Enum.into(%{})

        new()

        1..n
        |> Enum.map(fn x -> insurance_generations(g, parent, x) end)
        |> Enum.count(fn x -> x > 0 end)
        |> IO.puts()
    end

    def main() do
        n = ii()
        m = ii()
        p = li()  # type: "List[int]"

        xy =
            IO.binread(:stdio, :all)
            |> String.trim()
            |> String.split("\n")
            |> Enum.map(fn x ->
                String.trim(x)
                |> String.split(" ")
                |> Enum.map(&String.to_integer/1)
                end)
        solve(n, m, p, xy)
    end

end
