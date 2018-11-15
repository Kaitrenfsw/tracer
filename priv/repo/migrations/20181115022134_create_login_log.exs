defmodule Tracer.Repo.Migrations.CreateLoginLog do
  use Ecto.Migration

  def change do
    create table(:login_logs) do
      add :user_id, :bigint
      timestamps()
    end
  end
end
