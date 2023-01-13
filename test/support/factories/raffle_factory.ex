defmodule Rifa.RaffleFactory do
  defmacro __using__(_opts) do
    quote do
      def raffle_factory do
        %Rifa.Lottery.Raffle{
          name: sequence(:name, fn n -> "Rifa ##{n}" end),
          date: Date.new!(2030, 1, 1)
        }
      end
    end
  end
end
