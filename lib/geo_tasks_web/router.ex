defmodule GeoTasksWeb.Router do
  use GeoTasksWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GeoTasksWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end
end
