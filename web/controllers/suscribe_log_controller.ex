defmodule Tracer.SuscribeLogController do
  use Tracer.Web, :controller
  alias Tracer.{SuscribeLog}
  def create(conn, %{"user_id" => user_id, "topic_id" => topic_id}) do

    changeset = SuscribeLog.changeset(%SuscribeLog{}, %{user_id: user_id, topic_id: topic_id})
    case Repo.insert(changeset) do
      {:ok, _ } ->
        conn 
        |> put_status(200)
        |> render(Tracer.SuccessView, "200.json")
      {:error, changeset } ->
        conn
        |> put_status(422)
        |> render(Tracer.ErrorView, "422.json", changeset )
    end
  end

  def get(conn, %{"user_id" => user_id}) do
    logs = Repo.get_by(SuscribeLog, user_id: user_id)
    conn
    |> put_status(200)
    |> render(Tracer.SuccessView, "200.json", %{message: logs})
  end

end