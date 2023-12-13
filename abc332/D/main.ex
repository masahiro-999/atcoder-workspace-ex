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

  @inf 100100100

  def count_less_than_head([h|t]) do
      Enum.count(t, fn e -> e < h end)
  end

  def count_swap(p, h \\ 0)
  def count_swap(p, h) when h == tuple_size(p), do: 0
  def count_swap(p, h), do: count_less_than_val(p, h, h+1) + count_swap(p, h+1)

  def count_less_than_val(p, _h,i) when i == tuple_size(p) do
    0
  end

  def count_less_than_val(p, h, i) do
    (if elem(p,h) > elem(p,i), do: 1, else: 0) + count_less_than_val(p, h, i+1)
  end

  def is_matched(h,w,a,b,ph, pw) do
    for i<- 0..h-1, j <-0..w-1, reduce: :true do
      acc ->
        i1 = elem(ph,i)
        j1 = elem(pw,j)
        if a|> elem(i1)|> elem(j1) != b|> elem(i)|> elem(j), do: :false, else: acc
    end
  end

  def to_tuple_2d(list) do
    Enum.map(list, fn x -> List.to_tuple(x) end)
    |> List.to_tuple()
  end

  def solve(h, w, a, b) do

    for ph <- Combinatorics.permutations(0..h-1),
        pw <- Combinatorics.permutations(0..w-1),
        reduce: @inf
    do
      acc ->
        if is_matched(h, w, a, b, ph, pw) do
          min(acc, count_swap(ph) + count_swap(pw))
        else
          acc
        end
    end
    |> then(fn x -> if x == @inf, do: -1, else: x end)
    |> IO.puts()
  end

  def main() do
      h = ii()
      w = ii()
      a = for _ <- 1..h, do: li()
      b = for _ <- 1..h, do: li()

      tuple_a = to_tuple_2d(a)
      tuple_b = to_tuple_2d(b)

      solve(h, w, tuple_a, tuple_b)
  end

end

