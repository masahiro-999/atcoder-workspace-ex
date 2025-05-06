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

    def solve(a, count \\ 0) do
        half = Enum.map(a, fn x ->
            case rem(x,2) do
              0 -> div(x,2)
              1 -> :error
            end
        end)
        case Enum.member?(half, :error) do
          :true -> count
          _ -> solve(half, count+1)
        end
    end

    def main() do
        _n = ii()
        a = li()  # type: "List[int]"
        solve(a)
        |> IO.puts()
    end

end
