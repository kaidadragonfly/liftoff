defmodule LiftoffWeb.PageController do
  use LiftoffWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
