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
    def linei(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def inc_table(t, i) do
        ret = :ets.lookup(t,i)
        {_, val} = hd(ret)
        :ets.insert(t, {i,val+1})
    end

    def solve(n, k, q, a) do
        t = %{}

        t = a |> Enum.reduce(t, fn a,t -> Map.update(t, a, k-q, fn x -> x+1 end) end)

        (for i <- 1..n do
            Map.get(t,i,k-q)
        end)
        |> Enum.map(fn
            x when x>0 -> "Yes"
            x -> "No"
        end)
        |> Enum.join("\n")
        |> IO.puts()
    end

    def main() do
        n = ii()
        k = ii()
        q = ii()
        a = for _ <- 1..q, do: linei()
        solve(n, k, q, a)
    end

end
