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

    def permutations([]), do: [[]]
    def permutations(list) do
      for elem <- list, p <- permutations(list -- [elem]), do: [elem | p]
    end

    def d(xy, [h|[]]), do: 0
    def d(xy, [i|[j|t]]), do: d(xy,i,j)+d(xy,[j|t])
    def d(xy,i,j) do
        [x1,y1] = Enum.at(xy,i)
        [x2,y2] = Enum.at(xy,j)
        :math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))
    end

    def solve(n, xy) do
        p = permutations(Enum.to_list(0..n-1))
        l = length(p)
        sum_d = Enum.reduce(p, 0,fn list, sum -> sum + d(xy,list) end)
        IO.puts(sum_d / l)
    end

    def main() do
        n = ii()
        xy = (for _ <- 1..n, do: li())
        solve(n, xy)
    end

end
