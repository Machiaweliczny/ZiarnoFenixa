defmodule ZiarnoFenixa.User do
  use ZiarnoFenixa.Web, :model
  alias ZiarnoFenixa.User
  alias ZiarnoFenixa.Repo

  schema "users" do
    field :name, :string
    field :uid, :integer
    field :image, :string
    field :email, :string
    field :oauth_token, :string
    field :oauth_expires_at, :integer
    field :provider, :string

    timestamps
  end

  @required_fields ~w(name uid oauth_token oauth_expires_at provider)
  @optional_fields ~w(image email)

  def oauth(user, token, prov) do

    user_db = Repo.get_by(User, uid: user.id, provider: prov)

    user_map = %{name: user.name, uid: String.to_integer(user.id),
                    image: user.picture["data"]["url"], email: user.email,
                    oauth_token: token.access_token,
                    oauth_expires_at: token.expires_at,
                    provider: prov}

    if user_db do
      user_db = User.changeset(user_db, user_map)
      if user_db.valid? do
        case Repo.update(user_db) do
          {:ok, model}  ->
            user_db = model
          {:error, changeset} ->
            user_db = changeset.errors
        end
      end
    else
      user_db = User.changeset(%User{}, user_map)
      if user_db.valid? do
        case Repo.insert(user_db) do
          {:ok, model}  ->
            user_db = model
          {:error, changeset} ->
            user_db = changeset.errors
        end
      end
    end

    user_db
  end
  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 5)
  end
end
