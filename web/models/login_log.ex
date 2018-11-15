defmodule Tracer.LoginLog do
  use Tracer.Web, :model
  alias Tracer.Support
  
  schema "login_logs" do
    field :user_id, :integer
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end

end
