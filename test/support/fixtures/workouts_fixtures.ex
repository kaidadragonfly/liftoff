defmodule Liftoff.WorkoutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Liftoff.Workouts` context.
  """

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        day: :a,
        name: "some name"
      })
      |> Liftoff.Workouts.create_exercise()

    exercise
  end
end
