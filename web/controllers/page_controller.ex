defmodule ZiarnoFenixa.PageController do
  use ZiarnoFenixa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
