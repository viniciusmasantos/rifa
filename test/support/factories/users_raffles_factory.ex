defmodule Rifa.UsersRafflesFactory do
  defmacro __using__(_opts) do
    quote do
      def users_raffles_factory do
        %Rifa.Lottery.UsersRaffles{
          user: build(:user),
          raffle: build(:raffle)
        }
      end
    end
  end
end
