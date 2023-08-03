defmodule LiftoffWeb.PageLive.Index do
  use LiftoffWeb, :live_view

  alias Liftoff.Repo
  alias Liftoff.Accounts
  alias Liftoff.Workouts

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> assign(:users, Accounts.list_users())
      |> assign(:logs, Workouts.list_logs() |> Repo.preload(:exercise))
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Dashboard")
  end
end
