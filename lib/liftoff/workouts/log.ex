defmodule Liftoff.Workouts.Log do
  use Ecto.Schema
  import Ecto.Changeset

  alias Liftoff.Workouts.Exercise

  schema "log" do
    field :date, :date
    belongs_to :exercise, Exercise
    field :weight, :float
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:date, :exercise, :weight])
    |> validate_required([:date, :exercise, :weight])
  end
end
