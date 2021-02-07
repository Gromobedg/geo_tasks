defmodule GeoTasks.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :role])
    |> validate_required([:name, :role])
    |> unique_constraint(:name)
  end
end
