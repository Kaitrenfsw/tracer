defmodule Tracer.Router do
  use Tracer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tracer do
    pipe_through :api
    post "/login_logs", LoginLogController, :create
    post "/suscribe_logs", SuscribeLogController, :create
    post "/unsuscribe_logs", UnsuscribeLogController, :create
    get "/login_logs", LoginLogController, :get
    get "/suscribe_logs", SuscribeLogController, :get
    get "/unsuscribe_logs", UnsuscribeLogController, :get
  end
end
