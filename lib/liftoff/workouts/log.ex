defmodule Liftoff.Workouts.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "log" do
    field :date, :date
    field :exercise, :id

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
