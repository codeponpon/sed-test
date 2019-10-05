Resque::Server.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV["AUTH_USER"], ENV["AUTH_SECRET"]]
end