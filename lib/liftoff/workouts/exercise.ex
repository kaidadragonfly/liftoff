defmodule Liftoff.Workouts.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercise" do
    field :day, Ecto.Enum, values: [:a, :b]
    field :name, :string
    field :step, :float

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> unique_constraint(:name)
    |> cast(attrs, [:name, :day])
    |> validate_required([:name, :day])
  end
end
