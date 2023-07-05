defmodule Main do
    use Bitwise
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

    # MOD = 1000000007

    def is_white(c,i,j) do
      String.slice(elem(c,i),j,1)=="."
    end

    def is_all_white(h, w, c, i, w_bit) do
        0..w-1
        |> Enum.map(fn x ->
            (w_bit &&& (1 <<< x)) != 0 and
             not is_white(c,i,x) end)
        |> Enum.all?(fn x -> x == :false end)
    end

    def is_valid(bit1, bit2) do
        (bit1 &&& bit2) == 0 and ((bit1 <<<1) &&& bit2) == 0 and ((bit2 <<<1) &&& bit1) == 0
    end

    def get_ans(h, w, c, 0, w_bit) do
        # IO.inspect({0,w_bit})
        if(
         ((w_bit <<<1) &&& w_bit) == 0 and
         is_all_white(h, w, c, 0, w_bit)) do
            1
         else
            0
         end
        #  |> IO.inspect()
    end

    def get_ans(h, w, c, i, w_bit) do
        # IO.inspect({i,w_bit})
        if is_all_white(h, w, c, i, w_bit) do
            0..(1<<<w)-1
            |> Enum.filter(fn x -> ((x<<<1) &&& x) == 0 end)
            |> Enum.reduce(0, fn
                x, acc -> acc +
                    if is_valid(x, w_bit) do
                        get_ans(h, w, c, i-1, x)
                    else
                        0
                    end
                end)
        else
            0
        end
        # |> IO.inspect()
    end

    def solve(h,w,c) do
        ans = get_ans(h, w, c, h, 0)
        IO.puts(ans)
    end

    def main() do
        h = ii()
        w = ii()
        c = (for _ <- 1..h, do: input())|> List.to_tuple()
        solve(h,w,c)
    end

end
