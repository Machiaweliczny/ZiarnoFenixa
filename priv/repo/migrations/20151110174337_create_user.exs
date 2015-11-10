defmodule ZiarnoFenixa.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :uid, :bigint
      add :image, :string
      add :email, :string
      add :provider, :string
      add :oauth_token, :string
      add :oauth_expires_at, :integer

      timestamps
    end

  end
end
