defmodule FtcMembers.Accounts.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias FtcMembers.Accounts.Member


  schema "members" do
    field :bnet_id, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [:username, :bnet_id])
    |> validate_required([:username, :bnet_id])
    |> unique_constraint(:username)
    |> unique_constraint(:bnet_id)
  end
end
