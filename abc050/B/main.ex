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

    def solve(n, t_list, m, p, x) do
        t = List.to_tuple(t_list)
        for i <- 0..m-1 do
            put_elem(t,Enum.at(p,i)-1, Enum.at(x,i))
            |> Tuple.to_list()
            |> Enum.sum()
            |> IO.puts()
        end
    end

    def main() do
        n = ii()
        t = li()  # type: "List[int]"
        m = ii()
        [p,x] = (for _ <- 1..m, do: li())|> Enum.zip()|>Enum.map(&Tuple.to_list/1)
            #_ の部分をpに変更する事 = ii()
            #_ の部分をxに変更する事 = ii()
        solve(n, t, m, p, x)
    end

end
