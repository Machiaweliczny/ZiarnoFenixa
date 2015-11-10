# ZiarnoFenixa

Simple phoenix app seed with facebook login.

To rename app code:
  1. Change `ZiarnoFenixa` to `MyCoolName` in whole project
  2. Change `ziarno_fenixa` to `my_cool_name` in whole project

To start app:

  1. Modify db access in `config/dev.exs`
  2. Install dependencies with `mix deps.get`
  3. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  4. Start Phoenix endpoint with `mix phoenix.server`
  5. Open [`localhost:4000`](http://localhost:4000)

To deploy to heroku:

  1. `heroku login`
  2. `heroku create`
  3. `heroku apps:rename my_cool_name`
  4. `heroku buildpacks:set https://github.com/gjaldon/phoenix-static-buildpack`
  5. `heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir`
  6. `heroku push heroku master`
  7. `heroku addons:create heroku-postgresql`
  8. `heroku run mix ecto.migrate`
  9. `heroku config:set CLIENT_ID=<FB_APP_ID> CLIENT_SECRET=<FB_APP_SECRET> HOST_URL=https://my_cool_name.herokuapp.com SECRET_KEY_BASE=<64_chars_string>`
