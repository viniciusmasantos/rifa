defmodule Rifa.LotteryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rifa.Lottery` context.
  """

  @doc """
  Generate a raffle.
  """
  def raffle_fixture(attrs \\ %{}) do
    {:ok, raffle} =
      attrs
      |> Enum.into(%{
        date: "2000-10-10",
        name: "some name"
      })
      |> Rifa.Lottery.create_raffle()

    raffle
  end
end
