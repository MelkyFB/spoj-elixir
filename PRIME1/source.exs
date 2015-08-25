defmodule PrimeGen do
  def primes(0) do
  end
  def primes(t), do: find_primes(t, String.split(IO.gets(''), ~r{\s}, trim: true))

  def find_primes(t, [a,b]) when (is_binary(a) or is_binary(b)), do:  find_primes(t, (String.to_integer(a)..String.to_integer(b)))
  def find_primes(t, numbers) do

    numbers |> Enum.reject(&rem(&1, 2) == 0)
            |> filter_primes([])
            |> Enum.reverse
            |> Enum.each(&IO.puts(&1))
    IO.puts(' ')
    primes(t-1)
  end

  defp filter_primes([], primes), do: primes
  defp filter_primes([head|tail], primes), do: filter_primes([head|tail], primes, is_prime(head))
  defp filter_primes([_|tail], primes, false), do: filter_primes(tail, primes)
  defp filter_primes([head|tail], primes, true) do
    primes = [head] ++ primes
    tail |> Enum.reject(&rem(&1, head) == 0) |> filter_primes(primes)
  end

  defp is_prime(1), do: false
  defp is_prime(a) do
    is_prime(3,a, round(:math.sqrt(a) + 1))
  end
  defp is_prime(divisor, _, stop) when divisor >= stop, do: true
  defp is_prime(divisor, number, stop) do
    if  rem(number, divisor) == 0 do
      false
    else
      is_prime(divisor + 2, number, stop)
    end
  end
end

t = String.strip(IO.gets(''))
PrimeGen.primes(String.to_integer(t))
