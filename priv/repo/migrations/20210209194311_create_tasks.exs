defmodule GeoTasks.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :start, {:array, :integer}
      add :end, {:array, :integer}

      timestamps()
    end

  end
end
