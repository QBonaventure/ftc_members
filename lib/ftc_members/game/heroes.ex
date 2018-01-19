defmodule FtcMembers.Game.Heroes do
  use Ecto.Schema
  import Ecto.Changeset
  alias FtcMembers.Game.Heroes


  schema "heroes" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Heroes{} = heroes, attrs) do
    heroes
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
