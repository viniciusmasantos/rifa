defmodule Rifa.Lottery do
  @moduledoc """
  The Lottery context.
  """

  import Ecto.Query, warn: false
  alias Rifa.Repo

  alias Rifa.Lottery.Raffle
  alias Rifa.Lottery.UsersRaffles

  @doc """
  Returns the list of raffles.

  ## Examples

      iex> list_raffles()
      [%Raffle{}, ...]

  """
  def list_raffles do
    Repo.all(Raffle)
  end

  @doc """
  Gets a single raffle.

  Raises `Ecto.NoResultsError` if the Raffle does not exist.

  ## Examples

      iex> get_raffle!(123)
      %Raffle{}

      iex> get_raffle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_raffle!(id), do: Repo.get!(Raffle, id)

  @doc """
  Creates a raffle.

  ## Examples

      iex> create_raffle(%{field: value})
      {:ok, %Raffle{}}

      iex> create_raffle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_raffle(attrs \\ %{}) do
    %Raffle{}
    |> Raffle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a raffle.

  ## Examples

      iex> update_raffle(raffle, %{field: new_value})
      {:ok, %Raffle{}}

      iex> update_raffle(raffle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_raffle(%Raffle{} = raffle, attrs) do
    raffle
    |> Raffle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a raffle.

  ## Examples

      iex> delete_raffle(raffle)
      {:ok, %Raffle{}}

      iex> delete_raffle(raffle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_raffle(%Raffle{} = raffle) do
    Repo.delete(raffle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking raffle changes.

  ## Examples

      iex> change_raffle(raffle)
      %Ecto.Changeset{data: %Raffle{}}

  """
  def change_raffle(%Raffle{} = raffle, attrs \\ %{}) do
    Raffle.changeset(raffle, attrs)
  end


  @doc """
  Returns a UserRaffle. By passing user_id and raffle_id as map.
  """
  def add_user_to_raffle(attrs) do
    %UsersRaffles{}
    |> UsersRaffles.changeset(attrs)
    |> Repo.insert()
  end
end
