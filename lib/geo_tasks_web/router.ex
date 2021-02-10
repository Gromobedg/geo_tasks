defmodule GeoTasksWeb.Router do
  use GeoTasksWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug GeoTasksWeb.Auth.Pipeline
  end

  pipeline :auth_manager do
    plug GeoTasksWeb.Auth.PipelineManager
  end

  pipeline :auth_driver do
    plug GeoTasksWeb.Auth.PipelineDriver
  end

  scope "/api", GeoTasksWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", GeoTasksWeb do
    pipe_through [:api, :auth]
    post "/tasks/nearest", TaskController, :nearest
  end

  scope "/api", GeoTasksWeb do
    pipe_through [:api, :auth_manager]
    post "/tasks", TaskController, :new
    delete "/tasks/:id", TaskController, :delete
  end

  scope "/api", GeoTasksWeb do
    pipe_through [:api, :auth_driver]
    post "/tasks/:id/assigned", TaskController, :assigned
    post "/tasks/:id/done", TaskController, :done
  end
end
