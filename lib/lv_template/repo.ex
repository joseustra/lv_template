defmodule LvTemplate.Repo do
  use Ecto.Repo,
    otp_app: :lv_template,
    adapter: Ecto.Adapters.Postgres
end
