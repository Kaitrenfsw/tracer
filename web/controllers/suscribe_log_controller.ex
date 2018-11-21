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

  def multy_create(conn, %{"suscribed" => suscribed}) do
    changesets = Enum.map(suscribed, fn v -> 
      SuscribeLog.changeset(%SuscribeLog{}, %{user_id: v["user_id"], topic_id: v["topic_id"]})
    end)

    all_changeset_valid = Enum.all?(changesets, fn v -> v.valid? end)

    cond  do
      all_changeset_valid ->
        Enum.map(changesets, fn v -> Repo.insert(v) end)


        conn
        |> put_status(200)
        |> render(Tracer.SuccessView, "200.json")

      true ->
        [changeset | _] = changesets
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