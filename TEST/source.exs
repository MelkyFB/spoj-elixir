defmodule LifeTheUniverseEverything do
  def getAwnser("42\n") do
  end

  def getAwnser(n) do
    IO.puts String.strip(n)
    getAwnser(IO.gets '')
  end
end

LifeTheUniverseEverything.getAwnser(IO.gets '')
