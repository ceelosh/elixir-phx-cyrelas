defmodule Cyrelas.Repo do
  use Ecto.Repo,
    otp_app: :cyrelas,
    adapter: Ecto.Adapters.MyXQL
end