defmodule Combinatorics do

    # === product ===

    @doc ~S"""
    Cartesian Product of 2 Enumerables.
    (At least 2nd Enumerable should be finite)

    ## Examples

      iex> Combinatorics.product([1, 2, 3], 1..3) |> Enum.to_list
      [{1, 1}, {1, 2}, {1, 3}, {2, 1}, {2, 2}, {2, 3}, {3, 1}, {3, 2}, {3, 3}]

      iex> Stream.iterate(1, &(&1+1)) |> Combinatorics.product(1..3) |> Enum.take(10)
      [{1, 1}, {1, 2}, {1, 3}, {2, 1}, {2, 2}, {2, 3}, {3, 1}, {3, 2}, {3, 3}, {4, 1}]
    """
    def product(enum1, enum2) do
      product([enum1, enum2])
    end

    @doc ~S"""
    Cartesian Product of multi Enumerables.
    (At least last Enumerable should be finite)

    ## Examples

      iex> Combinatorics.product([1..2, 3..4, 5..6]) |> Enum.to_list
      [{1, 3, 5}, {1, 3, 6}, {1, 4, 5}, {1, 4, 6}, {2, 3, 5}, {2, 3, 6}, {2, 4, 5}, {2, 4, 6}]

      iex> Combinatorics.product([Stream.iterate(1, &(&1+1)), 1..3]) |> Enum.take(10)
      [{1, 1}, {1, 2}, {1, 3}, {2, 1}, {2, 2}, {2, 3}, {3, 1}, {3, 2}, {3, 3}, {4, 1}]
    """
    def product([]), do: []
    def product([it|[]]), do: Stream.map(it, &{&1})
    def product(its) when is_list(its) do
      &do_product({its, [], its, [], []}, &1, &2)
    end

    defp do_product(_, {:halt, term}, _fun), do: {:halted, term}
    defp do_product(v, {:suspend, term}, fun) do
      {:suspended, term, &do_product(v, &1, fun)}
    end
    defp do_product({[], [x|ys], [], [z|ws], vals = [_|vs]}, {:cont, term}, fun) do
      do_product({[x], ys, [z], ws, vs}, fun.(List.to_tuple(:lists.reverse(vals)), term), fun)
    end
    defp do_product({[y|xs], [], [z|zs], [], []}, acc = {:cont, term}, fun) do
      case next(z) do
        {:next, v, w} -> do_product({xs, [y], zs, [w], [v]}, acc, fun)
        _ -> {:done, term}
      end
    end
    defp do_product({xss = [x|xs], yss = [y|ys], [z|zs], wss = [w|ws], vals = [_|vs]}, acc = {:cont, _}, fun) do
      case next(z) do
        {:next, v, next_w} -> do_product({xs, [x|yss], zs, [next_w|wss], [v|vals]}, acc, fun)
        _ -> do_product({[y|xss], ys, [w|[x|zs]], ws, vs}, acc, fun)
      end
    end

    # === combinations ===

    @doc ~S"""
    Combinations - n-length tuples, in sorted order, no repeated elements.

    ## Examples

      iex> Combinatorics.combinations(1..4, 2) |> Enum.to_list
      [{1, 2}, {1, 3}, {1, 4}, {2, 3}, {2, 4}, {3, 4}]

      iex> Combinatorics.combinations(1..4, 3) |> Enum.to_list
      [{1, 2, 3}, {1, 2, 4}, {1, 3, 4}, {2, 3, 4}]
    """
    def combinations(_enum, 0), do: []
    def combinations(enum, 1), do: Stream.map(enum, &{&1})
    def combinations(enum, n) when is_integer(n) and n > 1 do
      case next(enum) do
        {:next, v, fun} -> &do_combinations({[fun], [v], :next, n - 1}, &1, &2)
        _  -> []
      end
    end

    defp do_combinations(_, {:halt, term}, _fun), do: {:halted, term}
    defp do_combinations(v, {:suspend, term}, fun) do
      {:suspended, term, &do_combinations(v, &1, fun)}
    end
    defp do_combinations({[], _, _, _}, {:cont, term}, _), do: {:done, term}
    defp do_combinations({fs, vals, _, 0}, {:cont, term}, fun) do
      do_combinations({fs, vals, :back, 1}, fun.(List.to_tuple(:lists.reverse(vals)), term), fun)
    end
    defp do_combinations({funs = [f|fs], vals = [_|vs], :next, n}, acc = {:cont, _}, fun) do
      case next(f) do
        {:next, v, next_f} -> do_combinations({[next_f|funs], [v|vals], :next, n - 1}, acc, fun)
        _ -> do_combinations({fs, vs, :back, n + 2}, acc, fun)
      end
    end
    defp do_combinations({[f|fs], [_|vs], :back, n}, acc = {:cont, _}, fun) do
      case next(f) do
        {:next, v, next_f} -> do_combinations({[next_f|fs], [v|vs], :next, n - 1}, acc, fun)
        _ -> do_combinations({fs, vs, :back, n + 1}, acc, fun)
      end
    end

    # === permutations ===

    @doc ~S"""
    Permutations - full-length tuples, all possible orderings, no repeated elements.
    Notice: parameter `enum` can be a List or a Range.

    ## Examples

      iex> Combinatorics.permutations([1, 2, 3]) |> Enum.to_list
      [{1, 2, 3}, {1, 3, 2}, {2, 1, 3}, {2, 3, 1}, {3, 1, 2}, {3, 2, 1}]

      iex> Combinatorics.permutations(2..4) |> Enum.to_list
      [{2, 3, 4}, {2, 4, 3}, {3, 2, 4}, {3, 4, 2}, {4, 2, 3}, {4, 3, 2}]
    """
    def permutations(enum) when is_list(enum) do
      permutations(enum, length(enum))
    end
    def permutations(enum = %Range{}) do
      permutations(enum, Enum.count(enum))
    end

    @doc ~S"""
    Permutations - n-length tuples, all possible orderings, no repeated elements.

    ## Examples

      iex> Combinatorics.permutations(1..4, 2) |> Enum.to_list
      [{1, 2}, {1, 3}, {1, 4}, {2, 1}, {2, 3}, {2, 4}, {3, 1}, {3, 2}, {3, 4}, {4, 1}, {4, 2}, {4, 3}]

      iex> Combinatorics.permutations(1..3, 3) |> Enum.to_list
      [{1, 2, 3}, {1, 3, 2}, {2, 1, 3}, {2, 3, 1}, {3, 1, 2}, {3, 2, 1}]
    """
    def permutations(_enum, 0), do: []
    def permutations(enum, 1), do: Stream.map(enum, &{&1})
    def permutations(enum, n) when is_integer(n) and n > 1 do
      case next(enum) do
        {:next, v, rest} -> &do_permutations({[{v, [], rest}], [v], :next, n - 1}, &1, &2)
        _  -> []
      end
    end

    defp do_permutations(_, {:halt, term}, _fun), do: {:halted, term}
    defp do_permutations(v, {:suspend, term}, fun) do
      {:suspended, term, &do_permutations(v, &1, fun)}
    end
    defp do_permutations({[], _, _, _}, {:cont, term}, _), do: {:done, term}
    defp do_permutations({fs, vals, _, 0}, {:cont, term}, fun) do
      do_permutations({fs, vals, :back, 1}, fun.(List.to_tuple(:lists.reverse(vals)), term), fun)
    end
    defp do_permutations({(fs=[{_, r, s}|_]), vals, :next, n}, acc = {:cont, term}, fun) do
      case next({r, s}) do
        {:next, v, rest} -> do_permutations({[{v, [], rest}|fs], [v|vals], :next, n - 1}, acc, fun)
        _ -> {:done, term}
      end
    end
    defp do_permutations({[{o, r, s}|fs], [_|vs], :back, n}, acc = {:cont, _}, fun) do
      case next(s) do
        {:next, v, rest} -> do_permutations({[{v, {r, [o]}, rest}|fs], [v|vs], :next, n - 1}, acc, fun)
        _ -> do_permutations({fs, vs, :back, n + 1}, acc, fun)
      end
    end

    # === Common Private Functions ===
    defp reducer(v, _), do: {:suspend, v}

    defp next([]), do: :done
    defp next([x|xs]), do: {:next, x, xs}
    defp next(fun) when is_function(fun, 1) do
      case fun.({:cont, nil}) do
        {:suspended, v, next_fun} -> {:next, v, next_fun}
        _ -> :done
      end
    end
    defp next({a, b}) do
      case next(a) do
        {:next, v, as} -> {:next, v, {as, b}}
        _ -> next(b)
      end
    end
    defp next(it) do
      case Enumerable.reduce(it, {:cont, nil}, &reducer/2) do
        {:suspended, v, next_fun} -> {:next, v, next_fun}
        _ -> :done
      end
    end
  end
