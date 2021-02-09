defmodule GeoTasksWeb.UserView do
  use GeoTasksWeb, :view

  def render("user.json", %{user: user, token: token}) do
    %{id: user.id, name: user.name, role: user.role, token: token}
  end

  def render("error.json", %{name: name, status: status}) do
    %{name: name, status: status}
  end
end
