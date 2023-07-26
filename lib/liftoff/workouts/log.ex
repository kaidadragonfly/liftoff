defmodule Liftoff.Workouts.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "log" do
    field :date, :date
    field :exercise, :id
    field :weight, :float

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:date, :exercise, :weight])
    |> validate_required([:date, :exercise, :weight])
  end
end
