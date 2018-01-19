defmodule FtcMembers.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias FtcMembers.Repo

  alias FtcMembers.Game.Heroes

  @doc """
  Returns the list of heroes.

  ## Examples

      iex> list_heroes()
      [%Heroes{}, ...]

  """
  def list_heroes do
    Repo.all(Heroes)
  end

  @doc """
  Gets a single heroes.

  Raises `Ecto.NoResultsError` if the Heroes does not exist.

  ## Examples

      iex> get_heroes!(123)
      %Heroes{}

      iex> get_heroes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_heroes!(id), do: Repo.get!(Heroes, id)

  @doc """
  Creates a heroes.

  ## Examples

      iex> create_heroes(%{field: value})
      {:ok, %Heroes{}}

      iex> create_heroes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_heroes(attrs \\ %{}) do
    %Heroes{}
    |> Heroes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a heroes.

  ## Examples

      iex> update_heroes(heroes, %{field: new_value})
      {:ok, %Heroes{}}

      iex> update_heroes(heroes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_heroes(%Heroes{} = heroes, attrs) do
    heroes
    |> Heroes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Heroes.

  ## Examples

      iex> delete_heroes(heroes)
      {:ok, %Heroes{}}

      iex> delete_heroes(heroes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_heroes(%Heroes{} = heroes) do
    Repo.delete(heroes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking heroes changes.

  ## Examples

      iex> change_heroes(heroes)
      %Ecto.Changeset{source: %Heroes{}}

  """
  def change_heroes(%Heroes{} = heroes) do
    Heroes.changeset(heroes, %{})
  end
end
