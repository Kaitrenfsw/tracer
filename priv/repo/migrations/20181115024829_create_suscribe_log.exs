defmodule Tracer.Repo.Migrations.CreateSuscribeLog do
  use Ecto.Migration

  def change do
    create table(:suscribe_logs) do
      add :user_id, :bigint
      add :topic_id, :bigint
      timestamps()
    end

  end
end
