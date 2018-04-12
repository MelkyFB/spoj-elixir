defmodule Prime do
    def is_prime(x) do
        (2..x |> Enum.filter(fn a -> rem(x, a)==0 end) |> length()) == 1
    end
    def prime_range(l) do
        l = l |> Enum.filter(fn n-> is_prime(n) end)
        Enum.to_list l |> Stream.each(fn n -> IO.puts n end)
    end
    def run_prime(n) when n > 0 do
        ipt = IO.gets ""
        l = ipt |> String.replace("\n", "") |> String.split
        l = l |> Enum.map(fn x -> x |> String.to_integer end)
        l = Range.new List.first(l), List.last(l)
        prime_range l
        IO.puts ""
        run_prime n - 1
    end
    def run_prime(n) do
    end
    def main(n) do        
        n = n |> String.replace("\n", "")
        n = n |> String.to_integer
        if is_integer n do
            run_prime n
        end
    end
end
Prime.main(IO.gets "")
