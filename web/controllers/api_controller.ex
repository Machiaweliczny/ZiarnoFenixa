defmodule ZiarnoFenixa.ApiController do
  use ZiarnoFenixa.Web, :controller

  def current_user(conn, _params) do
  	user = ZiarnoFenixa.AuthController.current_user(conn)
  	map = %{token: Phoenix.Token.sign(conn, "user", user.id), user: user.id}
  	render(conn, "current_user.json", map: map)
  end
end
