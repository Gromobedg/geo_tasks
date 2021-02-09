defmodule GeoTasks.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :end, {:array, :integer}
    field :start, {:array, :integer}

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
  end
end
