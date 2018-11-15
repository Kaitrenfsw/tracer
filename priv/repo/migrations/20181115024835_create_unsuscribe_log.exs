defmodule Tracer.Repo.Migrations.CreateUnsuscribeLog do
  use Ecto.Migration

  def change do
    create table(:unsuscribe_logs) do
      add :user_id, :bigint
      add :topic_id, :bigint
      timestamps()
    end

  end
end
