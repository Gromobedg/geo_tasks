defmodule GeoTasksWeb.Auth.Guardian do
  use Guardian, otp_app: :geo_tasks

  alias GeoTasks.Accounts

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    {:ok, Accounts.get_user!(claims["sub"])}
  end

  def authenticate(name) do
    case Accounts.get_by_name(name) do
      {:ok, user} -> create_token(user)
      {:error, :not_found} -> {:error, :unauthorized}
    end
  end

  def create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user, %{role: user.role})
    {:ok, user, token}
  end
end
