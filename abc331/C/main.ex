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

    def counter(a) do
        Enum.reduce(a, %{}, fn x, acc ->
            Map.update(acc, x, 1, &(&1+1))
        end)
    end

    def get_head([]), do: 0
    def get_head([x|_]), do: x

    def solve(_n, a) do

        cnt = counter(a)
        # IO.inspect(cnt)
        sorted_key = cnt |> Map.keys() |> Enum.sort()

        acc_sum_list=
        sorted_key
        |> Enum.map(fn x -> cnt[x]*x end)
        |> Enum.reduce([], fn x, acc -> [x+get_head(acc)|acc] end)
        |> Enum.reverse()

        sum_all = List.last(acc_sum_list)
        table =
            for {k, acc_sum} <- Enum.zip(sorted_key, acc_sum_list) , into: %{} do
                {k, sum_all - acc_sum}
            end

        a
        |> Enum.map(fn x -> table[x] end)
        |> Enum.join(" ")
        |> IO.puts()
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
