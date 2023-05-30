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

    def solve(n, k, q, a) do
        t = Tuple.duplicate(k-q, n)

        {time,t} = :timer.tc(Enum, :reduce,[a,t, fn (a,t) -> put_elem(t,a-1,elem(t,a-1)+1) end])
        # t = a |> Enum.reduce(t, fn (a,t) -> put_elem(t,a-1,elem(t,a-1)+1) end)

        Tuple.to_list(t)
        |> Enum.map(fn
            x when x>0 -> "Yes"
            x -> "No"
        end)
        |> Enum.join("\n")
        |> IO.puts()
        IO.inspect(time, level: "time")
    end

    def main() do
        n = ii()
        k = ii()
        q = ii()
        a = for _ <- 1..q, do: linei()
        solve(n, k, q, a)
    end

end
