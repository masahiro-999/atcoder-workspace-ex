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


    def solve(a, b, c, d, e) do
        time_list=[a,b,c,d,e]

        {_last_val,last_id} =
        time_list
        |> Enum.map(fn x -> rem(x,10) end)
        |> Enum.map(fn
            0 -> 10
            x -> x
         end)
        |> Enum.with_index()
        |> Enum.min(fn {v1, _k1}, {v2, _k2} -> v1<=v2 end)


        ans =
            time_list
            |> Enum.map(fn x -> div(x+9,10)*10 end)
            |> Enum.with_index()
            |> Enum.filter(fn {_v1, k1} -> k1 != last_id end)
            |> Enum.map(&elem(&1,0))
            |> Enum.sum()

        ans = ans + Enum.at(time_list, last_id)

        IO.puts(ans)
    end

    def main() do
        a = ii()
        b = ii()
        c = ii()
        d = ii()
        e = ii()
        solve(a, b, c, d, e)
    end

end
