defmodule Tracer.Router do
  use Tracer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tracer do
    pipe_through :api
    post "/login_logs", LoginLogController, :create
    post "/suscribe_logs", SuscribeLogController, :create
    post "/multiple_suscribed_logs", SuscribeLogController, :multy_create
    post "/multiple_unsuscribed_logs", UnsuscribeLogController, :multy_create

    get "/login_logs", LoginLogController, :get
    get "/suscribe_logs", SuscribeLogController, :get
    get "/unsuscribe_logs", UnsuscribeLogController, :get
    get "/all_logs", AllLogController, :get
  end
end
