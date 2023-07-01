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

    def create_formula([],[h]), do: h
    def create_formula([s|s_tail],[h|tail]), do: h <> s <> create_formula(s_tail, tail)

    def append_equql_7(x), do: x<>"=7"

    def solve(abcd) do
        sign_list =
            for x <- ["+","-"], y <- ["+","-"], z <- ["+","-"], do: [x,y,z]

        abcd_list = abcd
        |> String.graphemes()

        sign_list
        |> Enum.map(&create_formula(&1, abcd_list))
        |> Enum.map(fn formula -> {formula, Code.eval_string(formula)|> elem(0)} end)
        |> Enum.find_value(fn {formula,val} -> if(val == 7, do: formula, else: nil) end)
        |> append_equql_7()
        |> IO.puts()

    end

    def main() do
        abcd = input()
        solve(abcd)
    end

end
