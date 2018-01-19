defmodule FtcMembers.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias FtcMembers.Accounts.User


  schema "users" do
    field :bnet_id, :string
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username, :bnet_id])
    |> validate_required([:name, :username, :bnet_id])
    |> unique_constraint(:username)
    |> unique_constraint(:bnet_id)
  end
end
