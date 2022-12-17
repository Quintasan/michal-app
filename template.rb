gem_group :development, :test do
  gem "byebug"
  gem "binding_of_caller"
  gem "pry"
  gem "pry-byebug"
  gem "rspec-rails", "~> 6.0.0"
  gem "factory_bot_rails"
end

editorconfig = <<~EDITORCONFIG
root = true

[*]
end_of_line = lf
insert_final_newline = true
indent_style = space
indent_size = 2
EDITORCONFIG

file(".editorconfig", editorconfig)

database_configuration = <<~DATABASE
default: &default
    adapter: postgresql
    encoding: unicode
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
    host: <%= ENV.fetch("DATABASE_HOST") { "db" } %>
    port: <%= ENV.fetch("DATABASE_PORT") { 5432 } %>
    username: <%= ENV.fetch("DATABASE_USER") { "vscode" } %>
    password: <%= ENV.fetch("DATABASE_PASSWORD") { "vscode" } %>

development:
    <<: *default
    database: <%= ENV.fetch("DATABASE_NAME") { "appname_development" } %>

test:
    <<: *default
    database: <%= ENV.fetch("DATABASE_NAME") { "appname_test" } %>

production:
    <<: *default
    database: <%= ENV.fetch("DATABASE_NAME") { "appname_production" } %>
DATABASE

inside("config") do
    run "rm database.yml"
    file("database.yml", database_configuration)
end

after_bundle do
  generate("rspec:install")
end
