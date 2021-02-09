defmodule GeoTasksWeb.UserController do
  use GeoTasksWeb, :controller

  alias GeoTasks.Accounts
  alias GeoTasks.Accounts.User
  alias GeoTasksWeb.Auth.Guardian

  action_fallback GeoTasksWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user)
    do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end

  def signin(conn, %{"name" => name}) do
    case Guardian.authenticate(name) do
      {:ok, user, token} ->
        conn
        |> put_status(:created)
        |> render("user.json", %{user: user, token: token})
      {:error, status} ->
        conn
        |> put_status(status)
        |> render("error.json", %{name: name, status: status})
    end
  end
end
