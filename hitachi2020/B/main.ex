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


    def solve(a, b, m, a_list, b_list, xyc) do
        without_discount = hd(Enum.sort(a_list)) + hd(Enum.sort(b_list))
        a_tuple = List.to_tuple(a_list)
        b_tuple = List.to_tuple(b_list)

        with_discount =
        xyc
         |> Enum.map(fn [x,y,c] -> elem(a_tuple,x-1)+elem(b_tuple,y-1)-c end)
         |> Enum.min()
        IO.puts(min(without_discount, with_discount))
    end

    def main() do
        a = ii()
        b = ii()
        m = ii()
        a_list = li()  # type: "List[int]"
        b_list = li()  # type: "List[int]"
        xyc = (for _ <- 1..m, do: li())
        solve(a, b, m, a_list, b_list, xyc)
    end

end
