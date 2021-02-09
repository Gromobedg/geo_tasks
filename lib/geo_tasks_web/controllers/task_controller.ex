defmodule GeoTasksWeb.TaskController do
  use GeoTasksWeb, :controller

  alias GeoTasks.Tasks
  alias GeoTasks.Tasks.Task

  action_fallback GeoTasksWeb.FallbackController

  def new(conn, %{}) do
    conn |> render("task.json")
  end

  def assigned(conn, %{}) do
    conn |> render("task.json")
  end

  def done(conn, %{}) do
    conn |> render("task.json")
  end

  def delete(conn, %{}) do
    send_resp(conn, :no_content, "")
  end

  def nearest(conn, %{}) do
    conn |> render("task.json")
  end
end
