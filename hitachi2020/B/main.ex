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


    def solve(a, b, m, a_list, b_list, x, y, c) do
        without_discount = hd(Enum.sort(a_list)) + hd(Enum.sort(b_list))
        with_discount =
        Enum.zip([x,y,c])
         |> Enum.map(fn {x,y,c} -> Enum.at(a_list,x-1)+Enum.at(b_list,y-1)-c end)
         |> Enum.min()
        IO.puts(min(without_discount, with_discount))
    end

    def main() do
        a = ii()
        b = ii()
        m = ii()
        a_list = li()  # type: "List[int]"
        b_list = li()  # type: "List[int]"
        [x,y,c] = (for _ <- 1..m, do: li())|> Enum.zip_with(&(&1))
        solve(a, b, m, a_list, b_list, x, y, c)
    end

end
