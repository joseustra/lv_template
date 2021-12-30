defmodule LvTemplateWeb.PageController do
  use LvTemplateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
