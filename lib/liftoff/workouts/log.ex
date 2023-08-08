defmodule Liftoff.Workouts.Log do
  use Ecto.Schema
  import Ecto.Changeset

  alias Liftoff.Workouts.Exercise
  alias Liftoff.Accounts.User

  schema "log" do
    field :date, :date
    belongs_to :exercise, Exercise
    belongs_to :user, User
    field :weight, :float
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:date, :weight])
    |> put_assoc(:exercise, attrs.exercise)
    |> put_assoc(:user, attrs.user)
    |> validate_required([:date, :weight])
  end
end
