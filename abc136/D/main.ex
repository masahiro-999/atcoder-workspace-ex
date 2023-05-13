defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)

    def zero_list(0) do
        []
    end

    def zero_list(a) do
      for _ <- 1..a, do: 0
    end

    def get_ans(a,b) do
        cond do
          rem(a+b,2) == 0 -> zero_list(a-1) ++ [div(a+b,2)] ++ [div(a+b,2)] ++ zero_list(b-1)
          rem(a+b,2) == 1 -> zero_list(a-1) ++ [div(a+b,2)+rem(a,2)] ++ [div(a+b,2)+rem(b,2)] ++ zero_list(b-1)
        end
    end

    def solve(s) do
        String.to_charlist(s)
        |> Enum.chunk_by(fn x -> x end)
        |> Enum.map(fn x -> length(x) end)
        |> Enum.chunk_every(2)
        |> Enum.map(fn [a,b] -> get_ans(a,b) end)
        |> Enum.flat_map(fn x -> x end)
        |> Enum.join(" ")
        |> IO.puts()
    end

    def main() do
        s = input()
        solve(s)
    end

end
