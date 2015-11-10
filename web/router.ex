defmodule ZiarnoFenixa.Router do
  use ZiarnoFenixa.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ZiarnoFenixa do
    pipe_through :browser

    get "/current_user", ApiController, :current_user
  end

  scope "/", ZiarnoFenixa do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", ZiarnoFenixa do
    pipe_through :browser

    get "/logout", AuthController, :logout
    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
  end

end
