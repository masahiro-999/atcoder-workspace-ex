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

    def next_color("0"), do: "1"
    def next_color("1"), do: "0"

    def ans(initial, s_str) do
        {_, ret} = for s <- String.graphemes(s_str), reduce: {initial, 0} do
            {target, counter} when target == s -> {next_color(target), counter}
            {target, counter} -> {next_color(target), counter + 1}
        end
        ret
    end

    def solve(s_str) do
        min(ans("0", s_str),ans("1", s_str))
        |> IO.puts()
    end

    def main() do
        s = input()
        solve(s)
    end

end
