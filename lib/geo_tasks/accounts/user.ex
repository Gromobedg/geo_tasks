defmodule GeoTasks.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @inclusion ["manager", "driver"]

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
    |> validate_inclusion(:role, @inclusion)
    |> unique_constraint(:name)
  end
end
