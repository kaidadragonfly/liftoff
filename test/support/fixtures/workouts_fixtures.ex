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

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    {:ok, log} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-07-23]
      })
      |> Liftoff.Workouts.create_log()

    log
  end
end
