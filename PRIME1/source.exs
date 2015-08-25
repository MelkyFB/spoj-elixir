defmodule PrimeGen do
  def primes(0) do
  end
  def primes(t), do: find_primes(t, String.split(IO.gets(''), ~r{\s}, trim: true))

  def find_primes(t, [a,b]) when (is_binary(a) or is_binary(b)), do:  find_primes(t, [String.to_integer(a), String.to_integer(b)])
  def find_primes(t, [b,b]), do: find_primes(t, [b,b], is_prime(b))
  def find_primes(t, [a,b]), do: find_primes(t, [a,b], is_prime(a))

  defp find_primes(t, [b,b], true) do
    IO.puts b
    IO.puts ''
    primes(t-1)
  end
  defp find_primes(t, [b,b], false) do
    IO.puts ''
    primes(t-1)
  end
  defp find_primes(t, [a,b], true) do
    IO.puts a
    find_primes(t, [a+1,b])
  end
  defp find_primes(t, [a,b], false) do
    find_primes(t, [a+1,b])
  end

  defp is_prime(1), do: false
  defp is_prime(a) when rem(a,2) == 0, do: false
  defp is_prime(a) do
    is_prime(3,a)
  end

  defp is_prime(divisor, number) do
    is_prime(divisor, number, round(:math.sqrt(number) + 1))
  end

  defp is_prime(divisor, _, stop) when divisor >= stop, do: true
  defp is_prime(divisor, number, _) do
    if  rem(number, divisor) == 0 do
      false
    else
      is_prime(divisor + 2, number)
    end
  end
end

t = String.strip(IO.gets(''))
PrimeGen.primes(String.to_integer(t))
