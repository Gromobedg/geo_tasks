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

  scope "/api", GeoTasksWeb do
    pipe_through :api
    post "/tasks", TaskController, :new
    post "/tasks/:id/assigned", TaskController, :assigned
    post "/tasks/:id/done", TaskController, :done
    delete "/tasks/:id", TaskController, :delete
    post "/tasks/nearest", TaskController, :nearest
  end
end
