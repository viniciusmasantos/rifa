defmodule Rifa.AuthFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rifa.Auth` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> Rifa.Auth.create_user()

    user
  end
end
