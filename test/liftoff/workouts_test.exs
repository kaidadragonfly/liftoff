defmodule Liftoff.WorkoutsTest do
  use Liftoff.DataCase

  alias Liftoff.Workouts

  describe "exercise" do
    alias Liftoff.Workouts.Exercise

    import Liftoff.WorkoutsFixtures

    @invalid_attrs %{day: nil, name: nil}

    test "list_exercise/0 returns all exercise" do
      exercise = exercise_fixture()
      assert Workouts.list_exercise() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Workouts.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{day: :a, name: "some name"}

      assert {:ok, %Exercise{} = exercise} = Workouts.create_exercise(valid_attrs)
      assert exercise.day == :a
      assert exercise.name == "some name"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      update_attrs = %{day: :b, name: "some updated name"}

      assert {:ok, %Exercise{} = exercise} = Workouts.update_exercise(exercise, update_attrs)
      assert exercise.day == :b
      assert exercise.name == "some updated name"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_exercise(exercise, @invalid_attrs)
      assert exercise == Workouts.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Workouts.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Workouts.change_exercise(exercise)
    end
  end

  describe "log" do
    alias Liftoff.Workouts.Log

    import Liftoff.WorkoutsFixtures

    @invalid_attrs %{date: nil}

    test "list_log/0 returns all log" do
      log = log_fixture()
      assert Workouts.list_log() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Workouts.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      valid_attrs = %{date: ~D[2023-07-23]}

      assert {:ok, %Log{} = log} = Workouts.create_log(valid_attrs)
      assert log.date == ~D[2023-07-23]
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workouts.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      update_attrs = %{date: ~D[2023-07-24]}

      assert {:ok, %Log{} = log} = Workouts.update_log(log, update_attrs)
      assert log.date == ~D[2023-07-24]
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Workouts.update_log(log, @invalid_attrs)
      assert log == Workouts.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Workouts.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Workouts.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Workouts.change_log(log)
    end
  end
end
