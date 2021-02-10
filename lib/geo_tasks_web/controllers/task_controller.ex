defmodule GeoTasksWeb.TaskController do
  use GeoTasksWeb, :controller

  alias GeoTasks.Tasks
  alias GeoTasks.Tasks.Task

  action_fallback GeoTasksWeb.FallbackController

  def new(conn, _params) do
    conn |> render("task.json")
  end

  def assigned(conn, _params) do
    conn |> render("task.json")
  end

  def done(conn, _params) do
    conn |> render("task.json")
  end

  def delete(conn, _params) do
    send_resp(conn, :no_content, "")
  end

  def nearest(conn, _params) do
    conn |> render("task.json")
  end
end
