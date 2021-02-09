defmodule GeoTasksWeb.Auth.Guardian do
  use Guardian, otp_app: :geo_tasks

  alias GeoTasks.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end

  def authenticate(name) do
    case Accounts.get_by_name(name) do
      {:ok, user} -> create_token(user)
      {:error, :not_found} -> {:error, :unauthorized}
    end
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, user, token}
  end
end
