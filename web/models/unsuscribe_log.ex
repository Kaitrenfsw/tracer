defmodule Tracer.UnsuscribeLog do
  use Tracer.Web, :model
  alias Tracer.Support
  
  schema "unsuscribe_logs" do
    field :user_id, :integer
    field :topic_id, :integer
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:user_id, :topic_id])
    |> validate_required([:user_id, :topic_id])
  end

end
