defmodule Tracer.SuccessView do
  use Tracer.Web, :view

  # Success
  def render("200.json", %{message: message}), do: %{message: message}
  def render("200.json", _assigns), do: %{message: "Success."}

  def render("logs.json", %{logs: logs}), do:  logs
end