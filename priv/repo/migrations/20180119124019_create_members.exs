defmodule FtcMembers.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :username, :string
      add :bnet_id, :string

      timestamps()
    end

    create unique_index(:members, [:username])
    create unique_index(:members, [:bnet_id])
  end
end
