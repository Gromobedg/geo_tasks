defmodule GeoTasksWeb.Auth.PipelineDriver do
  use Guardian.Plug.Pipeline,
    otp_app: :geo_tasks,
    module: GeoTasksWeb.Auth.Guardian,
    error_handler: GeoTasksWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{role: "driver"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
