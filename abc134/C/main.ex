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
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)


    def solve(n, a) do
        a_sort =
            a
            |>Enum.with_index()
            |>Enum.sort(fn {v1,_i1}, {v2, _i2} -> v1 > v2 end)

        {max1, i_max1} = hd a_sort
        {max2, i_max2} = hd tl a_sort
        (for i <- 0..n-1, do: if i != i_max1, do: max1, else: max2)
        |> Enum.join("\n")
        |> IO.puts()

    end

    def main() do
        n = ii()
        a = for _ <- 1..n, do: ii()  # type: "List[int]"
        solve(n, a)
    end

end
