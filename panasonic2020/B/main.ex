defmodule Main do
    def input(), do: IO.read(:line) |> String.trim()
    def ii(), do: input() |> String.to_integer()
    def li(), do: input() |> String.split(" ") |> Enum.map(&String.to_integer/1)


    def solve(h, w) do
        cond do
            h==1 or w ==1 -> 1
            rem(h,2) == 0 -> div(h,2)*w
            true -> div(h,2)*w + div(w,2) + rem(w,2)
        end
        |> IO.puts()
    end

    def main() do
        [h, w] = li()
        solve(h, w)
    end

end
