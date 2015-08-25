defmodule PrimeGen do
  def primes(0) do
  end
  def primes(t), do: find_primes(t, String.split(IO.gets(''), ~r{\s}, trim: true))

  def find_primes(t, [a,b]) when (is_binary(a) or is_binary(b)), do:  find_primes(t, (String.to_integer(a)..String.to_integer(b)))
  def find_primes(t, numbers) do
    numbers |> Enum.reject(&rem(&1, 2) == 0)
            |> Enum.filter(&is_prime(&1))
            |> Enum.each(&IO.puts(&1))
    IO.puts(' ')
    primes(t-1)
  end

  defp is_prime(1), do: false
  defp is_prime(a) do
    is_prime(3,a)
  end

  defp is_prime(divisor, number), do: is_prime(divisor, number, round(:math.sqrt(number) + 1))

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
