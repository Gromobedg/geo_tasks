defmodule GeoTasksWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :geo_tasks,
    module: GeoTasksWeb.Auth.Guardian,
    error_handler: GeoTasksWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
