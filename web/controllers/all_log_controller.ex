defmodule Tracer.AllLogController do
  use Tracer.Web, :controller
  alias Tracer.{LoginLog, SuscribeLog, UnsuscribeLog}


  def get(conn, %{"user_id" => user_id}) do

    login_query = (
              from ll in Tracer.LoginLog,
              where: ll.user_id == ^user_id,
              order_by: [desc: :id],
              limit: 5
            )

    login_logs = Enum.map(Repo.all(login_query), fn v -> 
      v
      |> Map.drop([:__meta__])
    end)

    suscribe_query = (
              from ll in Tracer.SuscribeLog,
              where: ll.user_id == ^user_id,
              order_by: [desc: :id],
              limit: 5
            )

    suscribe_logs = Enum.map(Repo.all(suscribe_query), fn v -> 
      v
      |> Map.drop([:__meta__])
    end)



    IO.inspect suscribe_logs

    unsuscribe_query = (
              from ll in Tracer.UnsuscribeLog,
              where: ll.user_id == ^user_id,
              order_by: [desc: :id],
              limit: 5
            )

    unsuscribe_logs = Enum.map(Repo.all(unsuscribe_query), fn v -> 
      v
      |> Map.drop([:__meta__])
    end)


    IO.inspect unsuscribe_logs

    logs = %{subscriptions: suscribe_logs, unsubscriptions: unsuscribe_logs, logins: login_logs}

    conn
    |> put_status(200)
    |> render(Tracer.SuccessView, "logs.json", %{logs: logs})
  end

end