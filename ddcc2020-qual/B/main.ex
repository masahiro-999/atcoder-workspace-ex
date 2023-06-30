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

    def rev_accumulate(x) do
        Enum.reduce(x, [], fn
            elem,[h|t]-> [h + elem|[h|t]]
            elem,[]-> [elem]
        end)
    end

    def solve(n, a) do
        a_acc_rev = rev_accumulate(a)
        total_len = hd(a_acc_rev)
        half_diff =
        a_acc_rev
        |> Enum.map(fn x -> abs(x-total_len/2)end)
        |> Enum.min()

        half_len1 = total_len/2 + half_diff
        half_len2 = total_len - half_len1
        # IO.inspect({half_diff,total_len, half_len1,half_len2, a_acc})
        ans = floor(abs(half_len1 - half_len2))
        IO.puts(ans)
    end

    def main() do
        n = ii()
        a = li()  # type: "List[int]"
        solve(n, a)
    end

end
